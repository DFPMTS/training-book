#import "/book.typ": book-page
#import "@preview/frame-it:1.2.0": *

#show: book-page.with(title: "RTFM")


#let (example, feature, variant, syntax) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  example: ("Example", red.darken(40%)),
  // You can add as many as you want
  syntax: ("Syntax",),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)


#example[Title][Optional Tag][
  Body, i.e. large content block for the frame.
]

#syntax[Title][Optional Tag][
  Body, i.e. large content block for the frame.
]

#variant[Title][Optional Tag][
  Body, i.e. large content block for the frame.
]

