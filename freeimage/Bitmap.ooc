use freeimage

BitmapStruct: cover from FIBITMAP

Bitmap: cover from BitmapStruct* {
        new: static func(width, height, bpp : Int) -> This {
                return FreeImage_Allocate(width, height, bpp, 0, 0, 0) as This
        }

        width: extern(FreeImage_GetWidth) func -> Int
}

FreeImage_Allocate: extern func(Int, Int, Int, Int, Int, Int) -> Bitmap