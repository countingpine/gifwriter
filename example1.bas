'' compile with fbc example1.bas gifwriter.bas
#include once "gifwriter.bi"

screen 13

dim s as string = !"Hello\nWorld!"

dim g as GifWriter = GifWriter("hello.gif")

g.setDefaultFrameDuration(10)

for i as integer = 1 to len(s)
	print mid(s, i, 1);
	if i = len(s) then g.setNextFrameDuration(100)
	g.saveScreen()
	sleep 100
next i

g.loopcount = GifWriter.LOOP_FOREVER

sleep
