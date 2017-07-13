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

\paper {
  line-width = 5.5\cm
}

\header {
}

global = {
  \globalPreamble
  \key f \major
}

womenWords = \lyricmode { A -- men. }
menWords = \lyricmode { }

sopMusic = \relative {
  \partial 2 a'2 ^\pp f1 \bar "|."
}

altoMusic = \relative {
  \partial 2 f'2 a1
}

tenorMusic = \relative {
  \partial 2 c2 c1
}

bassMusic = \relative {
  \partial 2 e2 e1
}

\include "hymns/two-staves.ly"
