#import "/book.typ": book-page
#import "@preview/showybox:2.0.4": showybox

#show: book-page.with(title: "工具")

= LightSSS

#block(
  fill: yellow.lighten(80%),
  stroke: yellow.darken(50%),
  radius: 5pt,
  inset: 15pt,
  width: 90%,
  [#box(image("../../document-svgrepo-com.svg", height: 1.5em), baseline: 0.4em)#text(
      "XiangShan官方文档对于LightSSS的介绍",
      size: 1.2em,
      weight: "bold",
    )],
)
#block(
  fill: yellow.lighten(80%),
  stroke: yellow.darken(50%),
  radius: 5pt,
  inset: 15pt,
  width: 90%,
  quote(block: true, attribution: [https://docs.xiangshan.cc/zh-cn/latest/tools/lightsss/], quotes: false)[
    在仿真调试过程中，并不需要完整过程的波形，只需要在仿真出错的时候把前面一段时间内的波形保存即可。Verilator等仿真器提供了持久化保存电路状态的snapshot功能，仿真出错时可以调用这个功能生成相应的状态文件，复现错误的时候可以用这个文件从特定电路状态开始跑仿真。但这个功能的局限性有以下几点：

    - 只能保存RTL电路的状态，其他仿真的部分比如参考模型、DRAMSim3等的状态不能被保存
    - 而且当电路规模比较大的时候，保存电路状态的存储开销比较大

    为此我们开发了轻量级的仿真快照工具lightSSS，它可以在仿真进程出错时自动保存出错点附近的波形和debug信息而不需要经过电路状态文件这个中间层。
  ],
)


== 更多信息

- #link(
    "https://github.com/OpenXiangShan/XiangShan-doc/blob/main/slides/20210623-RVWC-LightSSS%EF%BC%9A%E5%9F%BA%E4%BA%8E%E5%86%85%E5%AD%98%E7%9A%84%E8%BD%BB%E9%87%8F%E7%BA%A7%E4%BB%BF%E7%9C%9F%E5%BF%AB%E7%85%A7.pdf",
  )[20210623-RVWC-LightSSS：基于内存的轻量级仿真快照]

- #link("https://www.bilibili.com/video/BV1Dbc8ebEqS")[香山LightSSS剖析 - 王植鑫 - 一生一芯双周分享会]

- #link(
    "https://www.bilibili.com/video/BV1fTR3YuEHm",
  )[在NPC上移植LightSSS - 彭培智 - 一生一芯双周分享会]

= RVGCpt

如果你有兴趣的话，可以尝试实现checkpoint工具。

#link("https://github.com/OpenXiangShan/LibCheckpointAlpha")[https://github.com/OpenXiangShan/LibCheckpointAlpha]

用途：在 Linux 启动完成后生成 checkpoint 供 npc 使用，跳过漫长的 Linux 启动流程。
