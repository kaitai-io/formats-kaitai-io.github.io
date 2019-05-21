# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class ZxSpectrumTap(KaitaiStruct):
    """TAP files are used by emulators of ZX Spectrum computer (released in
    1982 by Sinclair Research). TAP file stores blocks of data as if
    they are written to magnetic tape, which was used as primary media
    for ZX Spectrum. Contents of this file can be viewed as a very
    simple linear filesystem, storing named files with some basic
    metainformation prepended as a header.
    
    .. seealso::
       Source - https://faqwiki.zxnet.co.uk/wiki/TAP_format
    """

    class FlagEnum(Enum):
        header = 0
        data = 255

    class HeaderTypeEnum(Enum):
        program = 0
        num_array = 1
        char_array = 2
        bytes = 3
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.block = []
        i = 0
        while not self._io.is_eof():
            self.block.append(self._root.Block(self._io, self, self._root))
            i += 1


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.len_block = self._io.read_u2le()
            self.flag = self._root.FlagEnum(self._io.read_u1())
            if  ((self.len_block == 19) and (self.flag == self._root.FlagEnum.header)) :
                self.header = self._root.Header(self._io, self, self._root)

            if self.len_block == 19:
                self.data = self._io.read_bytes((self.header.len_data + 4))

            if self.flag == self._root.FlagEnum.data:
                self.headerless_data = self._io.read_bytes((self.len_block - 1))



    class ProgramParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.autostart_line = self._io.read_u2le()
            self.len_program = self._io.read_u2le()


    class BytesParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.start_address = self._io.read_u2le()
            self.reserved = self._io.read_bytes(2)


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header_type = self._root.HeaderTypeEnum(self._io.read_u1())
            self.filename = KaitaiStream.bytes_strip_right(self._io.read_bytes(10), 32)
            self.len_data = self._io.read_u2le()
            _on = self.header_type
            if _on == self._root.HeaderTypeEnum.program:
                self.params = self._root.ProgramParams(self._io, self, self._root)
            elif _on == self._root.HeaderTypeEnum.num_arry:
                self.params = self._root.ArrayParams(self._io, self, self._root)
            elif _on == self._root.HeaderTypeEnum.char_arry:
                self.params = self._root.ArrayParams(self._io, self, self._root)
            elif _on == self._root.HeaderTypeEnum.bytes:
                self.params = self._root.BytesParams(self._io, self, self._root)
            self.checksum = self._io.read_u1()


    class ArrayParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reserved = self._io.read_u1()
            self.var_name = self._io.read_u1()
            self.reserved1 = self._io.ensure_fixed_contents(b"\x00\x80")



