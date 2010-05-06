use freeimage

FreeImage: cover {
    /* These are only needed if you are linking FreeImage statically. */
    initialize:   extern(FreeImage_Initialise)   func
    deinitialize: extern(FreeImage_DeInitialise) func

    MajorVersion:  extern(FREEIMAGE_MAJOR_VERSION)  static Int
    MinorVersion:  extern(FREEIMAGE_MINOR_VERSION)  static Int
    ReleaseSerial: extern(FREEIMAGE_RELEASE_SERIAL) static Int

    version: extern(FreeImage_GetVersion) static func -> String
    copyrightMessage: extern(FreeImage_GetCopyrightMessage) static func -> String
}
