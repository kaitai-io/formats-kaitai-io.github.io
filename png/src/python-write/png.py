# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum
import zlib


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Png(ReadWriteKaitaiStruct):
    """Test files for APNG can be found at the following locations:
    
      * <https://philip.html5.org/tests/apng/tests.html>
      * <http://littlesvr.ca/apng/>
    """

    class BlendOpValues(IntEnum):
        source = 0
        over = 1

    class ColorType(IntEnum):
        greyscale = 0
        truecolor = 2
        indexed = 3
        greyscale_alpha = 4
        truecolor_alpha = 6

    class CompressionMethods(IntEnum):
        zlib = 0

    class DisposeOpValues(IntEnum):
        none = 0
        background = 1
        previous = 2

    class PhysUnit(IntEnum):
        unknown = 0
        meter = 1
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Png, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(8)
        if not self.magic == b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A":
            raise kaitaistruct.ValidationNotEqualError(b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", self.magic, self._io, u"/seq/0")
        self.ihdr_len = self._io.read_u4be()
        if not self.ihdr_len == 13:
            raise kaitaistruct.ValidationNotEqualError(13, self.ihdr_len, self._io, u"/seq/1")
        self.ihdr_type = self._io.read_bytes(4)
        if not self.ihdr_type == b"\x49\x48\x44\x52":
            raise kaitaistruct.ValidationNotEqualError(b"\x49\x48\x44\x52", self.ihdr_type, self._io, u"/seq/2")
        self.ihdr = Png.IhdrChunk(self._io, self, self._root)
        self.ihdr._read()
        self.ihdr_crc = self._io.read_bytes(4)
        self.chunks = []
        i = 0
        while True:
            _t_chunks = Png.Chunk(self._io, self, self._root)
            try:
                _t_chunks._read()
            finally:
                _ = _t_chunks
                self.chunks.append(_)
            if  ((_.type == u"IEND") or (self._io.is_eof())) :
                break
            i += 1
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.ihdr._fetch_instances()
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(Png, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u4be(self.ihdr_len)
        self._io.write_bytes(self.ihdr_type)
        self.ihdr._write__seq(self._io)
        self._io.write_bytes(self.ihdr_crc)
        for i in range(len(self.chunks)):
            pass
            self.chunks[i]._write__seq(self._io)
            _ = self.chunks[i]
            if  ((_.type == u"IEND") or (self._io.is_eof()))  != (i == len(self.chunks) - 1):
                raise kaitaistruct.ConsistencyError(u"chunks", i == len(self.chunks) - 1,  ((_.type == u"IEND") or (self._io.is_eof())) )



    def _check(self):
        if len(self.magic) != 8:
            raise kaitaistruct.ConsistencyError(u"magic", 8, len(self.magic))
        if not self.magic == b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A":
            raise kaitaistruct.ValidationNotEqualError(b"\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", self.magic, None, u"/seq/0")
        if not self.ihdr_len == 13:
            raise kaitaistruct.ValidationNotEqualError(13, self.ihdr_len, None, u"/seq/1")
        if len(self.ihdr_type) != 4:
            raise kaitaistruct.ConsistencyError(u"ihdr_type", 4, len(self.ihdr_type))
        if not self.ihdr_type == b"\x49\x48\x44\x52":
            raise kaitaistruct.ValidationNotEqualError(b"\x49\x48\x44\x52", self.ihdr_type, None, u"/seq/2")
        if self.ihdr._root != self._root:
            raise kaitaistruct.ConsistencyError(u"ihdr", self._root, self.ihdr._root)
        if self.ihdr._parent != self:
            raise kaitaistruct.ConsistencyError(u"ihdr", self, self.ihdr._parent)
        if len(self.ihdr_crc) != 4:
            raise kaitaistruct.ConsistencyError(u"ihdr_crc", 4, len(self.ihdr_crc))
        if len(self.chunks) == 0:
            raise kaitaistruct.ConsistencyError(u"chunks", 0, len(self.chunks))
        for i in range(len(self.chunks)):
            pass
            if self.chunks[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"chunks", self._root, self.chunks[i]._root)
            if self.chunks[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"chunks", self, self.chunks[i]._parent)

        self._dirty = False

    class AnimationControlChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60acTL.60:_The_Animation_Control_Chunk
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.AnimationControlChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_frames = self._io.read_u4be()
            self.num_plays = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.AnimationControlChunk, self)._write__seq(io)
            self._io.write_u4be(self.num_frames)
            self._io.write_u4be(self.num_plays)


        def _check(self):
            self._dirty = False


    class BkgdChunk(ReadWriteKaitaiStruct):
        """Background chunk stores default background color to display this
        image against. Contents depend on `color_type` of the image.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11bKGD
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.BkgdChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
                self.bkgd._read()
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                self.bkgd = Png.BkgdGreyscale(self._io, self, self._root)
                self.bkgd._read()
            elif _on == Png.ColorType.indexed:
                pass
                self.bkgd = Png.BkgdIndexed(self._io, self, self._root)
                self.bkgd._read()
            elif _on == Png.ColorType.truecolor:
                pass
                self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)
                self.bkgd._read()
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                self.bkgd = Png.BkgdTruecolor(self._io, self, self._root)
                self.bkgd._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.indexed:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.truecolor:
                pass
                self.bkgd._fetch_instances()
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                self.bkgd._fetch_instances()


        def _write__seq(self, io=None):
            super(Png.BkgdChunk, self)._write__seq(io)
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                self.bkgd._write__seq(self._io)
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                self.bkgd._write__seq(self._io)
            elif _on == Png.ColorType.indexed:
                pass
                self.bkgd._write__seq(self._io)
            elif _on == Png.ColorType.truecolor:
                pass
                self.bkgd._write__seq(self._io)
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                self.bkgd._write__seq(self._io)


        def _check(self):
            _on = self._root.ihdr.color_type
            if _on == Png.ColorType.greyscale:
                pass
                if self.bkgd._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self._root, self.bkgd._root)
                if self.bkgd._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self, self.bkgd._parent)
            elif _on == Png.ColorType.greyscale_alpha:
                pass
                if self.bkgd._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self._root, self.bkgd._root)
                if self.bkgd._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self, self.bkgd._parent)
            elif _on == Png.ColorType.indexed:
                pass
                if self.bkgd._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self._root, self.bkgd._root)
                if self.bkgd._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self, self.bkgd._parent)
            elif _on == Png.ColorType.truecolor:
                pass
                if self.bkgd._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self._root, self.bkgd._root)
                if self.bkgd._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self, self.bkgd._parent)
            elif _on == Png.ColorType.truecolor_alpha:
                pass
                if self.bkgd._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self._root, self.bkgd._root)
                if self.bkgd._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bkgd", self, self.bkgd._parent)
            self._dirty = False


    class BkgdGreyscale(ReadWriteKaitaiStruct):
        """Background chunk for greyscale images."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.BkgdGreyscale, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.value = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.BkgdGreyscale, self)._write__seq(io)
            self._io.write_u2be(self.value)


        def _check(self):
            self._dirty = False


    class BkgdIndexed(ReadWriteKaitaiStruct):
        """Background chunk for images with indexed palette."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.BkgdIndexed, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.palette_index = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.BkgdIndexed, self)._write__seq(io)
            self._io.write_u1(self.palette_index)


        def _check(self):
            self._dirty = False


    class BkgdTruecolor(ReadWriteKaitaiStruct):
        """Background chunk for truecolor images."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.BkgdTruecolor, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.red = self._io.read_u2be()
            self.green = self._io.read_u2be()
            self.blue = self._io.read_u2be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.BkgdTruecolor, self)._write__seq(io)
            self._io.write_u2be(self.red)
            self._io.write_u2be(self.green)
            self._io.write_u2be(self.blue)


        def _check(self):
            self._dirty = False


    class ChrmChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11cHRM
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.ChrmChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.white_point = Png.Point(self._io, self, self._root)
            self.white_point._read()
            self.red = Png.Point(self._io, self, self._root)
            self.red._read()
            self.green = Png.Point(self._io, self, self._root)
            self.green._read()
            self.blue = Png.Point(self._io, self, self._root)
            self.blue._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.white_point._fetch_instances()
            self.red._fetch_instances()
            self.green._fetch_instances()
            self.blue._fetch_instances()


        def _write__seq(self, io=None):
            super(Png.ChrmChunk, self)._write__seq(io)
            self.white_point._write__seq(self._io)
            self.red._write__seq(self._io)
            self.green._write__seq(self._io)
            self.blue._write__seq(self._io)


        def _check(self):
            if self.white_point._root != self._root:
                raise kaitaistruct.ConsistencyError(u"white_point", self._root, self.white_point._root)
            if self.white_point._parent != self:
                raise kaitaistruct.ConsistencyError(u"white_point", self, self.white_point._parent)
            if self.red._root != self._root:
                raise kaitaistruct.ConsistencyError(u"red", self._root, self.red._root)
            if self.red._parent != self:
                raise kaitaistruct.ConsistencyError(u"red", self, self.red._parent)
            if self.green._root != self._root:
                raise kaitaistruct.ConsistencyError(u"green", self._root, self.green._root)
            if self.green._parent != self:
                raise kaitaistruct.ConsistencyError(u"green", self, self.green._parent)
            if self.blue._root != self._root:
                raise kaitaistruct.ConsistencyError(u"blue", self._root, self.blue._root)
            if self.blue._parent != self:
                raise kaitaistruct.ConsistencyError(u"blue", self, self.blue._parent)
            self._dirty = False


    class Chunk(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.Chunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = self._io.read_u4be()
            self.type = (self._io.read_bytes(4)).decode(u"UTF-8")
            _on = self.type
            if _on == u"PLTE":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.PlteChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"acTL":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.AnimationControlChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"bKGD":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.BkgdChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"cHRM":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.ChrmChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"fcTL":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.FrameControlChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"fdAT":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.FrameDataChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"gAMA":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.GamaChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"iTXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.InternationalTextChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"pHYs":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.PhysChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"sRGB":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.SrgbChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"tEXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.TextChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"tIME":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.TimeChunk(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"zTXt":
                pass
                self._raw_body = self._io.read_bytes(self.len)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = Png.CompressedTextChunk(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len)
            self.crc = self._io.read_bytes(4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.type
            if _on == u"PLTE":
                pass
                self.body._fetch_instances()
            elif _on == u"acTL":
                pass
                self.body._fetch_instances()
            elif _on == u"bKGD":
                pass
                self.body._fetch_instances()
            elif _on == u"cHRM":
                pass
                self.body._fetch_instances()
            elif _on == u"fcTL":
                pass
                self.body._fetch_instances()
            elif _on == u"fdAT":
                pass
                self.body._fetch_instances()
            elif _on == u"gAMA":
                pass
                self.body._fetch_instances()
            elif _on == u"iTXt":
                pass
                self.body._fetch_instances()
            elif _on == u"pHYs":
                pass
                self.body._fetch_instances()
            elif _on == u"sRGB":
                pass
                self.body._fetch_instances()
            elif _on == u"tEXt":
                pass
                self.body._fetch_instances()
            elif _on == u"tIME":
                pass
                self.body._fetch_instances()
            elif _on == u"zTXt":
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(Png.Chunk, self)._write__seq(io)
            self._io.write_u4be(self.len)
            self._io.write_bytes((self.type).encode(u"UTF-8"))
            _on = self.type
            if _on == u"PLTE":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"acTL":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"bKGD":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"cHRM":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"fcTL":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"fdAT":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"gAMA":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"iTXt":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"pHYs":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"sRGB":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"tEXt":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"tIME":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"zTXt":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)
            self._io.write_bytes(self.crc)


        def _check(self):
            if len((self.type).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"type", 4, len((self.type).encode(u"UTF-8")))
            _on = self.type
            if _on == u"PLTE":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"acTL":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"bKGD":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"cHRM":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"fcTL":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"fdAT":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"gAMA":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"iTXt":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"pHYs":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"sRGB":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"tEXt":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"tIME":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"zTXt":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len:
                    raise kaitaistruct.ConsistencyError(u"body", self.len, len(self.body))
            if len(self.crc) != 4:
                raise kaitaistruct.ConsistencyError(u"crc", 4, len(self.crc))
            self._dirty = False


    class CompressedTextChunk(ReadWriteKaitaiStruct):
        """Compressed text chunk effectively allows to store key-value
        string pairs in PNG container, compressing "value" part (which
        can be quite lengthy) with zlib compression.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11zTXt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.CompressedTextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_method = KaitaiStream.resolve_enum(Png.CompressionMethods, self._io.read_u1())
            self._raw_text_datastream = self._io.read_bytes_full()
            self.text_datastream = zlib.decompress(self._raw_text_datastream)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.CompressedTextChunk, self)._write__seq(io)
            self._io.write_bytes((self.keyword).encode(u"UTF-8"))
            self._io.write_u1(0)
            self._io.write_u1(int(self.compression_method))
            self._raw_text_datastream = zlib.compress(self.text_datastream)
            self._io.write_bytes(self._raw_text_datastream)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"text_datastream", 0, self._io.size() - self._io.pos())


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.keyword).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"keyword", -1, KaitaiStream.byte_array_index_of((self.keyword).encode(u"UTF-8"), 0))
            self._dirty = False


    class FrameControlChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60fcTL.60:_The_Frame_Control_Chunk
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.FrameControlChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sequence_number = self._io.read_u4be()
            self.width = self._io.read_u4be()
            if not self.width >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.width, self._io, u"/types/frame_control_chunk/seq/1")
            if not self.width <= self._root.ihdr.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width, self.width, self._io, u"/types/frame_control_chunk/seq/1")
            self.height = self._io.read_u4be()
            if not self.height >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.height, self._io, u"/types/frame_control_chunk/seq/2")
            if not self.height <= self._root.ihdr.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height, self.height, self._io, u"/types/frame_control_chunk/seq/2")
            self.x_offset = self._io.read_u4be()
            if not self.x_offset <= self._root.ihdr.width - self.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width - self.width, self.x_offset, self._io, u"/types/frame_control_chunk/seq/3")
            self.y_offset = self._io.read_u4be()
            if not self.y_offset <= self._root.ihdr.height - self.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height - self.height, self.y_offset, self._io, u"/types/frame_control_chunk/seq/4")
            self.delay_num = self._io.read_u2be()
            self.delay_den = self._io.read_u2be()
            self.dispose_op = KaitaiStream.resolve_enum(Png.DisposeOpValues, self._io.read_u1())
            self.blend_op = KaitaiStream.resolve_enum(Png.BlendOpValues, self._io.read_u1())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.FrameControlChunk, self)._write__seq(io)
            self._io.write_u4be(self.sequence_number)
            self._io.write_u4be(self.width)
            self._io.write_u4be(self.height)
            self._io.write_u4be(self.x_offset)
            self._io.write_u4be(self.y_offset)
            self._io.write_u2be(self.delay_num)
            self._io.write_u2be(self.delay_den)
            self._io.write_u1(int(self.dispose_op))
            self._io.write_u1(int(self.blend_op))


        def _check(self):
            if not self.width >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.width, None, u"/types/frame_control_chunk/seq/1")
            if not self.width <= self._root.ihdr.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width, self.width, None, u"/types/frame_control_chunk/seq/1")
            if not self.height >= 1:
                raise kaitaistruct.ValidationLessThanError(1, self.height, None, u"/types/frame_control_chunk/seq/2")
            if not self.height <= self._root.ihdr.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height, self.height, None, u"/types/frame_control_chunk/seq/2")
            if not self.x_offset <= self._root.ihdr.width - self.width:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.width - self.width, self.x_offset, None, u"/types/frame_control_chunk/seq/3")
            if not self.y_offset <= self._root.ihdr.height - self.height:
                raise kaitaistruct.ValidationGreaterThanError(self._root.ihdr.height - self.height, self.y_offset, None, u"/types/frame_control_chunk/seq/4")
            self._dirty = False

        @property
        def delay(self):
            """Time to display this frame, in seconds."""
            if hasattr(self, '_m_delay'):
                return self._m_delay

            self._m_delay = self.delay_num / (100.0 if self.delay_den == 0 else self.delay_den)
            return getattr(self, '_m_delay', None)

        def _invalidate_delay(self):
            del self._m_delay

    class FrameDataChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://wiki.mozilla.org/APNG_Specification#.60fdAT.60:_The_Frame_Data_Chunk
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.FrameDataChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sequence_number = self._io.read_u4be()
            self.frame_data = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.FrameDataChunk, self)._write__seq(io)
            self._io.write_u4be(self.sequence_number)
            self._io.write_bytes(self.frame_data)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"frame_data", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class GamaChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11gAMA
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.GamaChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.gamma_int = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.GamaChunk, self)._write__seq(io)
            self._io.write_u4be(self.gamma_int)


        def _check(self):
            self._dirty = False

        @property
        def gamma_ratio(self):
            if hasattr(self, '_m_gamma_ratio'):
                return self._m_gamma_ratio

            self._m_gamma_ratio = 100000.0 / self.gamma_int
            return getattr(self, '_m_gamma_ratio', None)

        def _invalidate_gamma_ratio(self):
            del self._m_gamma_ratio

    class IhdrChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11IHDR
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.IhdrChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.width = self._io.read_u4be()
            self.height = self._io.read_u4be()
            self.bit_depth = self._io.read_u1()
            self.color_type = KaitaiStream.resolve_enum(Png.ColorType, self._io.read_u1())
            self.compression_method = self._io.read_u1()
            self.filter_method = self._io.read_u1()
            self.interlace_method = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.IhdrChunk, self)._write__seq(io)
            self._io.write_u4be(self.width)
            self._io.write_u4be(self.height)
            self._io.write_u1(self.bit_depth)
            self._io.write_u1(int(self.color_type))
            self._io.write_u1(self.compression_method)
            self._io.write_u1(self.filter_method)
            self._io.write_u1(self.interlace_method)


        def _check(self):
            self._dirty = False


    class InternationalTextChunk(ReadWriteKaitaiStruct):
        """International text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11iTXt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.InternationalTextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.compression_flag = self._io.read_u1()
            self.compression_method = KaitaiStream.resolve_enum(Png.CompressionMethods, self._io.read_u1())
            self.language_tag = (self._io.read_bytes_term(0, False, True, True)).decode(u"ASCII")
            self.translated_keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self.text = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.InternationalTextChunk, self)._write__seq(io)
            self._io.write_bytes((self.keyword).encode(u"UTF-8"))
            self._io.write_u1(0)
            self._io.write_u1(self.compression_flag)
            self._io.write_u1(int(self.compression_method))
            self._io.write_bytes((self.language_tag).encode(u"ASCII"))
            self._io.write_u1(0)
            self._io.write_bytes((self.translated_keyword).encode(u"UTF-8"))
            self._io.write_u1(0)
            self._io.write_bytes((self.text).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"text", 0, self._io.size() - self._io.pos())


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.keyword).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"keyword", -1, KaitaiStream.byte_array_index_of((self.keyword).encode(u"UTF-8"), 0))
            if KaitaiStream.byte_array_index_of((self.language_tag).encode(u"ASCII"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"language_tag", -1, KaitaiStream.byte_array_index_of((self.language_tag).encode(u"ASCII"), 0))
            if KaitaiStream.byte_array_index_of((self.translated_keyword).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"translated_keyword", -1, KaitaiStream.byte_array_index_of((self.translated_keyword).encode(u"UTF-8"), 0))
            self._dirty = False


    class PhysChunk(ReadWriteKaitaiStruct):
        """"Physical size" chunk stores data that allows to translate
        logical pixels into physical units (meters, etc) and vice-versa.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11pHYs
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.PhysChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.pixels_per_unit_x = self._io.read_u4be()
            self.pixels_per_unit_y = self._io.read_u4be()
            self.unit = KaitaiStream.resolve_enum(Png.PhysUnit, self._io.read_u1())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.PhysChunk, self)._write__seq(io)
            self._io.write_u4be(self.pixels_per_unit_x)
            self._io.write_u4be(self.pixels_per_unit_y)
            self._io.write_u1(int(self.unit))


        def _check(self):
            self._dirty = False


    class PlteChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11PLTE
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.PlteChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Png.Rgb(self._io, self, self._root)
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
            super(Png.PlteChunk, self)._write__seq(io)
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


    class Point(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.Point, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.x_int = self._io.read_u4be()
            self.y_int = self._io.read_u4be()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.Point, self)._write__seq(io)
            self._io.write_u4be(self.x_int)
            self._io.write_u4be(self.y_int)


        def _check(self):
            self._dirty = False

        @property
        def x(self):
            if hasattr(self, '_m_x'):
                return self._m_x

            self._m_x = self.x_int / 100000.0
            return getattr(self, '_m_x', None)

        def _invalidate_x(self):
            del self._m_x
        @property
        def y(self):
            if hasattr(self, '_m_y'):
                return self._m_y

            self._m_y = self.y_int / 100000.0
            return getattr(self, '_m_y', None)

        def _invalidate_y(self):
            del self._m_y

    class Rgb(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.Rgb, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.r = self._io.read_u1()
            self.g = self._io.read_u1()
            self.b = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.Rgb, self)._write__seq(io)
            self._io.write_u1(self.r)
            self._io.write_u1(self.g)
            self._io.write_u1(self.b)


        def _check(self):
            self._dirty = False


    class SrgbChunk(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://www.w3.org/TR/png/#11sRGB
        """

        class Intent(IntEnum):
            perceptual = 0
            relative_colorimetric = 1
            saturation = 2
            absolute_colorimetric = 3
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.SrgbChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.render_intent = KaitaiStream.resolve_enum(Png.SrgbChunk.Intent, self._io.read_u1())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.SrgbChunk, self)._write__seq(io)
            self._io.write_u1(int(self.render_intent))


        def _check(self):
            self._dirty = False


    class TextChunk(ReadWriteKaitaiStruct):
        """Text chunk effectively allows to store key-value string pairs in
        PNG container. Both "key" (keyword) and "value" (text) parts are
        given in pre-defined subset of iso8859-1 without control
        characters.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11tEXt
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.TextChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.keyword = (self._io.read_bytes_term(0, False, True, True)).decode(u"ISO-8859-1")
            self.text = (self._io.read_bytes_full()).decode(u"ISO-8859-1")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.TextChunk, self)._write__seq(io)
            self._io.write_bytes((self.keyword).encode(u"ISO-8859-1"))
            self._io.write_u1(0)
            self._io.write_bytes((self.text).encode(u"ISO-8859-1"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"text", 0, self._io.size() - self._io.pos())


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.keyword).encode(u"ISO-8859-1"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"keyword", -1, KaitaiStream.byte_array_index_of((self.keyword).encode(u"ISO-8859-1"), 0))
            self._dirty = False


    class TimeChunk(ReadWriteKaitaiStruct):
        """Time chunk stores time stamp of last modification of this image,
        up to 1 second precision in UTC timezone.
        
        .. seealso::
           Source - https://www.w3.org/TR/png/#11tIME
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Png.TimeChunk, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.year = self._io.read_u2be()
            self.month = self._io.read_u1()
            self.day = self._io.read_u1()
            self.hour = self._io.read_u1()
            self.minute = self._io.read_u1()
            self.second = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Png.TimeChunk, self)._write__seq(io)
            self._io.write_u2be(self.year)
            self._io.write_u1(self.month)
            self._io.write_u1(self.day)
            self._io.write_u1(self.hour)
            self._io.write_u1(self.minute)
            self._io.write_u1(self.second)


        def _check(self):
            self._dirty = False



