#import "/book.typ": book-page
#import "@preview/showybox:2.0.4": showybox

#show: book-page.with(title: "理论学习")


= 架构

== 初步学习

#link("https://ece752.ece.wisc.edu")[UWisc的ECE752]

推荐阅读#link("https://ece752.ece.wisc.edu/lect04-introsuperscalar.pdf")[Lecture 04]和#link("https://ece752.ece.wisc.edu/lect05-superscalar-org.pdf")[Lecture 05]，是对超标量处理器的一个很好的介绍。

目标：

+ 了解引入超标量技术的动机

+ 了解超标量处理器的基本结构

+ 了解超标量处理器如何处理
  - 分支预测与取指、译码
  - 数据依赖（RAW，WAR，WAW）
  - 访存

== 详细学习

上述内容只是一个引入，更具体的细节可以学习姚永斌老师的《超标量处理器设计》。

- 参考教材：
  + 《高性能超标量CPU：微架构剖析与设计》
  + 《Processor Microarchitecture: An Implementation Perspective》

这几本书覆盖的内容基本一致，只是在详细程度上有所取舍。

建议完整阅读《超标量处理器设计》中的相关章节，并有选择性的学习*参考教材*与*补充材料*中的相关内容。


== 补充材料


- 整体架构
  + \[#link(
      "https://github.com/OSCPU/NutShell-doc/blob/master/%E8%AE%BE%E8%AE%A1%E6%96%87%E6%A1%A3/%E4%B9%B1%E5%BA%8F%E6%A0%B8/Argo%E6%8A%80%E6%9C%AF%E6%96%87%E6%A1%A3.md",
    )[NutShell/Argo技术文档]\]
  + \[#link("https://github.com/mathis-s/SoomRV")[SoomRV]\]  RV32IMAC / 5.42 CoreMark/MHz / TAGE分支预测 / 分立的压缩式发射队列 / 非阻塞缓存 / 双路访存

- 寄存器重命名
  + \[#link("https://www.eecs.umich.edu/courses/eecs470/papers/RegisterRenaming_Sima.pdf")[The design space of register renaming techniques]\] 列举了不同的寄存器重命名策略，并分类
  + \[#link("https://mazirui2001.github.io/Zircon-2024-Web/Zircon2024/core/rename/")[Zircon-2024的重命名设计]\]

- 发射队列
  + 非压缩发射队列：\[#link("https://mazirui2001.github.io/Zircon-2024-Web/Zircon2024/experience/")[压缩vs非压缩]\] / \[#link("https://mazirui2001.github.io/Zircon-2024-Web/Zircon2024/core/issue/")[Zircon-2024的非压缩式发射队列]\]
  + 分组发射队列：\[#link("https://github.com/iFuProcessor/iFuMisc/tree/main/report")[iFuCore设计报告]\] / \[#link("https://github.com/iFuProcessor/iFuCore/blob/main/src/main/scala/backend/issue/IssueUnit.scala")[iFuCore的IssueUnit]\]

= ISA

== 热身活动

RISC-V ISA的学习将伴随着我们扩展NEMU功能的过程。后续我们会有针对性的学习，现在只需要完成热身活动即可。

请阅读手册，找出以下问题的答案：

+ `sstatus`和`mstatus`寄存器的关系是什么？

+ 在什么情况下，一条 `jal` / `jalr` 指令应当对RAS (Return Address Stack) 进行一次Push / Pop? （Hint：在实现ftrace时，就已经遇到过这个问题了）

+ `Instruction Address Misaligned` 异常是由哪条指令触发的？ C扩展的加入对这个异常有什么影响？
