# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Asn1Der(KaitaiStruct):

    class TypeTag(Enum):
        end_of_content = 0
        boolean = 1
        integer = 2
        bit_string = 3
        octet_string = 4
        null_value = 5
        object_id = 6
        object_descriptor = 7
        external = 8
        real = 9
        enumerated = 10
        embedded_pdv = 11
        utf8string = 12
        relative_oid = 13
        sequence_10 = 16
        printable_string = 19
        ia5string = 22
        sequence_30 = 48
        set = 49
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.type_tag = self._root.TypeTag(self._io.read_u1())
        self.len = self._root.LenEncoded(self._io, self, self._root)
        _on = self.type_tag
        if _on == self._root.TypeTag.sequence_30:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodySequence(io, self, self._root)
        elif _on == self._root.TypeTag.sequence_10:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodySequence(io, self, self._root)
        elif _on == self._root.TypeTag.utf8string:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodyUtf8string(io, self, self._root)
        elif _on == self._root.TypeTag.printable_string:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodyPrintableString(io, self, self._root)
        elif _on == self._root.TypeTag.set:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodySequence(io, self, self._root)
        else:
            self.body = self._io.read_bytes(self.len.result)

    class LenEncoded(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.b1 = self._io.read_u1()
            if self.b1 == 130:
                self.int2 = self._io.read_u2be()


        @property
        def result(self):
            if hasattr(self, '_m_result'):
                return self._m_result

            self._m_result = (self.b1 if (self.b1 & 128) == 0 else self.int2)
            return self._m_result


    class BodySequence(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                self.entries.append(Asn1Der(self._io))
                i += 1



    class BodyUtf8string(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.str = (self._io.read_bytes_full()).decode(u"UTF-8")


    class BodyPrintableString(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.str = (self._io.read_bytes_full()).decode(u"ASCII")



