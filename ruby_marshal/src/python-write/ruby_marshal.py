# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class RubyMarshal(ReadWriteKaitaiStruct):
    """Ruby's Marshal module allows serialization and deserialization of
    many standard and arbitrary Ruby objects in a compact binary
    format. It is relatively fast, available in stdlibs standard and
    allows conservation of language-specific properties (such as symbols
    or encoding-aware strings).
    
    Feature-wise, it is comparable to other language-specific
    implementations, such as:
    
    * Java's
      [Serializable](https://docs.oracle.com/javase/8/docs/api/java/io/Serializable.html)
    * .NET
      [BinaryFormatter](https://learn.microsoft.com/en-us/dotnet/api/system.runtime.serialization.formatters.binary.binaryformatter?view=net-7.0)
    * Python's
      [marshal](https://docs.python.org/3/library/marshal.html),
      [pickle](https://docs.python.org/3/library/pickle.html) and
      [shelve](https://docs.python.org/3/library/shelve.html)
    
    From internal perspective, serialized stream consists of a simple
    magic header and a record.
    
    .. seealso::
       Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Stream+Format
    """

    class Codes(IntEnum):
        ruby_string = 34
        const_nil = 48
        ruby_symbol = 58
        ruby_symbol_link = 59
        ruby_object_link = 64
        const_false = 70
        instance_var = 73
        ruby_struct = 83
        const_true = 84
        ruby_array = 91
        packed_int = 105
        bignum = 108
        ruby_hash = 123
    def __init__(self, _io=None, _parent=None, _root=None):
        super(RubyMarshal, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.version = self._io.read_bytes(2)
        if not self.version == b"\x04\x08":
            raise kaitaistruct.ValidationNotEqualError(b"\x04\x08", self.version, self._io, u"/seq/0")
        self.records = RubyMarshal.Record(self._io, self, self._root)
        self.records._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.records._fetch_instances()


    def _write__seq(self, io=None):
        super(RubyMarshal, self)._write__seq(io)
        self._io.write_bytes(self.version)
        self.records._write__seq(self._io)


    def _check(self):
        if len(self.version) != 2:
            raise kaitaistruct.ConsistencyError(u"version", 2, len(self.version))
        if not self.version == b"\x04\x08":
            raise kaitaistruct.ValidationNotEqualError(b"\x04\x08", self.version, None, u"/seq/0")
        if self.records._root != self._root:
            raise kaitaistruct.ConsistencyError(u"records", self._root, self.records._root)
        if self.records._parent != self:
            raise kaitaistruct.ConsistencyError(u"records", self, self.records._parent)
        self._dirty = False

    class Bignum(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Bignum
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.Bignum, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.sign = self._io.read_u1()
            self.len_div_2 = RubyMarshal.PackedInt(self._io, self, self._root)
            self.len_div_2._read()
            self.body = self._io.read_bytes(self.len_div_2.value * 2)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len_div_2._fetch_instances()


        def _write__seq(self, io=None):
            super(RubyMarshal.Bignum, self)._write__seq(io)
            self._io.write_u1(self.sign)
            self.len_div_2._write__seq(self._io)
            self._io.write_bytes(self.body)


        def _check(self):
            if self.len_div_2._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len_div_2", self._root, self.len_div_2._root)
            if self.len_div_2._parent != self:
                raise kaitaistruct.ConsistencyError(u"len_div_2", self, self.len_div_2._parent)
            if len(self.body) != self.len_div_2.value * 2:
                raise kaitaistruct.ConsistencyError(u"body", self.len_div_2.value * 2, len(self.body))
            self._dirty = False


    class InstanceVar(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Instance+Variables
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.InstanceVar, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.obj = RubyMarshal.Record(self._io, self, self._root)
            self.obj._read()
            self.num_vars = RubyMarshal.PackedInt(self._io, self, self._root)
            self.num_vars._read()
            self.vars = []
            for i in range(self.num_vars.value):
                _t_vars = RubyMarshal.Pair(self._io, self, self._root)
                try:
                    _t_vars._read()
                finally:
                    self.vars.append(_t_vars)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.obj._fetch_instances()
            self.num_vars._fetch_instances()
            for i in range(len(self.vars)):
                pass
                self.vars[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RubyMarshal.InstanceVar, self)._write__seq(io)
            self.obj._write__seq(self._io)
            self.num_vars._write__seq(self._io)
            for i in range(len(self.vars)):
                pass
                self.vars[i]._write__seq(self._io)



        def _check(self):
            if self.obj._root != self._root:
                raise kaitaistruct.ConsistencyError(u"obj", self._root, self.obj._root)
            if self.obj._parent != self:
                raise kaitaistruct.ConsistencyError(u"obj", self, self.obj._parent)
            if self.num_vars._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_vars", self._root, self.num_vars._root)
            if self.num_vars._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_vars", self, self.num_vars._parent)
            if len(self.vars) != self.num_vars.value:
                raise kaitaistruct.ConsistencyError(u"vars", self.num_vars.value, len(self.vars))
            for i in range(len(self.vars)):
                pass
                if self.vars[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"vars", self._root, self.vars[i]._root)
                if self.vars[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"vars", self, self.vars[i]._parent)

            self._dirty = False


    class PackedInt(ReadWriteKaitaiStruct):
        """Ruby uses sophisticated system to pack integers: first `code`
        byte either determines packing scheme or carries encoded
        immediate value (thus allowing smaller values from -123 to 122
        (inclusive) to take only one byte. There are 11 encoding schemes
        in total:
        
        * 0 is encoded specially (as 0)
        * 1..122 are encoded as immediate value with a shift
        * 123..255 are encoded with code of 0x01 and 1 extra byte
        * 0x100..0xffff are encoded with code of 0x02 and 2 extra bytes
        * 0x10000..0xffffff are encoded with code of 0x03 and 3 extra
          bytes
        * 0x1000000..0xffffffff are encoded with code of 0x04 and 4
          extra bytes
        * -123..-1 are encoded as immediate value with another shift
        * -256..-124 are encoded with code of 0xff and 1 extra byte
        * -0x10000..-257 are encoded with code of 0xfe and 2 extra bytes
        * -0x1000000..0x10001 are encoded with code of 0xfd and 3 extra
           bytes
        * -0x40000000..-0x1000001 are encoded with code of 0xfc and 4
           extra bytes
        
        Values beyond that are serialized as bignum (even if they
        technically might be not Bignum class in Ruby implementation,
        i.e. if they fit into 64 bits on a 64-bit platform).
        
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Fixnum+and+long
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.PackedInt, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = self._io.read_u1()
            _on = self.code
            if _on == 1:
                pass
                self.encoded = self._io.read_u1()
            elif _on == 2:
                pass
                self.encoded = self._io.read_u2le()
            elif _on == 252:
                pass
                self.encoded = self._io.read_u4le()
            elif _on == 253:
                pass
                self.encoded = self._io.read_u2le()
            elif _on == 254:
                pass
                self.encoded = self._io.read_u2le()
            elif _on == 255:
                pass
                self.encoded = self._io.read_u1()
            elif _on == 3:
                pass
                self.encoded = self._io.read_u2le()
            elif _on == 4:
                pass
                self.encoded = self._io.read_u4le()
            _on = self.code
            if _on == 253:
                pass
                self.encoded2 = self._io.read_u1()
            elif _on == 3:
                pass
                self.encoded2 = self._io.read_u1()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == 1:
                pass
            elif _on == 2:
                pass
            elif _on == 252:
                pass
            elif _on == 253:
                pass
            elif _on == 254:
                pass
            elif _on == 255:
                pass
            elif _on == 3:
                pass
            elif _on == 4:
                pass
            _on = self.code
            if _on == 253:
                pass
            elif _on == 3:
                pass


        def _write__seq(self, io=None):
            super(RubyMarshal.PackedInt, self)._write__seq(io)
            self._io.write_u1(self.code)
            _on = self.code
            if _on == 1:
                pass
                self._io.write_u1(self.encoded)
            elif _on == 2:
                pass
                self._io.write_u2le(self.encoded)
            elif _on == 252:
                pass
                self._io.write_u4le(self.encoded)
            elif _on == 253:
                pass
                self._io.write_u2le(self.encoded)
            elif _on == 254:
                pass
                self._io.write_u2le(self.encoded)
            elif _on == 255:
                pass
                self._io.write_u1(self.encoded)
            elif _on == 3:
                pass
                self._io.write_u2le(self.encoded)
            elif _on == 4:
                pass
                self._io.write_u4le(self.encoded)
            _on = self.code
            if _on == 253:
                pass
                self._io.write_u1(self.encoded2)
            elif _on == 3:
                pass
                self._io.write_u1(self.encoded2)


        def _check(self):
            _on = self.code
            if _on == 1:
                pass
            elif _on == 2:
                pass
            elif _on == 252:
                pass
            elif _on == 253:
                pass
            elif _on == 254:
                pass
            elif _on == 255:
                pass
            elif _on == 3:
                pass
            elif _on == 4:
                pass
            _on = self.code
            if _on == 253:
                pass
            elif _on == 3:
                pass
            self._dirty = False

        @property
        def is_immediate(self):
            if hasattr(self, '_m_is_immediate'):
                return self._m_is_immediate

            self._m_is_immediate =  ((self.code > 4) and (self.code < 252)) 
            return getattr(self, '_m_is_immediate', None)

        def _invalidate_is_immediate(self):
            del self._m_is_immediate
        @property
        def value(self):
            if hasattr(self, '_m_value'):
                return self._m_value

            self._m_value = ((self.code - 5 if self.code < 128 else 4 - (~(self.code) & 127)) if self.is_immediate else (0 if self.code == 0 else (self.encoded - 256 if self.code == 255 else (self.encoded - 65536 if self.code == 254 else ((self.encoded2 << 16 | self.encoded) - 16777216 if self.code == 253 else (self.encoded2 << 16 | self.encoded if self.code == 3 else self.encoded))))))
            return getattr(self, '_m_value', None)

        def _invalidate_value(self):
            del self._m_value

    class Pair(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.Pair, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.key = RubyMarshal.Record(self._io, self, self._root)
            self.key._read()
            self.value = RubyMarshal.Record(self._io, self, self._root)
            self.value._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.key._fetch_instances()
            self.value._fetch_instances()


        def _write__seq(self, io=None):
            super(RubyMarshal.Pair, self)._write__seq(io)
            self.key._write__seq(self._io)
            self.value._write__seq(self._io)


        def _check(self):
            if self.key._root != self._root:
                raise kaitaistruct.ConsistencyError(u"key", self._root, self.key._root)
            if self.key._parent != self:
                raise kaitaistruct.ConsistencyError(u"key", self, self.key._parent)
            if self.value._root != self._root:
                raise kaitaistruct.ConsistencyError(u"value", self._root, self.value._root)
            if self.value._parent != self:
                raise kaitaistruct.ConsistencyError(u"value", self, self.value._parent)
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        """Each record starts with a single byte that determines its type
        (`code`) and contents. If necessary, additional info as parsed
        as `body`, to be determined by `code`.
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.code = KaitaiStream.resolve_enum(RubyMarshal.Codes, self._io.read_u1())
            _on = self.code
            if _on == RubyMarshal.Codes.bignum:
                pass
                self.body = RubyMarshal.Bignum(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.instance_var:
                pass
                self.body = RubyMarshal.InstanceVar(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.packed_int:
                pass
                self.body = RubyMarshal.PackedInt(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_array:
                pass
                self.body = RubyMarshal.RubyArray(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_hash:
                pass
                self.body = RubyMarshal.RubyHash(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_object_link:
                pass
                self.body = RubyMarshal.PackedInt(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_string:
                pass
                self.body = RubyMarshal.RubyString(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_struct:
                pass
                self.body = RubyMarshal.RubyStruct(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_symbol:
                pass
                self.body = RubyMarshal.RubySymbol(self._io, self, self._root)
                self.body._read()
            elif _on == RubyMarshal.Codes.ruby_symbol_link:
                pass
                self.body = RubyMarshal.PackedInt(self._io, self, self._root)
                self.body._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            _on = self.code
            if _on == RubyMarshal.Codes.bignum:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.instance_var:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.packed_int:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_array:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_hash:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_object_link:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_string:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_struct:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_symbol:
                pass
                self.body._fetch_instances()
            elif _on == RubyMarshal.Codes.ruby_symbol_link:
                pass
                self.body._fetch_instances()


        def _write__seq(self, io=None):
            super(RubyMarshal.Record, self)._write__seq(io)
            self._io.write_u1(int(self.code))
            _on = self.code
            if _on == RubyMarshal.Codes.bignum:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.instance_var:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.packed_int:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_array:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_hash:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_object_link:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_string:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_struct:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_symbol:
                pass
                self.body._write__seq(self._io)
            elif _on == RubyMarshal.Codes.ruby_symbol_link:
                pass
                self.body._write__seq(self._io)


        def _check(self):
            _on = self.code
            if _on == RubyMarshal.Codes.bignum:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.instance_var:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.packed_int:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_array:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_hash:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_object_link:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_string:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_struct:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_symbol:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            elif _on == RubyMarshal.Codes.ruby_symbol_link:
                pass
                if self.body._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"body", self._root, self.body._root)
                if self.body._parent != self:
                    raise kaitaistruct.ConsistencyError(u"body", self, self.body._parent)
            self._dirty = False


    class RubyArray(ReadWriteKaitaiStruct):
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.RubyArray, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_elements = RubyMarshal.PackedInt(self._io, self, self._root)
            self.num_elements._read()
            self.elements = []
            for i in range(self.num_elements.value):
                _t_elements = RubyMarshal.Record(self._io, self, self._root)
                try:
                    _t_elements._read()
                finally:
                    self.elements.append(_t_elements)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.num_elements._fetch_instances()
            for i in range(len(self.elements)):
                pass
                self.elements[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RubyMarshal.RubyArray, self)._write__seq(io)
            self.num_elements._write__seq(self._io)
            for i in range(len(self.elements)):
                pass
                self.elements[i]._write__seq(self._io)



        def _check(self):
            if self.num_elements._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_elements", self._root, self.num_elements._root)
            if self.num_elements._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_elements", self, self.num_elements._parent)
            if len(self.elements) != self.num_elements.value:
                raise kaitaistruct.ConsistencyError(u"elements", self.num_elements.value, len(self.elements))
            for i in range(len(self.elements)):
                pass
                if self.elements[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"elements", self._root, self.elements[i]._root)
                if self.elements[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"elements", self, self.elements[i]._parent)

            self._dirty = False


    class RubyHash(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Hash+and+Hash+with+Default+Value
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.RubyHash, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.num_pairs = RubyMarshal.PackedInt(self._io, self, self._root)
            self.num_pairs._read()
            self.pairs = []
            for i in range(self.num_pairs.value):
                _t_pairs = RubyMarshal.Pair(self._io, self, self._root)
                try:
                    _t_pairs._read()
                finally:
                    self.pairs.append(_t_pairs)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.num_pairs._fetch_instances()
            for i in range(len(self.pairs)):
                pass
                self.pairs[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RubyMarshal.RubyHash, self)._write__seq(io)
            self.num_pairs._write__seq(self._io)
            for i in range(len(self.pairs)):
                pass
                self.pairs[i]._write__seq(self._io)



        def _check(self):
            if self.num_pairs._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_pairs", self._root, self.num_pairs._root)
            if self.num_pairs._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_pairs", self, self.num_pairs._parent)
            if len(self.pairs) != self.num_pairs.value:
                raise kaitaistruct.ConsistencyError(u"pairs", self.num_pairs.value, len(self.pairs))
            for i in range(len(self.pairs)):
                pass
                if self.pairs[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"pairs", self._root, self.pairs[i]._root)
                if self.pairs[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"pairs", self, self.pairs[i]._parent)

            self._dirty = False


    class RubyString(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-String
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.RubyString, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = RubyMarshal.PackedInt(self._io, self, self._root)
            self.len._read()
            self.body = self._io.read_bytes(self.len.value)
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


        def _write__seq(self, io=None):
            super(RubyMarshal.RubyString, self)._write__seq(io)
            self.len._write__seq(self._io)
            self._io.write_bytes(self.body)


        def _check(self):
            if self.len._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len", self._root, self.len._root)
            if self.len._parent != self:
                raise kaitaistruct.ConsistencyError(u"len", self, self.len._parent)
            if len(self.body) != self.len.value:
                raise kaitaistruct.ConsistencyError(u"body", self.len.value, len(self.body))
            self._dirty = False


    class RubyStruct(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Struct
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.RubyStruct, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.name = RubyMarshal.Record(self._io, self, self._root)
            self.name._read()
            self.num_members = RubyMarshal.PackedInt(self._io, self, self._root)
            self.num_members._read()
            self.members = []
            for i in range(self.num_members.value):
                _t_members = RubyMarshal.Pair(self._io, self, self._root)
                try:
                    _t_members._read()
                finally:
                    self.members.append(_t_members)

            self._dirty = False


        def _fetch_instances(self):
            pass
            self.name._fetch_instances()
            self.num_members._fetch_instances()
            for i in range(len(self.members)):
                pass
                self.members[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(RubyMarshal.RubyStruct, self)._write__seq(io)
            self.name._write__seq(self._io)
            self.num_members._write__seq(self._io)
            for i in range(len(self.members)):
                pass
                self.members[i]._write__seq(self._io)



        def _check(self):
            if self.name._root != self._root:
                raise kaitaistruct.ConsistencyError(u"name", self._root, self.name._root)
            if self.name._parent != self:
                raise kaitaistruct.ConsistencyError(u"name", self, self.name._parent)
            if self.num_members._root != self._root:
                raise kaitaistruct.ConsistencyError(u"num_members", self._root, self.num_members._root)
            if self.num_members._parent != self:
                raise kaitaistruct.ConsistencyError(u"num_members", self, self.num_members._parent)
            if len(self.members) != self.num_members.value:
                raise kaitaistruct.ConsistencyError(u"members", self.num_members.value, len(self.members))
            for i in range(len(self.members)):
                pass
                if self.members[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"members", self._root, self.members[i]._root)
                if self.members[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"members", self, self.members[i]._parent)

            self._dirty = False


    class RubySymbol(ReadWriteKaitaiStruct):
        """
        .. seealso::
           Source - https://docs.ruby-lang.org/en/2.4.0/marshal_rdoc.html#label-Symbols+and+Byte+Sequence
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(RubyMarshal.RubySymbol, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.len = RubyMarshal.PackedInt(self._io, self, self._root)
            self.len._read()
            self.name = (self._io.read_bytes(self.len.value)).decode(u"UTF-8")
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.len._fetch_instances()


        def _write__seq(self, io=None):
            super(RubyMarshal.RubySymbol, self)._write__seq(io)
            self.len._write__seq(self._io)
            self._io.write_bytes((self.name).encode(u"UTF-8"))


        def _check(self):
            if self.len._root != self._root:
                raise kaitaistruct.ConsistencyError(u"len", self._root, self.len._root)
            if self.len._parent != self:
                raise kaitaistruct.ConsistencyError(u"len", self, self.len._parent)
            if len((self.name).encode(u"UTF-8")) != self.len.value:
                raise kaitaistruct.ConsistencyError(u"name", self.len.value, len((self.name).encode(u"UTF-8")))
            self._dirty = False



