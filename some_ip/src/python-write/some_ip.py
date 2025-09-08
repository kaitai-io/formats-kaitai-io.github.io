# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
# type: ignore

import kaitaistruct
from kaitaistruct import ReadWriteKaitaiStruct, KaitaiStream, BytesIO
import some_ip_sd
from enum import IntEnum


if getattr(kaitaistruct, 'API_VERSION', (0, 9)) < (0, 11):
    raise Exception("Incompatible Kaitai Struct Python API: 0.11 or later is required, but you have %s" % (kaitaistruct.__version__))

class SomeIp(ReadWriteKaitaiStruct):
    """SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
    communication protocol which supports remoteprocedure calls, event notifications
    and the underlying serialization/wire format.
    
    .. seealso::
       Source - https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf
    """
    def __init__(self, _io=None, _parent=None, _root=None):
        super(SomeIp, self).__init__(_io)
        self._parent = _parent
        self._root = _root or self

    def _read(self):
        self.header = SomeIp.Header(self._io, self, self._root)
        self.header._read()
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
            self._raw_payload = self._io.read_bytes(self.header.length - 8)
            _io__raw_payload = KaitaiStream(BytesIO(self._raw_payload))
            self.payload = some_ip_sd.SomeIpSd(_io__raw_payload)
            self.payload._read()
        else:
            pass
            self.payload = self._io.read_bytes(self.header.length - 8)
        self._dirty = False


    def _fetch_instances(self):
        pass
        self.header._fetch_instances()
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
            self.payload._fetch_instances()
        else:
            pass


    def _write__seq(self, io=None):
        super(SomeIp, self)._write__seq(io)
        self.header._write__seq(self._io)
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
            _io__raw_payload = KaitaiStream(BytesIO(bytearray(self.header.length - 8)))
            self._io.add_child_stream(_io__raw_payload)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (self.header.length - 8))
            def handler(parent, _io__raw_payload=_io__raw_payload):
                self._raw_payload = _io__raw_payload.to_byte_array()
                if len(self._raw_payload) != self.header.length - 8:
                    raise kaitaistruct.ConsistencyError(u"raw(payload)", self.header.length - 8, len(self._raw_payload))
                parent.write_bytes(self._raw_payload)
            _io__raw_payload.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.payload._write__seq(_io__raw_payload)
        else:
            pass
            self._io.write_bytes(self.payload)


    def _check(self):
        if self.header._root != self._root:
            raise kaitaistruct.ConsistencyError(u"header", self._root, self.header._root)
        if self.header._parent != self:
            raise kaitaistruct.ConsistencyError(u"header", self, self.header._parent)
        _on = self.header.message_id.value
        if _on == 4294934784:
            pass
        else:
            pass
            if len(self.payload) != self.header.length - 8:
                raise kaitaistruct.ConsistencyError(u"payload", self.header.length - 8, len(self.payload))
        self._dirty = False

    class Header(ReadWriteKaitaiStruct):

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
        def __init__(self, _io=None, _parent=None, _root=None):
            super(SomeIp.Header, self).__init__(_io)
            self._parent = _parent
            self._root = _root

        def _read(self):
            self._raw_message_id = self._io.read_bytes(4)
            _io__raw_message_id = KaitaiStream(BytesIO(self._raw_message_id))
            self.message_id = SomeIp.Header.MessageId(_io__raw_message_id, self, self._root)
            self.message_id._read()
            self.length = self._io.read_u4be()
            self._raw_request_id = self._io.read_bytes(4)
            _io__raw_request_id = KaitaiStream(BytesIO(self._raw_request_id))
            self.request_id = SomeIp.Header.RequestId(_io__raw_request_id, self, self._root)
            self.request_id._read()
            self.protocol_version = self._io.read_u1()
            self.interface_version = self._io.read_u1()
            self.message_type = KaitaiStream.resolve_enum(SomeIp.Header.MessageTypeEnum, self._io.read_u1())
            self.return_code = KaitaiStream.resolve_enum(SomeIp.Header.ReturnCodeEnum, self._io.read_u1())
            self._dirty = False


        def _fetch_instances(self):
            pass
            self.message_id._fetch_instances()
            self.request_id._fetch_instances()


        def _write__seq(self, io=None):
            super(SomeIp.Header, self)._write__seq(io)
            _io__raw_message_id = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_message_id)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_message_id=_io__raw_message_id):
                self._raw_message_id = _io__raw_message_id.to_byte_array()
                if len(self._raw_message_id) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(message_id)", 4, len(self._raw_message_id))
                parent.write_bytes(self._raw_message_id)
            _io__raw_message_id.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.message_id._write__seq(_io__raw_message_id)
            self._io.write_u4be(self.length)
            _io__raw_request_id = KaitaiStream(BytesIO(bytearray(4)))
            self._io.add_child_stream(_io__raw_request_id)
            _pos2 = self._io.pos()
            self._io.seek(self._io.pos() + (4))
            def handler(parent, _io__raw_request_id=_io__raw_request_id):
                self._raw_request_id = _io__raw_request_id.to_byte_array()
                if len(self._raw_request_id) != 4:
                    raise kaitaistruct.ConsistencyError(u"raw(request_id)", 4, len(self._raw_request_id))
                parent.write_bytes(self._raw_request_id)
            _io__raw_request_id.write_back_handler = KaitaiStream.WriteBackHandler(_pos2, handler)
            self.request_id._write__seq(_io__raw_request_id)
            self._io.write_u1(self.protocol_version)
            self._io.write_u1(self.interface_version)
            self._io.write_u1(int(self.message_type))
            self._io.write_u1(int(self.return_code))


        def _check(self):
            if self.message_id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"message_id", self._root, self.message_id._root)
            if self.message_id._parent != self:
                raise kaitaistruct.ConsistencyError(u"message_id", self, self.message_id._parent)
            if self.request_id._root != self._root:
                raise kaitaistruct.ConsistencyError(u"request_id", self._root, self.request_id._root)
            if self.request_id._parent != self:
                raise kaitaistruct.ConsistencyError(u"request_id", self, self.request_id._parent)
            self._dirty = False

        class MessageId(ReadWriteKaitaiStruct):
            """[PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
            the user. However, the Message ID shall be unique for the whole
            system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
            should be handled via a comparable process.
            [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
            the ID with 2^16 services with 2^15 methods.
            
            .. seealso::
               AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIp.Header.MessageId, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_value = False
                self.value__enabled = True

            def _read(self):
                self.service_id = self._io.read_u2be()
                self.sub_id = self._io.read_bits_int_be(1) != 0
                if self.sub_id == False:
                    pass
                    self.method_id = self._io.read_bits_int_be(15)

                if self.sub_id == True:
                    pass
                    self.event_id = self._io.read_bits_int_be(15)

                self._dirty = False


            def _fetch_instances(self):
                pass
                if self.sub_id == False:
                    pass

                if self.sub_id == True:
                    pass

                _ = self.value
                if hasattr(self, '_m_value'):
                    pass



            def _write__seq(self, io=None):
                super(SomeIp.Header.MessageId, self)._write__seq(io)
                self._should_write_value = self.value__enabled
                self._io.write_u2be(self.service_id)
                self._io.write_bits_int_be(1, int(self.sub_id))
                if self.sub_id == False:
                    pass
                    self._io.write_bits_int_be(15, self.method_id)

                if self.sub_id == True:
                    pass
                    self._io.write_bits_int_be(15, self.event_id)



            def _check(self):
                if self.sub_id == False:
                    pass

                if self.sub_id == True:
                    pass

                if self.value__enabled:
                    pass

                self._dirty = False

            @property
            def value(self):
                """The value provides the undissected Message ID."""
                if self._should_write_value:
                    self._write_value()
                if hasattr(self, '_m_value'):
                    return self._m_value

                if not self.value__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_value = self._io.read_u4be()
                self._io.seek(_pos)
                return getattr(self, '_m_value', None)

            @value.setter
            def value(self, v):
                self._dirty = True
                self._m_value = v

            def _write_value(self):
                self._should_write_value = False
                _pos = self._io.pos()
                self._io.seek(0)
                self._io.write_u4be(self._m_value)
                self._io.seek(_pos)


        class RequestId(ReadWriteKaitaiStruct):
            """The Request ID allows a provider and subscriber to differentiate
            multiple parallel usesof the same method, event, getter or setter.
            
            .. seealso::
               AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
            """
            def __init__(self, _io=None, _parent=None, _root=None):
                super(SomeIp.Header.RequestId, self).__init__(_io)
                self._parent = _parent
                self._root = _root
                self._should_write_value = False
                self.value__enabled = True

            def _read(self):
                self.client_id = self._io.read_u2be()
                self.session_id = self._io.read_u2be()
                self._dirty = False


            def _fetch_instances(self):
                pass
                _ = self.value
                if hasattr(self, '_m_value'):
                    pass



            def _write__seq(self, io=None):
                super(SomeIp.Header.RequestId, self)._write__seq(io)
                self._should_write_value = self.value__enabled
                self._io.write_u2be(self.client_id)
                self._io.write_u2be(self.session_id)


            def _check(self):
                if self.value__enabled:
                    pass

                self._dirty = False

            @property
            def value(self):
                """The value provides the undissected Request ID."""
                if self._should_write_value:
                    self._write_value()
                if hasattr(self, '_m_value'):
                    return self._m_value

                if not self.value__enabled:
                    return None

                _pos = self._io.pos()
                self._io.seek(0)
                self._m_value = self._io.read_u4be()
                self._io.seek(_pos)
                return getattr(self, '_m_value', None)

            @value.setter
            def value(self, v):
                self._dirty = True
                self._m_value = v

            def _write_value(self):
                self._should_write_value = False
                _pos = self._io.pos()
                self._io.seek(0)
                self._io.write_u4be(self._m_value)
                self._io.seek(_pos)


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

        def _invalidate_is_valid_service_discovery(self):
            del self._m_is_valid_service_discovery


