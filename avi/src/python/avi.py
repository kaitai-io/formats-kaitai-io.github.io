# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Avi(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(Avi, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

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


    def _fetch_instances(self):
        pass
        self.data._fetch_instances()

    class AvihBody(KaitaiStruct):
        """Main header of an AVI file, defined as AVIMAINHEADER structure.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/ms779632(v=vs.85)
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.AvihBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.four_cc = KaitaiStream.resolve_enum(Avi.ChunkType, self._io.read_u4le())
            self.block_size = self._io.read_u4le()
            _on = self.four_cc
            if _on == Avi.ChunkType.avih:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.AvihBody(_io__raw_data, self, self._root)
            elif _on == Avi.ChunkType.list:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.ListBody(_io__raw_data, self, self._root)
            elif _on == Avi.ChunkType.strh:
                pass
                self._raw_data = self._io.read_bytes(self.block_size)
                _io__raw_data = KaitaiStream(BytesIO(self._raw_data))
                self.data = Avi.StrhBody(_io__raw_data, self, self._root)
            else:
                pass
                self.data = self._io.read_bytes(self.block_size)


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


    class Blocks(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.Blocks, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Avi.Block(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()



    class ListBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.ListBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.list_type = KaitaiStream.resolve_enum(Avi.ChunkType, self._io.read_u4le())
            self.data = Avi.Blocks(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.data._fetch_instances()


    class Rect(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.Rect, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.left = self._io.read_s2le()
            self.top = self._io.read_s2le()
            self.right = self._io.read_s2le()
            self.bottom = self._io.read_s2le()


        def _fetch_instances(self):
            pass


    class StrfBody(KaitaiStruct):
        """Stream format description."""
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.StrfBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            pass


        def _fetch_instances(self):
            pass


    class StrhBody(KaitaiStruct):
        """Stream header (one header per stream), defined as AVISTREAMHEADER structure.
        
        .. seealso::
           Source - https://learn.microsoft.com/en-us/previous-versions/ms779638(v=vs.85)
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Avi.StrhBody, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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


        def _fetch_instances(self):
            pass
            self.frame._fetch_instances()



