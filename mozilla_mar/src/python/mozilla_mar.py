# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class MozillaMar(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(MozillaMar, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.magic = self._io.read_bytes(4)
        if not self.magic == b"\x4D\x41\x52\x31":
            raise kaitaistruct.ValidationNotEqualError(b"\x4D\x41\x52\x31", self.magic, self._io, u"/seq/0")
        self.ofs_index = self._io.read_u4be()
        self.file_size = self._io.read_u8be()
        self.len_signatures = self._io.read_u4be()
        self.signatures = []
        for i in range(self.len_signatures):
            self.signatures.append(MozillaMar.Signature(self._io, self, self._root))

        self.len_additional_sections = self._io.read_u4be()
        self.additional_sections = []
        for i in range(self.len_additional_sections):
            self.additional_sections.append(MozillaMar.AdditionalSection(self._io, self, self._root))



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


    class AdditionalSection(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.AdditionalSection, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_block = self._io.read_u4be()
            self.block_identifier = KaitaiStream.resolve_enum(MozillaMar.BlockIdentifiers, self._io.read_u4be())
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                self._raw_bytes = self._io.read_bytes((self.len_block - 4) - 4)
                _io__raw_bytes = KaitaiStream(BytesIO(self._raw_bytes))
                self.bytes = MozillaMar.ProductInformationBlock(_io__raw_bytes, self, self._root)
            else:
                pass
                self.bytes = self._io.read_bytes((self.len_block - 4) - 4)


        def _fetch_instances(self):
            pass
            _on = self.block_identifier
            if _on == MozillaMar.BlockIdentifiers.product_information:
                pass
                self.bytes._fetch_instances()
            else:
                pass


    class IndexEntries(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.IndexEntries, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.index_entry = []
            i = 0
            while not self._io.is_eof():
                self.index_entry.append(MozillaMar.IndexEntry(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.index_entry)):
                pass
                self.index_entry[i]._fetch_instances()



    class IndexEntry(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.IndexEntry, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.ofs_content = self._io.read_u4be()
            self.len_content = self._io.read_u4be()
            self.flags = self._io.read_u4be()
            self.file_name = (self._io.read_bytes_term(0, False, True, True)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass


        @property
        def body(self):
            if hasattr(self, '_m_body'):
                return self._m_body

            io = self._root._io
            _pos = io.pos()
            io.seek(self.ofs_content)
            self._m_body = io.read_bytes(self.len_content)
            io.seek(_pos)
            return getattr(self, '_m_body', None)


    class MarIndex(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.MarIndex, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len_index = self._io.read_u4be()
            self._raw_index_entries = self._io.read_bytes(self.len_index)
            _io__raw_index_entries = KaitaiStream(BytesIO(self._raw_index_entries))
            self.index_entries = MozillaMar.IndexEntries(_io__raw_index_entries, self, self._root)


        def _fetch_instances(self):
            pass
            self.index_entries._fetch_instances()


    class ProductInformationBlock(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.ProductInformationBlock, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.mar_channel_name = (KaitaiStream.bytes_terminate(self._io.read_bytes(64), 0, False)).decode(u"UTF-8")
            self.product_version = (KaitaiStream.bytes_terminate(self._io.read_bytes(32), 0, False)).decode(u"UTF-8")


        def _fetch_instances(self):
            pass


    class Signature(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(MozillaMar.Signature, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.algorithm = KaitaiStream.resolve_enum(MozillaMar.SignatureAlgorithms, self._io.read_u4be())
            self.len_signature = self._io.read_u4be()
            self.signature = self._io.read_bytes(self.len_signature)


        def _fetch_instances(self):
            pass


    @property
    def index(self):
        if hasattr(self, '_m_index'):
            return self._m_index

        _pos = self._io.pos()
        self._io.seek(self.ofs_index)
        self._m_index = MozillaMar.MarIndex(self._io, self, self._root)
        self._io.seek(_pos)
        return getattr(self, '_m_index', None)


