# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Id3v24(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.tag = self._root.Tag(self._io, self, self._root)

    class U1beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.padding = self._io.read_bits_int(1) != 0
            self.value = self._io.read_bits_int(7)


    class U2beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.byte0 = self._root.U1beSynchsafe(self._io, self, self._root)
            self.byte1 = self._root.U1beSynchsafe(self._io, self, self._root)

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = ((self.byte0.value << 7) | self.byte1.value)
            return self._m_value


    class Tag(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = self._root.Header(self._io, self, self._root)
            if self.header.flags.flag_headerex:
                self.header_ex = self._root.HeaderEx(self._io, self, self._root)

            self.frames = []
            i = 0
            while True:
                _ = self._root.Frame(self._io, self, self._root)
                self.frames.append(_)
                if  (((self._io.pos() + _.size.value) > self.header.size.value) or (_.is_invalid)) :
                    break
                i += 1
            if not (self.header.flags.flag_footer):
                self.padding = self._root.Padding(self._io, self, self._root)

            if self.header.flags.flag_footer:
                self.footer = self._root.Footer(self._io, self, self._root)



    class U4beSynchsafe(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.short0 = self._root.U2beSynchsafe(self._io, self, self._root)
            self.short1 = self._root.U2beSynchsafe(self._io, self, self._root)

        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = ((self.short0.value << 14) | self.short1.value)
            return self._m_value


    class Frame(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.id = (self._io.read_bytes(4)).decode(u"ASCII")
            self.size = self._root.U4beSynchsafe(self._io, self, self._root)
            self.flags_status = self._root.Frame.FlagsStatus(self._io, self, self._root)
            self.flags_format = self._root.Frame.FlagsFormat(self._io, self, self._root)
            self.data = self._io.read_bytes(self.size.value)

        class FlagsStatus(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int(1) != 0
                self.flag_discard_alter_tag = self._io.read_bits_int(1) != 0
                self.flag_discard_alter_file = self._io.read_bits_int(1) != 0
                self.flag_read_only = self._io.read_bits_int(1) != 0
                self.reserved2 = self._io.read_bits_int(4)


        class FlagsFormat(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int(1) != 0
                self.flag_grouping = self._io.read_bits_int(1) != 0
                self.reserved2 = self._io.read_bits_int(2)
                self.flag_compressed = self._io.read_bits_int(1) != 0
                self.flag_encrypted = self._io.read_bits_int(1) != 0
                self.flag_unsynchronisated = self._io.read_bits_int(1) != 0
                self.flag_indicator = self._io.read_bits_int(1) != 0


        @property
        def is_invalid(self):
            if hasattr(self, '_m_is_invalid'):
                return self._m_is_invalid

            self._m_is_invalid = self.id == u"\000\000\000\000"
            return self._m_is_invalid


    class HeaderEx(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.size = self._root.U4beSynchsafe(self._io, self, self._root)
            self.flags_ex = self._root.HeaderEx.FlagsEx(self._io, self, self._root)
            self.data = self._io.read_bytes((self.size.value - 5))

        class FlagsEx(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved1 = self._io.read_bits_int(1) != 0
                self.flag_update = self._io.read_bits_int(1) != 0
                self.flag_crc = self._io.read_bits_int(1) != 0
                self.flag_restrictions = self._io.read_bits_int(1) != 0
                self.reserved2 = self._io.read_bits_int(4)



    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x49\x44\x33")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = self._root.Header.Flags(self._io, self, self._root)
            self.size = self._root.U4beSynchsafe(self._io, self, self._root)

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int(1) != 0
                self.flag_headerex = self._io.read_bits_int(1) != 0
                self.flag_experimental = self._io.read_bits_int(1) != 0
                self.flag_footer = self._io.read_bits_int(1) != 0
                self.reserved = self._io.read_bits_int(4)



    class Padding(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.padding = self._io.read_bytes((self._root.tag.header.size.value - self._io.pos()))


    class Footer(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(b"\x33\x44\x49")
            self.version_major = self._io.read_u1()
            self.version_revision = self._io.read_u1()
            self.flags = self._root.Footer.Flags(self._io, self, self._root)
            self.size = self._root.U4beSynchsafe(self._io, self, self._root)

        class Flags(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.flag_unsynchronization = self._io.read_bits_int(1) != 0
                self.flag_headerex = self._io.read_bits_int(1) != 0
                self.flag_experimental = self._io.read_bits_int(1) != 0
                self.flag_footer = self._io.read_bits_int(1) != 0
                self.reserved = self._io.read_bits_int(4)




