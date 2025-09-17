#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "工程实现")

#show: frame-style(styles.boxy)

= 技术选型

- 重命名方式 （ROB Based / Physical Register）

- 分支预测错误恢复 （Checkpoint / Walk / Exception）

- 原子指令 （Uop / State Machine）

#advice[先完成，后完美][
  - 梳理 data path
  - 参数化模块，并完成最简版本，如单发射乱序
  - 完成指令与 CSR的添加，使用 Linux 验证
  - 最后加入多发射，分支预测，乱序访存等高级特性
]
