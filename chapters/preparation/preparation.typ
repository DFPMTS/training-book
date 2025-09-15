#import "/book.typ": book-page
#import "@preview/showybox:2.0.4": showybox

#show: book-page.with(title: "初识A阶段")

= 初识A阶段

以下内容主要来自#link("https://ysyx.oscc.cc/docs/2306/advanced/advanced.html")[第六期一生一芯的A阶段大纲]

== PA Continued

完成 PA3 与 PA4.2。

选做题：并发执行多个用户进程。

目标：理解SV32页表 & 学习OS基本知识。

== M-extension

乘法器与除法器设计。

建议：首先实现流水化Radix-4 Booth乘法器与恢复余数的除法器。

目标：理解功能单元设计。

思考题：优化除法器的延迟对性能影响？如何定量分析？

参考资料：

- #link("https://ysyx.oscc.cc/slides/2205/20.html")[第五期课件：功能单元设计]

- #link(
    "https://github.com/MaZirui2001/cs-teaching/blob/main/Computer-Organization-and-Design/Advanced/%E4%B9%98%E6%B3%95%E5%99%A8%E4%B8%8E%E9%99%A4%E6%B3%95%E5%99%A8%E7%9A%84%E8%AE%BE%E8%AE%A1.pdf",
  )[MaZirui2001: 乘法器与除法器的设计]

== 改造NPC

在NPC上实现

- RV32E -> RV32I

- M-extension

- Virtual Memory

并运行支持虚存管理的Nanos-lite

在实现SV32页表的过程中，尽量：（1）参数化 （2）模块化，以便后续复用。

！（你理解细节的）应用程序是宝贵的验证资源。

= ISA

== 热身活动

RISC-V ISA的学习将伴随着我们扩展NEMU功能的过程。后续我们会有针对性的学习，现在只需要完成热身活动即可。

请阅读手册，找出以下问题的答案：

+ `sstatus`和`mstatus`寄存器的关系是什么？

+ 在什么情况下，一条 `jal` / `jalr` 指令应当对RAS (Return Address Stack) 进行一次Push / Pop? （Hint：在实现ftrace时，就已经遇到过这个问题了）

+ `Instruction Address Misaligned` 异常是由哪条指令触发的？ C扩展的加入对这个异常有什么影响？
