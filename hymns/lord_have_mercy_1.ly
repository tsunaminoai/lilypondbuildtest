\version "2.12.0"
\include "hymns/defines.ly"
#(define myNoteSpacing 5.0)
#(define raggedRight #t)
\include "hymns/preamble.ly"

global = {
  \globalPreamble
  \key f \major
  \override Staff.TimeSignature #'stencil = #ly:text-interface::print
  \override Staff.TimeSignature #'text = ""
}

monoWords = \lyricmode {
  Lord have mer -- cry
}

monoMusic = \relative {
  \cadenzaOn
  f'2 g4  a2 \melisma \bar "|" g4 \melismaEnd f2. \bar "|."
}

\include "hymns/single-staff.ly"
