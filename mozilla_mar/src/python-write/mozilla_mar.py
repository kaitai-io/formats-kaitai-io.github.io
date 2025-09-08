# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MozillaMar(ReadWriteKaitaiStruct):
    """Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
    Test files can be found on Mozilla's FTP site, for example:
    
    <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
    
    .. seealso::
       Source - https://wiki.mozilla.org/Software_Update:MAR
    """

    class BlockIdentifiers(IntEnum):
        product_information = 1

    class SignatureAlgorithms(IntEnum):
        rsa_pkcs1_sha1 = 1
        rsa_pkcs1_sha384 = 2
    def __init__(self, _io=None, _parent=None, _root=None):
        super(MozillaMar, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._should_write_index = False
        self.index__enabled = True

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x4D\x41\x52\x31":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x41\x52\x31", self.magic, self._io, u"/seq/0")
        self.ofs_index = self._io.read_u4be()
        self.file_size = self._io.read_u8be()
        self.len_signatures = self._io.read_u4be()
        self.signatures = []
        for i in range(self.len_signatures):
            _t_signatures = MozillaMar.Signature(self._io, self, self._root)
            try:
                _t_signatures._read()
            finally:
                self.signatures.append(_t_signatures)

        self.len_additional_sections = self._io.read_u4be()
        self.additional_sections = []
        for i in range(self.len_additional_sections):
            _t_additional_sections = MozillaMar.AdditionalSection(self._io, self, self._root)
            try:
                _t_additional_sections._read()
            finally:
                self.additional_sections.append(_t_additional_sections)

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.signatures)):
            pass
            self.signatures[i]._fetch_instances()

        for i in range(len(self.additional_sections)):
            pass
            self.additional_sections[i]._fetch_instances()

        _ = self.index
        if hasattr(self, '_m_index'):
            pass
            self._m_index._fetch_instances()



    def _write__seq(self, io=None):
        super(MozillaMar, self)._write__seq(io)
        self._should_write_index = self.index__enabled
        self._io.write_bytes(self.magic)
        self._io.write_u4be(self.ofs_index)
        self._io.write_u8be(self.file_size)
        self._io.write_u4be(self.len_signatures)
        for i in range(len(self.signatures)):
            pass
            self.signatures[i]._write__seq(self._io)

        self._io.write_u4be(self.len_additional_sections)
        for i in range(len(self.additional_sections)):
            pass
            self.additional_sections[i]._write__seq(self._io)



    def _check(self):
        if len(self.magic) != 4:
            raise kaitaistruct.ConsistencyError(u"magic", 4, len(self.magic))
        if not self.magic == b"\x4D\x41\x52\x31":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x41\x52\x31", self.magic, None, u"/seq/0")
        if len(self.signatures) != self.len_signatures:
            raise kaitaistruct.ConsistencyError(u"signatures", self.len_signatures, len(self.signatures))
        for i in range(len(self.signatures)):
            pass
            if self.signatures[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"signatures", self._root, self.signatures[i]._root)
            if self.signatures[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"signatures", self, self.signatures[i]._parent)

        if len(self.additional_sections) != self.len_additional_sections:
            raise kaitaistruct.ConsistencyError(u"additional_sections", self.len_additional_sections, len(self.additional_sections))
        for i in range(len(self.additional_sections)):
            pass
            if self.additional_sections[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"additional_sections", self._root, self.additional_sections[i]._root)
            if self.additional_sections[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"additional_sections", self, self.additional_sections[i]._parent)

        if self.index__enabled:
            pass
            if self._m_index._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index", self._root, self._m_index._root)
            if self._m_index._parent != self:
                raise kaitaistruct.ConsistencyError(u"index", self, self._m_index._parent)

        self._dirty = False

    class AdditionalSection(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.AdditionalSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_block = self._io.read_u4be()
            self.block_identifier = KaitaiStream.resolve_enum(MozillaMar.BlockIdentifiers, self._io.read_u4be())
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                self._raw_bytes = self._io.read_bytes((self.len_block - 4) - 4)
                _io__raw_bytes = KaitaiStream(BytesIO(self._raw_bytes))
                self.bytes = MozillaMar.ProductInformationBlock(_io__raw_bytes, self, self._root)
                self.bytes._read()
            else:
                pass
                self.bytes = self._io.read_bytes((self.len_block - 4) - 4)
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                self.bytes._fetch_instances()
            else:
                pass


        def _write__seq(self, io=None):
            super(MozillaMar.AdditionalSection, self)._write__seq(io)
            self._io.write_u4be(self.len_block)
            self._io.write_u4be(int(self.block_identifier))
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                _io__raw_bytes = KaitaiStream(BytesIO(bytearray((self.len_block - 4) - 4)))
                self._io.add_child_stream(_io__raw_bytes)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + ((self.len_block - 4) - 4))
                def handler(parent, _io__raw_bytes=_io__raw_bytes):
                    self._raw_bytes = _io__raw_bytes.to_byte_array()
                    if len(self._raw_bytes) != (self.len_block - 4) - 4:
                        raise kaitaistruct.ConsistencyError(u"raw(bytes)", (self.len_block - 4) - 4, len(self._raw_bytes))
                    parent.write_bytes(self._raw_bytes)
                _io__raw_bytes.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.bytes._write__seq(_io__raw_bytes)
            else:
                pass
                self._io.write_bytes(self.bytes)


        def _check(self):
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                if self.bytes._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"bytes", self._root, self.bytes._root)
                if self.bytes._parent != self:
                    raise kaitaistruct.ConsistencyError(u"bytes", self, self.bytes._parent)
            else:
                pass
                if len(self.bytes) != (self.len_block - 4) - 4:
                    raise kaitaistruct.ConsistencyError(u"bytes", (self.len_block - 4) - 4, len(self.bytes))
            self._dirty = False


    class IndexEntries(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.IndexEntries, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.index_entry = []
            i = 0
            while not self._io.is_eof():
                _t_index_entry = MozillaMar.IndexEntry(self._io, self, self._root)
                try:
                    _t_index_entry._read()
                finally:
                    self.index_entry.append(_t_index_entry)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.index_entry)):
                pass
                self.index_entry[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(MozillaMar.IndexEntries, self)._write__seq(io)
            for i in range(len(self.index_entry)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"index_entry", 0, self._io.size() - self._io.pos())
                self.index_entry[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"index_entry", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.index_entry)):
                pass
                if self.index_entry[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"index_entry", self._root, self.index_entry[i]._root)
                if self.index_entry[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"index_entry", self, self.index_entry[i]._parent)

            self._dirty = False


    class IndexEntry(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.IndexEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.ofs_content = self._io.read_u4be()
            self.len_content = self._io.read_u4be()
            self.flags = self._io.read_u4be()
            self.file_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(MozillaMar.IndexEntry, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u4be(self.ofs_content)
            self._io.write_u4be(self.len_content)
            self._io.write_u4be(self.flags)
            self._io.write_bytes((self.file_name).encode(u"UTF-8"))
            self._io.write_u1(0)


        def _check(self):
            if KaitaiStream.byte_array_index_of((self.file_name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"file_name", -1, KaitaiStream.byte_array_index_of((self.file_name).encode(u"UTF-8"), 0))
            if self.body__enabled:
                pass
                if len(self._m_body) != self.len_content:
                    raise kaitaistruct.ConsistencyError(u"body", self.len_content, len(self._m_body))

            self._dirty = False

        @property
        def body(self):
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_content)
            self._m_body = io.read_bytes(self.len_content)
            io.seek(_pos)
            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_content)
            io.write_bytes(self._m_body)
            io.seek(_pos)


    class MarIndex(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.MarIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len_index = self._io.read_u4be()
            self._raw_index_entries = self._io.read_bytes(self.len_index)
            _io__raw_index_entries = KaitaiStream(BytesIO(self._raw_index_entries))
            self.index_entries = MozillaMar.IndexEntries(_io__raw_index_entries, self, self._root)
            self.index_entries._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.index_entries._fetch_instances()


        def _write__seq(self, io=None):
            super(MozillaMar.MarIndex, self)._write__seq(io)
            self._io.write_u4be(self.len_index)
            _io__raw_index_entries = KaitaiStream(BytesIO(bytearray(self.len_index)))
            self._io.add_child_stream(_io__raw_index_entries)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_index))
            def handler(parent, _io__raw_index_entries=_io__raw_index_entries):
                self._raw_index_entries = _io__raw_index_entries.to_byte_array()
                if len(self._raw_index_entries) != self.len_index:
                    raise kaitaistruct.ConsistencyError(u"raw(index_entries)", self.len_index, len(self._raw_index_entries))
                parent.write_bytes(self._raw_index_entries)
            _io__raw_index_entries.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.index_entries._write__seq(_io__raw_index_entries)


        def _check(self):
            if self.index_entries._root != self._root:
                raise kaitaistruct.ConsistencyError(u"index_entries", self._root, self.index_entries._root)
            if self.index_entries._parent != self:
                raise kaitaistruct.ConsistencyError(u"index_entries", self, self.index_entries._parent)
            self._dirty = False


    class ProductInformationBlock(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.ProductInformationBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.mar_channel_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"UTF-8")
            self.product_version = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MozillaMar.ProductInformationBlock, self)._write__seq(io)
            self._io.write_bytes_limit((self.mar_channel_name).encode(u"UTF-8"), 64, 0, 0)
            self._io.write_bytes_limit((self.product_version).encode(u"UTF-8"), 32, 0, 0)


        def _check(self):
            if len((self.mar_channel_name).encode(u"UTF-8")) > 64:
                raise kaitaistruct.ConsistencyError(u"mar_channel_name", 64, len((self.mar_channel_name).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.mar_channel_name).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"mar_channel_name", -1, KaitaiStream.byte_array_index_of((self.mar_channel_name).encode(u"UTF-8"), 0))
            if len((self.product_version).encode(u"UTF-8")) > 32:
                raise kaitaistruct.ConsistencyError(u"product_version", 32, len((self.product_version).encode(u"UTF-8")))
            if KaitaiStream.byte_array_index_of((self.product_version).encode(u"UTF-8"), 0) != -1:
                raise kaitaistruct.ConsistencyError(u"product_version", -1, KaitaiStream.byte_array_index_of((self.product_version).encode(u"UTF-8"), 0))
            self._dirty = False


    class Signature(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(MozillaMar.Signature, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.algorithm = KaitaiStream.resolve_enum(MozillaMar.SignatureAlgorithms, self._io.read_u4be())
            self.len_signature = self._io.read_u4be()
            self.signature = self._io.read_bytes(self.len_signature)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(MozillaMar.Signature, self)._write__seq(io)
            self._io.write_u4be(int(self.algorithm))
            self._io.write_u4be(self.len_signature)
            self._io.write_bytes(self.signature)


        def _check(self):
            if len(self.signature) != self.len_signature:
                raise kaitaistruct.ConsistencyError(u"signature", self.len_signature, len(self.signature))
            self._dirty = False


    @property
    def index(self):
        if self._should_write_index:
            self._write_index()
        if hasattr(self, '_m_index'):
            return self._m_index

        if not self.index__enabled:
            return None

        _pos = self._io.pos()
        self._io.seek(self.ofs_index)
        self._m_index = MozillaMar.MarIndex(self._io, self, self._root)
        self._m_index._read()
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)

    @index.setter
    def index(self, v):
        self._dirty = True
        self._m_index = v

    def _write_index(self):
        self._should_write_index = False
        _pos = self._io.pos()
        self._io.seek(self.ofs_index)
        self._m_index._write__seq(self._io)
        self._io.seek(_pos)


