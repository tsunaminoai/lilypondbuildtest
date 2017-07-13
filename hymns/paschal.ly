\version "2.12.0"
\include "hymns/defines.ly"
#(define myNoteSpacing 5.0)
#(define raggedRight #f)
midiTempo =
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 72 4)
      }
    }


\include "hymns/preamble.ly"



\header {
}

global = {
  \globalPreamble
  \key d \major
}

womenWords = \lyricmode {
  Christ is ris -- en from the dead
  Tramp -- ling down death by death
  And
    \once \override LyricText.self-alignment-X = #LEFT
    upon_those_in_the
    tombs be -- stow -- ing life
}
menWords = \lyricmode { }

sopMusic = \relative {
  fis'4 ^\ff g4 a4 a4 a4 a4 g4 (a4)
  b2 b4 b4 a4 g4 a2
  a4 a4 a4 b4 a2 g2 fis1 \mark \markup {"3x"} \bar ":|."
}

altoMusic = \relative {
   d'4 e4 fis4 fis4 fis4 fis4 e4 (fis4)
   g2 g4 g4 fis4 e4 fis2
   fis4 fis4 fis4 g4 fis2 e2 d1
}

tenorMusic = \relative {
   a4 a4 d4 d4 d4 d4 d2
   d2 d4 d4 d4 d4 d2
   d4 d4 d4 d4 d2 cis2 g1
}

bassMusic = \relative {
   d4 d4 d4 d4 d4 d4 d2
   g2 g4 d4 d4 d4 d2
   d4 d4 d4 g4 a2 a,2 d1
}

\include "hymns/two-staves.ly"
