# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import vlq_base128_le
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class GoogleProtobuf(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(GoogleProtobuf, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.pairs = []
        i = 0
        while not self._io.is_eof():
            self.pairs.append(GoogleProtobuf.Pair(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.pairs)):
            pass
            self.pairs[i]._fetch_instances()


    class DelimitedBytes(KaitaiStruct):
        def __init__(self, _io, _parent=None, _root=None):
            super(GoogleProtobuf.DelimitedBytes, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.len = vlq_base128_le.VlqBase128Le(self._io)
            self.body = self._io.read_bytes(self.len.value)


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


    class Pair(KaitaiStruct):
        """Key-value pair."""

        class WireTypes(IntEnum):
            varint = 0
            bit_64 = 1
            len_delimited = 2
            group_start = 3
            group_end = 4
            bit_32 = 5
        def __init__(self, _io, _parent=None, _root=None):
            super(GoogleProtobuf.Pair, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.key = vlq_base128_le.VlqBase128Le(self._io)
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
            elif _on == GoogleProtobuf.Pair.WireTypes.varint:
                pass
                self.value = vlq_base128_le.VlqBase128Le(self._io)


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

        @property
        def field_tag(self):
            """Identifies a field of protocol. One can look up symbolic
            field name in a `.proto` file by this field tag.
            """
            if hasattr(self, '_m_field_tag'):
                return self._m_field_tag

            self._m_field_tag = self.key.value >> 3
            return getattr(self, '_m_field_tag', None)

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



