# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class DimeMessage(KaitaiStruct):
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
    def __init__(self, _io, _parent=None, _root=None):
        super(DimeMessage, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.records = []
        i = 0
        while not self._io.is_eof():
            self.records.append(DimeMessage.Record(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.records)):
            pass
            self.records[i]._fetch_instances()


    class OptionElement(KaitaiStruct):
        """one element of the option field."""
        def __init__(self, _io, _parent=None, _root=None):
            super(DimeMessage.OptionElement, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.element_format = self._io.read_u2be()
            self.len_element = self._io.read_u2be()
            self.element_data = self._io.read_bytes(self.len_element)


        def _fetch_instances(self):
            pass


    class OptionField(KaitaiStruct):
        """the option field of the record."""
        def __init__(self, _io, _parent=None, _root=None):
            super(DimeMessage.OptionField, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.option_elements = []
            i = 0
            while not self._io.is_eof():
                self.option_elements.append(DimeMessage.OptionElement(self._io, self, self._root))
                i += 1



        def _fetch_instances(self):
            pass
            for i in range(len(self.option_elements)):
                pass
                self.option_elements[i]._fetch_instances()



    class Padding(KaitaiStruct):
        """padding to the next 4-byte boundary."""
        def __init__(self, _io, _parent=None, _root=None):
            super(DimeMessage.Padding, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.boundary_padding = self._io.read_bytes(-(self._io.pos()) % 4)


        def _fetch_instances(self):
            pass


    class Record(KaitaiStruct):
        """each individual fragment of the message."""
        def __init__(self, _io, _parent=None, _root=None):
            super(DimeMessage.Record, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

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
            self.options_padding = DimeMessage.Padding(self._io, self, self._root)
            self.id = (self._io.read_bytes(self.len_id)).decode(u"ASCII")
            self.id_padding = DimeMessage.Padding(self._io, self, self._root)
            self.type = (self._io.read_bytes(self.len_type)).decode(u"ASCII")
            self.type_padding = DimeMessage.Padding(self._io, self, self._root)
            self.data = self._io.read_bytes(self.len_data)
            self.data_padding = DimeMessage.Padding(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.options._fetch_instances()
            self.options_padding._fetch_instances()
            self.id_padding._fetch_instances()
            self.type_padding._fetch_instances()
            self.data_padding._fetch_instances()



