# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Vp8DuckIvf(ReadWriteKaitaiStruct):
    """Duck IVF is a simple container format for raw VP8 data, which is an open and
    royalty-free video compression format, currently developed by Google.
    
    Test .ivf files are available at
    <https://chromium.googlesource.com/webm/vp8-test-vectors>
    
    .. seealso::
       Source - https://wiki.multimedia.cx/index.php/Duck_IVF
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Vp8DuckIvf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic1 = self._io.read_bytes(4)
        if not self.magic1 == b"\x44\x4B\x49\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x44\x4B\x49\x46", self.magic1, self._io, u"/seq/0")
        self.version = self._io.read_u2le()
        self.len_header = self._io.read_u2le()
        self.codec = self._io.read_bytes(4)
        if not self.codec == b"\x56\x50\x38\x30":
            raise kaitaistruct.ValidationNotEqualError(b"\x56\x50\x38\x30", self.codec, self._io, u"/seq/3")
        self.width = self._io.read_u2le()
        self.height = self._io.read_u2le()
        self.framerate = self._io.read_u4le()
        self.timescale = self._io.read_u4le()
        self.num_frames = self._io.read_u4le()
        self.unused = self._io.read_u4le()
        self.image_data = []
        for i in range(self.num_frames):
            _t_image_data = Vp8DuckIvf.Blocks(self._io, self, self._root)
            try:
                _t_image_data._read()
            finally:
                self.image_data.append(_t_image_data)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.image_data)):
            pass
            self.image_data[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Vp8DuckIvf, self)._write__seq(io)
        self._io.write_bytes(self.magic1)
        self._io.write_u2le(self.version)
        self._io.write_u2le(self.len_header)
        self._io.write_bytes(self.codec)
        self._io.write_u2le(self.width)
        self._io.write_u2le(self.height)
        self._io.write_u4le(self.framerate)
        self._io.write_u4le(self.timescale)
        self._io.write_u4le(self.num_frames)
        self._io.write_u4le(self.unused)
        for i in range(len(self.image_data)):
            pass
            self.image_data[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic1) != 4:
            raise kaitaistruct.ConsistencyError(u"magic1", 4, len(self.magic1))
        if not self.magic1 == b"\x44\x4B\x49\x46":
            raise kaitaistruct.ValidationNotEqualError(b"\x44\x4B\x49\x46", self.magic1, None, u"/seq/0")
        if len(self.codec) != 4:
            raise kaitaistruct.ConsistencyError(u"codec", 4, len(self.codec))
        if not self.codec == b"\x56\x50\x38\x30":
            raise kaitaistruct.ValidationNotEqualError(b"\x56\x50\x38\x30", self.codec, None, u"/seq/3")
        if len(self.image_data) != self.num_frames:
            raise kaitaistruct.ConsistencyError(u"image_data", self.num_frames, len(self.image_data))
        for i in range(len(self.image_data)):
            pass
            if self.image_data[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"image_data", self._root, self.image_data[i]._root)
            if self.image_data[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"image_data", self, self.image_data[i]._parent)

        self._dirty = False

    class Block(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vp8DuckIvf.Block, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_frame = self._io.read_u4le()
            self.timestamp = self._io.read_u8le()
            self.framedata = self._io.read_bytes(self.len_frame)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Vp8DuckIvf.Block, self)._write__seq(io)
            self._io.write_u4le(self.len_frame)
            self._io.write_u8le(self.timestamp)
            self._io.write_bytes(self.framedata)


        def _check(self):
            if len(self.framedata) != self.len_frame:
                raise kaitaistruct.ConsistencyError(u"framedata", self.len_frame, len(self.framedata))
            self._dirty = False


    class Blocks(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Vp8DuckIvf.Blocks, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = Vp8DuckIvf.Block(self._io, self, self._root)
            self.entries._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.entries._fetch_instances()


        def _write__seq(self, io=None):
            super(Vp8DuckIvf.Blocks, self)._write__seq(io)
            self.entries._write__seq(self._io)


        def _check(self):
            if self.entries._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries._root)
            if self.entries._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries._parent)
            self._dirty = False



