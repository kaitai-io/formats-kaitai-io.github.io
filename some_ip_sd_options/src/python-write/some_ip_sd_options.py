# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIpSdOptions(ReadWriteKaitaiStruct):
    """FormatOptions are used to transport additional information to the entries.
    This includes forinstance the information how a service instance is
    reachable (IP-Address, TransportProtocol, Port Number).
    
    .. seealso::
       section 4.1.2.4 Options Format - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf
       -
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SomeIpSdOptions, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.entries = []
        i = 0
        while not self._io.is_eof():
            _t_entries = SomeIpSdOptions.SdOption(self._io, self, self._root)
            try:
                _t_entries._read()
            finally:
                self.entries.append(_t_entries)
            i += 1

        self._dirty = False


    def _fetch_instances(self):
        pass
        for i in range(len(self.entries)):
            pass
            self.entries[i]._fetch_instances()



    def _write__seq(self, io=None):
        super(SomeIpSdOptions, self)._write__seq(io)
        for i in range(len(self.entries)):
            pass
            if self._io.is_eof():
                raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())
            self.entries[i]._write__seq(self._io)

        if not self._io.is_eof():
            raise kaitaistruct.ConsistencyError(u"entries", 0, self._io.size() - self._io.pos())


    def _check(self):
        for i in range(len(self.entries)):
            pass
            if self.entries[i]._root != self._root:
                raise kaitaistruct.ConsistencyError(u"entries", self._root, self.entries[i]._root)
            if self.entries[i]._parent != self:
                raise kaitaistruct.ConsistencyError(u"entries", self, self.entries[i]._parent)

        self._dirty = False

    class SdOption(ReadWriteKaitaiStruct):

        class OptionTypes(IntEnum):
            configuration_option = 1
            load_balancing_option = 2
            ipv4_endpoint_option = 4
            ipv6_endpoint_option = 6
            ipv4_multicast_option = 20
            ipv6_multicast_option = 22
            ipv4_sd_endpoint_option = 36
            ipv6_sd_endpoint_option = 38
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SomeIpSdOptions.SdOption, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self.header = SomeIpSdOptions.SdOption.SdOptionHeader(self._io, self, self._root)
            self.header._read()
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdConfigurationOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4EndpointOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4MulticastOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6EndpointOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6MulticastOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption(self._io, self, self._root)
                self.content._read()
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                pass
                self.content = SomeIpSdOptions.SdOption.SdLoadBalancingOption(self._io, self, self._root)
                self.content._read()
            self._dirty = False


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


        def _write__seq(self, io=None):
            super(SomeIpSdOptions.SdOption, self)._write__seq(io)
            self.header._write__seq(self._io)
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                pass
                self.content._write__seq(self._io)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                pass
                self.content._write__seq(self._io)


        def _check(self):
            if self.header._root != self._root:
                raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
            if self.header._parent != self:
                raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
            _on = self.header.type
            if _on == SomeIpSdOptions.SdOption.OptionTypes.configuration_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_endpoint_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_multicast_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv4_sd_endpoint_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_endpoint_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_multicast_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.ipv6_sd_endpoint_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            elif _on == SomeIpSdOptions.SdOption.OptionTypes.load_balancing_option:
                pass
                if self.content._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"content", self._root, self.content._root)
                if self.content._parent != self:
                    raise kaitaistruct.ConsistencyError(u"content", self, self.content._parent)
            self._dirty = False

        class SdConfigKvPair(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigKvPair, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.key = (self._io.read_bytes_term(61, False, True, True)).decode(u"ASCII")
                self.value = (self._io.read_bytes_full()).decode(u"ASCII")
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdConfigKvPair, self)._write__seq(io)
                self._io.write_bytes((self.key).encode(u"ASCII"))
                self._io.write_u1(61)
                self._io.write_bytes((self.value).encode(u"ASCII"))
                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"value", 0, self._io.size() - self._io.pos())


            def _check(self):
                if KaitaiStream.byte_array_index_of((self.key).encode(u"ASCII"), 61) != -1:
                    raise kaitaistruct.ConsistencyError(u"key", -1, KaitaiStream.byte_array_index_of((self.key).encode(u"ASCII"), 61))
                self._dirty = False


        class SdConfigString(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigString, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u1()
                if self.length != 0:
                    pass
                    self._raw_config = self._io.read_bytes(self.length)
                    _io__raw_config = KaitaiStream(BytesIO(self._raw_config))
                    self.config = SomeIpSdOptions.SdOption.SdConfigKvPair(_io__raw_config, self, self._root)
                    self.config._read()

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.length != 0:
                    pass
                    self.config._fetch_instances()



            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdConfigString, self)._write__seq(io)
                self._io.write_u1(self.length)
                if self.length != 0:
                    pass
                    _io__raw_config = KaitaiStream(BytesIO(bytearray(self.length)))
                    self._io.add_child_stream(_io__raw_config)
                    _pos2 = self._io.pos()
                    self._io.seek(self._io.pos() + (self.length))
                    def handler(parent, _io__raw_config=_io__raw_config):
                        self._raw_config = _io__raw_config.to_byte_array()
                        if len(self._raw_config) != self.length:
                            raise kaitaistruct.ConsistencyError(u"raw(config)", self.length, len(self._raw_config))
                        parent.write_bytes(self._raw_config)
                    _io__raw_config.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                    self.config._write__seq(_io__raw_config)



            def _check(self):
                if self.length != 0:
                    pass
                    if self.config._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"config", self._root, self.config._root)
                    if self.config._parent != self:
                        raise kaitaistruct.ConsistencyError(u"config", self, self.config._parent)

                self._dirty = False


        class SdConfigStringsContainer(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigStringsContainer, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.config_strings = []
                i = 0
                while not self._io.is_eof():
                    _t_config_strings = SomeIpSdOptions.SdOption.SdConfigString(self._io, self, self._root)
                    try:
                        _t_config_strings._read()
                    finally:
                        self.config_strings.append(_t_config_strings)
                    i += 1

                self._dirty = False


            def _fetch_instances(self):
                pass
                for i in range(len(self.config_strings)):
                    pass
                    self.config_strings[i]._fetch_instances()



            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdConfigStringsContainer, self)._write__seq(io)
                for i in range(len(self.config_strings)):
                    pass
                    if self._io.is_eof():
                        raise kaitaistruct.ConsistencyError(u"config_strings", 0, self._io.size() - self._io.pos())
                    self.config_strings[i]._write__seq(self._io)

                if not self._io.is_eof():
                    raise kaitaistruct.ConsistencyError(u"config_strings", 0, self._io.size() - self._io.pos())


            def _check(self):
                for i in range(len(self.config_strings)):
                    pass
                    if self.config_strings[i]._root != self._root:
                        raise kaitaistruct.ConsistencyError(u"config_strings", self._root, self.config_strings[i]._root)
                    if self.config_strings[i]._parent != self:
                        raise kaitaistruct.ConsistencyError(u"config_strings", self, self.config_strings[i]._parent)

                self._dirty = False


        class SdConfigurationOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdConfigurationOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self._raw_configurations = self._io.read_bytes(self._parent.header.length - 1)
                _io__raw_configurations = KaitaiStream(BytesIO(self._raw_configurations))
                self.configurations = SomeIpSdOptions.SdOption.SdConfigStringsContainer(_io__raw_configurations, self, self._root)
                self.configurations._read()
                self._dirty = False


            def _fetch_instances(self):
                pass
                self.configurations._fetch_instances()


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdConfigurationOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                _io__raw_configurations = KaitaiStream(BytesIO(bytearray(self._parent.header.length - 1)))
                self._io.add_child_stream(_io__raw_configurations)
                _pos2 = self._io.pos()
                self._io.seek(self._io.pos() + (self._parent.header.length - 1))
                def handler(parent, _io__raw_configurations=_io__raw_configurations):
                    self._raw_configurations = _io__raw_configurations.to_byte_array()
                    if len(self._raw_configurations) != self._parent.header.length - 1:
                        raise kaitaistruct.ConsistencyError(u"raw(configurations)", self._parent.header.length - 1, len(self._raw_configurations))
                    parent.write_bytes(self._raw_configurations)
                _io__raw_configurations.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
                self.configurations._write__seq(_io__raw_configurations)


            def _check(self):
                if self.configurations._root != self._root:
                    raise kaitaistruct.ConsistencyError(u"configurations", self._root, self.configurations._root)
                if self.configurations._parent != self:
                    raise kaitaistruct.ConsistencyError(u"configurations", self, self.configurations._parent)
                self._dirty = False


        class SdIpv4EndpointOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4EndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv4EndpointOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 4:
                    raise kaitaistruct.ConsistencyError(u"address", 4, len(self.address))
                self._dirty = False


        class SdIpv4MulticastOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4MulticastOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv4MulticastOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 4:
                    raise kaitaistruct.ConsistencyError(u"address", 4, len(self.address))
                self._dirty = False


        class SdIpv4SdEndpointOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(4)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv4SdEndpointOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 4:
                    raise kaitaistruct.ConsistencyError(u"address", 4, len(self.address))
                self._dirty = False


        class SdIpv6EndpointOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6EndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv6EndpointOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 16:
                    raise kaitaistruct.ConsistencyError(u"address", 16, len(self.address))
                self._dirty = False


        class SdIpv6MulticastOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6MulticastOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv6MulticastOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 16:
                    raise kaitaistruct.ConsistencyError(u"address", 16, len(self.address))
                self._dirty = False


        class SdIpv6SdEndpointOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.address = self._io.read_bytes(16)
                self.reserved2 = self._io.read_u1()
                self.l4_protocol = self._io.read_u1()
                self.port = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdIpv6SdEndpointOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_bytes(self.address)
                self._io.write_u1(self.reserved2)
                self._io.write_u1(self.l4_protocol)
                self._io.write_u2be(self.port)


            def _check(self):
                if len(self.address) != 16:
                    raise kaitaistruct.ConsistencyError(u"address", 16, len(self.address))
                self._dirty = False


        class SdLoadBalancingOption(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdLoadBalancingOption, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.reserved = self._io.read_u1()
                self.priority = self._io.read_u2be()
                self.weight = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdLoadBalancingOption, self)._write__seq(io)
                self._io.write_u1(self.reserved)
                self._io.write_u2be(self.priority)
                self._io.write_u2be(self.weight)


            def _check(self):
                self._dirty = False


        class SdOptionHeader(ReadWriteKaitaiStruct):
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIpSdOptions.SdOption.SdOptionHeader, self).__init__(_io)
                self._parent = _parent
                self._root = _root

            def _read(self):
                self.length = self._io.read_u2be()
                self.type = KaitaiStream.resolve_enum(SomeIpSdOptions.SdOption.OptionTypes, self._io.read_u1())
                self._dirty = False


            def _fetch_instances(self):
                pass


            def _write__seq(self, io=None):
                super(SomeIpSdOptions.SdOption.SdOptionHeader, self)._write__seq(io)
                self._io.write_u2be(self.length)
                self._io.write_u1(int(self.type))


            def _check(self):
                self._dirty = False




