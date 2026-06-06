#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "优化")

#show: frame-style(styles.boxy)
#set heading(numbering: "1.1")

= 实现访存乱序？

== 部分乱序发射
再次重申:软件给定的程序其实是规定了两种访问顺序，一种是寄存器，另一种就是内存了，我们想要实现访问内存的乱序，就得和实现寄存器访问乱序一样去考虑这个问题。
首先回答:记分牌算法和Tomasulo算法是如何去解决这个问题？
程序给定顺序是很强的，它还规定了访问不同寄存器或内存地址的顺序，我们可以让store之前的load乱序执行，我们做一个检查，执行流水是否存在没有完成的store指令。
如果存在则必须等到这个store完成，下一个store之前的所有load都可以乱序发射。
可以将之前lsq的发射队列拆分成loadIssueQueue和storeIssueQueue，load发射检查是否年龄比storeIssueQueue最old的指令更old，如果是则可以发射

== 访存指令的乱序执行
前面优化了访存指令发射性能，但是执行过程中我们还是采用顺序，如果一条访存指令出现了cache缺失就会阻塞后面的指令，现在提出一种非阻塞的cache，用于解决这个问题。
我们之前将cache结构分为hit部分和miss部分，并且hit部分是要和CPU流水适配并行执行的。方法简单，你在miss部分设置一个fifo，然后fifo可以需求接收hit部分发现是cache miss的指令，然后慢慢处理。
这个时候CPU如果发现这条指令是miss的话，则将这个指令放到一个replayQueue里面，当cache完成对这条指令处理，在来唤醒replayQueue中访存指令，让它重新进入访存流水执行，在次读取cache。


我们在访存指令不能进行写违例检查，每次一个store执行完成都要拿它的地址去检查那些被推测执行的load，是否存在地址相同，如果存在则要求那些load重新执行，即我们设计load和store推测执行。目前有个问题，如果这些访存指令还是保存在rob里面会导致我们检查很麻烦，因为我检查的时候还要区分一个指令是不是访存指令，所以这里推荐将访存指令执行完成后保存到一个地方，集中管理。


== 实现更强的cache 
如果你支持访存的乱序执行，那cache最好也支持非阻塞，因为如果cache miss 就阻塞流水线的话，那乱序发射访存指令也没有很多的意义。
在我们前面描述的cache的结构上，我们在处理cache miss的状态级上设计一个fifo,我们只需要将cache发现miss后就对应的请求保存到fifo里面，
然后对应的load指令接受到miss信号就停止执行，然后进入一个replayQueue，当cache处理完成后，则发起req到repalyQueue，唤醒里面load指令，让它重新发射

=== cache替换算法

== 实现更强的分支预测器


== 预取器 

=== stride预取器
在遍历多维数组时候，经常会出现这种按步长访问的模式，或者当Aggregate data types(比如：C语言中的结构体)存储在数组中时，即使在基于指针的数据结构中，当dynamic memory allocators在memory中连续布局大小固定的对象时，也可能偶尔出现跨步访问。

Stride Prefcher 实现的一个挑战就是：如何去区分多个交错的Strided sequences.比如：matrix-vecotr product 中可能出现上面的情况情况.可以设计如下的结构进行保存对应的信息：
+ load inst:保存这条指令的pc值
+ last Address保存的是上次的访问地址，
+ last Stride：前两次访问地址之差(即Stride)
+ Flags:表示这个记录是否有效

|  | Load Inst. | Last Address | Last | Flags |
| --- | --- | --- | --- | --- |
| Load | PC (tag) | Referenced | Stride |  |
| Inst |  |  |  |  |
| PC | ... ... |  |  |  |

每当连续两次观察到相同的stride时，就是使用上次引用的地址和stride来计算一个或多个额外预取地址，后续和记录的步幅相匹配的连续访问会触发额外预取操作。
一长串此类步幅式访问被称作访问流。

第二个关键的问题是：检查到 a strided stream 时候，应prefetch 多少个data-block.通常把这个称为`prefetch degree or prefetch depth`.理想情况下，如果stride Prefecher 过于激进的话，会污染cache，所以提出一个替换策略，即stream prefetcher 将prefetch 的data放到一个单独的缓冲区中，这个缓冲区称为stream buffers(流缓冲区)，这些缓冲区可以在L1cache之后或者与L1cache并行访问。虽然这种方式不会污染cache，但是会导致占用下层存储器的带宽。
