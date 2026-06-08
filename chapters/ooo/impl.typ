#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "工程实现")

#show: frame-style(styles.boxy)
#set heading(numbering: "1.1")

= 工程实现

本章整理乱序处理器工程实现中的关键设计点，包括五级流水基础、多发射、记分牌算法、Tomasulo算法以及后续优化方向。
