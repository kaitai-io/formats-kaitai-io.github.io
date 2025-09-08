# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Id3v24(KaitaiStruct):
    """
    .. seealso::
       Source - http://id3.org/id3v2.4.0-structure
    
    
    .. seealso::
       Source - http://id3.org/id3v2.4.0-frames
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Id3v24, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.tag = Id3v24.Tag(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.tag._fetch_instances()

    class Footer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.Footer, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(3)
            if not self.magic == b"\x33\x44\x49":
                raise kaitaistruct.ValidationNotEqualError(b"\x33\x44\x49", self.magic, self._io, u"/types/footer/seq/0")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = Id3v24.Footer.Flags(self._io, self, self._root)
            self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.size._fetch_instances()

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v24.Footer.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int_be(1) != 0
                self.flag_headerex = self._io.read_bits_int_be(1) != 0
                self.flag_experimental = self._io.read_bits_int_be(1) != 0
                self.flag_footer = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(4)


            def _fetch_instances(self):
                pass



    class Frame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = (self._io.read_bytes(4)).decode(u"ASCII")
            self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
            self.flags_status = Id3v24.Frame.FlagsStatus(self._io, self, self._root)
            self.flags_format = Id3v24.Frame.FlagsFormat(self._io, self, self._root)
            self.data = self._io.read_bytes(self.size.value)


        def _fetch_instances(self):
            pass
            self.size._fetch_instances()
            self.flags_status._fetch_instances()
            self.flags_format._fetch_instances()

        class FlagsFormat(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v24.Frame.FlagsFormat, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(1) != 0
                self.flag_grouping = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(2)
                self.flag_compressed = self._io.read_bits_int_be(1) != 0
                self.flag_encrypted = self._io.read_bits_int_be(1) != 0
                self.flag_unsynchronisated = self._io.read_bits_int_be(1) != 0
                self.flag_indicator = self._io.read_bits_int_be(1) != 0


            def _fetch_instances(self):
                pass


        class FlagsStatus(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v24.Frame.FlagsStatus, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(1) != 0
                self.flag_discard_alter_tag = self._io.read_bits_int_be(1) != 0
                self.flag_discard_alter_file = self._io.read_bits_int_be(1) != 0
                self.flag_read_only = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(4)


            def _fetch_instances(self):
                pass


        @property
        def is_invalid(self):
            if hasattr(self, '_m_is_invalid'):
                return self._m_is_invalid

            self._m_is_invalid = self.id == u"\000\000\000\000"
            return getattr(self, '_m_is_invalid', None)


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(3)
            if not self.magic == b"\x49\x44\x33":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x33", self.magic, self._io, u"/types/header/seq/0")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = Id3v24.Header.Flags(self._io, self, self._root)
            self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.size._fetch_instances()

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v24.Header.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int_be(1) != 0
                self.flag_headerex = self._io.read_bits_int_be(1) != 0
                self.flag_experimental = self._io.read_bits_int_be(1) != 0
                self.flag_footer = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(4)


            def _fetch_instances(self):
                pass



    class HeaderEx(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.HeaderEx, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = Id3v24.U4beSynchsafe(self._io, self, self._root)
            self.flags_ex = Id3v24.HeaderEx.FlagsEx(self._io, self, self._root)
            self.data = self._io.read_bytes(self.size.value - 5)


        def _fetch_instances(self):
            pass
            self.size._fetch_instances()
            self.flags_ex._fetch_instances()

        class FlagsEx(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v24.HeaderEx.FlagsEx, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int_be(1) != 0
                self.flag_update = self._io.read_bits_int_be(1) != 0
                self.flag_crc = self._io.read_bits_int_be(1) != 0
                self.flag_restrictions = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(4)


            def _fetch_instances(self):
                pass



    class Padding(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.Padding, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.padding = self._io.read_bytes(self._root.tag.header.size.value - self._io.pos())


        def _fetch_instances(self):
            pass


    class Tag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.Tag, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = Id3v24.Header(self._io, self, self._root)
            if self.header.flags.flag_headerex:
                pass
                self.header_ex = Id3v24.HeaderEx(self._io, self, self._root)

            self.frames = []
            i = 0
            while True:
                _ = Id3v24.Frame(self._io, self, self._root)
                self.frames.append(_)
                if  ((self._io.pos() + _.size.value > self.header.size.value) or (_.is_invalid)) :
                    break
                i += 1
            if (not (self.header.flags.flag_footer)):
                pass
                self.padding = Id3v24.Padding(self._io, self, self._root)

            if self.header.flags.flag_footer:
                pass
                self.footer = Id3v24.Footer(self._io, self, self._root)



        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            if self.header.flags.flag_headerex:
                pass
                self.header_ex._fetch_instances()

            for i in range(len(self.frames)):
                pass
                self.frames[i]._fetch_instances()

            if (not (self.header.flags.flag_footer)):
                pass
                self.padding._fetch_instances()

            if self.header.flags.flag_footer:
                pass
                self.footer._fetch_instances()



    class U1beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.U1beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.padding = self._io.read_bits_int_be(1) != 0
            self.value = self._io.read_bits_int_be(7)


        def _fetch_instances(self):
            pass


    class U2beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.U2beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.byte0 = Id3v24.U1beSynchsafe(self._io, self, self._root)
            self.byte1 = Id3v24.U1beSynchsafe(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.byte0._fetch_instances()
            self.byte1._fetch_instances()

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.byte0.value << 7 | self.byte1.value
            return getattr(self, '_m_value', None)


    class U4beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v24.U4beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.short0 = Id3v24.U2beSynchsafe(self._io, self, self._root)
            self.short1 = Id3v24.U2beSynchsafe(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.short0._fetch_instances()
            self.short1._fetch_instances()

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = self.short0.value << 14 | self.short1.value
            return getattr(self, '_m_value', None)



