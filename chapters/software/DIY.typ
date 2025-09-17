#import "/book.typ": book-page
#import "/include.typ": *

#show: book-page.with(title: "DIY")

#show: frame-style(styles.boxy)


= “来自外部的声音”

#question[在 NEMU 中实现时钟中断][
  + 在 NEMU 中添加中断相关的机制与 CSR。
  + 为你的 NEMU 添加一个 CLINT，并驱动相应的 CSR。
]

= Svade / Svadu

#question[这是什么？][
  如果你不了解，请重新阅读 SV32 页表相关章节，并再次检查你的 MMU 是否正确实现。
]

= 检验你的实现

#question[在 NEMU 上运行 Linux][
  你会遇到 Difftest 相关的问题，请仔细思考如何应对（Hint：注意中断相关的 CSR）。暂时不开启 Difftest 也是一种选择。

  构建最小的Linux可以参考 #link("https://github.com/CmdBlockZQG/rvcore-mini-linux")[zqg同学的笔记]。
]


#question[更丰富的应用程序][
  使用 #link("https://github.com/buildroot/buildroot")[Buildroot] 构建根文件系统，运行更丰富的应用程序。
]

= RV32 Debian

如果你想实现 RV32 Debian，还需要开启NEMU 的 SD 卡外设，并将驱动程序加入 Linux 内核。

Debian rootfs 可以在 #link("https://github.com/yuzibo/riscv32/")[这里] 找到。

#question[C 扩展][
  如何让 NEMU 支持不定长译码？
]

#question[如果你决定实现 C 扩展][
  考虑以下情况：假设在取指时，一条 4 字节指令的后 2 字节发生了 page fault，`xepc` 和 `xtval` 分别应该存储什么值？
]

#question[SD 卡驱动程序][
  参考 NEMU 中的文档，将 NEMU SD 卡驱动加入kernel。
]

#question[浮点数？][
  如果你选择使用 #link("https://github.com/riscv-software-src/riscv-pk")[riscv-pk/bbl]，则可以 trap-and-emulate 浮点指令。
]
