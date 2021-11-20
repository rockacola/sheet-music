\header {
  title = "Allegro"
}


main = {
  \relative c'' {
    a4 a e e |
    f8 g a g e4 e |
  }
}

\score {
  \relative c'' {
    \numericTimeSignature
    \time 4/4
    \key a \minor
    \tempo 4 = 80

    \main
  }

  \layout {}
  \midi {}
}