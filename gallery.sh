#!/usr/bin/env bash
shopt -s expand_aliases
source "$HOME"/.bash_aliases
mkdir -p src images

templates=("amiga" "aws-orange" "black-knight" "bluegray" "blueprint" "cerulean-outline" "cerulean" "crt-amber" "crt-green" "cyborg-outline" "cyborg" "hacker" "lightgray" "mars" "materia-outline" "materia" "metal" "mimeograph" "minty" "plain" "reddress-darkblue" "reddress-darkgreen" "reddress-darkorange" "reddress-darkred" "reddress-lightblue" "reddress-lightgreen" "reddress-lightorange" "reddress-lightred" "sandstone" "silver" "sketchy-outline" "sketchy" "spacelab" "spacelab-white" "superhero-outline" "superhero" "toy" "united" "vibrant")

for t in "${templates[@]}"; do
	echo "$t"
	cat > src/"$t".plantuml <<EOF
@startsalt
!theme $t
title $t
skinparam dpi 300
skinparam handwritten true
{
  Just plain text
  [This is my button]
  ()  Unchecked radio
  (X) Checked radio
  []  Unchecked box
  [X] Checked box
  "Enter text here   "
  ^This is a droplist^
}
@endsalt

EOF
	plantuml -tpng -p -charset utf-8 < src/"$t".plantuml > images/"$t".png
done

montage images/*.png -mode Concatenate -tile 7x6 gallery.png
