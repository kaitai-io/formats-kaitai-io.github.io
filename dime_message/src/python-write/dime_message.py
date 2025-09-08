# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DimeMessage(ReadWriteKaitaiStruct):
    """Direct Internet Message Encapsulation (DIME)
    is an old Microsoft specification for sending and receiving
    SOAP messages along with additional attachments,
    like binary files, XML fragments, and even other
    SOAP messages, using standard transport protocols like HTTP.
    
    Sample file: `curl -LO
    https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
    && gunzip scanner_withoptions.dump.gz`
    
    .. seealso::
       Source - https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02
    
    
    .. seealso::
       Source - https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime
    
    
    .. seealso::
       Source - http://imrannazar.com/Parsing-the-DIME-Message-Format
    """

    class TypeFormats(IntEnum):
        unchanged = 0
        media_type = 1
        absolute_uri = 2
        unknown = 3
        none = 4
    def __init__(self, _io=None, _parent=None, _root=None):
        super(DimeMessage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            _t_records = DimeMessage.Record(self._io, self, self._root)
            try:
                _t_records._read()
            finally:
                self.records.append(_t_records)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(DimeMessage, self)._write__seq(io)
        for i in range(len(self.records)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())
            self.records[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"records", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.records)):
            pass
            if self.records[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"records", self._root, self.records[i]._root)
            if self.records[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"records", self, self.records[i]._parent)

        self._dirty = False

    class OptionElement(ReadWriteKaitaiStruct):
        """one element of the option field."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DimeMessage.OptionElement, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.element_format = self._io.read_u2be()
            self.len_element = self._io.read_u2be()
            self.element_data = self._io.read_bytes(self.len_element)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DimeMessage.OptionElement, self)._write__seq(io)
            self._io.write_u2be(self.element_format)
            self._io.write_u2be(self.len_element)
            self._io.write_bytes(self.element_data)


        def _check(self):
            if len(self.element_data) != self.len_element:
                raise kaitaistruct.ConsistencyError(u"element_data", self.len_element, len(self.element_data))
            self._dirty = False


    class OptionField(ReadWriteKaitaiStruct):
        """the option field of the record."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DimeMessage.OptionField, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.option_elements = []
            i = 0
            while not self._io.is_eof():
                _t_option_elements = DimeMessage.OptionElement(self._io, self, self._root)
                try:
                    _t_option_elements._read()
                finally:
                    self.option_elements.append(_t_option_elements)
                i += 1

            self._dirty = False


        def _fetch_instances(self):
            pass
            for i in range(len(self.option_elements)):
                pass
                self.option_elements[i]._fetch_instances()



        def _write__seq(self, io=None):
            super(DimeMessage.OptionField, self)._write__seq(io)
            for i in range(len(self.option_elements)):
                pass
                if self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"option_elements", 0, self._io.size() - self._io.pos())
                self.option_elements[i]._write__seq(self._io)

            if not self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"option_elements", 0, self._io.size() - self._io.pos())


        def _check(self):
            for i in range(len(self.option_elements)):
                pass
                if self.option_elements[i]._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"option_elements", self._root, self.option_elements[i]._root)
                if self.option_elements[i]._parent != self:
                    raise kaitaistruct.ConsistencyError(u"option_elements", self, self.option_elements[i]._parent)

            self._dirty = False


    class Padding(ReadWriteKaitaiStruct):
        """padding to the next 4-byte boundary."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DimeMessage.Padding, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.boundary_padding = self._io.read_bytes(-(self._io.pos()) % 4)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(DimeMessage.Padding, self)._write__seq(io)
            if len(self.boundary_padding) != -(self._io.pos()) % 4:
                raise kaitaistruct.ConsistencyError(u"boundary_padding", -(self._io.pos()) % 4, len(self.boundary_padding))
            self._io.write_bytes(self.boundary_padding)


        def _check(self):
            self._dirty = False


    class Record(ReadWriteKaitaiStruct):
        """each individual fragment of the message."""
        def __init__(self, _io=None, _parent=None, _root=None):
            super(DimeMessage.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.version = self._io.read_bits_int_be(5)
            self.is_first_record = self._io.read_bits_int_be(1) != 0
            self.is_last_record = self._io.read_bits_int_be(1) != 0
            self.is_chunk_record = self._io.read_bits_int_be(1) != 0
            self.type_format = KaitaiStream.resolve_enum(DimeMessage.TypeFormats, self._io.read_bits_int_be(4))
            self.reserved = self._io.read_bits_int_be(4)
            self.len_options = self._io.read_u2be()
            self.len_id = self._io.read_u2be()
            self.len_type = self._io.read_u2be()
            self.len_data = self._io.read_u4be()
            self._raw_options = self._io.read_bytes(self.len_options)
            _io__raw_options = KaitaiStream(BytesIO(self._raw_options))
            self.options = DimeMessage.OptionField(_io__raw_options, self, self._root)
            self.options._read()
            self.options_padding = DimeMessage.Padding(self._io, self, self._root)
            self.options_padding._read()
            self.id = (self._io.read_bytes(self.len_id)).decode(u"ASCII")
            self.id_padding = DimeMessage.Padding(self._io, self, self._root)
            self.id_padding._read()
            self.type = (self._io.read_bytes(self.len_type)).decode(u"ASCII")
            self.type_padding = DimeMessage.Padding(self._io, self, self._root)
            self.type_padding._read()
            self.data = self._io.read_bytes(self.len_data)
            self.data_padding = DimeMessage.Padding(self._io, self, self._root)
            self.data_padding._read()
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.options._fetch_instances()
            self.options_padding._fetch_instances()
            self.id_padding._fetch_instances()
            self.type_padding._fetch_instances()
            self.data_padding._fetch_instances()


        def _write__seq(self, io=None):
            super(DimeMessage.Record, self)._write__seq(io)
            self._io.write_bits_int_be(5, self.version)
            self._io.write_bits_int_be(1, int(self.is_first_record))
            self._io.write_bits_int_be(1, int(self.is_last_record))
            self._io.write_bits_int_be(1, int(self.is_chunk_record))
            self._io.write_bits_int_be(4, int(self.type_format))
            self._io.write_bits_int_be(4, self.reserved)
            self._io.write_u2be(self.len_options)
            self._io.write_u2be(self.len_id)
            self._io.write_u2be(self.len_type)
            self._io.write_u4be(self.len_data)
            _io__raw_options = KaitaiStream(BytesIO(bytearray(self.len_options)))
            self._io.add_child_stream(_io__raw_options)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.len_options))
            def handler(parent, _io__raw_options=_io__raw_options):
                self._raw_options = _io__raw_options.to_byte_array()
                if len(self._raw_options) != self.len_options:
                    raise kaitaistruct.ConsistencyError(u"raw(options)", self.len_options, len(self._raw_options))
                parent.write_bytes(self._raw_options)
            _io__raw_options.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.options._write__seq(_io__raw_options)
            self.options_padding._write__seq(self._io)
            self._io.write_bytes((self.id).encode(u"ASCII"))
            self.id_padding._write__seq(self._io)
            self._io.write_bytes((self.type).encode(u"ASCII"))
            self.type_padding._write__seq(self._io)
            self._io.write_bytes(self.data)
            self.data_padding._write__seq(self._io)


        def _check(self):
            if self.options._root != self._root:
                raise kaitaistruct.ConsistencyError(u"options", self._root, self.options._root)
            if self.options._parent != self:
                raise kaitaistruct.ConsistencyError(u"options", self, self.options._parent)
            if self.options_padding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"options_padding", self._root, self.options_padding._root)
            if self.options_padding._parent != self:
                raise kaitaistruct.ConsistencyError(u"options_padding", self, self.options_padding._parent)
            if len((self.id).encode(u"ASCII")) != self.len_id:
                raise kaitaistruct.ConsistencyError(u"id", self.len_id, len((self.id).encode(u"ASCII")))
            if self.id_padding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"id_padding", self._root, self.id_padding._root)
            if self.id_padding._parent != self:
                raise kaitaistruct.ConsistencyError(u"id_padding", self, self.id_padding._parent)
            if len((self.type).encode(u"ASCII")) != self.len_type:
                raise kaitaistruct.ConsistencyError(u"type", self.len_type, len((self.type).encode(u"ASCII")))
            if self.type_padding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"type_padding", self._root, self.type_padding._root)
            if self.type_padding._parent != self:
                raise kaitaistruct.ConsistencyError(u"type_padding", self, self.type_padding._parent)
            if len(self.data) != self.len_data:
                raise kaitaistruct.ConsistencyError(u"data", self.len_data, len(self.data))
            if self.data_padding._root != self._root:
                raise kaitaistruct.ConsistencyError(u"data_padding", self._root, self.data_padding._root)
            if self.data_padding._parent != self:
                raise kaitaistruct.ConsistencyError(u"data_padding", self, self.data_padding._parent)
            self._dirty = False



