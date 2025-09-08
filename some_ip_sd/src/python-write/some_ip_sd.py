# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import some_ip_sd_options
import some_ip_sd_entries


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSd(ReadWriteKaitaiStruct):
    """The main tasks of the Service Discovery Protocol are communicating the
    availability of functional entities called services in the in-vehicle
    communication as well as controlling the send behavior of event messages.
    This allows sending only event messages to receivers requiring them (Publish/Subscribe).
    The solution described here is also known as SOME/IP-SD
    (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
    
    .. seealso::
       Source - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SomeIpSd, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.flags = SomeIpSd.SdFlags(self._io, self, self._root)
        self.flags._read()
        self.reserved = self._io.read_bytes(3)
        self.len_entries = self._io.read_u4be()
        self._raw_entries = self._io.read_bytes(self.len_entries)
        _io__raw_entries = KaitaiStream(BytesIO(self._raw_entries))
        self.entries = some_ip_sd_entries.SomeIpSdEntries(_io__raw_entries)
        self.entries._read()
        self.len_options = self._io.read_u4be()
        self._raw_options = self._io.read_bytes(self.len_options)
        _io__raw_options = KaitaiStream(BytesIO(self._raw_options))
        self.options = some_ip_sd_options.SomeIpSdOptions(_io__raw_options)
        self.options._read()
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        self.entries._fetch_instances()
        self.options._fetch_instances()


    def _write__seq(self, io=None):
        super(SomeIpSd, self)._write__seq(io)
        self.flags._write__seq(self._io)
        self._io.write_bytes(self.reserved)
        self._io.write_u4be(self.len_entries)
        _io__raw_entries = KaitaiStream(BytesIO(bytearray(self.len_entries)))
        self._io.add_child_stream(_io__raw_entries)
        _pos2 = self._io.pos()
        self._io.seek(self._io.pos() + (self.len_entries))
        def handler(parent, _io__raw_entries=_io__raw_entries):
            self._raw_entries = _io__raw_entries.to_byte_array()
            if len(self._raw_entries) != self.len_entries:
                raise kaitaistruct.ConsistencyError(u"raw(entries)", self.len_entries, len(self._raw_entries))
            parent.write_bytes(self._raw_entries)
        _io__raw_entries.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
        self.entries._write__seq(_io__raw_entries)
        self._io.write_u4be(self.len_options)
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


    def _check(self):
        if self.flags._root != self._root:
            raise kaitaistruct.ConsistencyError(u"flags", self._root, self.flags._root)
        if self.flags._parent != self:
            raise kaitaistruct.ConsistencyError(u"flags", self, self.flags._parent)
        if len(self.reserved) != 3:
            raise kaitaistruct.ConsistencyError(u"reserved", 3, len(self.reserved))
        self._dirty = False

    class SdFlags(ReadWriteKaitaiStruct):
        """
        .. seealso::
           AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
        """
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SomeIpSd.SdFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.reboot = self._io.read_bits_int_be(1) != 0
            self.unicast = self._io.read_bits_int_be(1) != 0
            self.initial_data = self._io.read_bits_int_be(1) != 0
            self.reserved = self._io.read_bits_int_be(5)
            self._dirty = False


        def _fetch_instances(self):
            pass


        def _write__seq(self, io=None):
            super(SomeIpSd.SdFlags, self)._write__seq(io)
            self._io.write_bits_int_be(1, int(self.reboot))
            self._io.write_bits_int_be(1, int(self.unicast))
            self._io.write_bits_int_be(1, int(self.initial_data))
            self._io.write_bits_int_be(5, self.reserved)


        def _check(self):
            self._dirty = False



