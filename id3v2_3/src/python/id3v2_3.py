# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Id3v23(KaitaiStruct):
    """
    .. seealso::
       Source - https://id3.org/id3v2.3.0
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(Id3v23, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.tag = Id3v23.Tag(self._io, self, self._root)


    def _fetch_instances(self):
        pass
        self.tag._fetch_instances()

    class Frame(KaitaiStruct):
        """
        .. seealso::
           Section 3.3. ID3v2 frame overview
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v23.Frame, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = (self._io.read_bytes(4)).decode(u"ASCII")
            self.size = self._io.read_u4be()
            self.flags = Id3v23.Frame.Flags(self._io, self, self._root)
            self.data = self._io.read_bytes(self.size)


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v23.Frame.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flag_discard_alter_tag = self._io.read_bits_int_be(1) != 0
                self.flag_discard_alter_file = self._io.read_bits_int_be(1) != 0
                self.flag_read_only = self._io.read_bits_int_be(1) != 0
                self.reserved1 = self._io.read_bits_int_be(5)
                self.flag_compressed = self._io.read_bits_int_be(1) != 0
                self.flag_encrypted = self._io.read_bits_int_be(1) != 0
                self.flag_grouping = self._io.read_bits_int_be(1) != 0
                self.reserved2 = self._io.read_bits_int_be(5)


            def _fetch_instances(self):
                pass


        @property
        def is_invalid(self):
            if hasattr(self, '_m_is_invalid'):
                return self._m_is_invalid

            self._m_is_invalid = self.id == u"\000\000\000\000"
            return getattr(self, '_m_is_invalid', None)


    class Header(KaitaiStruct):
        """ID3v2 fixed header.
        
        .. seealso::
           Section 3.1. ID3v2 header
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v23.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.magic = self._io.read_bytes(3)
            if not self.magic == b"\x49\x44\x33":
                raise kaitaistruct.ValidationNotEqualError(b"\x49\x44\x33", self.magic, self._io, u"/types/header/seq/0")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = Id3v23.Header.Flags(self._io, self, self._root)
            self.size = Id3v23.U4beSynchsafe(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.flags._fetch_instances()
            self.size._fetch_instances()

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v23.Header.Flags, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int_be(1) != 0
                self.flag_headerex = self._io.read_bits_int_be(1) != 0
                self.flag_experimental = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(5)


            def _fetch_instances(self):
                pass



    class HeaderEx(KaitaiStruct):
        """ID3v2 extended header.
        
        .. seealso::
           Section 3.2. ID3v2 extended header
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v23.HeaderEx, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.size = self._io.read_u4be()
            self.flags_ex = Id3v23.HeaderEx.FlagsEx(self._io, self, self._root)
            self.padding_size = self._io.read_u4be()
            if self.flags_ex.flag_crc:
                pass
                self.crc = self._io.read_u4be()



        def _fetch_instances(self):
            pass
            self.flags_ex._fetch_instances()
            if self.flags_ex.flag_crc:
                pass


        class FlagsEx(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(Id3v23.HeaderEx.FlagsEx, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.flag_crc = self._io.read_bits_int_be(1) != 0
                self.reserved = self._io.read_bits_int_be(15)


            def _fetch_instances(self):
                pass



    class Tag(KaitaiStruct):
        """
        .. seealso::
           Section 3. ID3v2 overview
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v23.Tag, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = Id3v23.Header(self._io, self, self._root)
            if self.header.flags.flag_headerex:
                pass
                self.header_ex = Id3v23.HeaderEx(self._io, self, self._root)

            self.frames = []
            i = 0
            while True:
                _ = Id3v23.Frame(self._io, self, self._root)
                self.frames.append(_)
                if  ((self._io.pos() + _.size > self.header.size.value) or (_.is_invalid)) :
                    break
                i += 1
            if self.header.flags.flag_headerex:
                pass
                self.padding = self._io.read_bytes(self.header_ex.padding_size - self._io.pos())



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



    class U1beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Id3v23.U1beSynchsafe, self).__init__(_io)
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
            super(Id3v23.U2beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.byte0 = Id3v23.U1beSynchsafe(self._io, self, self._root)
            self.byte1 = Id3v23.U1beSynchsafe(self._io, self, self._root)


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
            super(Id3v23.U4beSynchsafe, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.short0 = Id3v23.U2beSynchsafe(self._io, self, self._root)
            self.short1 = Id3v23.U2beSynchsafe(self._io, self, self._root)


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



