use freeimage
import freeimage/[Version, Bitmap]

main: func {
        println("FreeImage version " + FreeImage getVersion())
        println(FreeImage getCopyrightMessage())

        bitmap := Bitmap new(320, 240, 32)
        println(bitmap width() + "x" + bitmap height() + " bpp: " + bitmap bpp())
}
