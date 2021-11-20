\header {
  title = "Allegro"
}

main = \relative g'' {
  a4 a e e |
  f8 g a f e4 e |
  d d c c |
  b8 a b c a2
}

\score {
  \relative g'' {
    \key a \major
    \tempo 4 = 105
    \numericTimeSignature
    \time 4/4

    \repeat "volta" 2 { \main }

    \relative g'' {
      f4 f e \relative c'' { a } |
      f f e \relative c'' { a } |
      f g a f |
      e c b2
    }

    R1

    \main
  }

  \layout {}
  \midi {}
}
