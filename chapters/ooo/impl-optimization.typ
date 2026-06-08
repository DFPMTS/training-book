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

这种结构的访存，我仍然是推荐采用流水线cache

== 实现更强的cache 

=== cache替换算法

== 实现更强的分支预测器


== 预取器 
