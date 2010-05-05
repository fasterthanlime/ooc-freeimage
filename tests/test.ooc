use freeimage
import freeimage/[Version, Bitmap, ImageFormat]
import io/File
import structs/ArrayList

main: func (args : ArrayList<String>) {
    println("FreeImage version " + FreeImage version())
    println(FreeImage copyrightMessage())

    bitmap1 := Bitmap new(320, 240, 32)
    printf("new bitmap: %ix%i bpp: %i\n", bitmap1 height, bitmap1 width, bitmap1 bpp)

    bitmap1c := bitmap1 clone()
    printf("clone bitmap: %ix%i bpp: %i\n", bitmap1c height, bitmap1c width, bitmap1c bpp)

    if (args size() != 2) {
        println("Please provide the path to a bitmap file to test loading bitmaps from files.")
    }
    else {
        bitmap2 := Bitmap new(args[1])
        printf("bitmap from file: %ix%i bpp: %i\n", bitmap2 height, bitmap2 width, bitmap2 bpp)

        thumb := bitmap2 thumbnail(256)
        thumb save("test.jpg", ImageFormat jpeg)
    }
}
