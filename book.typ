
#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "Training Book",
  summary: [
    #prefix-chapter("intro.typ")[介绍]
    = 整装待发
    - #chapter("chapters/preparation/preparation.typ", section: "0.1")[初识A阶段]
    = NEMU
    - #chapter("chapters/software/RTFM.typ", section: "1.1")[RTFM]
    - #chapter("chapters/software/DIY.typ", section: "1.2")[DIY]
    = 工欲善其事
    - #chapter("chapters/tools/tools.typ", section: "2.1")[工具]
    = Superscalar & Out-of-Order
    - #chapter("chapters/preparation/learning.typ", section: "3.1")[理论学习]
    = 附录
    - #chapter("chapters/appendix/nscscc.typ", section: "4.1")[龙芯杯学习资源]
  ],
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
