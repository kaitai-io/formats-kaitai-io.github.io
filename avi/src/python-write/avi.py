# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Avi(ReadWriteKaitaiStruct):
    """
    .. seealso::
       Source - https://learn.microsoft.com/en-us/previous-versions/ms779636(v=vs.85)
    """

    class ChunkType(IntEnum):
        idx1 = 829973609
        junk = 1263424842
        info = 1330007625
        isft = 1413894985
        list = 1414744396
        strf = 1718776947
        avih = 1751742049
        strh = 1752331379
        movi = 1769369453
        hdrl = 1819436136
        strl = 1819440243

    class HandlerType(IntEnum):
        mp3 = 85
        ac3 = 8192
        dts = 8193
        cvid = 1684633187
        xvid = 1684633208

    class StreamType(IntEnum):
        mids = 1935960429
        vids = 1935960438
        auds = 1935963489
        txts = 1937012852
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Avi, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic1 = self._io.read_bytes(4)
        if not self.magic1 == b"\x52\x49\x46\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x52\x49\x46\x46", self.magic1, self._io, u"/seq/0")
        self.file_size = self._io.read_u4le()
        self.magic2 = self._io.read_bytes(4)
        if not self.magic2 == b"\x41\x56\x49\x20":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x56\x49\x20", self.magic2, self._io, u"/seq/2")
        self._raw_data = self._io.read_bytes(self.file_size - 4)
        _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
        self.data = Avi.Blocks(_io__raw_data, self, self._root)
        self.data._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.data._fetch_instances()


    def _write__seq(self, io=None):
        super(Avi, self)._write__seq(io)
        self._io.write_bytes(self.magic1)
        self._io.write_u4le(self.file_size)
        self._io.write_bytes(self.magic2)
        _io__raw_data = KaitaiStream(BytesIO(bytearray(self.file_size - 4)))
        self._io.add_child_stream(_io__raw_data)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.file_size - 4))
        def handler(parent, _io__raw_data=_io__raw_data):
            self._raw_data = _io__raw_data.to_byte_array()
            if len(self._raw_data) != self.file_size - 4:
                raise kaitaistruct.ConsistencyError(u"raw(data)", self.file_size - 4, len(self._raw_data))
            parent.write_bytes(self._raw_data)
        _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.data._write__seq(_io__raw_data)


    def _check(self):
        if len(self.magic1) != 4:
            raise kaitaistruct.ConsistencyError(u"magic1", 4, len(self.magic1))
        if not self.magic1 == b"\x52\x49\x46\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x52\x49\x46\x46", self.magic1, None, u"/seq/0")
        if len(self.magic2) != 4:
            raise kaitaistruct.ConsistencyError(u"magic2", 4, len(self.magic2))
        if not self.magic2 == b"\x41\x56\x49\x20":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x56\x49\x20", self.magic2, None, u"/seq/2")
        if self.data._root != self._root:
            raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
        if self.data._parent != self:
            raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
        self._dirty = False

    class AvihBody(ReadWriteKaitaiStruct):
        """Main header of an AVI file, defined as AVIMAINHEADER structure.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.AvihBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.micro_sec_per_frame = self._io.read_u4le()
            self.max_bytes_per_sec = self._io.read_u4le()
            self.padding_granularity = self._io.read_u4le()
            self.flags = self._io.read_u4le()
            self.total_frames = self._io.read_u4le()
            self.initial_frames = self._io.read_u4le()
            self.streams = self._io.read_u4le()
            self.suggested_buffer_size = self._io.read_u4le()
            self.width = self._io.read_u4le()
            self.height = self._io.read_u4le()
            self.reserved = self._io.read_bytes(16)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Avi.AvihBody, self)._write__seq(io)
            self._io.write_u4le(self.micro_sec_per_frame)
            self._io.write_u4le(self.max_bytes_per_sec)
            self._io.write_u4le(self.padding_granularity)
            self._io.write_u4le(self.flags)
            self._io.write_u4le(self.total_frames)
            self._io.write_u4le(self.initial_frames)
            self._io.write_u4le(self.streams)
            self._io.write_u4le(self.suggested_buffer_size)
            self._io.write_u4le(self.width)
            self._io.write_u4le(self.height)
            self._io.write_bytes(self.reserved)


        def _check(self):
            if len(self.reserved) != 16:
                raise kaitaistruct.ConsistencyError(u"reserved", 16, len(self.reserved))
            self._dirty = False


    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.four_cc = KaitaiStream.resolve_enum(Avi.ChunkType, self._io.read_u4le())
            self.block_size = self._io.read_u4le()
            _on = self.four_cc
            if _on == Avi.ChunkType.avih:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.AvihBody(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Avi.ChunkType.list:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.ListBody(_io__raw_data, self, self._root)
                self.data._read()
            elif _on == Avi.ChunkType.strh:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.StrhBody(_io__raw_data, self, self._root)
                self.data._read()
            else:
                pass
                self.data = self._io.read_bytes(self.block_size)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.four_cc
            if _on == Avi.ChunkType.avih:
                pass
                self.data._fetch_instances()
            elif _on == Avi.ChunkType.list:
                pass
                self.data._fetch_instances()
            elif _on == Avi.ChunkType.strh:
                pass
                self.data._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Avi.Block, self)._write__seq(io)
            self._io.write_u4le(int(self.four_cc))
            self._io.write_u4le(self.block_size)
            _on = self.four_cc
            if _on == Avi.ChunkType.avih:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.block_size)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.block_size))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.block_size:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.block_size, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Avi.ChunkType.list:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.block_size)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.block_size))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.block_size:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.block_size, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            elif _on == Avi.ChunkType.strh:
                pass
                _io__raw_data = KaitaiStream(BytesIO(bytearray(self.block_size)))
                self._io.add_child_stream(_io__raw_data)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.block_size))
                def handler(parent, _io__raw_data=_io__raw_data):
                    self._raw_data = _io__raw_data.to_byte_array()
                    if len(self._raw_data) != self.block_size:
                        raise kaitaistruct.ConsistencyError(u"raw(data)", self.block_size, len(self._raw_data))
                    parent.write_bytes(self._raw_data)
                _io__raw_data.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.data._write__seq(_io__raw_data)
            else:
                pass
                self._io.write_bytes(self.data)


        def _check(self):
            _on = self.four_cc
            if _on == Avi.ChunkType.avih:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Avi.ChunkType.list:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            elif _on == Avi.ChunkType.strh:
                pass
                if self.data._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
                if self.data._parent != self:
                    raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            else:
                pass
                if len(self.data) != self.block_size:
                    raise kaitaistruct.ConsistencyError(u"data", self.block_size, len(self.data))
            self._dirty = False


    class Blocks(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.Blocks, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Avi.Block(self._io, self, self._root)
                try:
                    _t_entries._read()
                finally:
                    self.entries.append(_t_entries)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(Avi.Blocks, self)._write__seq(io)
            for i in range(len(self.entries)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
                self.entries[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.entries)):
                pass
                if self.entries[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
                if self.entries[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

            self._dirty = False


    class ListBody(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.ListBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.list_type = KaitaiStream.resolve_enum(Avi.ChunkType, self._io.read_u4le())
            self.data = Avi.Blocks(self._io, self, self._root)
            self.data._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.data._fetch_instances()


        def _write__seq(self, io=None):
            super(Avi.ListBody, self)._write__seq(io)
            self._io.write_u4le(int(self.list_type))
            self.data._write__seq(self._io)


        def _check(self):
            if self.data._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data", self._root, self.data._root)
            if self.data._parent != self:
                raise kaitaistruct.ConsistencyError(u"data", self, self.data._parent)
            self._dirty = False


    class Rect(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.Rect, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.left = self._io.read_s2le()
            self.top = self._io.read_s2le()
            self.right = self._io.read_s2le()
            self.bottom = self._io.read_s2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Avi.Rect, self)._write__seq(io)
            self._io.write_s2le(self.left)
            self._io.write_s2le(self.top)
            self._io.write_s2le(self.right)
            self._io.write_s2le(self.bottom)


        def _check(self):
            self._dirty = False


    class StrfBody(ReadWriteKaitaiStruct):
        """Stream format description."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.StrfBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            pass
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Avi.StrfBody, self)._write__seq(io)


        def _check(self):
            self._dirty = False


    class StrhBody(ReadWriteKaitaiStruct):
        """Stream header (one header per stream), defined as AVISTREAMHEADER structure.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Avi.StrhBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.fcc_type = KaitaiStream.resolve_enum(Avi.StreamType, self._io.read_u4le())
            self.fcc_handler = KaitaiStream.resolve_enum(Avi.HandlerType, self._io.read_u4le())
            self.flags = self._io.read_u4le()
            self.priority = self._io.read_u2le()
            self.language = self._io.read_u2le()
            self.initial_frames = self._io.read_u4le()
            self.scale = self._io.read_u4le()
            self.rate = self._io.read_u4le()
            self.start = self._io.read_u4le()
            self.length = self._io.read_u4le()
            self.suggested_buffer_size = self._io.read_u4le()
            self.quality = self._io.read_u4le()
            self.sample_size = self._io.read_u4le()
            self.frame = Avi.Rect(self._io, self, self._root)
            self.frame._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.frame._fetch_instances()


        def _write__seq(self, io=None):
            super(Avi.StrhBody, self)._write__seq(io)
            self._io.write_u4le(int(self.fcc_type))
            self._io.write_u4le(int(self.fcc_handler))
            self._io.write_u4le(self.flags)
            self._io.write_u2le(self.priority)
            self._io.write_u2le(self.language)
            self._io.write_u4le(self.initial_frames)
            self._io.write_u4le(self.scale)
            self._io.write_u4le(self.rate)
            self._io.write_u4le(self.start)
            self._io.write_u4le(self.length)
            self._io.write_u4le(self.suggested_buffer_size)
            self._io.write_u4le(self.quality)
            self._io.write_u4le(self.sample_size)
            self.frame._write__seq(self._io)


        def _check(self):
            if self.frame._root != self._root:
                raise kaitaistruct.ConsistencyError(u"frame", self._root, self.frame._root)
            if self.frame._parent != self:
                raise kaitaistruct.ConsistencyError(u"frame", self, self.frame._parent)
            self._dirty = False



