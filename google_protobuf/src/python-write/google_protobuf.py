# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_le
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GoogleProtobuf(ReadWriteKaitaiStruct):
    """Google Protocol Buffers (AKA protobuf) is a popular data
    serialization scheme used for communication protocols, data storage,
    etc. There are implementations are available for almost every
    popular language. The focus points of this scheme are brevity (data
    is encoded in a very size-efficient manner) and extensibility (one
    can add keys to the structure, while keeping it readable in previous
    version of software).
    
    Protobuf uses semi-self-describing encoding scheme for its
    messages. It means that it is possible to parse overall structure of
    the message (skipping over fields one can't understand), but to
    fully understand the message, one needs a protocol definition file
    (`.proto`). To be specific:
    
    * "Keys" in key-value pairs provided in the message are identified
      only with an integer "field tag". `.proto` file provides info on
      which symbolic field names these field tags map to.
    * "Keys" also provide something called "wire type". It's not a data
      type in its common sense (i.e. you can't, for example, distinguish
      `sint32` vs `uint32` vs some enum, or `string` from `bytes`), but
      it's enough information to determine how many bytes to
      parse. Interpretation of the value should be done according to the
      type specified in `.proto` file.
    * There's no direct information on which fields are optional /
      required, which fields may be repeated or constitute a map, what
      restrictions are placed on fields usage in a single message, what
      are the fields' default values, etc, etc.
    
    .. seealso::
       Source - https://protobuf.dev/programming-guides/encoding/
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(GoogleProtobuf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.pairs = []
        i = 0
        while not self._io.is_eof():
            _t_pairs = GoogleProtobuf.Pair(self._io, self, self._root)
            try:
                _t_pairs._read()
            finally:
                self.pairs.append(_t_pairs)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.pairs)):
            pass
            self.pairs[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(GoogleProtobuf, self)._write__seq(io)
        for i in range(len(self.pairs)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"pairs", 0, self._io.size() - self._io.pos())
            self.pairs[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"pairs", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.pairs)):
            pass
            if self.pairs[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"pairs", self._root, self.pairs[i]._root)
            if self.pairs[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"pairs", self, self.pairs[i]._parent)

        self._dirty = False

    class DelimitedBytes(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GoogleProtobuf.DelimitedBytes, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = vlq_base128_le.VlqBase128Le(self._io)
            self.len._read()
            self.body = self._io.read_bytes(self.len.value)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


        def _write__seq(self, io=None):
            super(GoogleProtobuf.DelimitedBytes, self)._write__seq(io)
            self.len._write__seq(self._io)
            self._io.write_bytes(self.body)


        def _check(self):
            if len(self.body) != self.len.value:
                raise kaitaistruct.ConsistencyError(u"body", self.len.value, len(self.body))
            self._dirty = False


    class Pair(ReadWriteKaitaiStruct):
        """Key-value pair."""

        class WireTypes(IntEnum):
            varint = 0
            bit_64 = 1
            len_delimited = 2
            group_start = 3
            group_end = 4
            bit_32 = 5
        def __init__(self, _io=None, _parent=None, _root=None):
            super(GoogleProtobuf.Pair, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key = vlq_base128_le.VlqBase128Le(self._io)
            self.key._read()
            _on = self.wire_type
            if _on == GoogleProtobuf.Pair.WireTypes.bit_32:
                pass
                self.value = self._io.read_u4le()
            elif _on == GoogleProtobuf.Pair.WireTypes.bit_64:
                pass
                self.value = self._io.read_u8le()
            elif _on == GoogleProtobuf.Pair.WireTypes.len_delimited:
                pass
                self.value = GoogleProtobuf.DelimitedBytes(self._io, self, self._root)
                self.value._read()
            elif _on == GoogleProtobuf.Pair.WireTypes.varint:
                pass
                self.value = vlq_base128_le.VlqBase128Le(self._io)
                self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            _on = self.wire_type
            if _on == GoogleProtobuf.Pair.WireTypes.bit_32:
                pass
            elif _on == GoogleProtobuf.Pair.WireTypes.bit_64:
                pass
            elif _on == GoogleProtobuf.Pair.WireTypes.len_delimited:
                pass
                self.value._fetch_instances()
            elif _on == GoogleProtobuf.Pair.WireTypes.varint:
                pass
                self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(GoogleProtobuf.Pair, self)._write__seq(io)
            self.key._write__seq(self._io)
            _on = self.wire_type
            if _on == GoogleProtobuf.Pair.WireTypes.bit_32:
                pass
                self._io.write_u4le(self.value)
            elif _on == GoogleProtobuf.Pair.WireTypes.bit_64:
                pass
                self._io.write_u8le(self.value)
            elif _on == GoogleProtobuf.Pair.WireTypes.len_delimited:
                pass
                self.value._write__seq(self._io)
            elif _on == GoogleProtobuf.Pair.WireTypes.varint:
                pass
                self.value._write__seq(self._io)


        def _check(self):
            _on = self.wire_type
            if _on == GoogleProtobuf.Pair.WireTypes.bit_32:
                pass
            elif _on == GoogleProtobuf.Pair.WireTypes.bit_64:
                pass
            elif _on == GoogleProtobuf.Pair.WireTypes.len_delimited:
                pass
                if self.value._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
                if self.value._parent != self:
                    raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            elif _on == GoogleProtobuf.Pair.WireTypes.varint:
                pass
            self._dirty = False

        @property
        def field_tag(self):
            """Identifies a field of protocol. One can look up symbolic
            field name in a `.proto` file by this field tag.
            """
            if hasattr(self, '_m_field_tag'):
                return self._m_field_tag

            self._m_field_tag = self.key.value >> 3
            return getattr(self, '_m_field_tag', None)

        def _invalidate_field_tag(self):
            del self._m_field_tag
        @property
        def wire_type(self):
            """"Wire type" is a part of the "key" that carries enough
            information to parse value from the wire, i.e. read correct
            amount of bytes, but there's not enough informaton to
            interprete in unambiguously. For example, one can't clearly
            distinguish 64-bit fixed-sized integers from 64-bit floats,
            signed zigzag-encoded varints from regular unsigned varints,
            arbitrary bytes from UTF-8 encoded strings, etc.
            """
            if hasattr(self, '_m_wire_type'):
                return self._m_wire_type

            self._m_wire_type = KaitaiStream.resolve_enum(GoogleProtobuf.Pair.WireTypes, self.key.value & 7)
            return getattr(self, '_m_wire_type', None)

        def _invalidate_wire_type(self):
            del self._m_wire_type


