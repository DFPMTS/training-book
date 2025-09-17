#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "RTFM")

#show: frame-style(styles.boxy)

= Linux

== 缺失的一块

#reading[了解操作系统中的并发与互斥锁][
  #link("https://jyywiki.cn/OS/2023/build/lect6.ipynb.html")[jyy's 操作系统：设计与实现 - 6. 并发控制基础]

  #link("https://rcore-os.cn/rCore-Tutorial-Book-v3/chapter8/2lock.html")[rCore - 第八章：并发 - 互斥锁]
]

#question[单CPU系统也需要实现原子指令吗？][
  请给出论证或反例。

  如果你认为需要，请找出哪些 RISC-V 扩展提供了原子指令。
]

#question[为了运行Linux，哪些指令集扩展是必须实现的？][
  这是一个开放式的问题，也不需要一个完全严谨的回答。

  请 STFW 或#link("https://github.com/cnlohr/mini-rv32ima")[上手试试]，得出一个初步的答案。
]

#question[Debian呢？][
  对于#link("https://github.com/yuzibo/riscv32/")[rv32-Debian]来说，最小ISA是什么？
]

== CSR

#question[必须的CSR][
  这个问题不必现在就完整回答，但还是请找出*尽量多*的必须实现的`CSR`。
  （Hint：objdump）
]


== 中断

#reading[中断][
  - 阅读 PA 讲义： #link("https://ysyx.oscc.cc/docs/ics-pa/4.4.html")[PA4-分时多任务]

  - 阅读手册，理解 RISC-V 的中断机制。（提示：delegate 是什么？）

  - 了解 CLINT （可以参考 #link("https://www.scs.stanford.edu/~zyedidia/docs/sifive/sifive-vic-u7.pdf")[SiFive Vic_U7_Core Manual] 中的 Chapter 6）
]

尤其需要注意的是异常和中断委托机制。请特别注意`mideleg`，`mip`，`mie`，`sip`，`sie`等CSR 之间的关系。

#question[尝试回答以下中断相关问题][
  + MTIP 中断可以被委托给 S 特权级吗？
  + 当mideleg[i] = 0，当前特权级为 S，sstatus.SIE = 1，mie = 1，sip[i] = 1 且 sie[i] = 1 时，行为是什么?
]

#reading[分散的信息][

  要正确理解中断委托机制，需要仔细阅读手册中*所有*相关寄存器的说明，因为完整的中断委托机制的细节分散在不同 CSR 的描述中。

  如果你仍然感到困惑，可以参考以下讨论：
  - #link("https://lists.riscv.org/g/tech-privileged/topic/question_about_mideleg/95518557")[Question about mideleg]

  - #link("https://github.com/riscv/riscv-isa-manual/issues/1163")[Clarification needed on interrupt delegation]。

]


== 更多资料

如果遇到了困难，可以阅读以下优秀文档：

- \[#link("https://www.bilibili.com/video/BV14tASeUEYn/")[NEMU启动Linux - 郭明轩 - 一生一芯双周分享会]\] / \[#link("https://github.com/Seeker0472/ysyx-linux")[分享会的 repo]\]

- \[#link("https://github.com/CmdBlockZQG/rvcore-mini-linux")[
    CmdBlockZQG的最小 Linux 构建教程]\]

感谢 gmx 和 zqg 两位同学的分享。
