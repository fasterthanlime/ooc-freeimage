use freeimage
import io/File
import freeimage/[ImageFormat, IOHandler]

Bitmap: cover from FIBITMAP* {
    new: static func (width, height, bpp: Int) -> This {
        FreeImage_Allocate(width, height, bpp, 0, 0, 0)
    }

    new: static func ~fromPath (path: String) -> This {
        fif := FIF_UNKNOWN
        fif = FreeImage_GetFileType(path, 0)
        if (fif == FIF_UNKNOWN) {
            fif = FreeImage_GetFIFFromFilename(path)
        }
        if ((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif)) {
            bitmap := FreeImage_Load(fif, path, 0)
            return bitmap
        }
        return null
    }

    new: static func ~fromFile (file: File) -> This {
        This new(file path)
    }

    new: static func ~fromHandle (io: IOHandler*, handle: Handle) -> This {
        fif := FIF_UNKNOWN
        fif = FreeImage_GetFileTypeFromHandle(io, handle, 0)
        if ((fif != FIF_UNKNOWN) && FreeImage_FIFSupportsReading(fif)) {
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
FreeImage_LoadFromHandle: extern func (ImageFormat, IOHandler*, Handle, Int) -> Bitmap
FreeImage_Save: extern func (ImageFormat, Bitmap, String, Int) -> Bool
FreeImage_GetFileType: extern func (String, Int) -> ImageFormat
FreeImage_GetFileTypeFromHandle: extern func (IOHandler*, Handle, Int) -> ImageFormat
FreeImage_GetFIFFromFilename: extern func (String) -> ImageFormat
FreeImage_FIFSupportsReading: extern func (ImageFormat) -> Bool

// FREE_IMAGE_TYPE enum
ImageType: cover from FREE_IMAGE_TYPE
FIT_UNKNOWN, FIT_BITMAP, FIT_UINT16, FIT_INT16, FIT_UINT32, FIT_INT32,
FIT_FLOAT, FIT_DOUBLE, FIT_COMPLEX, FIT_RGB16, FIT_RGBA16, FIT_RGBF,
FIT_RGBAF : extern const ImageType

// FREE_IMAGE_FILTER enum
Filter: cover from FREE_IMAGE_FILTER
FILTER_BOX, FILTER_BICUBIC, FILTER_BILINEAR, FILTER_BSPLINE, FILTER_CATMULLROM,
FILTER_LANCZOS3 : extern const Filter
