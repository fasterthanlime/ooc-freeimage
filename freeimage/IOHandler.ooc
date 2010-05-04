use freeimage

Handle: cover from fi_handle

IOHandler: cover from FreeImageIO {
    read_proc:  extern Func (Pointer, UInt, UInt, Handle) -> UInt
    write_proc: extern Func (Pointer, UInt, UInt, Handle) -> UInt
    seek_proc:  extern Func (Handle, Long, Int) -> Int
    tell_proc:  extern Func (Handle) -> Long

    init: func@ (=read_proc, =write_proc, =seek_proc, =tell_proc) {}
}
