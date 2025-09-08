# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'some_ip_sd'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# SOME/IP (Scalable service-Oriented MiddlewarE over IP) is an automotive/embedded
# communication protocol which supports remoteprocedure calls, event notifications
# and the underlying serialization/wire format.
# @see https://www.autosar.org/fileadmin/standards/foundation/19-11/AUTOSAR_PRS_SOMEIPProtocol.pdf Source
class SomeIp < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @header = Header.new(@_io, self, @_root)
    case header.message_id.value
    when 4294934784
      _io_payload = @_io.substream(header.length - 8)
      @payload = SomeIpSd.new(_io_payload)
    else
      @payload = @_io.read_bytes(header.length - 8)
    end
    self
  end
  class Header < Kaitai::Struct::Struct

    MESSAGE_TYPE_ENUM = {
      0 => :message_type_enum_request,
      1 => :message_type_enum_request_no_return,
      2 => :message_type_enum_notification,
      64 => :message_type_enum_request_ack,
      65 => :message_type_enum_request_no_return_ack,
      66 => :message_type_enum_notification_ack,
      128 => :message_type_enum_response,
      129 => :message_type_enum_error,
      192 => :message_type_enum_response_ack,
      193 => :message_type_enum_error_ack,
    }
    I__MESSAGE_TYPE_ENUM = MESSAGE_TYPE_ENUM.invert

    RETURN_CODE_ENUM = {
      0 => :return_code_enum_ok,
      1 => :return_code_enum_not_ok,
      2 => :return_code_enum_unknown_service,
      3 => :return_code_enum_unknown_method,
      4 => :return_code_enum_not_ready,
      5 => :return_code_enum_not_reachable,
      6 => :return_code_enum_time_out,
      7 => :return_code_enum_wrong_protocol_version,
      8 => :return_code_enum_wrong_interface_version,
      9 => :return_code_enum_malformed_message,
      10 => :return_code_enum_wrong_message_type,
    }
    I__RETURN_CODE_ENUM = RETURN_CODE_ENUM.invert
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      _io_message_id = @_io.substream(4)
      @message_id = MessageId.new(_io_message_id, self, @_root)
      @length = @_io.read_u4be
      _io_request_id = @_io.substream(4)
      @request_id = RequestId.new(_io_request_id, self, @_root)
      @protocol_version = @_io.read_u1
      @interface_version = @_io.read_u1
      @message_type = Kaitai::Struct::Stream::resolve_enum(MESSAGE_TYPE_ENUM, @_io.read_u1)
      @return_code = Kaitai::Struct::Stream::resolve_enum(RETURN_CODE_ENUM, @_io.read_u1)
      self
    end

    ##
    # [PRS_SOMEIP_00035] The assignment of the Message ID shall be up to
    # the user. However, the Message ID shall be unique for the whole
    # system (i.e. the vehicle). TheMessage ID is similar to a CAN ID and
    # should be handled via a comparable process.
    # [PRS_SOMEIP_00038] Message IDs of method calls shall be structured in
    # the ID with 2^16 services with 2^15 methods.
    # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf 4.1.1.1  Message ID
    class MessageId < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @service_id = @_io.read_u2be
        @sub_id = @_io.read_bits_int_be(1) != 0
        if sub_id == false
          @method_id = @_io.read_bits_int_be(15)
        end
        if sub_id == true
          @event_id = @_io.read_bits_int_be(15)
        end
        self
      end

      ##
      # The value provides the undissected Message ID
      def value
        return @value unless @value.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @value = @_io.read_u4be
        @_io.seek(_pos)
        @value
      end

      ##
      # Service ID
      attr_reader :service_id

      ##
      # Single bit to flag, if there is a Method or a Event ID
      attr_reader :sub_id

      ##
      # Method ID
      # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.1.
      attr_reader :method_id

      ##
      # Event ID
      # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.6
      attr_reader :event_id
    end

    ##
    # The Request ID allows a provider and subscriber to differentiate
    # multiple parallel usesof the same method, event, getter or setter.
    # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf - section 4.1.1.3  Request ID
    class RequestId < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = nil)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @client_id = @_io.read_u2be
        @session_id = @_io.read_u2be
        self
      end

      ##
      # The value provides the undissected Request ID
      def value
        return @value unless @value.nil?
        _pos = @_io.pos
        @_io.seek(0)
        @value = @_io.read_u4be
        @_io.seek(_pos)
        @value
      end
      attr_reader :client_id
      attr_reader :session_id
    end

    ##
    # auxillary value
    # @see '' AUTOSAR_PRS_SOMEIPServiceDiscoveryProtocol.pdf - section 4.1.2.1 General Requirements
    def is_valid_service_discovery
      return @is_valid_service_discovery unless @is_valid_service_discovery.nil?
      @is_valid_service_discovery =  ((message_id.value == 4294934784) && (protocol_version == 1) && (interface_version == 1) && (message_type == :message_type_enum_notification) && (return_code == :return_code_enum_ok)) 
      @is_valid_service_discovery
    end

    ##
    # The Message ID shall be a 32 Bit identifier that is used to identify
    # the RPC call to a method of an application or to identify an event.
    attr_reader :message_id

    ##
    # [PRS_SOMEIP_00042] Length field shall contain the length in Byte
    # starting from Request ID/Client ID until the end of the SOME/IP message.
    attr_reader :length

    ##
    # The Request ID allows a provider and subscriber to differentiate
    # multiple parallel uses of the same method, event, getter or setter.
    attr_reader :request_id

    ##
    # The Protocol Version identifies the used SOME/IP Header format
    # (not including the Payload format).
    attr_reader :protocol_version

    ##
    # Interface Version shall be an 8 Bit field that contains the
    # MajorVersion of the Service Interface.
    attr_reader :interface_version

    ##
    # The Message Type field is used to differentiate different types of
    # messages.
    # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.4
    attr_reader :message_type

    ##
    # The Return Code shall be used to signal whether a request was
    # successfully processed.
    # @see '' AUTOSAR_PRS_SOMEIPProtocol.pdf - Table 4.5
    attr_reader :return_code
    attr_reader :_raw_message_id
    attr_reader :_raw_request_id
  end
  attr_reader :header
  attr_reader :payload
  attr_reader :_raw_payload
end
