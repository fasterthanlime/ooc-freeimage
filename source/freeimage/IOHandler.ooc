use freeimage
import io/FileReader

IOHandler: cover from FreeImageIO {
    read_proc:  extern Pointer
    write_proc: extern Pointer
    seek_proc:  extern Pointer
    tell_proc:  extern Pointer

    init: func@ (=read_proc, =write_proc, =seek_proc, =tell_proc) {}
}
