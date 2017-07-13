\version "2.12.0"
\include "hymns/defines.ly"
#(define myNoteSpacing 5.0)
#(define raggedRight #t)
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
  \key f \major
}

womenWords = \lyricmode {To Thee O Lord. }
menWords = \lyricmode { }

sopMusic = \relative {
  \partial 4 a'4 bes2 bes2 a1 \bar "|."
}

altoMusic = \relative {
  \partial 4 f'4 d2 e2 f1 
}

tenorMusic = \relative {
  \partial 4 c'4 d2 c2 c1 
}

bassMusic = \relative {
  \partial 4 g4 bes2 g2 f1 
}

\include "hymns/two-staves.ly"
