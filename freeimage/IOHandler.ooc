use freeimage
import io/FileReader

IOHandler: cover from FreeImageIO {
    read_proc:  extern Func (Pointer, UInt, UInt, FStream) -> UInt
    write_proc: extern Func (Pointer, UInt, UInt, FStream) -> UInt
    seek_proc:  extern Func (FStream, Long, Int) -> Int
    tell_proc:  extern Func (FStream) -> Long

    init: func@ (=read_proc, =write_proc, =seek_proc, =tell_proc) {}
}
