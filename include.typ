#import "/book.typ": book-page
#import "@preview/frame-it:1.2.0": *


#let (reading, feature, variant, question) = frames(
  feature: ("Feature",),
  // For each frame kind, you have to provide its supplement title to be displayed
  variant: ("Variant",),
  // You can provide a color or leave it out and it will be generated
  reading: ("Reading", orange.lighten(30%)),
  // You can add as many as you want
  question: ("Question", red.lighten(50%)),
)
// This is necessary. Don't forget this!
#show: frame-style(styles.boxy)
