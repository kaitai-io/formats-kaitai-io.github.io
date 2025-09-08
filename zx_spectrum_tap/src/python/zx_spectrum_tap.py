# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ZxSpectrumTap(KaitaiStruct):
    """TAP files are used by emulators of ZX Spectrum computer (released in
    1982 by Sinclair Research). TAP file stores blocks of data as if
    they are written to magnetic tape, which was used as primary media
    for ZX Spectrum. Contents of this file can be viewed as a very
    simple linear filesystem, storing named files with some basic
    metainformation prepended as a header.
    
    .. seealso::
       Source - https://sinclair.wiki.zxnet.co.uk/wiki/TAP_format
    """

    class FlagEnum(IntEnum):
        header = 0
        data = 255

    class HeaderTypeEnum(IntEnum):
        program = 0
        num_array = 1
        char_array = 2
        bytes = 3
    def __init__(self, _io, _parent=None, _root=None):
        super(ZxSpectrumTap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            self.blocks.append(ZxSpectrumTap.Block(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()


    class ArrayParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ZxSpectrumTap.ArrayParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved = self._io.read_u1()
            self.var_name = self._io.read_u1()
            self.reserved1 = self._io.read_bytes(2)
            if not self.reserved1 == b"\x00\x80":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x80", self.reserved1, self._io, u"/types/array_params/seq/2")


        def _fetch_instances(self):
            pass


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ZxSpectrumTap.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_block = self._io.read_u2le()
            self.flag = KaitaiStream.resolve_enum(ZxSpectrumTap.FlagEnum, self._io.read_u1())
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                self.header = ZxSpectrumTap.Header(self._io, self, self._root)

            if self.len_block == 19:
                pass
                self.data = self._io.read_bytes(self.header.len_data + 4)

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass
                self.headerless_data = self._io.read_bytes(self.len_block - 1)



        def _fetch_instances(self):
            pass
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                self.header._fetch_instances()

            if self.len_block == 19:
                pass

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass



    class BytesParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ZxSpectrumTap.BytesParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.start_address = self._io.read_u2le()
            self.reserved = self._io.read_bytes(2)


        def _fetch_instances(self):
            pass


    class Header(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ZxSpectrumTap.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header_type = KaitaiStream.resolve_enum(ZxSpectrumTap.HeaderTypeEnum, self._io.read_u1())
            self.filename = KaitaiStream.bytes_strip_right(self._io.read_bytes(10), 32)
            self.len_data = self._io.read_u2le()
            _on = self.header_type
            if _on == ZxSpectrumTap.HeaderTypeEnum.bytes:
                pass
                self.params = ZxSpectrumTap.BytesParams(self._io, self, self._root)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.char_array:
                pass
                self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.num_array:
                pass
                self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.program:
                pass
                self.params = ZxSpectrumTap.ProgramParams(self._io, self, self._root)
            self.checksum = self._io.read_u1()


        def _fetch_instances(self):
            pass
            _on = self.header_type
            if _on == ZxSpectrumTap.HeaderTypeEnum.bytes:
                pass
                self.params._fetch_instances()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.char_array:
                pass
                self.params._fetch_instances()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.num_array:
                pass
                self.params._fetch_instances()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.program:
                pass
                self.params._fetch_instances()


    class ProgramParams(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ZxSpectrumTap.ProgramParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.autostart_line = self._io.read_u2le()
            self.len_program = self._io.read_u2le()


        def _fetch_instances(self):
            pass



