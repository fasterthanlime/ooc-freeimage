use freeimage
import io/File
import freeimage/IOHandler

BitmapStruct: cover from FIBITMAP

Bitmap: cover from BitmapStruct* {
    new: static func(width, height, bpp : Int) -> This {
            return FreeImage_Allocate(width, height, bpp, 0, 0, 0) as This
    }

    new: static func ~withPath(path : String) -> This {
        fif := FIF_UNKNOWN
        fif = FreeImage_GetFileType(path, 0)
        if (fif == FIF_UNKNOWN) {
            fif = FreeImage_GetFIFFromFilename(path);
        }
        if ((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif)) {
            bitmap := FreeImage_Load(fif, path, 0)
            return bitmap
        }
        return null
    }

    new: static func ~withFile(file : File) -> This {
        This new(file path)
    }

    new: static func ~fromHandle (io : IOHandler*, handle : Handle) -> This {
        fif := FIF_UNKNOWN
        fif = FreeImage_GetFileTypeFromHandle(io, handle, 0)
        if ((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif)) {
            bitmap := FreeImage_LoadFromHandle(fif, io, handle, 0)
            return bitmap
        }
        return null
    }

    clone: extern(FreeImage_Clone) func -> This

    width: extern(FreeImage_GetWidth) func -> Int
    height: extern(FreeImage_GetHeight) func -> Int
    bpp: extern(FreeImage_GetBPP) func -> Int

    imageType: extern(FreeImage_GetImageType) func -> ImageType
}

FreeImage_Allocate: extern func(Int, Int, Int, Int, Int, Int) -> Bitmap
FreeImage_Load: extern func(ImageFormat, String, Int) -> Bitmap
FreeImage_LoadFromHandle: extern func(ImageFormat, IOHandler*, Handle, Int) -> Bitmap
version(!windows) {
    FreeImage_GetFileType: extern func(String, Int) -> ImageFormat
}
version(windows) {
    FreeImage_GetFileType: extern(FreeImage_GetFileTypeU) func(String, Int) -> ImageFormat
}
FreeImage_GetFileTypeFromHandle: extern func(IOHandler*, Handle, Int) -> ImageFormat
FreeImage_GetFIFFromFilename: extern func(String) -> ImageFormat
FreeImage_FIFSupportsReading: extern func(ImageFormat) -> Bool

// FREE_IMAGE_FORMAT
ImageFormat: cover from Int
FIF_UNKNOWN, FIF_BMP, FIF_ICO, FIF_JPEG, FIF_JNG, FIF_KOALA, FIF_LBM,
FIF_IFF, FIF_MNG, FIF_PBM, FIF_PBMRAW, FIF_PCD, FIF_PCX, FIF_PGM,
FIF_PGMRAW, FIF_PNG, FIF_PPM, FIF_PPMRAW, FIF_RAS, FIF_TARGA,
FIF_TIFF, FIF_WBMP, FIF_PSD, FIF_CUT, FIF_XBM, FIF_XPM, FIF_DDS,
FIF_GIF, FIF_HDR, FIF_FAXG3, FIF_SGI, FIF_EXR, FIF_J2K, FIF_JP2,
FIF_PFM, FIF_PICT, FIF_RAW : extern const ImageFormat

// FREE_IMAGE_TYPE enum
ImageType: cover from Int
FIT_UNKNOWN, FIT_BITMAP, FIT_UINT16, FIT_INT16, FIT_UINT32, FIT_INT32,
FIT_FLOAT, FIT_DOUBLE, FIT_COMPLEX, FIT_RGB16, FIT_RGBA16, FIT_RGBF,
FIT_RGBAF : extern const ImageType
