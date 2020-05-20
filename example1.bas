#include "gifwriter.bi"
'' compile with fbc example1.bas gifwriter.bas

screen 13

dim s as string = !"Hello\nWorld!"
dim g as GifWriter = GifWriter("hello.gif")
for i as integer = 1 to len(s)
	print mid(s, i, 1);
	g.saveScreen()
	sleep 100
next i
sleep
