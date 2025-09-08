# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Gzip(KaitaiStruct):
    """Gzip is a popular and standard single-file archiving format. It
    essentially provides a container that stores original file name,
    timestamp and a few other things (like optional comment), basic
    CRCs, etc, and a file compressed by a chosen compression algorithm.
    
    As of 2019, there is actually only one working solution for
    compression algorithms, so it's typically raw DEFLATE stream
    (without zlib header) in all gzipped files.
    
    .. seealso::
       Source - https://www.rfc-editor.org/rfc/rfc1952
    """

    class CompressionMethods(IntEnum):
        deflate = 8

    class Oses(IntEnum):
        fat = 0
        amiga = 1
        vms = 2
        unix = 3
        vm_cms = 4
        atari_tos = 5
        hpfs = 6
        macintosh = 7
        z_system = 8
        cp_m = 9
        tops_20 = 10
        ntfs = 11
        qdos = 12
        acorn_riscos = 13
        unknown = 255
    def __init__(self, _io, _parent=None, _root=None):
        super(Gzip, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(2)
        if not self.magic == b"\x1F\x8B":
            raise kaitaistruct.ValidationNotEqualError(b"\x1F\x8B", self.magic, self._io, u"/seq/0")
        self.compression_method = KaitaiStream.resolve_enum(Gzip.CompressionMethods, self._io.read_u1())
        self.flags = Gzip.Flags(self._io, self, self._root)
        self.mod_time = self._io.read_u4le()
        _on = self.compression_method
        if _on == Gzip.CompressionMethods.deflate:
            pass
            self.extra_flags = Gzip.ExtraFlagsDeflate(self._io, self, self._root)
        self.os = KaitaiStream.resolve_enum(Gzip.Oses, self._io.read_u1())
        if self.flags.has_extra:
            pass
            self.extras = Gzip.Extras(self._io, self, self._root)

        if self.flags.has_name:
            pass
            self.name = self._io.read_bytes_term(0, False, True, True)

        if self.flags.has_comment:
            pass
            self.comment = self._io.read_bytes_term(0, False, True, True)

        if self.flags.has_header_crc:
            pass
            self.header_crc16 = self._io.read_u2le()

        self.body = self._io.read_bytes((self._io.size() - self._io.pos()) - 8)
        self.body_crc32 = self._io.read_u4le()
        self.len_uncompressed = self._io.read_u4le()


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        _on = self.compression_method
        if _on == Gzip.CompressionMethods.deflate:
            pass
            self.extra_flags._fetch_instances()
        if self.flags.has_extra:
            pass
            self.extras._fetch_instances()

        if self.flags.has_name:
            pass

        if self.flags.has_comment:
            pass

        if self.flags.has_header_crc:
            pass


    class ExtraFlagsDeflate(KaitaiStruct):

        class CompressionStrengths(IntEnum):
            best = 2
            fast = 4
        def __init__(self, _io, _parent=None, _root=None):
            super(Gzip.ExtraFlagsDeflate, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.compression_strength = KaitaiStream.resolve_enum(Gzip.ExtraFlagsDeflate.CompressionStrengths, self._io.read_u1())


        def _fetch_instances(self):
            pass


    class Extras(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gzip.Extras, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_subfields = self._io.read_u2le()
            self._raw_subfields = self._io.read_bytes(self.len_subfields)
            _io__raw_subfields = KaitaiStream(BytesIO(self._raw_subfields))
            self.subfields = Gzip.Subfields(_io__raw_subfields, self, self._root)


        def _fetch_instances(self):
            pass
            self.subfields._fetch_instances()


    class Flags(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(Gzip.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reserved1 = self._io.read_bits_int_be(3)
            self.has_comment = self._io.read_bits_int_be(1) != 0
            self.has_name = self._io.read_bits_int_be(1) != 0
            self.has_extra = self._io.read_bits_int_be(1) != 0
            self.has_header_crc = self._io.read_bits_int_be(1) != 0
            self.is_text = self._io.read_bits_int_be(1) != 0


        def _fetch_instances(self):
            pass


    class Subfield(KaitaiStruct):
        """Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
        
        * `id` serves role of "T"ype
        * `len_data` serves role of "L"ength
        * `data` serves role of "V"alue
        
        This way it's possible to for arbitrary parser to skip over
        subfields it does not support.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Gzip.Subfield, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.len_data = self._io.read_u2le()
            self.data = self._io.read_bytes(self.len_data)


        def _fetch_instances(self):
            pass


    class Subfields(KaitaiStruct):
        """Container for many subfields, constrained by size of stream.
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(Gzip.Subfields, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Gzip.Subfield(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.entries)):
                pass
                self.entries[i]._fetch_instances()




