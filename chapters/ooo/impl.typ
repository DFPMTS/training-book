#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "工程实现")

#show: frame-style(styles.boxy)
#set heading(numbering: "1.1")

= 工程实现

本章整理乱序处理器工程实现中的关键设计点，包括五级流水基础、多发射、scoreBoard算法、Tomasulo算法以及后续优化方向。

= 架构选型
+ 顺序单发射
+ 顺序多发射
+ scoreBoard
+ Tomasulo

= 技术选项
- 重命名方式 （ROB Based / Physical Register）

- 分支预测错误恢复 （Checkpoint / Walk / Exception）

- 原子指令 （Uop / State Machine）

#advice[先完成，后完美][
  - 梳理 data path
  - 参数化模块，并完成最简版本，如单发射乱序
  - 完成指令与 CSR的添加，使用 Linux 验证
  - 最后加入多发射，分支预测，乱序访存等高级特性
]
