# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Avi(KaitaiStruct):
    """
    .. seealso::
       Source - https://msdn.microsoft.com/en-us/library/ms779636.aspx
    """

    class ChunkType(Enum):
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

    class StreamType(Enum):
        mids = 1935960429
        vids = 1935960438
        auds = 1935963489
        txts = 1937012852

    class HandlerType(Enum):
        mp3 = 85
        ac3 = 8192
        dts = 8193
        cvid = 1684633187
        xvid = 1684633208
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.magic1 = self._io.ensure_fixed_contents(b"\x52\x49\x46\x46")
        self.file_size = self._io.read_u4le()
        self.magic2 = self._io.ensure_fixed_contents(b"\x41\x56\x49\x20")
        self._raw_data = self._io.read_bytes((self.file_size - 4))
        io = KaitaiStream(BytesIO(self._raw_data))
        self.data = self._root.Blocks(io, self, self._root)

    class ListBody(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.list_type = self._root.ChunkType(self._io.read_u4le())
            self.data = self._root.Blocks(self._io, self, self._root)


    class Rect(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.left = self._io.read_s2le()
            self.top = self._io.read_s2le()
            self.right = self._io.read_s2le()
            self.bottom = self._io.read_s2le()


    class Blocks(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(self._root.Block(self._io, self, self._root))
                i += 1



    class AvihBody(KaitaiStruct):
        """Main header of an AVI file, defined as AVIMAINHEADER structure.
        
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms779632.aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
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


    class Block(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.four_cc = self._root.ChunkType(self._io.read_u4le())
            self.block_size = self._io.read_u4le()
            _on = self.four_cc
            if _on == self._root.ChunkType.list:
                self._raw_data = self._io.read_bytes(self.block_size)
                io = KaitaiStream(BytesIO(self._raw_data))
                self.data = self._root.ListBody(io, self, self._root)
            elif _on == self._root.ChunkType.avih:
                self._raw_data = self._io.read_bytes(self.block_size)
                io = KaitaiStream(BytesIO(self._raw_data))
                self.data = self._root.AvihBody(io, self, self._root)
            elif _on == self._root.ChunkType.strh:
                self._raw_data = self._io.read_bytes(self.block_size)
                io = KaitaiStream(BytesIO(self._raw_data))
                self.data = self._root.StrhBody(io, self, self._root)
            else:
                self.data = self._io.read_bytes(self.block_size)


    class StrhBody(KaitaiStruct):
        """Stream header (one header per stream), defined as AVISTREAMHEADER structure.
        
        .. seealso::
           Source - https://msdn.microsoft.com/en-us/library/ms779638.aspx
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.fcc_type = self._root.StreamType(self._io.read_u4le())
            self.fcc_handler = self._root.HandlerType(self._io.read_u4le())
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
            self.frame = self._root.Rect(self._io, self, self._root)


    class StrfBody(KaitaiStruct):
        """Stream format description."""
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            pass



