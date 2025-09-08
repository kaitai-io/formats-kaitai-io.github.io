# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ChromePak(KaitaiStruct):
    """Format mostly used by Google Chrome and various Android apps to store
    resources such as translated strings, help messages and images.
    
    .. seealso::
       Source - https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings
    
    
    .. seealso::
       Source - https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py
    
    
    .. seealso::
       Source - https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py
    """

    class Encodings(IntEnum):
        binary = 0
        utf8 = 1
        utf16 = 2
    def __init__(self, _io, _parent=None, _root=None):
        super(ChromePak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.version = self._io.read_u4le()
        if not  ((self.version == 4) or (self.version == 5)) :
            raise kaitaistruct.ValidationNotAnyOfError(self.version, self._io, u"/seq/0")
        if self.version == 4:
            pass
            self.num_resources_v4 = self._io.read_u4le()

        self.encoding = KaitaiStream.resolve_enum(ChromePak.Encodings, self._io.read_u1())
        if self.version == 5:
            pass
            self.v5_part = ChromePak.HeaderV5Part(self._io, self, self._root)

        self.resources = []
        for i in range(self.num_resources + 1):
            self.resources.append(ChromePak.Resource(i, i < self.num_resources, self._io, self, self._root))

        self.aliases = []
        for i in range(self.num_aliases):
            self.aliases.append(ChromePak.Alias(self._io, self, self._root))



    def _fetch_instances(self):
        pass
        if self.version == 4:
            pass

        if self.version == 5:
            pass
            self.v5_part._fetch_instances()

        for i in range(len(self.resources)):
            pass
            self.resources[i]._fetch_instances()

        for i in range(len(self.aliases)):
            pass
            self.aliases[i]._fetch_instances()


    class Alias(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ChromePak.Alias, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.resource_idx = self._io.read_u2le()
            if not self.resource_idx <= self._parent.num_resources - 1:
                raise kaitaistruct.ValidationGreaterThanError(self._parent.num_resources - 1, self.resource_idx, self._io, u"/types/alias/seq/1")


        def _fetch_instances(self):
            pass

        @property
        def resource(self):
            if hasattr(self, '_m_resource'):
                return self._m_resource

            self._m_resource = self._parent.resources[self.resource_idx]
            return getattr(self, '_m_resource', None)


    class HeaderV5Part(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(ChromePak.HeaderV5Part, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.encoding_padding = self._io.read_bytes(3)
            self.num_resources = self._io.read_u2le()
            self.num_aliases = self._io.read_u2le()


        def _fetch_instances(self):
            pass


    class Resource(KaitaiStruct):
        def __init__(self, idx, has_body, _io, _parent=None, _root=None):
            super(ChromePak.Resource, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self.has_body = has_body
            self._read()

        def _read(self):
            self.id = self._io.read_u2le()
            self.ofs_body = self._io.read_u4le()


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass


        @property
        def body(self):
            """MUST NOT be accessed until the next `resource` is parsed."""
            if hasattr(self, '_m_body'):
                return self._m_body

            if self.has_body:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._m_body = self._io.read_bytes(self.len_body)
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)

        @property
        def len_body(self):
            """MUST NOT be accessed until the next `resource` is parsed."""
            if hasattr(self, '_m_len_body'):
                return self._m_len_body

            if self.has_body:
                pass
                self._m_len_body = self._parent.resources[self.idx + 1].ofs_body - self.ofs_body

            return getattr(self, '_m_len_body', None)


    @property
    def num_aliases(self):
        if hasattr(self, '_m_num_aliases'):
            return self._m_num_aliases

        self._m_num_aliases = (self.v5_part.num_aliases if self.version == 5 else 0)
        return getattr(self, '_m_num_aliases', None)

    @property
    def num_resources(self):
        if hasattr(self, '_m_num_resources'):
            return self._m_num_resources

        self._m_num_resources = (self.v5_part.num_resources if self.version == 5 else self.num_resources_v4)
        return getattr(self, '_m_num_resources', None)


