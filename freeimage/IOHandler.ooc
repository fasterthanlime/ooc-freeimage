use freeimage

Handle: cover from fi_handle

IOHandler: cover from FreeImageIO {
    read_proc:  extern Func (Pointer, UInt, UInt, Handle) -> UInt
    write_proc: extern Func (Pointer, UInt, UInt, Handle) -> UInt
    seek_proc:  extern Func (Handle, Long, Int) -> Int
    tell_proc:  extern Func (Handle) -> Long

    new: static func (.read_proc, .write_proc, .seek_proc, .tell_proc) -> This {
        this: This
        this read_proc = read_proc
        this write_proc = write_proc
        this seek_proc = seek_proc
        this tell_proc = tell_proc
        return this
    }

    new: static func ~empty -> This {
        this: This
        this read_proc = null
        this write_proc = null
        this seek_proc = null
        this tell_proc = null
        return this
    }
}
