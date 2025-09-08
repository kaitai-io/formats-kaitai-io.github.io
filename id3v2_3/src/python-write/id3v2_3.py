# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Id3v23(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://id3.org/id3v2.3.0
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Id3v23, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.tag = Id3v23.Tag(self._io, self, self._root)
        self.tag._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.tag._fetch_instances()


    def _write__seq(self, io=None):
        super(Id3v23, self)._write__seq(io)
        self.tag._write__seq(self._io)


    def _check(self):
        if self.tag._root != self._root:
            raise kaitaistruct.ConsistencyError(u"tag", self._root, self.tag._root)
        if self.tag._parent != self:
            raise kaitaistruct.ConsistencyError(u"tag", self, self.tag._parent)
        self._dirty = False

    class Frame(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 3.3. ID3v2 frame overview
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = (self._io.read_bytes(4)).decode(u"ASCII")
            self.size = self._io.read_u4be()
            self.flags = Id3v23.Frame.Flags(self._io, self, self._root)
            self.flags._read()
            self.data = self._io.read_bytes(self.size)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()


        def _write__seq(self, io=None):
            super(Id3v23.Frame, self)._write__seq(io)
            self._io.write_bytes((self.id).encode(u"ASCII"))
            self._io.write_u4be(self.size)
            self.flags._write__seq(self._io)
            self._io.write_bytes(self.data)


        def _check(self):
            if len((self.id).encode(u"ASCII")) != 4:
                raise kaitaistruct.ConsistencyError(u"id", 4, len((self.id).encode(u"ASCII")))
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if len(self.data) != self.size:
                raise kaitaistruct.ConsistencyError(u"data", self.size, len(self.data))
            self._dirty = False

        class Flags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Id3v23.Frame.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flag_discard_alter_tag = self._io.read_bits_int_be(1) != 0
                self.flag_discard_alter_file = self._io.read_bits_int_be(1) != 0
                self.flag_read_only = self._io.read_bits_int_be(1) != 0
                self.reserved1 = self._io.read_bits_int_be(5)
                self.flag_compressed = self._io.read_bits_int_be(1) != 0
                self.flag_encrypted = self._io.read_bits_int_be(1) != 0
                self.flag_grouping = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(5)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Id3v23.Frame.Flags, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.flag_discard_alter_tag))
                self._io.write_bits_int_be(1, int(self.flag_discard_alter_file))
                self._io.write_bits_int_be(1, int(self.flag_read_only))
                self._io.write_bits_int_be(5, self.reserved1)
                self._io.write_bits_int_be(1, int(self.flag_compressed))
                self._io.write_bits_int_be(1, int(self.flag_encrypted))
                self._io.write_bits_int_be(1, int(self.flag_grouping))
                self._io.write_bits_int_be(5, self.reserved2)


            def _check(self):
                self._dirty = False


        @property
        def is_invalid(self):
            if hasattr(self, '_m_is_invalid'):
                return self._m_is_invalid

            self._m_is_invalid = self.id == u"\000\000\000\000"
            return getattr(self, '_m_is_invalid', None)

        def _invalidate_is_invalid(self):
            del self._m_is_invalid

    class Header(ReadWriteKaitaiStruct):
        """ID3v2 fixed header.
        
        .. seealso::
           Section 3.1. ID3v2 header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = self._io.read_bytes(3)
            if not self.magic == b"\x49\x44\x33":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x33", self.magic, self._io, u"/types/header/seq/0")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = Id3v23.Header.Flags(self._io, self, self._root)
            self.flags._read()
            self.size = Id3v23.U4beSynchsafe(self._io, self, self._root)
            self.size._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.size._fetch_instances()


        def _write__seq(self, io=None):
            super(Id3v23.Header, self)._write__seq(io)
            self._io.write_bytes(self.magic)
            self._io.write_u1(self.version_major)
            self._io.write_u1(self.version_revision)
            self.flags._write__seq(self._io)
            self.size._write__seq(self._io)


        def _check(self):
            if len(self.magic) != 3:
                raise kaitaistruct.ConsistencyError(u"magic", 3, len(self.magic))
            if not self.magic == b"\x49\x44\x33":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x33", self.magic, None, u"/types/header/seq/0")
            if self.flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
            if self.flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
            if self.size._root != self._root:
                raise kaitaistruct.ConsistencyError(u"size", self._root, self.size._root)
            if self.size._parent != self:
                raise kaitaistruct.ConsistencyError(u"size", self, self.size._parent)
            self._dirty = False

        class Flags(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Id3v23.Header.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int_be(1) != 0
                self.flag_headerex = self._io.read_bits_int_be(1) != 0
                self.flag_experimental = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(5)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Id3v23.Header.Flags, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.flag_unsynchronization))
                self._io.write_bits_int_be(1, int(self.flag_headerex))
                self._io.write_bits_int_be(1, int(self.flag_experimental))
                self._io.write_bits_int_be(5, self.reserved)


            def _check(self):
                self._dirty = False



    class HeaderEx(ReadWriteKaitaiStruct):
        """ID3v2 extended header.
        
        .. seealso::
           Section 3.2. ID3v2 extended header
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.HeaderEx, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.size = self._io.read_u4be()
            self.flags_ex = Id3v23.HeaderEx.FlagsEx(self._io, self, self._root)
            self.flags_ex._read()
            self.padding_size = self._io.read_u4be()
            if self.flags_ex.flag_crc:
                pass
                self.crc = self._io.read_u4be()

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.flags_ex._fetch_instances()
            if self.flags_ex.flag_crc:
                pass



        def _write__seq(self, io=None):
            super(Id3v23.HeaderEx, self)._write__seq(io)
            self._io.write_u4be(self.size)
            self.flags_ex._write__seq(self._io)
            self._io.write_u4be(self.padding_size)
            if self.flags_ex.flag_crc:
                pass
                self._io.write_u4be(self.crc)



        def _check(self):
            if self.flags_ex._root != self._root:
                raise kaitaistruct.ConsistencyError(u"flags_ex", self._root, self.flags_ex._root)
            if self.flags_ex._parent != self:
                raise kaitaistruct.ConsistencyError(u"flags_ex", self, self.flags_ex._parent)
            if self.flags_ex.flag_crc:
                pass

            self._dirty = False

        class FlagsEx(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(Id3v23.HeaderEx.FlagsEx, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.flag_crc = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(15)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(Id3v23.HeaderEx.FlagsEx, self)._write__seq(io)
                self._io.write_bits_int_be(1, int(self.flag_crc))
                self._io.write_bits_int_be(15, self.reserved)


            def _check(self):
                self._dirty = False



    class Tag(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Section 3. ID3v2 overview
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.Tag, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = Id3v23.Header(self._io, self, self._root)
            self.header._read()
            if self.header.flags.flag_headerex:
                pass
                self.header_ex = Id3v23.HeaderEx(self._io, self, self._root)
                self.header_ex._read()

            self.frames = []
            i = 0
            while True:
                _t_frames = Id3v23.Frame(self._io, self, self._root)
                try:
                    _t_frames._read()
                finally:
                    _ = _t_frames
                    self.frames.append(_)
                if  ((self._io.pos() + _.size > self.header.size.value) or (_.is_invalid)) :
                    break
                i += 1
            if self.header.flags.flag_headerex:
                pass
                self.padding = self._io.read_bytes(self.header_ex.padding_size - self._io.pos())

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.flags.flag_headerex:
                pass
                self.header_ex._fetch_instances()

            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()

            if self.header.flags.flag_headerex:
                pass



        def _write__seq(self, io=None):
            super(Id3v23.Tag, self)._write__seq(io)
            self.header._write__seq(self._io)
            if self.header.flags.flag_headerex:
                pass
                self.header_ex._write__seq(self._io)

            for i in range(len(self.frames)):
                pass
                self.frames[i]._write__seq(self._io)
                _ = self.frames[i]
                if  ((self._io.pos() + _.size > self.header.size.value) or (_.is_invalid))  != (i == len(self.frames) - 1):
                    raise kaitaistruct.ConsistencyError(u"frames", i == len(self.frames) - 1,  ((self._io.pos() + _.size > self.header.size.value) or (_.is_invalid)) )

            if self.header.flags.flag_headerex:
                pass
                if len(self.padding) != self.header_ex.padding_size - self._io.pos():
                    raise kaitaistruct.ConsistencyError(u"padding", self.header_ex.padding_size - self._io.pos(), len(self.padding))
                self._io.write_bytes(self.padding)



        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            if self.header.flags.flag_headerex:
                pass
                if self.header_ex._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header_ex", self._root, self.header_ex._root)
                if self.header_ex._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header_ex", self, self.header_ex._parent)

            if len(self.frames) == 0:
                raise kaitaistruct.ConsistencyError(u"frames", 0, len(self.frames))
            for i in range(len(self.frames)):
                pass
                if self.frames[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"frames", self._root, self.frames[i]._root)
                if self.frames[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"frames", self, self.frames[i]._parent)

            if self.header.flags.flag_headerex:
                pass

            self._dirty = False


    class U1beSynchsafe(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.U1beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.padding = self._io.read_bits_int_be(1) != 0
            self.value = self._io.read_bits_int_be(7)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Id3v23.U1beSynchsafe, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.padding))
            self._io.write_bits_int_be(7, self.value)


        def _check(self):
            self._dirty = False


    class U2beSynchsafe(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.U2beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.byte0 = Id3v23.U1beSynchsafe(self._io, self, self._root)
            self.byte0._read()
            self.byte1 = Id3v23.U1beSynchsafe(self._io, self, self._root)
            self.byte1._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.byte0._fetch_instances()
            self.byte1._fetch_instances()


        def _write__seq(self, io=None):
            super(Id3v23.U2beSynchsafe, self)._write__seq(io)
            self.byte0._write__seq(self._io)
            self.byte1._write__seq(self._io)


        def _check(self):
            if self.byte0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"byte0", self._root, self.byte0._root)
            if self.byte0._parent != self:
                raise kaitaistruct.ConsistencyError(u"byte0", self, self.byte0._parent)
            if self.byte1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"byte1", self._root, self.byte1._root)
            if self.byte1._parent != self:
                raise kaitaistruct.ConsistencyError(u"byte1", self, self.byte1._parent)
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.byte0.value << 7 | self.byte1.value
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class U4beSynchsafe(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Id3v23.U4beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.short0 = Id3v23.U2beSynchsafe(self._io, self, self._root)
            self.short0._read()
            self.short1 = Id3v23.U2beSynchsafe(self._io, self, self._root)
            self.short1._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.short0._fetch_instances()
            self.short1._fetch_instances()


        def _write__seq(self, io=None):
            super(Id3v23.U4beSynchsafe, self)._write__seq(io)
            self.short0._write__seq(self._io)
            self.short1._write__seq(self._io)


        def _check(self):
            if self.short0._root != self._root:
                raise kaitaistruct.ConsistencyError(u"short0", self._root, self.short0._root)
            if self.short0._parent != self:
                raise kaitaistruct.ConsistencyError(u"short0", self, self.short0._parent)
            if self.short1._root != self._root:
                raise kaitaistruct.ConsistencyError(u"short1", self._root, self.short1._root)
            if self.short1._parent != self:
                raise kaitaistruct.ConsistencyError(u"short1", self, self.short1._parent)
            self._dirty = False

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.short0.value << 14 | self.short1.value
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value


