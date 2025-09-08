# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import some_ip_sd_options
import some_ip_sd_entries


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSd(KaitaiStruct):
    """The main tasks of the Service Discovery Protocol are communicating the
    availability of functional entities called services in the in-vehicle
    communication as well as controlling the send behavior of event messages.
    This allows sending only event messages to receivers requiring them (Publish/Subscribe).
    The solution described here is also known as SOME/IP-SD
    (Scalable service-Oriented MiddlewarE over IP - Service Discovery).
    
    .. seealso::
       Source - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(SomeIpSd, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.flags = SomeIpSd.SdFlags(self._io, self, self._root)
        self.reserved = self._io.read_bytes(3)
        self.len_entries = self._io.read_u4be()
        self._raw_entries = self._io.read_bytes(self.len_entries)
        _io__raw_entries = KaitaiStream(BytesIO(self._raw_entries))
        self.entries = some_ip_sd_entries.SomeIpSdEntries(_io__raw_entries)
        self.len_options = self._io.read_u4be()
        self._raw_options = self._io.read_bytes(self.len_options)
        _io__raw_options = KaitaiStream(BytesIO(self._raw_options))
        self.options = some_ip_sd_options.SomeIpSdOptions(_io__raw_options)


    def _fetch_instances(self):
        pass
        self.flags._fetch_instances()
        self.entries._fetch_instances()
        self.options._fetch_instances()

    class SdFlags(KaitaiStruct):
        """
        .. seealso::
           AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
        """
        def __init__(self, _io, _parent=None, _root=None):
            super(SomeIpSd.SdFlags, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.reboot = self._io.read_bits_int_be(1) != 0
            self.unicast = self._io.read_bits_int_be(1) != 0
            self.initial_data = self._io.read_bits_int_be(1) != 0
            self.reserved = self._io.read_bits_int_be(5)


        def _fetch_instances(self):
            pass



