# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSdOptions(KaitaiStruct):
    """FormatOptions are used to transport additional information to the entries.
    This includes forinstance the information how a service instance is
    reachable (IP-Address, TransportProtocol, Port Number).
    
    .. seealso::
       section 4.1.2.4 Options Format - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
       -
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(SomeIpSdOptions, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            self.entries.append(SomeIpSdOptions.SdOption(self._io, self, self._root))
            i += 1



    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()


    class SdOption(KaitaiStruct):

        class OptionTypes(IntEnum):
            configuration_option = 1
            load_balancing_option = 2
            ipv4_endpoint_option = 4
            ipv6_endpoint_option = 6
            ipv4_multicast_option = 20
            ipv6_multicast_option = 22
            ipv4_sd_endpoint_option = 36
            ipv6_sd_endpoint_option = 38
        def __init__(self, _io, _parent=None, _root=None):
            super(SomeIpSdOptions.SdOption, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self.header = SomeIpSdOptions.SdOption.SdOptionHeader(self._io, self, self._root)
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdConfigurationOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4EndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4MulticastOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6EndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6MulticastOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption(self._io, self, self._root)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdLoadBalancingOption(self._io, self, self._root)


        def _fetch_instances(self):
            pass
            self.header._fetch_instances()
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                pass
                self.content._fetch_instances()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                pass
                self.content._fetch_instances()

        class SdConfigKvPair(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigKvPair, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.key = (self._io.read_bytes_term(61, False, True, True)).decode(u"ASCII")
                self.value = (self._io.read_bytes_full()).decode(u"ASCII")


            def _fetch_instances(self):
                pass


        class SdConfigString(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigString, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.length = self._io.read_u1()
                if self.length != 0:
                    pass
                    self._raw_config = self._io.read_bytes(self.length)
                    _io__raw_config = KaitaiStream(BytesIO(self._raw_config))
                    self.config = SomeIpSdOptions.SdOption.SdConfigKvPair(_io__raw_config, self, self._root)



            def _fetch_instances(self):
                pass
                if self.length != 0:
                    pass
                    self.config._fetch_instances()



        class SdConfigStringsContainer(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigStringsContainer, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.config_strings = []
                i = 0
                while not self._io.is_eof():
                    self.config_strings.append(SomeIpSdOptions.SdOption.SdConfigString(self._io, self, self._root))
                    i += 1



            def _fetch_instances(self):
                pass
                for i in range(len(self.config_strings)):
                    pass
                    self.config_strings[i]._fetch_instances()



        class SdConfigurationOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigurationOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self._raw_configurations = self._io.read_bytes(self._parent.header.length - 1)
                _io__raw_configurations = KaitaiStream(BytesIO(self._raw_configurations))
                self.configurations = SomeIpSdOptions.SdOption.SdConfigStringsContainer(_io__raw_configurations, self, self._root)


            def _fetch_instances(self):
                pass
                self.configurations._fetch_instances()


        class SdIpv4EndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4EndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdIpv4MulticastOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4MulticastOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdIpv4SdEndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdIpv6EndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6EndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdIpv6MulticastOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6MulticastOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdIpv6SdEndpointOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdLoadBalancingOption(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdLoadBalancingOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.reserved = self._io.read_u1()
                self.priority = self._io.read_u2be()
                self.weight = self._io.read_u2be()


            def _fetch_instances(self):
                pass


        class SdOptionHeader(KaitaiStruct):
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdOptionHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.length = self._io.read_u2be()
                self.type = KaitaiStream.resolve_enum(SomeIpSdOptions.SdOption.OptionTypes, self._io.read_u1())


            def _fetch_instances(self):
                pass




