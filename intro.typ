#import "/book.typ": book-page
#import "@preview/frame-it:1.2.0": *

#show: book-page.with(title: "Introduction")

本文遵循以下组织形式：

#block(
  fill: yellow.lighten(80%),
  stroke: yellow.darken(50%),
  radius: 5pt,
  inset: 15pt,
  width: 90%,
  [#box(image("./document-svgrepo-com.svg", height: 1.5em), baseline: 0.4em)#text(
      "2306讲义中对A阶段编排顺序的介绍",
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
  quote(block: true, attribution: [https://ysyx.oscc.cc/docs/2306/advanced/advanced.html], quotes: false)[
    + 先实现软硬件的ISA功能, 因为这部分功能对软件和硬件都有影响, 实现这部分内容后, 硬件的功能上限基本上就确定了
    + 然后实现更多系统软件的支持, 在硬件功能确定的情况下运行更复杂的软件
    + 最后对微结构进行优化, 并用相对完整的系统软件和应用程序来评估优化的效果
  ],
)
