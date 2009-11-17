use freeimage

FreeImage: cover {
        MajorVersion: extern(FREEIMAGE_MAJOR_VERSION) static Int
        MinorVersion: extern(FREEIMAGE_MINOR_VERSION) static Int
        ReleaseSerial: extern(FREEIMAGE_RELEASE_SERIAL) static Int

        getVersion: extern(FreeImage_GetVersion) static func -> String
        getCopyrightMessage: extern(FreeImage_GetCopyrightMessage) static func -> String
}
