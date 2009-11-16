use freeimage
include stdio

/*
 * FreeImage wrapper for ooc
 * Author: Scott Olson <scott@scott-olson.org>
 */

FreeImage: cover {
        MajorVersion: extern(FREEIMAGE_MAJOR_VERSION) static Int
        MinorVersion: extern(FREEIMAGE_MINOR_VERSION) static Int
        ReleaseSerial: extern(FREEIMAGE_RELEASE_SERIAL) static Int
}

printf("FreeImage %i.%i.%i\n", FreeImage MajorVersion, FreeImage MinorVersion, FreeImage ReleaseSerial)
