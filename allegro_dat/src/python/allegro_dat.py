# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class AllegroDat(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(AllegroDat, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.pack_magic = KaitaiStream.resolve_enum(AllegroDat.PackEnum, self._io.read_u4be())
        self.dat_magic = self._io.read_bytes(4)
        if not self.dat_magic == b"\x41\x4C\x4C\x2E":
            raise kaitaistruct.ValidationNotEqualError(b"\x41\x4C\x4C\x2E", self.dat_magic, self._io, u"/seq/1")
        self.num_objects = self._io.read_u4be()
        self.objects = []
        for i in range(self.num_objects):
            self.objects.append(AllegroDat.DatObject(self._io, self, self._root))



    def _fetch_instances(self):
        pass
        for i in range(len(self.objects)):
            pass
            self.objects[i]._fetch_instances()


    class DatBitmap(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatBitmap, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bits_per_pixel = self._io.read_s2be()
            self.width = self._io.read_u2be()
            self.height = self._io.read_u2be()
            self.image = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class DatFont(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatFont, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.font_size = self._io.read_s2be()
            _on = self.font_size
            if _on == 0:
                pass
                self.body = AllegroDat.DatFont39(self._io, self, self._root)
            elif _on == 16:
                pass
                self.body = AllegroDat.DatFont16(self._io, self, self._root)
            elif _on == 8:
                pass
                self.body = AllegroDat.DatFont8(self._io, self, self._root)


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


    class DatFont16(KaitaiStruct):
        """Simple monochrome monospaced font, 95 characters, 8x16 px
        characters.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatFont16, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.chars = []
            for i in range(95):
                self.chars.append(self._io.read_bytes(16))



        def _fetch_instances(self):
            pass
            for i in range(len(self.chars)):
                pass



    class DatFont39(KaitaiStruct):
        """New bitmap font format introduced since Allegro 3.9: allows
        flexible designation of character ranges, 8-bit colored
        characters, etc.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatFont39, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.num_ranges = self._io.read_s2be()
            self.ranges = []
            for i in range(self.num_ranges):
                self.ranges.append(AllegroDat.DatFont39.Range(self._io, self, self._root))



        def _fetch_instances(self):
            pass
            for i in range(len(self.ranges)):
                pass
                self.ranges[i]._fetch_instances()


        class FontChar(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AllegroDat.DatFont39.FontChar, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.width = self._io.read_u2be()
                self.height = self._io.read_u2be()
                self.body = self._io.read_bytes(self.width * self.height)


            def _fetch_instances(self):
                pass


        class Range(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(AllegroDat.DatFont39.Range, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.mono = self._io.read_u1()
                self.start_char = self._io.read_u4be()
                self.end_char = self._io.read_u4be()
                self.chars = []
                for i in range((self.end_char - self.start_char) + 1):
                    self.chars.append(AllegroDat.DatFont39.FontChar(self._io, self, self._root))



            def _fetch_instances(self):
                pass
                for i in range(len(self.chars)):
                    pass
                    self.chars[i]._fetch_instances()




    class DatFont8(KaitaiStruct):
        """Simple monochrome monospaced font, 95 characters, 8x8 px
        characters.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatFont8, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.chars = []
            for i in range(95):
                self.chars.append(self._io.read_bytes(8))



        def _fetch_instances(self):
            pass
            for i in range(len(self.chars)):
                pass



    class DatObject(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatObject, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.properties = []
            i = 0
            while True:
                _ = AllegroDat.Property(self._io, self, self._root)
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
            elif _on == u"FONT":
                pass
                self._raw_body = self._io.read_bytes(self.len_compressed)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = AllegroDat.DatFont(_io__raw_body, self, self._root)
            elif _on == u"RLE ":
                pass
                self._raw_body = self._io.read_bytes(self.len_compressed)
                _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
                self.body = AllegroDat.DatRleSprite(_io__raw_body, self, self._root)
            else:
                pass
                self.body = self._io.read_bytes(self.len_compressed)


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

        @property
        def type(self):
            if hasattr(self, '_m_type'):
                return self._m_type

            self._m_type = self.properties[-1].magic
            return getattr(self, '_m_type', None)


    class DatRleSprite(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.DatRleSprite, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.bits_per_pixel = self._io.read_s2be()
            self.width = self._io.read_u2be()
            self.height = self._io.read_u2be()
            self.len_image = self._io.read_u4be()
            self.image = self._io.read_bytes_full()


        def _fetch_instances(self):
            pass


    class Property(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(AllegroDat.Property, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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



        def _fetch_instances(self):
            pass
            if self.is_valid:
                pass

            if self.is_valid:
                pass

            if self.is_valid:
                pass


        @property
        def is_valid(self):
            if hasattr(self, '_m_is_valid'):
                return self._m_is_valid

            self._m_is_valid = self.magic == u"prop"
            return getattr(self, '_m_is_valid', None)



