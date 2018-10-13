# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
from kaitaistruct import __version__ as ks_version, KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(ks_version) < parse_version('0.7'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.7 or later is required, but you have %s" % (ks_version))

class Asn1Der(KaitaiStruct):
    """ASN.1 (Abstract Syntax Notation One) DER (Distinguished Encoding
    Rules) is a standard-backed serialization scheme used in many
    different use-cases. Particularly popular usage scenarios are X.509
    certificates and some telecommunication / networking protocols.
    
    DER is self-describing encoding scheme which allows representation
    of simple, atomic data elements, such as strings and numbers, and
    complex objects, such as sequences of other elements.
    
    DER is a subset of BER (Basic Encoding Rules), with an emphasis on
    being non-ambiguous: there's always exactly one canonical way to
    encode a data structure defined in terms of ASN.1 using DER.
    
    This spec allows full parsing of format syntax, but to understand
    the semantics, one would typically require a dictionary of Object
    Identifiers (OIDs), to match OID bodies against some human-readable
    list of constants. OIDs are covered by many different standards,
    so typically it's simpler to use a pre-compiled list of them, such
    as:
    
    * https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg
    * http://oid-info.com/
    * https://www.alvestrand.no/objectid/top.html
    
    .. seealso::
       Source - https://www.itu.int/rec/T-REC-X.690-201508-I/en
    """

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
        elif _on == self._root.TypeTag.object_id:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodyObjectId(io, self, self._root)
        elif _on == self._root.TypeTag.set:
            self._raw_body = self._io.read_bytes(self.len.result)
            io = KaitaiStream(BytesIO(self._raw_body))
            self.body = self._root.BodySequence(io, self, self._root)
        else:
            self.body = self._io.read_bytes(self.len.result)

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


    class BodyObjectId(KaitaiStruct):
        """
        .. seealso::
           Source - https://docs.microsoft.com/en-us/windows/desktop/SecCertEnroll/about-object-identifier
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.first_and_second = self._io.read_u1()
            self.rest = self._io.read_bytes_full()

        @property
        def first(self):
            if hasattr(self, '_m_first'):
                return self._m_first if hasattr(self, '_m_first') else None

            self._m_first = self.first_and_second // 40
            return self._m_first if hasattr(self, '_m_first') else None

        @property
        def second(self):
            if hasattr(self, '_m_second'):
                return self._m_second if hasattr(self, '_m_second') else None

            self._m_second = (self.first_and_second % 40)
            return self._m_second if hasattr(self, '_m_second') else None


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
                return self._m_result if hasattr(self, '_m_result') else None

            self._m_result = (self.b1 if (self.b1 & 128) == 0 else self.int2)
            return self._m_result if hasattr(self, '_m_result') else None


    class BodyPrintableString(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.str = (self._io.read_bytes_full()).decode(u"ASCII")



