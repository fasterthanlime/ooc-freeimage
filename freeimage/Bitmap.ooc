use freeimage
import io/File

BitmapStruct: cover from FIBITMAP

Bitmap: cover from BitmapStruct* {
        new: static func(width, height, bpp : Int) -> This {
                return FreeImage_Allocate(width, height, bpp, 0, 0, 0) as This
        }

        new: static func ~withPath(path : String) -> This {
                fif := 0
                fif = FreeImage_GetFileType(path, 0)
                if (fif == 0) {
                        fif = FreeImage_GetFIFFromFilename(path);
                }
                if ((fif != 0) && FreeImage_FIFSupportsReading(fif)) {
                        bitmap := FreeImage_Load(fif, path, 0)
                        return bitmap
                }
                return null
        }

        new: static func ~withFile(file : File) -> This { This new(file path) }

        clone: extern(FreeImage_Clone) func -> This

        width: extern(FreeImage_GetWidth) func -> Int
        height: extern(FreeImage_GetHeight) func -> Int
        bpp: extern(FreeImage_GetBPP) func -> Int

        imageType: extern(FreeImage_GetImageType) func -> ImageType
}

FreeImage_Allocate: extern func(Int, Int, Int, Int, Int, Int) -> Bitmap
FreeImage_Load: extern func(Int, String, Int) -> Bitmap
version(!windows) {
        FreeImage_GetFileType: extern func(String, Int) -> Int
}
version(windows) {
        FreeImage_GetFileType: extern(FreeImage_GetFileTypeU) func(String, Int) -> Int
}
FreeImage_GetFIFFromFilename: extern func(String) -> Int
FreeImage_FIFSupportsReading: extern func(Int) -> Bool

// FREE_IMAGE_TYPE enum
ImageType: cover from Int
FIT_UNKNOWN: extern Int // unknown type
FIT_BITMAP:  extern Int // standard image               : 1-, 4-, 8-, 16-, 24-, 32-bit
FIT_UINT16:  extern Int // array of unsigned short      : unsigned 16-bit
FIT_INT16:   extern Int // array of short               : signed 16-bit
FIT_UINT32:  extern Int // array of unsigned long       : unsigned 32-bit
FIT_INT32:   extern Int // array of long                : signed 32-bit
FIT_FLOAT:   extern Int // array of float               : 32-bit IEEE floating point
FIT_DOUBLE:  extern Int // array of double              : 64-bit IEEE floating point
FIT_COMPLEX: extern Int // array of FICOMPLEX           : 2 x 64-bit IEEE floating point
FIT_RGB16:   extern Int // 48-bit RGB image             : 3 x 16-bit
FIT_RGBA16:  extern Int // 64-bit RGBA image            : 4 x 16-bit
FIT_RGBF:    extern Int // 96-bit RGB float image       : 3 x 32-bit IEEE floating point
FIT_RGBAF:   extern Int // 128-bit RGBA float image     : 4 x 32-bit IEEE floating point
