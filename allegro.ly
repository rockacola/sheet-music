\version "2.18.2"
\include "deutsch.ly"

#(set-global-staff-size 20)

\header {
  title     = \markup \bold \italic "Allegro"
  composer  = "Johann Joachim Quantz (1697-1773)"
  arranger  = "arr. Björn Sothmann"
  enteredby = "cellist (2010-09-14)"
}

voiceconsts = {
 \key g \major
 %\numericTimeSignature
 \time 4/4
 \tempo "Allegro " 4=120
}

mivl = "violin"
miba = "cello"

va = \relative c'' {
  \voiceconsts
  \clef "treble"

  \repeat volta 2 {
    \partial 8 d8
    h d fis, d' g, d' a d
    h d e g, fis e d d'
    h e cis fis d g e a
    fis a h d, \appoggiatura d cis4. e8
    fis a, e' a, a' a, g' a,
    fis' a, e' a, a' a, g' a,
    fis' d h e cis a' e g
    fis d e cis d h a g
    fis d' e, cis' d,4.
  }
  \repeat volta 2 {
    a''8
    fis a cis, a' d, a' fis d
    c e a, c h a g h
    e h fis' h, g' h, a' h,
    h' e, c' e, \appoggiatura e dis4. fis8
    g h, fis' h, h' h, a' h,
    g' h, fis' h, h' h, a' h,
    g' e fis cis dis h e h
    fis fis' h, dis \appoggiatura dis e4 r8 g
    a d, a' c, h g d' g,
    e' a, e' g, fis e d d'
    h d fis, d' g, d' a d 
    h d fis, d' g, d' a d
    h g' d f e a e g
    fis d' a c h d a d
    h d a g \appoggiatura g fis4. a8
    h d, a' d, d' d, c' d,
    h' d, a' d, d' d, c' d,
    h' g a e fis d g h,
    a a' d, fis \appoggiatura fis g4 r8 a,
    h d, a' d, d' d, c' d,
    h' d, a' d, d' d, c' d,
    h' g e a fis d' a c
    h g' a fis g e d c
    h g' a fis g e d c
    h g' a, fis' g,4
  }
}

vb = \relative c' {
   \voiceconsts
   \clef "bass"

   \repeat volta 2 {
     \partial 8 r8
     g4 a h fis
     g c, d fis
     g a h cis
     d g, a8 a, cis a
     d4 a r cis
     d a r cis
     d g a cis
     d8 fis, g a h4 cis
     d8 fis, g a d,4.
   }
   \repeat volta 2 {
     r8
     d4 e fis d
     e fis g r8 fis
     e4 dis e fis
     g a h8 h, dis h
     e4 h r dis
     e h r dis
     fis a2 g4
     a h e,8 fis g e
     fis4 d g h,
     c cis d r8 fis
     g4 a h fis
     g a h fis
     g h c cis
     d fis, g fis
     g c d8 d, fis d
     g4 d r fis
     g d r fis
     g c2 h4
     c d g,8 a h fis
     g4 d r fis
     g d r fis
     g c, d fis
     g8 h, c d e4 fis
     g8 h, c d e4 fis
     g8 h, c d g,4 
   }
}

music = \new StaffGroup <<
      \new Staff {
        \set Staff.midiInstrument = \mivl
        \set Staff.instrumentName = \markup \center-column { "Violine" }
        \transpose g f { \va }
      }

      \new Staff {
        \set Staff.midiInstrument = \miba
        \set Staff.instrumentName = \markup \center-column { "Violon-" "cello" }
        \transpose g f { \vb }
      }
>>

\book {
   \paper {
    print-page-number = ##t
    print-first-page-number = ##t
    ragged-last-bottom = ##f
    oddHeaderMarkup = \markup \null
    evenHeaderMarkup = \markup \null
    oddFooterMarkup = \markup {
      \fill-line {
        \on-the-fly #print-page-number-check-first
        "Johann Joachim Quantz - Allegro" \fromproperty #'page:page-number-string
      }
    }
    evenFooterMarkup = \oddFooterMarkup
  } \score {
    \music
    \layout {}
  }

  \score {
    \unfoldRepeats \music

    \midi {
      \context {
        \Score
      }
    }
  }
}