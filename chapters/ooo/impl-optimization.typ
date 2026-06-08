#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "优化")

#show: frame-style(styles.boxy)
#set heading(numbering: "1.1")

= 实现访存乱序？

== 部分乱序发射
再次重申：软件给定的程序其实规定了两种访问顺序，一种是寄存器访问顺序，另一种是内存访问顺序。我们想要实现内存访问乱序，就得像实现寄存器访问乱序一样分析这个问题。

#question[思考][
首先回答：记分牌算法和 Tomasulo 算法是如何解决这个问题的？
]
程序给定顺序是很强的，它还规定了访问不同寄存器或不同内存地址的顺序。我们可以让 store 之前的 load 乱序执行，但需要检查执行流水中是否存在没有完成的 store 指令。如果存在，则必须等到这个 store 完成；下一个 store 之前的所有 load 都可以乱序发射。

可以将之前 LSQ 的发射队列拆分成 loadIssueQueue 和 storeIssueQueue。load 发射时检查自己的年龄是否比 storeIssueQueue 中最 old 的指令更 old，如果是则可以发射。

这种结构的访存，我仍然推荐采用流水线 cache。

== 实现更强的 cache

=== cache 替换算法

== 实现更强的分支预测器


== 预取器 
