-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")
require("some_ip_sd")
local stringstream = require("string_stream")
local enum = require("enum")

-- 
-- SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
-- communication protocol which supports remoteprocedure calls, event notifications
-- and the underlying serialization/wire format.
-- See also: Source (https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf)
SomeIp = class.class(KaitaiStruct)

function SomeIp:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function SomeIp:_read()
  self.header = SomeIp.Header(self._io, self, self._root)
  local _on = self.header.message_id.value
  if _on == 4294934784 then
    self._raw_payload = self._io:read_bytes(self.header.length - 8)
    local _io = KaitaiStream(stringstream(self._raw_payload))
    self.payload = SomeIpSd(_io)
  else
    self.payload = self._io:read_bytes(self.header.length - 8)
  end
end


SomeIp.Header = class.class(KaitaiStruct)

SomeIp.Header.MessageTypeEnum = enum.Enum {
  request = 0,
  request_no_return = 1,
  notification = 2,
  request_ack = 64,
  request_no_return_ack = 65,
  notification_ack = 66,
  response = 128,
  error = 129,
  response_ack = 192,
  error_ack = 193,
}

SomeIp.Header.ReturnCodeEnum = enum.Enum {
  ok = 0,
  not_ok = 1,
  unknown_service = 2,
  unknown_method = 3,
  not_ready = 4,
  not_reachable = 5,
  time_out = 6,
  wrong_protocol_version = 7,
  wrong_interface_version = 8,
  malformed_message = 9,
  wrong_message_type = 10,
}

function SomeIp.Header:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SomeIp.Header:_read()
  self._raw_message_id = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_message_id))
  self.message_id = SomeIp.Header.MessageId(_io, self, self._root)
  self.length = self._io:read_u4be()
  self._raw_request_id = self._io:read_bytes(4)
  local _io = KaitaiStream(stringstream(self._raw_request_id))
  self.request_id = SomeIp.Header.RequestId(_io, self, self._root)
  self.protocol_version = self._io:read_u1()
  self.interface_version = self._io:read_u1()
  self.message_type = SomeIp.Header.MessageTypeEnum(self._io:read_u1())
  self.return_code = SomeIp.Header.ReturnCodeEnum(self._io:read_u1())
end

-- 
-- auxillary value.
-- See also: AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
SomeIp.Header.property.is_valid_service_discovery = {}
function SomeIp.Header.property.is_valid_service_discovery:get()
  if self._m_is_valid_service_discovery ~= nil then
    return self._m_is_valid_service_discovery
  end

  self._m_is_valid_service_discovery =  ((self.message_id.value == 4294934784) and (self.protocol_version == 1) and (self.interface_version == 1) and (self.message_type == SomeIp.Header.MessageTypeEnum.notification) and (self.return_code == SomeIp.Header.ReturnCodeEnum.ok)) 
  return self._m_is_valid_service_discovery
end

-- 
-- The Message ID shall be a 32 Bit identifier that is used to identify
-- the RPC call to a method of an application or to identify an event.
-- 
-- [PRS_SOMEIP_00042] Length field shall contain the length in Byte
-- starting from Request ID/Client ID until the end of the SOME/IP message.
-- 
-- The Request ID allows a provider and subscriber to differentiate
-- multiple parallel uses of the same method, event, getter or setter.
-- 
-- The Protocol Version identifies the used SOME/IP Header format
-- (not including the Payload format).
-- 
-- Interface Version shall be an 8 Bit field that contains the
-- MajorVersion of the Service Interface.
-- 
-- The Message Type field is used to differentiate different types of
-- messages.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4
-- 
-- The Return Code shall be used to signal whether a request was
-- successfully processed.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5

-- 
-- [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
-- the user. However, the Message ID shall be unique for the whole
-- system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
-- should be handled via a comparable process.
-- [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
-- the ID with 2^16 services with 2^15 methods.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
SomeIp.Header.MessageId = class.class(KaitaiStruct)

function SomeIp.Header.MessageId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SomeIp.Header.MessageId:_read()
  self.service_id = self._io:read_u2be()
  self.sub_id = self._io:read_bits_int_be(1) ~= 0
  if self.sub_id == false then
    self.method_id = self._io:read_bits_int_be(15)
  end
  if self.sub_id == true then
    self.event_id = self._io:read_bits_int_be(15)
  end
end

-- 
-- The value provides the undissected Message ID.
SomeIp.Header.MessageId.property.value = {}
function SomeIp.Header.MessageId.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_value = self._io:read_u4be()
  self._io:seek(_pos)
  return self._m_value
end

-- 
-- Service ID.
-- 
-- Single bit to flag, if there is a Method or a Event ID.
-- 
-- Method ID.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1.
-- 
-- Event ID.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6

-- 
-- The Request ID allows a provider and subscriber to differentiate
-- multiple parallel usesof the same method, event, getter or setter.
-- See also: AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
SomeIp.Header.RequestId = class.class(KaitaiStruct)

function SomeIp.Header.RequestId:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root
  self:_read()
end

function SomeIp.Header.RequestId:_read()
  self.client_id = self._io:read_u2be()
  self.session_id = self._io:read_u2be()
end

-- 
-- The value provides the undissected Request ID.
SomeIp.Header.RequestId.property.value = {}
function SomeIp.Header.RequestId.property.value:get()
  if self._m_value ~= nil then
    return self._m_value
  end

  local _pos = self._io:pos()
  self._io:seek(0)
  self._m_value = self._io:read_u4be()
  self._io:seek(_pos)
  return self._m_value
end


