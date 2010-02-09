/*
 * This file uses IOHandler to load a bitmap from stdin. The reason
 * for this is that it can load bitmaps from any source that you can
 * define read, seek, and tell for. (It's also possible to write to
 * arbitrary resources.)
 * Run it with: ./iohandler < some/bitmap.png
 */

use freeimage
import freeimage/[IOHandler, Bitmap]
import io/FileReader

hread: func (buffer: Pointer, size: UInt, count: UInt, handle: Handle) -> UInt {
    fread(buffer, size, count, handle)
}

hseek: func (handle: Handle, offset: Long, origin: Int) -> Int {
    fseek(handle, offset, origin)
}

htell: func (handle: Handle) -> Long {
    ftell(handle)
}

main: func {
    io := IOHandler new(hread, null, hseek, htell)
    bitmap := Bitmap new(io&, stdin as Handle)
    "%ix%i bpp: %i" format(bitmap width(), bitmap height(), bitmap bpp()) println()
}
