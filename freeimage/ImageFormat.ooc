use freeimage
import structs/ArrayList, text/StringTokenizer

ImageFormat: extern(FREE_IMAGE_FORMAT) enum {
    unknown: extern(FIF_UNKNOWN)
    bmp:     extern(FIF_BMP)
    ico:     extern(FIF_ICO)
    jpeg:    extern(FIF_JPEG)
    jgn:     extern(FIF_JNG)
    koala:   extern(FIF_KOALA)
    lbm:     extern(FIF_LBM)
    iff:     extern(FIF_IFF)
    mng:     extern(FIF_MNG)
    pbm:     extern(FIF_PBM)
    pbmraw:  extern(FIF_PBMRAW)
    pcd:     extern(FIF_PCD)
    pcx:     extern(FIF_PCX)
    pgm:     extern(FIF_PGM)
    pgmraw:  extern(FIF_PGMRAW)
    png:     extern(FIF_PNG)
    ppm:     extern(FIF_PPM)
    ppmraw:  extern(FIF_PPMRAW)
    ras:     extern(FIF_RAS)
    targa:   extern(FIF_TARGA)
    tiff:    extern(FIF_TIFF)
    wbmp:    extern(FIF_WBMP)
    psd:     extern(FIF_PSD)
    cut:     extern(FIF_CUT)
    xbm:     extern(FIF_XBM)
    xpm:     extern(FIF_XPM)
    dds:     extern(FIF_DDS)
    gif:     extern(FIF_GIF)
    hdr:     extern(FIF_HDR)
    faxg3:   extern(FIF_FAXG3)
    sgi:     extern(FIF_SGI)
    exr:     extern(FIF_EXR)
    j2k:     extern(FIF_J2K)
    jp2:     extern(FIF_JP2)
    pfm:     extern(FIF_PFM)
    pict:    extern(FIF_PICT)
    raw:     extern(FIF_RAW)

//    toString: extern(FreeImage_GetFormatFromFIF) func -> String

//    extensionListString: extern(FreeImage_GetFIFExtensionList) func -> String

//    extensionList: func -> ArrayList<String> {
//        extensionListString() split(',') toArrayList()
//    }
}
