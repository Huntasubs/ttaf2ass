 #!/bin/bash
#Ёбаный кот, вот это говноскрипт, Так что мы тут делаем...

#Вариаблы, они няши

lang="English"
script="script.xml"
header="[Script Info]\nTitle: sub.beer\nScriptType: v4.00+\nWrapStyle: 0\nPlayResX: 848\nPlayResY: 480\nScaledBorderAndShadow: yes"
header2="\n\n[V4+ Styles]\nFormat: Name, Fontname, Fontsize, PrimaryColour, SecondaryColour, OutlineColour, BackColour, Bold, Italic, Underline, StrikeOut, ScaleX, ScaleY, Spacing, Angle, BorderStyle, Outline, Shadow, Alignment, MarginL, MarginR, MarginV, Encoding\n"
header3="Style: Default,Open Sans Semibold,36,\&H00FFFFFF,\&H000000FF,\&H00020713,\&H00000000,-1,0,0,0,100,100,0,0,1,1.7,0,2,0,0,28,1"
header4="\n\n[Events]\nFormat: Layer, Start, End, Style, Name, MarginL, MarginR, MarginV, Effect, Text\n"
maxheader=$(echo $header$header2$header3$header4)
perl -wne "print if /<div xml:lang=\"$lang\"/ .. /<\/div>/" $script  | \
sed 's/<br \/>/\\N /g' | sed 's/<\/p>/ /g' | sed 's/<p\ begin\=\"0/Dialogue: 0,/g' | \
sed 's/\"\ end\=\"0/,/g' | sed 's/" style="1">/,Main,,0000,0000,0000,,/g' | \
tr -d "\t\n\r\f" | sed 's/Dialogue/\nDialogue/g' |sed 's/<\/div>//g' | \
sed "s/    <div xml:lang=\"$lang\">/$maxheader/g"  > $lang.ass
#sed -n -e '/\\N.*\\N/p' $lang.ass | sed 's/0000,,/0000,,{\\an8}/g' | sed '0,/RE/s/\\N/\N{\\an2}/' >> $lang.ass
