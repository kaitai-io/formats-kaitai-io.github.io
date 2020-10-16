# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

from pkg_resources import parse_version
import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import Enum


if parse_version(kaitaistruct.__version__) < parse_version('0.9'):
    raise Exception("Incompatible Kaitai Struct Python API: 0.9 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSdOptions(KaitaiStruct):
    """FormatOptions are used to transport additional information to the entries. 
    This includes forinstance the information how a service instance is 
    reachable (IP-Address, TransportProtocol, Port Number).
    
    .. seealso::
       section 4.1.2.4 Options Format - https://www.autosar.org/fileadmin/user_upload/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
       -
    """
    def __init__(self, _io, _parent=None, _root=None):
        self._io = _io
        self._parent = _parent
        self._root = _root if _root else self
        self._read()

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            self.entries.append(SomeIpSdOptions.SdOption(self._io, self, self._root))
            i += 1


    class SdOption(KaitaiStruct):

        class OptionTypes(Enum):
            configuration_option = 1
            load_balancing_option = 2
            ipv4_endpoint_option = 4
            ipv6_endpoint_option = 6
            ipv4_multicast_option = 20
            ipv6_multicast_option = 22
            ipv4_sd_endpoint_option = 36
            ipv6_sd_endpoint_option = 38
        def __init__(self, _io, _parent=None, _root=None):
            self._io = _io
            self._parent = _parent
            self._root = _root if _root else self
            self._read()

        def _read(self):
            self.header = SomeIpSdOptions.SdOption.SdOptionHeader(self._io, self, self._root)
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                self.content = SomeIpSdOptions.SdOption.SdLoadBalancingOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                self.content = SomeIpSdOptions.SdOption.SdConfigurationOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv4EndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv4MulticastOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv6EndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                self.content = SomeIpSdOptions.SdOption.SdIpv6MulticastOption(self._io, self, self._root)

        class SdOptionHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.length = self._io.read_u2be()
                self.type = KaitaiStream.resolve_enum(SomeIpSdOptions.SdOption.OptionTypes, self._io.read_u1())


        class SdConfigString(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.length = self._io.read_u1()
                if self.length != 0:
                    self._raw_config = self._io.read_bytes(self.length)
                    _io__raw_config = KaitaiStream(BytesIO(self._raw_config))
                    self.config = SomeIpSdOptions.SdOption.SdConfigKvPair(_io__raw_config, self, self._root)



        class SdConfigStringsContainer(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.config_strings = []
                i = 0
                while not self._io.is_eof():
                    self.config_strings.append(SomeIpSdOptions.SdOption.SdConfigString(self._io, self, self._root))
                    i += 1



        class SdConfigurationOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self._raw_configurations = self._io.read_bytes((self._parent.header.length - 1))
                _io__raw_configurations = KaitaiStream(BytesIO(self._raw_configurations))
                self.configurations = SomeIpSdOptions.SdOption.SdConfigStringsContainer(_io__raw_configurations, self, self._root)


        class SdIpv4MulticastOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdIpv4SdEndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdIpv6MulticastOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdConfigKvPair(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.key = (self._io.read_bytes_term(61, False, True, True)).decode(u"ASCII")
                self.value = (self._io.read_bytes_full()).decode(u"ASCII")


        class SdIpv6SdEndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdIpv4EndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdIpv6EndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


        class SdLoadBalancingOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                self._io = _io
                self._parent = _parent
                self._root = _root if _root else self
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.priority = self._io.read_u2be()
                self.weight = self._io.read_u2be()




