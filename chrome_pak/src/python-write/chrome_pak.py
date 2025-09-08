# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class ChromePak(ReadWriteKaitaiStruct):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(ChromePak, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

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
            self.v5_part._read()

        self.resources = []
        for i in range(self.num_resources + 1):
            _t_resources = ChromePak.Resource(i, i < self.num_resources, self._io, self, self._root)
            try:
                _t_resources._read()
            finally:
                self.resources.append(_t_resources)

        self.aliases = []
        for i in range(self.num_aliases):
            _t_aliases = ChromePak.Alias(self._io, self, self._root)
            try:
                _t_aliases._read()
            finally:
                self.aliases.append(_t_aliases)

        self._dirty = False


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



    def _write__seq(self, io=None):
        super(ChromePak, self)._write__seq(io)
        self._io.write_u4le(self.version)
        if self.version == 4:
            pass
            self._io.write_u4le(self.num_resources_v4)

        self._io.write_u1(int(self.encoding))
        if self.version == 5:
            pass
            self.v5_part._write__seq(self._io)

        for i in range(len(self.resources)):
            pass
            self.resources[i]._write__seq(self._io)

        for i in range(len(self.aliases)):
            pass
            self.aliases[i]._write__seq(self._io)



    def _check(self):
        if not  ((self.version == 4) or (self.version == 5)) :
            raise kaitaistruct.ValidationNotAnyOfError(self.version, None, u"/seq/0")
        if self.version == 4:
            pass

        if self.version == 5:
            pass
            if self.v5_part._root != self._root:
                raise kaitaistruct.ConsistencyError(u"v5_part", self._root, self.v5_part._root)
            if self.v5_part._parent != self:
                raise kaitaistruct.ConsistencyError(u"v5_part", self, self.v5_part._parent)

        if len(self.resources) != self.num_resources + 1:
            raise kaitaistruct.ConsistencyError(u"resources", self.num_resources + 1, len(self.resources))
        for i in range(len(self.resources)):
            pass
            if self.resources[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"resources", self._root, self.resources[i]._root)
            if self.resources[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"resources", self, self.resources[i]._parent)
            if self.resources[i].idx != i:
                raise kaitaistruct.ConsistencyError(u"resources", i, self.resources[i].idx)
            if self.resources[i].has_body != (i < self.num_resources):
                raise kaitaistruct.ConsistencyError(u"resources", i < self.num_resources, self.resources[i].has_body)

        if len(self.aliases) != self.num_aliases:
            raise kaitaistruct.ConsistencyError(u"aliases", self.num_aliases, len(self.aliases))
        for i in range(len(self.aliases)):
            pass
            if self.aliases[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"aliases", self._root, self.aliases[i]._root)
            if self.aliases[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"aliases", self, self.aliases[i]._parent)

        self._dirty = False

    class Alias(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ChromePak.Alias, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.id = self._io.read_u2le()
            self.resource_idx = self._io.read_u2le()
            if not self.resource_idx <= self._parent.num_resources - 1:
                raise kaitaistruct.ValidationGreaterThanError(self._parent.num_resources - 1, self.resource_idx, self._io, u"/types/alias/seq/1")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ChromePak.Alias, self)._write__seq(io)
            self._io.write_u2le(self.id)
            self._io.write_u2le(self.resource_idx)


        def _check(self):
            if not self.resource_idx <= self._parent.num_resources - 1:
                raise kaitaistruct.ValidationGreaterThanError(self._parent.num_resources - 1, self.resource_idx, None, u"/types/alias/seq/1")
            self._dirty = False

        @property
        def resource(self):
            if hasattr(self, '_m_resource'):
                return self._m_resource

            self._m_resource = self._parent.resources[self.resource_idx]
            return getattr(self, '_m_resource', None)

        def _invalidate_resource(self):
            del self._m_resource

    class HeaderV5Part(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(ChromePak.HeaderV5Part, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.encoding_padding = self._io.read_bytes(3)
            self.num_resources = self._io.read_u2le()
            self.num_aliases = self._io.read_u2le()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(ChromePak.HeaderV5Part, self)._write__seq(io)
            self._io.write_bytes(self.encoding_padding)
            self._io.write_u2le(self.num_resources)
            self._io.write_u2le(self.num_aliases)


        def _check(self):
            if len(self.encoding_padding) != 3:
                raise kaitaistruct.ConsistencyError(u"encoding_padding", 3, len(self.encoding_padding))
            self._dirty = False


    class Resource(ReadWriteKaitaiStruct):
        def __init__(self, idx, has_body, _io=None, _parent=None, _root=None):
            super(ChromePak.Resource, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self.idx = idx
            self.has_body = has_body
            self._should_write_body = False
            self.body__enabled = True

        def _read(self):
            self.id = self._io.read_u2le()
            self.ofs_body = self._io.read_u4le()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _ = self.body
            if hasattr(self, '_m_body'):
                pass



        def _write__seq(self, io=None):
            super(ChromePak.Resource, self)._write__seq(io)
            self._should_write_body = self.body__enabled
            self._io.write_u2le(self.id)
            self._io.write_u4le(self.ofs_body)


        def _check(self):
            if self.body__enabled:
                pass
                if self.has_body:
                    pass
                    if len(self._m_body) != self.len_body:
                        raise kaitaistruct.ConsistencyError(u"body", self.len_body, len(self._m_body))


            self._dirty = False

        @property
        def body(self):
            """MUST NOT be accessed until the next `resource` is parsed."""
            if self._should_write_body:
                self._write_body()
            if hasattr(self, '_m_body'):
                return self._m_body

            if not self.body__enabled:
                return None

            if self.has_body:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._m_body = self._io.read_bytes(self.len_body)
                self._io.seek(_pos)

            return getattr(self, '_m_body', None)

        @body.setter
        def body(self, v):
            self._dirty = True
            self._m_body = v

        def _write_body(self):
            self._should_write_body = False
            if self.has_body:
                pass
                _pos = self._io.pos()
                self._io.seek(self.ofs_body)
                self._io.write_bytes(self._m_body)
                self._io.seek(_pos)


        @property
        def len_body(self):
            """MUST NOT be accessed until the next `resource` is parsed."""
            if hasattr(self, '_m_len_body'):
                return self._m_len_body

            if self.has_body:
                pass
                self._m_len_body = self._parent.resources[self.idx + 1].ofs_body - self.ofs_body

            return getattr(self, '_m_len_body', None)

        def _invalidate_len_body(self):
            del self._m_len_body

    @property
    def num_aliases(self):
        if hasattr(self, '_m_num_aliases'):
            return self._m_num_aliases

        self._m_num_aliases = (self.v5_part.num_aliases if self.version == 5 else 0)
        return getattr(self, '_m_num_aliases', None)

    def _invalidate_num_aliases(self):
        del self._m_num_aliases
    @property
    def num_resources(self):
        if hasattr(self, '_m_num_resources'):
            return self._m_num_resources

        self._m_num_resources = (self.v5_part.num_resources if self.version == 5 else self.num_resources_v4)
        return getattr(self, '_m_num_resources', None)

    def _invalidate_num_resources(self):
        del self._m_num_resources

