'' compile with fbc example1.bas gifwriter.bas
#include once "gifwriter.bi"

screen 13

dim s as string = !"Hello\nWorld!"
dim g as GifWriter = GifWriter("hello.gif")
for i as integer = 1 to len(s)
	print mid(s, i, 1);
	g.saveScreen()
	g.addDelay(10)
	sleep 100
next i
sleep
