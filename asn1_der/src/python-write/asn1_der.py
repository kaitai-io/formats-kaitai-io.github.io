# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class Asn1Der(ReadWriteKaitaiStruct):
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
    
    * <https://www.cs.auckland.ac.nz/~pgut001/dumpasn1.cfg>
    * <http://oid-info.com/>
    * <https://www.alvestrand.no/objectid/top.html>
    
    .. seealso::
       Source - https://www.itu.int/itu-t/recommendations/rec.aspx?rec=12483&lang=en
    """

    class TypeTag(IntEnum):
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
    def __init__(self, _io=None, _parent=None, _root=None):
        super(Asn1Der, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.type_tag = KaitaiStream.resolve_enum(Asn1Der.TypeTag, self._io.read_u1())
        self.len = Asn1Der.LenEncoded(self._io, self, self._root)
        self.len._read()
        _on = self.type_tag
        if _on == Asn1Der.TypeTag.object_id:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodyObjectId(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == Asn1Der.TypeTag.printable_string:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodyPrintableString(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == Asn1Der.TypeTag.sequence_10:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodySequence(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == Asn1Der.TypeTag.sequence_30:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodySequence(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == Asn1Der.TypeTag.set:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodySequence(_io__raw_body, self, self._root)
            self.body._read()
        elif _on == Asn1Der.TypeTag.utf8string:
            pass
            self._raw_body = self._io.read_bytes(self.len.result)
            _io__raw_body = KaitaiStream(BytesIO(self._raw_body))
            self.body = Asn1Der.BodyUtf8string(_io__raw_body, self, self._root)
            self.body._read()
        else:
            pass
            self.body = self._io.read_bytes(self.len.result)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.len._fetch_instances()
        _on = self.type_tag
        if _on == Asn1Der.TypeTag.object_id:
            pass
            self.body._fetch_instances()
        elif _on == Asn1Der.TypeTag.printable_string:
            pass
            self.body._fetch_instances()
        elif _on == Asn1Der.TypeTag.sequence_10:
            pass
            self.body._fetch_instances()
        elif _on == Asn1Der.TypeTag.sequence_30:
            pass
            self.body._fetch_instances()
        elif _on == Asn1Der.TypeTag.set:
            pass
            self.body._fetch_instances()
        elif _on == Asn1Der.TypeTag.utf8string:
            pass
            self.body._fetch_instances()
        else:
            pass


    def _write__seq(self, io=None):
        super(Asn1Der, self)._write__seq(io)
        self._io.write_u1(int(self.type_tag))
        self.len._write__seq(self._io)
        _on = self.type_tag
        if _on == Asn1Der.TypeTag.object_id:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == Asn1Der.TypeTag.printable_string:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == Asn1Der.TypeTag.sequence_10:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == Asn1Der.TypeTag.sequence_30:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == Asn1Der.TypeTag.set:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        elif _on == Asn1Der.TypeTag.utf8string:
            pass
            _io__raw_body = KaitaiStream(BytesIO(bytearray(self.len.result)))
            self._io.add_child_stream(_io__raw_body)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len.result))
            def handler(parent, _io__raw_body=_io__raw_body):
                self._raw_body = _io__raw_body.to_byte_array()
                if len(self._raw_body) != self.len.result:
                    raise kaitaistruct.ConsistencyError(u"raw(body)", self.len.result, len(self._raw_body))
                parent.write_bytes(self._raw_body)
            _io__raw_body.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.body._write__seq(_io__raw_body)
        else:
            pass
            self._io.write_bytes(self.body)


    def _check(self):
        if self.len._root != self._root:
            raise kaitaistruct.ConsistencyError(u"len", self._root, self.len._root)
        if self.len._parent != self:
            raise kaitaistruct.ConsistencyError(u"len", self, self.len._parent)
        _on = self.type_tag
        if _on == Asn1Der.TypeTag.object_id:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == Asn1Der.TypeTag.printable_string:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == Asn1Der.TypeTag.sequence_10:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == Asn1Der.TypeTag.sequence_30:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == Asn1Der.TypeTag.set:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        elif _on == Asn1Der.TypeTag.utf8string:
            pass
            if self.body._root != self._root:
                raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
            if self.body._parent != self:
                raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
        else:
            pass
            if len(self.body) != self.len.result:
                raise kaitaistruct.ConsistencyError(u"body", self.len.result, len(self.body))
        self._dirty = False

    class BodyObjectId(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://learn.microsoft.com/en-us/windows/win32/seccertenroll/about-object-identifier
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Asn1Der.BodyObjectId, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.first_and_second = self._io.read_u1()
            self.rest = self._io.read_bytes_full()
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Asn1Der.BodyObjectId, self)._write__seq(io)
            self._io.write_u1(self.first_and_second)
            self._io.write_bytes(self.rest)
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"rest", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False

        @property
        def first(self):
            if hasattr(self, '_m_first'):
                return self._m_first

            self._m_first = self.first_and_second // 40
            return getattr(self, '_m_first', None)

        def _invalidate_first(self):
            del self._m_first
        @property
        def second(self):
            if hasattr(self, '_m_second'):
                return self._m_second

            self._m_second = self.first_and_second % 40
            return getattr(self, '_m_second', None)

        def _invalidate_second(self):
            del self._m_second

    class BodyPrintableString(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Asn1Der.BodyPrintableString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str = (self._io.read_bytes_full()).decode(u"ASCII")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Asn1Der.BodyPrintableString, self)._write__seq(io)
            self._io.write_bytes((self.str).encode(u"ASCII"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"str", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class BodySequence(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Asn1Der.BodySequence, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.entries = []
            i = 0
            while not self._io.is_eof():
                _t_entries = Asn1Der(self._io, self, self._root)
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
            super(Asn1Der.BodySequence, self)._write__seq(io)
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


    class BodyUtf8string(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Asn1Der.BodyUtf8string, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.str = (self._io.read_bytes_full()).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(Asn1Der.BodyUtf8string, self)._write__seq(io)
            self._io.write_bytes((self.str).encode(u"UTF-8"))
            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"str", 0, self._io.size() - self._io.pos())


        def _check(self):
            self._dirty = False


    class LenEncoded(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(Asn1Der.LenEncoded, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.b1 = self._io.read_u1()
            if self.b1 == 130:
                pass
                self.int2 = self._io.read_u2be()

            if self.b1 == 129:
                pass
                self.int1 = self._io.read_u1()

            self._dirty = False


        def _fetch_instances(self):
            pass
            if self.b1 == 130:
                pass

            if self.b1 == 129:
                pass



        def _write__seq(self, io=None):
            super(Asn1Der.LenEncoded, self)._write__seq(io)
            self._io.write_u1(self.b1)
            if self.b1 == 130:
                pass
                self._io.write_u2be(self.int2)

            if self.b1 == 129:
                pass
                self._io.write_u1(self.int1)



        def _check(self):
            if self.b1 == 130:
                pass

            if self.b1 == 129:
                pass

            self._dirty = False

        @property
        def result(self):
            if hasattr(self, '_m_result'):
                return self._m_result

            self._m_result = (self.int1 if self.b1 == 129 else (self.int2 if self.b1 == 130 else self.b1))
            return getattr(self, '_m_result', None)

        def _invalidate_result(self):
            del self._m_result


