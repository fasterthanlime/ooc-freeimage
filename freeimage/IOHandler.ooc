use freeimage

Handle: cover from fi_handle

IOHandler: cover from FreeImageIO {
        read_proc: extern Func (Pointer, UInt, UInt, Handle) -> UInt
        write_proc: extern Func (Pointer, UInt, UInt, Handle) -> UInt
        seek_proc: extern Func (Handle, Long, Int) -> Int
        tell_proc: extern Func (Handle) -> Long

        new: static func (.read_proc, .write_proc, .seek_proc, .tell_proc) -> This {
                this : This
                this read_proc = read_proc
                this write_proc = write_proc
                this seek_proc = seek_proc
                this tell_proc = tell_proc
                return this
        }
        new: static func ~withoutWrite (.read_proc, .seek_proc, .tell_proc) -> This {
                This new(read_proc, null, seek_proc, tell_proc)
        }
        new: static func ~withoutRead (.write_proc, .seek_proc, .tell_proc) -> This {
                This new(null, write_proc, seek_proc, tell_proc)
        }

        new: static func ~empty -> This {
                This new(null, null, null, null)
        }
}