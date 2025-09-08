# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Gzip(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Gzip, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.magic = self._io.read_bytes(2)
        if not self.magic == b"\x1F\x8B":
            raise kaitaistruct.ValidationNotEqualError(b"\x1F\x8B", self.magic, self._io, u"/seq/0")
        self.compression_method = KaitaiStream.resolve_enum(Gzip.CompressionMethods, self._io.read_u1())
        self.flags = Gzip.Flags(self._io, self, self._root)
        self.flags._read()
        self.mod_time = self._io.read_u4le()
        _on = self.compression_method
        if _on == Gzip.CompressionMethods.deflate:
            pass
            self.extra_flags = Gzip.ExtraFlagsDeflate(self._io, self, self._root)
            self.extra_flags._read()
        self.os = KaitaiStream.resolve_enum(Gzip.Oses, self._io.read_u1())
        if self.flags.has_extra:
            pass
            self.extras = Gzip.Extras(self._io, self, self._root)
            self.extras._read()

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
        self._dirty = False


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



    def _write__seq(self, io=None):
        super(Gzip, self)._write__seq(io)
        self._io.write_bytes(self.magic)
        self._io.write_u1(int(self.compression_method))
        self.flags._write__seq(self._io)
        self._io.write_u4le(self.mod_time)
        _on = self.compression_method
        if _on == Gzip.CompressionMethods.deflate:
            pass
            self.extra_flags._write__seq(self._io)
        self._io.write_u1(int(self.os))
        if self.flags.has_extra:
            pass
            self.extras._write__seq(self._io)

        if self.flags.has_name:
            pass
            self._io.write_bytes(self.name)
            self._io.write_u1(0)

        if self.flags.has_comment:
            pass
            self._io.write_bytes(self.comment)
            self._io.write_u1(0)

        if self.flags.has_header_crc:
            pass
            self._io.write_u2le(self.header_crc16)

        if len(self.body) != (self._io.size() - self._io.pos()) - 8:
            raise kaitaistruct.ConsistencyError(u"body", (self._io.size() - self._io.pos()) - 8, len(self.body))
        self._io.write_bytes(self.body)
        self._io.write_u4le(self.body_crc32)
        self._io.write_u4le(self.len_uncompressed)


    def _check(self):
        if len(self.magic) != 2:
            raise kaitaistruct.ConsistencyError(u"magic", 2, len(self.magic))
        if not self.magic == b"\x1F\x8B":
            raise kaitaistruct.ValidationNotEqualError(b"\x1F\x8B", self.magic, None, u"/seq/0")
        if self.flags._root != self._root:
            raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
        if self.flags._parent != self:
            raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
        _on = self.compression_method
        if _on == Gzip.CompressionMethods.deflate:
            pass
            if self.extra_flags._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extra_flags", self._root, self.extra_flags._root)
            if self.extra_flags._parent != self:
                raise kaitaistruct.ConsistencyError(u"extra_flags", self, self.extra_flags._parent)
        if self.flags.has_extra:
            pass
            if self.extras._root != self._root:
                raise kaitaistruct.ConsistencyError(u"extras", self._root, self.extras._root)
            if self.extras._parent != self:
                raise kaitaistruct.ConsistencyError(u"extras", self, self.extras._parent)

        if self.flags.has_name:
            pass
            if KaitaiStream.byte_array_index_of(self.name, 0) != -1:
                raise kaitaistruct.ConsistencyError(u"name", -1, KaitaiStream.byte_array_index_of(self.name, 0))

        if self.flags.has_comment:
            pass
            if KaitaiStream.byte_array_index_of(self.comment, 0) != -1:
                raise kaitaistruct.ConsistencyError(u"comment", -1, KaitaiStream.byte_array_index_of(self.comment, 0))

        if self.flags.has_header_crc:
            pass

        self._dirty = False

    class ExtraFlagsDeflate(ReadWriteKaitaiStruct):

        class CompressionStrengths(IntEnum):
            best = 2
            fast = 4
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gzip.ExtraFlagsDeflate, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.compression_strength = KaitaiStream.resolve_enum(Gzip.ExtraFlagsDeflate.CompressionStrengths, self._io.read_u1())
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gzip.ExtraFlagsDeflate, self)._write__seq(io)
            self._io.write_u1(int(self.compression_strength))


        def _check(self):
            self._dirty = False


    class Extras(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gzip.Extras, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_subfields = self._io.read_u2le()
            self._raw_subfields = self._io.read_bytes(self.len_subfields)
            _io__raw_subfields = KaitaiStream(BytesIO(self._raw_subfields))
            self.subfields = Gzip.Subfields(_io__raw_subfields, self, self._root)
            self.subfields._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.subfields._fetch_instances()


        def _write__seq(self, io=None):
            super(Gzip.Extras, self)._write__seq(io)
            self._io.write_u2le(self.len_subfields)
            _io__raw_subfields = KaitaiStream(BytesIO(bytearray(self.len_subfields)))
            self._io.add_child_stream(_io__raw_subfields)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_subfields))
            def handler(parent, _io__raw_subfields=_io__raw_subfields):
                self._raw_subfields = _io__raw_subfields.to_byte_array()
                if len(self._raw_subfields) != self.len_subfields:
                    raise kaitaistruct.ConsistencyError(u"raw(subfields)", self.len_subfields, len(self._raw_subfields))
                parent.write_bytes(self._raw_subfields)
            _io__raw_subfields.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.subfields._write__seq(_io__raw_subfields)


        def _check(self):
            if self.subfields._root != self._root:
                raise kaitaistruct.ConsistencyError(u"subfields", self._root, self.subfields._root)
            if self.subfields._parent != self:
                raise kaitaistruct.ConsistencyError(u"subfields", self, self.subfields._parent)
            self._dirty = False


    class Flags(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gzip.Flags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reserved1 = self._io.read_bits_int_be(3)
            self.has_comment = self._io.read_bits_int_be(1) != 0
            self.has_name = self._io.read_bits_int_be(1) != 0
            self.has_extra = self._io.read_bits_int_be(1) != 0
            self.has_header_crc = self._io.read_bits_int_be(1) != 0
            self.is_text = self._io.read_bits_int_be(1) != 0
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gzip.Flags, self)._write__seq(io)
            self._io.write_bits_int_be(3, self.reserved1)
            self._io.write_bits_int_be(1, int(self.has_comment))
            self._io.write_bits_int_be(1, int(self.has_name))
            self._io.write_bits_int_be(1, int(self.has_extra))
            self._io.write_bits_int_be(1, int(self.has_header_crc))
            self._io.write_bits_int_be(1, int(self.is_text))


        def _check(self):
            self._dirty = False


    class Subfield(ReadWriteKaitaiStruct):
        """Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
        
        * `id` serves role of "T"ype
        * `len_data` serves role of "L"ength
        * `data` serves role of "V"alue
        
        This way it's possible to for arbitrary parser to skip over
        subfields it does not support.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gzip.Subfield, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2le()
            self.len_data = self._io.read_u2le()
            self.data = self._io.read_bytes(self.len_data)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Gzip.Subfield, self)._write__seq(io)
            self._io.write_u2le(self.id)
            self._io.write_u2le(self.len_data)
            self._io.write_bytes(self.data)


        def _check(self):
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            self._dirty = False


    class Subfields(ReadWriteKaitaiStruct):
        """Container for many subfields, constrained by size of stream.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Gzip.Subfields, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Gzip.Subfield(self._io, self, self._root)
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
            super(Gzip.Subfields, self)._write__seq(io)
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



