
#import "@preview/shiroa:0.2.3": *

#show: book

#book-meta(
  title: "Training Book",
  summary: [
    #prefix-chapter("intro.typ")[介绍]
    = 整装待发
    - #chapter("chapters/preparation/preparation.typ", section: "0.1")[初识A阶段]
    - #chapter("chapters/preparation/learning.typ", section: "0.2")[理论学习]
    = NEMU
    - #chapter("chapters/software/RTFM.typ", section: "1.1")[RTFM]
    - #chapter("chapters/software/software.typ", section: "1.2")[软件]
    = 工欲善其事
    - #chapter("chapters/tools/tools.typ", section: "2.1")[工具]
  ],
)



// re-export page template
#import "/templates/page.typ": project
#let book-page = project
