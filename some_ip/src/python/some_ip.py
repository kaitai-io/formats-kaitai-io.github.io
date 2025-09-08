# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import KaitaiStruct, KaitaiStream, BytesIO
import some_ip_sd
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIp(KaitaiStruct):
    """SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
    communication protocol which supports remoteprocedure calls, event notifications
    and the underlying serialization/wire format.
    
    .. seealso::
       Source - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf
    """
    def __init__(self, _io, _parent=None, _root=None):
        super(SomeIp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self
        self._read()

    def _read(self):
        self.header = SomeIp.Header(self._io, self, self._root)
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
            self._raw_payload = self._io.read_bytes(self.header.length - 8)
            _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
            self.payload = some_ip_sd.SomeIpSd(_io__raw_payload)
        else:
            pass
            self.payload = self._io.read_bytes(self.header.length - 8)


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
            self.payload._fetch_instances()
        else:
            pass

    class Header(KaitaiStruct):

        class MessageTypeEnum(IntEnum):
            request = 0
            request_no_return = 1
            notification = 2
            request_ack = 64
            request_no_return_ack = 65
            notification_ack = 66
            response = 128
            error = 129
            response_ack = 192
            error_ack = 193

        class ReturnCodeEnum(IntEnum):
            ok = 0
            not_ok = 1
            unknown_service = 2
            unknown_method = 3
            not_ready = 4
            not_reachable = 5
            time_out = 6
            wrong_protocol_version = 7
            wrong_interface_version = 8
            malformed_message = 9
            wrong_message_type = 10
        def __init__(self, _io, _parent=None, _root=None):
            super(SomeIp.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root
            self._read()

        def _read(self):
            self._raw_message_id = self._io.read_bytes(4)
            _io__raw_message_id = KaitaiStream(BytesIO(self._raw_message_id))
            self.message_id = SomeIp.Header.MessageId(_io__raw_message_id, self, self._root)
            self.length = self._io.read_u4be()
            self._raw_request_id = self._io.read_bytes(4)
            _io__raw_request_id = KaitaiStream(BytesIO(self._raw_request_id))
            self.request_id = SomeIp.Header.RequestId(_io__raw_request_id, self, self._root)
            self.protocol_version = self._io.read_u1()
            self.interface_version = self._io.read_u1()
            self.message_type = KaitaiStream.resolve_enum(SomeIp.Header.MessageTypeEnum, self._io.read_u1())
            self.return_code = KaitaiStream.resolve_enum(SomeIp.Header.ReturnCodeEnum, self._io.read_u1())


        def _fetch_instances(self):
            pass
            self.message_id._fetch_instances()
            self.request_id._fetch_instances()

        class MessageId(KaitaiStruct):
            """[PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
            the user. However, the Message ID shall be unique for the whole
            system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
            should be handled via a comparable process.
            [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
            the ID with 2^16 services with 2^15 methods.
            
            .. seealso::
               AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIp.Header.MessageId, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.service_id = self._io.read_u2be()
                self.sub_id = self._io.read_bits_int_be(1) != 0
                if self.sub_id == False:
                    pass
                    self.method_id = self._io.read_bits_int_be(15)

                if self.sub_id == True:
                    pass
                    self.event_id = self._io.read_bits_int_be(15)



            def _fetch_instances(self):
                pass
                if self.sub_id == False:
                    pass

                if self.sub_id == True:
                    pass

                _ = self.value
                if hasattr(self, '_m_value'):
                    pass


            @property
            def value(self):
                """The value provides the undissected Message ID."""
                if hasattr(self, '_m_value'):
                    return self._m_value

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_value = self._io.read_u4be()
                self._io.seek(_pos)
                return getattr(self, '_m_value', None)


        class RequestId(KaitaiStruct):
            """The Request ID allows a provider and subscriber to differentiate
            multiple parallel usesof the same method, event, getter or setter.
            
            .. seealso::
               AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
            """
            def __init__(self, _io, _parent=None, _root=None):
                super(SomeIp.Header.RequestId, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._read()

            def _read(self):
                self.client_id = self._io.read_u2be()
                self.session_id = self._io.read_u2be()


            def _fetch_instances(self):
                pass
                _ = self.value
                if hasattr(self, '_m_value'):
                    pass


            @property
            def value(self):
                """The value provides the undissected Request ID."""
                if hasattr(self, '_m_value'):
                    return self._m_value

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_value = self._io.read_u4be()
                self._io.seek(_pos)
                return getattr(self, '_m_value', None)


        @property
        def is_valid_service_discovery(self):
            """auxillary value.
            
            .. seealso::
               AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
            """
            if hasattr(self, '_m_is_valid_service_discovery'):
                return self._m_is_valid_service_discovery

            self._m_is_valid_service_discovery =  ((self.message_id.value == 4294934784) and (self.protocol_version == 1) and (self.interface_version == 1) and (self.message_type == SomeIp.Header.MessageTypeEnum.notification) and (self.return_code == SomeIp.Header.ReturnCodeEnum.ok)) 
            return getattr(self, '_m_is_valid_service_discovery', None)



