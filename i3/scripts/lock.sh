#!/bin/sh

B='#00000000'  # blank
C='#ffffff22'  # clear ish
D='#ff00ffcc'  # default
T='#ffffffff'  # text
W='#880000bb'  # wrong
V='#bb00bbbb'  # verifying

i3lock \
--verifcolor=$T       \
--wrongcolor=$T       \
--timecolor=$T        \
--datecolor=$T        \
--layoutcolor=$T      \
--keyhlcolor=$W       \
--bshlcolor=$W        \
--blur 5              \
--clock               \
--bar-indicator       \
--timestr="%H:%M:%S" \
--datestr="%A, %d %b %Y" \
--keylayout 2         \

# --veriftext="Drinking verification can..."
# --wrongtext="Nope!"
# --textsize=20
# --modsize=10
# --timefont=comic-sans
# --datefont=monofur
# etc
