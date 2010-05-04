use freeimage

FreeImage: cover {
    MajorVersion: extern(FREEIMAGE_MAJOR_VERSION) static Int
    MinorVersion: extern(FREEIMAGE_MINOR_VERSION) static Int
    ReleaseSerial: extern(FREEIMAGE_RELEASE_SERIAL) static Int

    version: extern(FreeImage_GetVersion) static func -> String
    copyrightMessage: extern(FreeImage_GetCopyrightMessage) static func -> String
}
