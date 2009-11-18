use freeimage
import freeimage/[Version, Bitmap]
import io/File
import structs/ArrayList

main: func (argc : Int, argv : String*) {
        println("FreeImage version " + FreeImage getVersion())
        println(FreeImage getCopyrightMessage())

        if (argc != 2) {
                println("Please provide the path to a bitmap file to test with.")
                exit(1)
        }

        bitmap1 := Bitmap new(320, 240, 32)
        printf("new bitmap: %ix%i bpp: %i\n", bitmap1 height(), bitmap1 width(), bitmap1 bpp())

        bitmap2 := Bitmap new(argv[1])
        printf("bitmap from filepath: %ix%i bpp: %i\n", bitmap2 height(), bitmap2 width(), bitmap2 bpp())

        bitmap3f := File new(argv[1])
        bitmap3 := Bitmap new(bitmap3f)
        printf("bitmap from File: %ix%i bpp: %i\n", bitmap3 height(), bitmap3 width(), bitmap3 bpp())
}
