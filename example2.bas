#include "gifwriter.bi"
'' compile with fbc example2.bas gifwriter.bas

screen 13

#define r(n) int(rnd * (n))

const W = 100, H = 100
dim as any ptr img = imagecreate(W, H), p
dim as integer pitch
imageinfo img, ,,, pitch, p

dim as GifWriter g = GifWriter("lines.gif")

dim as long pal(0 to 255)
for c as integer = 1 to 255
	pal(c) = r(16777216)
	palette c, pal(c) shr 16 and 255, pal(c) shr 8 and 255, pal(c) and 255
next c

for i as integer = 1 to 100
	line img, (r(W), r(H))-(r(W), r(H)), r(256)

	dim as ubyte c = 1 + r(255)
	pal(c) = r(16777216)
	palette c, pal(c) shr 16 and 255, pal(c) shr 8 and 255, pal(c) and 255
	g.saveframe(p, W, H, pitch, @pal(0))

	put (10, 10), img, pset
	sleep 10
next i

bsave "test-img.bmp", img
imagedestroy img
