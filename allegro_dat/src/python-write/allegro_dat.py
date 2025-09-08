# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AllegroDat(ReadWriteKaitaiStruct):
    """Allegro library for C (mostly used for game and multimedia apps
    programming) used its own container file format.
    
    In general, it allows storage of arbitrary binary data blocks
    bundled together with some simple key-value style metadata
    ("properties") for every block. Allegro also pre-defines some simple
    formats for bitmaps, fonts, MIDI music, sound samples and
    palettes. Allegro library v4.0+ also support LZSS compression.
    
    This spec applies to Allegro data files for library versions 2.2 up
    to 4.4.
    
    .. seealso::
       Source - https://liballeg.org/stabledocs/en/datafile.html
    """

    class PackEnum(IntEnum):
        unpacked = 1936484398
    def __init__(self, _io=None, _parent=None, _root=None):
        super(AllegroDat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.pack_magic = KaitaiStream.resolve_enum(AllegroDat.PackEnum, self._io.read_u4be())
        self.dat_magic = self._io.read_bytes(4)
        if not self.dat_magic == b"\x41\x4C\x4C\x2E":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4C\x4C\x2E", self.dat_magic, self._io, u"/seq/1")
        self.num_objects = self._io.read_u4be()
        self.objects = []
        for i in range(self.num_objects):
            _t_objects = AllegroDat.DatObject(self._io, self, self._root)
            try:
                _t_objects._read()
            finally:
                self.objects.append(_t_objects)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.objects)):
            pass
            self.objects[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(AllegroDat, self)._write__seq(io)
        self._io.write_u4be(int(self.pack_magic))
        self._io.write_bytes(self.dat_magic)
        self._io.write_u4be(self.num_objects)
        for i in range(len(self.objects)):
            pass
            self.objects[i]._write__seq(self._io)



    def _check(self):
        if len(self.dat_magic) != 4:
            raise kaitaistruct.ConsistencyError(u"dat_magic", 4, len(self.dat_magic))
        if not self.dat_magic == b"\x41\x4C\x4C\x2E":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4C\x4C\x2E", self.dat_magic, None, u"/seq/1")
        if len(self.objects) != self.num_objects:
            raise kaitaistruct.ConsistencyError(u"objects", self.num_objects, len(self.objects))
        for i in range(len(self.objects)):
            pass
            if self.objects[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"objects", self._root, self.objects[i]._root)
            if self.objects[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"objects", self, self.objects[i]._parent)

        self._dirty = False

    class DatBitmap(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatBitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bits_per_pixel = self._io.read_s2be()
            self.width = self._io.read_u2be()
            self.height = self._io.read_u2be()
            self.image = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AllegroDat.DatBitmap, self)._write__seq(io)
            self._io.write_s2be(self.bits_per_pixel)
            self._io.write_u2be(self.width)
            self._io.write_u2be(self.height)
            self._io.write_bytes(self.image)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"image", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class DatFont(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatFont, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.font_size = self._io.read_s2be()
            _on = self.font_size
            if _on == 0:
                pass
                self.body = AllegroDat.DatFont39(self._io, self, self._root)
                self.body._read()
            elif _on == 16:
                pass
                self.body = AllegroDat.DatFont16(self._io, self, self._root)
                self.body._read()
            elif _on == 8:
                pass
                self.body = AllegroDat.DatFont8(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.font_size
            if _on == 0:
                pass
                self.body._fetch_instances()
            elif _on == 16:
                pass
                self.body._fetch_instances()
            elif _on == 8:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(AllegroDat.DatFont, self)._write__seq(io)
            self._io.write_s2be(self.font_size)
            _on = self.font_size
            if _on == 0:
                pass
                self.body._write__seq(self._io)
            elif _on == 16:
                pass
                self.body._write__seq(self._io)
            elif _on == 8:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            _on = self.font_size
            if _on == 0:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 16:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == 8:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class DatFont16(ReadWriteKaitaiStruct):
        """Simple monochrome monospaced font, 95 characters, 8x16 px
        characters.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatFont16, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chars = []
            for i in range(95):
                self.chars.append(self._io.read_bytes(16))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.chars)):
                pass



        def _write__seq(self, io=None):
            super(AllegroDat.DatFont16, self)._write__seq(io)
            for i in range(len(self.chars)):
                pass
                self._io.write_bytes(self.chars[i])



        def _check(self):
            if len(self.chars) != 95:
                raise kaitaistruct.ConsistencyError(u"chars", 95, len(self.chars))
            for i in range(len(self.chars)):
                pass
                if len(self.chars[i]) != 16:
                    raise kaitaistruct.ConsistencyError(u"chars", 16, len(self.chars[i]))

            self._dirty = False


    class DatFont39(ReadWriteKaitaiStruct):
        """New bitmap font format introduced since Allegro 3.9: allows
        flexible designation of character ranges, 8-bit colored
        characters, etc.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatFont39, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_ranges = self._io.read_s2be()
            self.ranges = []
            for i in range(self.num_ranges):
                _t_ranges = AllegroDat.DatFont39.Range(self._io, self, self._root)
                try:
                    _t_ranges._read()
                finally:
                    self.ranges.append(_t_ranges)

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.ranges)):
                pass
                self.ranges[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(AllegroDat.DatFont39, self)._write__seq(io)
            self._io.write_s2be(self.num_ranges)
            for i in range(len(self.ranges)):
                pass
                self.ranges[i]._write__seq(self._io)



        def _check(self):
            if len(self.ranges) != self.num_ranges:
                raise kaitaistruct.ConsistencyError(u"ranges", self.num_ranges, len(self.ranges))
            for i in range(len(self.ranges)):
                pass
                if self.ranges[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"ranges", self._root, self.ranges[i]._root)
                if self.ranges[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"ranges", self, self.ranges[i]._parent)

            self._dirty = False

        class FontChar(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AllegroDat.DatFont39.FontChar, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.width = self._io.read_u2be()
                self.height = self._io.read_u2be()
                self.body = self._io.read_bytes(self.width * self.height)
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(AllegroDat.DatFont39.FontChar, self)._write__seq(io)
                self._io.write_u2be(self.width)
                self._io.write_u2be(self.height)
                self._io.write_bytes(self.body)


            def _check(self):
                if len(self.body) != self.width * self.height:
                    raise kaitaistruct.ConsistencyError(u"body", self.width * self.height, len(self.body))
                self._dirty = False


        class Range(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(AllegroDat.DatFont39.Range, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.mono = self._io.read_u1()
                self.start_char = self._io.read_u4be()
                self.end_char = self._io.read_u4be()
                self.chars = []
                for i in range((self.end_char - self.start_char) + 1):
                    _t_chars = AllegroDat.DatFont39.FontChar(self._io, self, self._root)
                    try:
                        _t_chars._read()
                    finally:
                        self.chars.append(_t_chars)

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.chars)):
                    pass
                    self.chars[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(AllegroDat.DatFont39.Range, self)._write__seq(io)
                self._io.write_u1(self.mono)
                self._io.write_u4be(self.start_char)
                self._io.write_u4be(self.end_char)
                for i in range(len(self.chars)):
                    pass
                    self.chars[i]._write__seq(self._io)



            def _check(self):
                if len(self.chars) != (self.end_char - self.start_char) + 1:
                    raise kaitaistruct.ConsistencyError(u"chars", (self.end_char - self.start_char) + 1, len(self.chars))
                for i in range(len(self.chars)):
                    pass
                    if self.chars[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"chars", self._root, self.chars[i]._root)
                    if self.chars[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"chars", self, self.chars[i]._parent)

                self._dirty = False



    class DatFont8(ReadWriteKaitaiStruct):
        """Simple monochrome monospaced font, 95 characters, 8x8 px
        characters.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatFont8, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.chars = []
            for i in range(95):
                self.chars.append(self._io.read_bytes(8))

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.chars)):
                pass



        def _write__seq(self, io=None):
            super(AllegroDat.DatFont8, self)._write__seq(io)
            for i in range(len(self.chars)):
                pass
                self._io.write_bytes(self.chars[i])



        def _check(self):
            if len(self.chars) != 95:
                raise kaitaistruct.ConsistencyError(u"chars", 95, len(self.chars))
            for i in range(len(self.chars)):
                pass
                if len(self.chars[i]) != 8:
                    raise kaitaistruct.ConsistencyError(u"chars", 8, len(self.chars[i]))

            self._dirty = False


    class DatObject(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.properties = []
            i = 0
            while True:
                _t_properties = AllegroDat.Property(self._io, self, self._root)
                try:
                    _t_properties._read()
                finally:
                    _ = _t_properties
                    self.properties.append(_)
                if (not (_.is_valid)):
                    break
                i += 1
            self.len_compressed = self._io.read_s4be()
            self.len_uncompressed = self._io.read_s4be()
            _on = self.type
            if _on == u"BMP ":
                pass
                self._raw_body = self._io.read_bytes(self.len_compressed)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = AllegroDat.DatBitmap(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"FONT":
                pass
                self._raw_body = self._io.read_bytes(self.len_compressed)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = AllegroDat.DatFont(_io__raw_body, self, self._root)
                self.body._read()
            elif _on == u"RLE ":
                pass
                self._raw_body = self._io.read_bytes(self.len_compressed)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = AllegroDat.DatRleSprite(_io__raw_body, self, self._root)
                self.body._read()
            else:
                pass
                self.body = self._io.read_bytes(self.len_compressed)
            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.properties)):
                pass
                self.properties[i]._fetch_instances()

            _on = self.type
            if _on == u"BMP ":
                pass
                self.body._fetch_instances()
            elif _on == u"FONT":
                pass
                self.body._fetch_instances()
            elif _on == u"RLE ":
                pass
                self.body._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(AllegroDat.DatObject, self)._write__seq(io)
            for i in range(len(self.properties)):
                pass
                self.properties[i]._write__seq(self._io)

            self._io.write_s4be(self.len_compressed)
            self._io.write_s4be(self.len_uncompressed)
            _on = self.type
            if _on == u"BMP ":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_compressed)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_compressed))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_compressed:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_compressed, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"FONT":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_compressed)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_compressed))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_compressed:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_compressed, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            elif _on == u"RLE ":
                pass
                _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len_compressed)))
                self._io.add_child_stream(_io__raw_body)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self.len_compressed))
                def handler(parent, _io__raw_body=_io__raw_body):
                    self._raw_body = _io__raw_body.to_byte_array()
                    if len(self._raw_body) != self.len_compressed:
                        raise kaitaistruct.ConsistencyError(u"raw(body)", self.len_compressed, len(self._raw_body))
                    parent.write_bytes(self._raw_body)
                _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.body._write__seq(_io__raw_body)
            else:
                pass
                self._io.write_bytes(self.body)


        def _check(self):
            if len(self.properties) == 0:
                raise kaitaistruct.ConsistencyError(u"properties", 0, len(self.properties))
            for i in range(len(self.properties)):
                pass
                if self.properties[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"properties", self._root, self.properties[i]._root)
                if self.properties[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"properties", self, self.properties[i]._parent)
                _ = self.properties[i]
                if (not (_.is_valid)) != (i == len(self.properties) - 1):
                    raise kaitaistruct.ConsistencyError(u"properties", i == len(self.properties) - 1, (not (_.is_valid)))

            _on = self.type
            if _on == u"BMP ":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"FONT":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == u"RLE ":
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            else:
                pass
                if len(self.body) != self.len_compressed:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_compressed, len(self.body))
            self._dirty = False

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self.properties[-1].magic
            return getattr(self, '_m_type', None)

        def _invalidate_type(self):
            del self._m_type

    class DatRleSprite(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.DatRleSprite, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.bits_per_pixel = self._io.read_s2be()
            self.width = self._io.read_u2be()
            self.height = self._io.read_u2be()
            self.len_image = self._io.read_u4be()
            self.image = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(AllegroDat.DatRleSprite, self)._write__seq(io)
            self._io.write_s2be(self.bits_per_pixel)
            self._io.write_u2be(self.width)
            self._io.write_u2be(self.height)
            self._io.write_u4be(self.len_image)
            self._io.write_bytes(self.image)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"image", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class Property(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(AllegroDat.Property, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.magic = (self._io.read_bytes(4)).decode(u"UTF-8")
            if self.is_valid:
                pass
                self.type = (self._io.read_bytes(4)).decode(u"UTF-8")

            if self.is_valid:
                pass
                self.len_body = self._io.read_u4be()

            if self.is_valid:
                pass
                self.body = (self._io.read_bytes(self.len_body)).decode(u"UTF-8")

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.is_valid:
                pass

            if self.is_valid:
                pass

            if self.is_valid:
                pass



        def _write__seq(self, io=None):
            super(AllegroDat.Property, self)._write__seq(io)
            self._io.write_bytes((self.magic).encode(u"UTF-8"))
            if self.is_valid:
                pass
                self._io.write_bytes((self.type).encode(u"UTF-8"))

            if self.is_valid:
                pass
                self._io.write_u4be(self.len_body)

            if self.is_valid:
                pass
                self._io.write_bytes((self.body).encode(u"UTF-8"))



        def _check(self):
            if len((self.magic).encode(u"UTF-8")) != 4:
                raise kaitaistruct.ConsistencyError(u"magic", 4, len((self.magic).encode(u"UTF-8")))
            if self.is_valid:
                pass
                if len((self.type).encode(u"UTF-8")) != 4:
                    raise kaitaistruct.ConsistencyError(u"type", 4, len((self.type).encode(u"UTF-8")))

            if self.is_valid:
                pass

            if self.is_valid:
                pass
                if len((self.body).encode(u"UTF-8")) != self.len_body:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_body, len((self.body).encode(u"UTF-8")))

            self._dirty = False

        @property
        def is_valid(self):
            if hasattr(self, '_m_is_valid'):
                return self._m_is_valid

            self._m_is_valid = self.magic == u"prop"
            return getattr(self, '_m_is_valid', None)

        def _invalidate_is_valid(self):
            del self._m_is_valid


