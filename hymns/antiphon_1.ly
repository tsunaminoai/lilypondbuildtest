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
  \key g \major
}

womenWords = \lyricmode {
  Make a joy -- ful noise to God, all the earth!
  Sing of this name, give glo -- ry to his praise!

  Through the prayers of the The -- o -- to -- kos, O Sav -- ior, save us.

  Let all the earth wor -- ship thee and praise thee!
  Let it praise they name O most high!

  %show the refrain marker in the lyric line
  \once \override LyricText.self-alignment-X = #LEFT
  \markup {\bold Refrain}

  Glo -- ry to the \once \override LyricText.self-alignment-X = #LEFT Father_and_to_the_son,_and_to The Ho -- ly Spi -- rit,
  now and \once \override LyricText.self-alignment-X = #LEFT ev_-_er_and_unto_a -- ges of a -- ges, a -- men.

  %show the refrain marker in the lyric line
  \once \override LyricText.self-alignment-X = #LEFT
  \markup {\bold Refrain}

}
menWords = \lyricmode {}

sopMusic = \relative {

  g'4 a4 b4 b4 a4 b4 c2 c4 c4 b2
  g4  g4 a4 b4 g4 a2 a4 a4 a4 g2

  %add the bars denoting the refrain and also mark this as the refrain.
  \bar ".|" \mark Refrain \time 2/4 g4 a4 \time 4/4 b2 b4 b4 a4 b4 c2 b4 (c4) b4 (a4) g2 a2 b1 (a1) g1 \bar "|."

  g4 g4 a4 b4 b4 b4 a4 b4 c2 b2
  g4 a4 b4 g4 a2 a4 a4 g1

  %add a hidden whole note to align the "Refrain" mark to
  \bar "||" \hideNotes c1 \unHideNotes \bar "||"

  g4 g4 g4 a4 b4 b4 a4 b4 c2 b2
  g4 a4 b4 b4 g4 a2 a4 a4 g2.

  %add a hidden whole note to align the "Refrain" mark to
  \bar "||" \hideNotes c1 \unHideNotes \bar "|."
}

altoMusic = \relative {
  g'4 g4 g4 g4 g4 g4 g2 g4 g4 g2
  g4 g4 g4 g4 g4 fis2 fis4 fis4 fis4 d2

  g4 g4 g2 g4 g4 g4 g4 g2 g2 g2 g2 g2 g1 (d1) d1

  g4 g4 g4 g4 g4 g4 g4 g4 g2 g2
  g4 g4 g4 g4 fis2 fis4 fis4 d1
  \hideNotes c1 \unHideNotes

  g'4 g4 g4 g4 g4 g4 g4 g4 g2 g2
  g4 g4 g4 g4 g4 fis2 fis4 fis4 d2.

  \hideNotes c1 \unHideNotes
}

tenorMusic = \relative {
  b4 c4 d4 d4 c4 d4 e2 e4 e4 d2
  b4 b4 c4 d4 b4 c2 c4 c4 c4 b2

  b4 c4 d2 d4 d4 c4 d4 e2 d4 (e4) d4 (c4) b2 c2 d1 (c1) b1

  b4 b4 c4 d4 d4 d4 c4 d4 e2 d2
  b4 c4 d4 b4 c2 c4 c4 b1

  \hideNotes c1 \unHideNotes

  b4 b4 b4 c4 d4 d4 c4 d4 e2 d2
  b4 c4 d4 d4 b4 c2 c4 c4 b2.

  \hideNotes c1 \unHideNotes
}

bassMusic = \relative {
  g4 g4 g4 g4 g4 g4 c,2 c4 e4 g2
  g4 g4 g4 g4 g4 d2 d4 d4 d4 g2

  g4 g4 g2 g4 g4 g4 g4 c2 g2 g2 g2 e2 d1 (d1) g1

  g4 g4 g4 g4 g4 g4 g4 g4 c,4 (e4) g2
  g4 g4 g4 g4 d2 d4 d4 g1

  \hideNotes c1 \unHideNotes

  g4 g4 g4 g4 g4 g4 g4 g4 c,4 (e4) g2
  g4 g4 g4 g4 g4 d2 d4 d4 g2.

  \hideNotes c1 \unHideNotes
}

\include "hymns/two-staves.ly"
