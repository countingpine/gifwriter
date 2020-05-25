#pragma once

#ifndef __GIF_WRITER_BI__
#define __GIF_WRITER_BI__

#include "gif_lib.bi"

type GifWriter
	public:
	declare constructor(byref filename as const string, byval TestExistence as boolean = false)
	declare function saveScreen() as long
	declare function saveFrame( _
		byval p as const ubyte ptr, _
		byval wid as long, byval hei as long, byval pitch as long, _
		byval pal as const ulong const ptr) as long
	declare sub addDelay(byval centiseconds as ushort)
	declare function setLoop(byval loopcount as ushort = 0) as long
	declare function close() as long
	declare function errorString() as string
	declare destructor()

	as long errorcode = E_GIF_SUCCEEDED

	private:
	'' disable copying
	declare constructor(byref as const GifWriter)
	declare operator let(byref as const GifWriter)

	declare function putDelay() as long

	as GifFileType ptr gif

	as boolean writtenfirstframe = false
	as ushort delay = 0

	as GifPixelType ptr prevframe
	as GifPixelType ptr gifline
	as long gifwid, gifhei
	as ulong prevpal(0 to 255), gpal(0 to 255)
end type

#endif
