# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
import struct


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Ines(KaitaiStruct):
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.header = self._root.Header(self._io, self, self._root)
        self.rom = self._io.read_bytes_full()

    class F7(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.upper_nibble = self._io.read_bits_int(4)
            self.format = self._io.read_bits_int(2)
            self.arcade_2 = self._io.read_bits_int(1) != 0
            self.arcade_1 = self._io.read_bits_int(1) != 0


    class F6(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.lower_nibble = self._io.read_bits_int(4)
            self.ignore_mirror = self._io.read_bits_int(1) != 0
            self.trainer = self._io.read_bits_int(1) != 0
            self.has_battery_ram = self._io.read_bits_int(1) != 0
            self.mirror = self._io.read_bits_int(1) != 0


    class F10(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.nothing1 = self._io.read_bits_int(2)
            self.bus_conflict = self._io.read_bits_int(1) != 0
            self.prg_ram = self._io.read_bits_int(1) != 0
            self.nothing2 = self._io.read_bits_int(2)
            self.tv_system = self._io.read_bits_int(2)


    class F9(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reserved = self._io.read_bits_int(7)
            self.tv_system = self._io.read_bits_int(1) != 0


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.magic = self._io.ensure_fixed_contents(struct.pack('4b', 78, 69, 83, 26))
            self.prg_rom_size = self._io.read_u1()
            self.chr_rom_size = self._io.read_u1()
            self.f6 = self._root.F6(self._io, self, self._root)
            self.f7 = self._root.F7(self._io, self, self._root)
            self.prg_ram_size = self._io.read_u1()
            self.f9 = self._root.F9(self._io, self, self._root)
            self.f10 = self._root.F10(self._io, self, self._root)
            self.zero_fill = self._io.read_bytes(4)


    @property
    def mapper(self):
        if hasattr(self, '_m_mapper'):
            return self._m_mapper if hasattr(self, '_m_mapper') else None

        self._m_mapper = (self._root.header.f6.lower_nibble | (self._root.header.f7.upper_nibble << 4))
        return self._m_mapper if hasattr(self, '_m_mapper') else None


