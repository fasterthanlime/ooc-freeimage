use freeimage
import io/File
import freeimage/[ImageFormat, IOHandler]

Bitmap: cover from FIBITMAP* {
    new: static func (width, height, bpp: Int) -> This {
        FreeImage_Allocate(width, height, bpp, 0, 0, 0)
    }

    new: static func ~fromPath (path: String) -> This {
        fif := ImageFormat unknown
        fif = FreeImage_GetFileType(path, 0)

        if (fif == ImageFormat unknown) {
            fif = FreeImage_GetFIFFromFilename(path)
        }

        if ((fif != ImageFormat unknown) && FreeImage_FIFSupportsReading(fif)) {
            bitmap := FreeImage_Load(fif, path, 0)
            return bitmap
        }

        return null
    }

    new: static func ~fromFile (file: File) -> This {
        This new(file path)
    }

    new: static func ~fromHandle (io: IOHandler*, handle: FStream) -> This {
        fif := ImageFormat unknown
        fif = FreeImage_GetFileTypeFromHandle(io, handle, 0)

        if ((fif != ImageFormat unknown) && FreeImage_FIFSupportsReading(fif)) {
            bitmap := FreeImage_LoadFromHandle(fif, io, handle, 0)
            return bitmap
        }

        return null
    }

    clone: extern(FreeImage_Clone) func -> This

    save: func (filename: String, format: ImageFormat) -> Bool {
        FreeImage_Save(format, this, filename, 0)
    }

    unload: extern(FreeImage_Unload) func

    width: Int {
        get: extern(FreeImage_GetWidth)
    }

    height: Int {
        get: extern(FreeImage_GetHeight)
    }

    bpp: Int {
        get: extern(FreeImage_GetBPP)
    }

    imageType: extern(FreeImage_GetImageType) func -> ImageType

    // Toolkit functions
    rescale: extern(FreeImage_Rescale) func (width, height: Int, filter: Filter) -> This
    thumbnail: extern(FreeImage_MakeThumbnail) func (max: Int, convert: Bool) -> This
    thumbnail: func ~defaultConvert (max: Int) -> This {
        thumbnail(max, true)
    }
}

FreeImage_Allocate: extern func (Int, Int, Int, Int, Int, Int) -> Bitmap
FreeImage_Load: extern func (ImageFormat, String, Int) -> Bitmap
FreeImage_LoadFromHandle: extern func (ImageFormat, IOHandler*, FStream, Int) -> Bitmap
FreeImage_Save: extern func (ImageFormat, Bitmap, String, Int) -> Bool
FreeImage_GetFileType: extern func (String, Int) -> ImageFormat
FreeImage_GetFileTypeFromHandle: extern func (IOHandler*, FStream, Int) -> ImageFormat
FreeImage_GetFIFFromFilename: extern func (String) -> ImageFormat
FreeImage_FIFSupportsReading: extern func (ImageFormat) -> Bool

// FREE_IMAGE_TYPE enum
//ImageType: cover from FREE_IMAGE_TYPE
//FIT_UNKNOWN, FIT_BITMAP, FIT_UINT16, FIT_INT16, FIT_UINT32, FIT_INT32,
//FIT_FLOAT, FIT_DOUBLE, FIT_COMPLEX, FIT_RGB16, FIT_RGBA16, FIT_RGBF,
//FIT_RGBAF : extern const ImageType

ImageType: enum {
    unknown: extern(FIT_UNKNOWN)
    bitmap:  extern(FIT_BITMAP)
    uint16:  extern(FIT_UINT16)
    int16:   extern(FIT_INT16)
    uint32:  extern(FIT_UINT32)
    int32:   extern(FIT_INT32)
    float:   extern(FIT_FLOAT)
    double:  extern(FIT_DOUBLE)
    complex: extern(FIT_COMPLEX)
    rgb16:   extern(FIT_RGB16)
    rgba16:  extern(FIT_RGBA16)
    rgbf:    extern(FIT_RGBF)
    rgbaf:   extern(FIT_RGBAF)
}

// FREE_IMAGE_FILTER enum
Filter: cover from FREE_IMAGE_FILTER
FILTER_BOX, FILTER_BICUBIC, FILTER_BILINEAR, FILTER_BSPLINE, FILTER_CATMULLROM,
FILTER_LANCZOS3 : extern const Filter
