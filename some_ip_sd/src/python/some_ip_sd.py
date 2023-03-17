# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 9):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

import some_ip_sd_entries
import some_ip_sd_options
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
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
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

    class SdFlags(KaitaiStruct):
        """
        .. seealso::
           AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - Figure 4.3
        """
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.reboot = self._io.read_bits_int_be(1) != 0
            self.unicast = self._io.read_bits_int_be(1) != 0
            self.initial_data = self._io.read_bits_int_be(1) != 0
            self.reserved = self._io.read_bits_int_be(5)



