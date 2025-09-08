# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ZxSpectrumTap(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(ZxSpectrumTap, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.blocks = []
        i = 0
        while not self._io.is_eof():
            _t_blocks = ZxSpectrumTap.Block(self._io, self, self._root)
            try:
                _t_blocks._read()
            finally:
                self.blocks.append(_t_blocks)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.blocks)):
            pass
            self.blocks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(ZxSpectrumTap, self)._write__seq(io)
        for i in range(len(self.blocks)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())
            self.blocks[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"blocks", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.blocks)):
            pass
            if self.blocks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blocks", self._root, self.blocks[i]._root)
            if self.blocks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"blocks", self, self.blocks[i]._parent)

        self._dirty = False

    class ArrayParams(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ZxSpectrumTap.ArrayParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved = self._io.read_u1()
            self.var_name = self._io.read_u1()
            self.reserved1 = self._io.read_bytes(2)
            if not self.reserved1 == b"\x00\x80":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x80", self.reserved1, self._io, u"/types/array_params/seq/2")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ZxSpectrumTap.ArrayParams, self)._write__seq(io)
            self._io.write_u1(self.reserved)
            self._io.write_u1(self.var_name)
            self._io.write_bytes(self.reserved1)


        def _check(self):
            if len(self.reserved1) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved1", 2, len(self.reserved1))
            if not self.reserved1 == b"\x00\x80":
                raise kaitaistruct.ValidationNotEqualError(b"\x00\x80", self.reserved1, None, u"/types/array_params/seq/2")
            self._dirty = False


    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ZxSpectrumTap.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_block = self._io.read_u2le()
            self.flag = KaitaiStream.resolve_enum(ZxSpectrumTap.FlagEnum, self._io.read_u1())
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                self.header = ZxSpectrumTap.Header(self._io, self, self._root)
                self.header._read()

            if self.len_block == 19:
                pass
                self.data = self._io.read_bytes(self.header.len_data + 4)

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass
                self.headerless_data = self._io.read_bytes(self.len_block - 1)

            self._dirty = False


        def _fetch_instances(self):
            pass
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                self.header._fetch_instances()

            if self.len_block == 19:
                pass

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass



        def _write__seq(self, io=None):
            super(ZxSpectrumTap.Block, self)._write__seq(io)
            self._io.write_u2le(self.len_block)
            self._io.write_u1(int(self.flag))
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                self.header._write__seq(self._io)

            if self.len_block == 19:
                pass
                self._io.write_bytes(self.data)

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass
                self._io.write_bytes(self.headerless_data)



        def _check(self):
            if  ((self.len_block == 19) and (self.flag == ZxSpectrumTap.FlagEnum.header)) :
                pass
                if self.header._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
                if self.header._parent != self:
                    raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)

            if self.len_block == 19:
                pass
                if len(self.data) != self.header.len_data + 4:
                    raise kaitaistruct.ConsistencyError(u"data", self.header.len_data + 4, len(self.data))

            if self.flag == ZxSpectrumTap.FlagEnum.data:
                pass
                if len(self.headerless_data) != self.len_block - 1:
                    raise kaitaistruct.ConsistencyError(u"headerless_data", self.len_block - 1, len(self.headerless_data))

            self._dirty = False


    class BytesParams(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ZxSpectrumTap.BytesParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.start_address = self._io.read_u2le()
            self.reserved = self._io.read_bytes(2)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ZxSpectrumTap.BytesParams, self)._write__seq(io)
            self._io.write_u2le(self.start_address)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.reserved) != 2:
                raise kaitaistruct.ConsistencyError(u"reserved", 2, len(self.reserved))
            self._dirty = False


    class Header(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ZxSpectrumTap.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header_type = KaitaiStream.resolve_enum(ZxSpectrumTap.HeaderTypeEnum, self._io.read_u1())
            self.filename = KaitaiStream.bytes_strip_right(self._io.read_bytes(10), 32)
            self.len_data = self._io.read_u2le()
            _on = self.header_type
            if _on == ZxSpectrumTap.HeaderTypeEnum.bytes:
                pass
                self.params = ZxSpectrumTap.BytesParams(self._io, self, self._root)
                self.params._read()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.char_array:
                pass
                self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
                self.params._read()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.num_array:
                pass
                self.params = ZxSpectrumTap.ArrayParams(self._io, self, self._root)
                self.params._read()
            elif _on == ZxSpectrumTap.HeaderTypeEnum.program:
                pass
                self.params = ZxSpectrumTap.ProgramParams(self._io, self, self._root)
                self.params._read()
            self.checksum = self._io.read_u1()
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(ZxSpectrumTap.Header, self)._write__seq(io)
            self._io.write_u1(int(self.header_type))
            self._io.write_bytes_limit(self.filename, 10, 32, 32)
            self._io.write_u2le(self.len_data)
            _on = self.header_type
            if _on == ZxSpectrumTap.HeaderTypeEnum.bytes:
                pass
                self.params._write__seq(self._io)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.char_array:
                pass
                self.params._write__seq(self._io)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.num_array:
                pass
                self.params._write__seq(self._io)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.program:
                pass
                self.params._write__seq(self._io)
            self._io.write_u1(self.checksum)


        def _check(self):
            if len(self.filename) > 10:
                raise kaitaistruct.ConsistencyError(u"filename", 10, len(self.filename))
            if  ((len(self.filename) != 0) and (KaitaiStream.byte_array_index(self.filename, -1) == 32)) :
                raise kaitaistruct.ConsistencyError(u"filename", 32, KaitaiStream.byte_array_index(self.filename, -1))
            _on = self.header_type
            if _on == ZxSpectrumTap.HeaderTypeEnum.bytes:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.char_array:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.num_array:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            elif _on == ZxSpectrumTap.HeaderTypeEnum.program:
                pass
                if self.params._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"params", self._root, self.params._root)
                if self.params._parent != self:
                    raise kaitaistruct.ConsistencyError(u"params", self, self.params._parent)
            self._dirty = False


    class ProgramParams(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ZxSpectrumTap.ProgramParams, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.autostart_line = self._io.read_u2le()
            self.len_program = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ZxSpectrumTap.ProgramParams, self)._write__seq(io)
            self._io.write_u2le(self.autostart_line)
            self._io.write_u2le(self.len_program)


        def _check(self):
            self._dirty = False



