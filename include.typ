#import "/book.typ": book-page
#import "@preview/frame-it:1.2.0": *


#let (reading, advice, variant, question) = frames(
  advice: ("Advice", rgb("#dbeafe")),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  reading: ("Reading", rgb("#fef3c7")),
  // You can add as many as you want
  question: ("Question", rgb("#fde68a")),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
