# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class IcmpPacket < Kaitai::Struct::Struct

  ICMP_TYPE_ENUM = {
    0 => :icmp_type_enum_echo_reply,
    3 => :icmp_type_enum_destination_unreachable,
    4 => :icmp_type_enum_source_quench,
    5 => :icmp_type_enum_redirect,
    8 => :icmp_type_enum_echo,
    11 => :icmp_type_enum_time_exceeded,
  }
  I__ICMP_TYPE_ENUM = ICMP_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @icmp_type = Kaitai::Struct::Stream::resolve_enum(ICMP_TYPE_ENUM, @_io.read_u1)
    if icmp_type == :icmp_type_enum_destination_unreachable
      @destination_unreachable = DestinationUnreachableMsg.new(@_io, self, @_root)
    end
    if icmp_type == :icmp_type_enum_time_exceeded
      @time_exceeded = TimeExceededMsg.new(@_io, self, @_root)
    end
    if  ((icmp_type == :icmp_type_enum_echo) || (icmp_type == :icmp_type_enum_echo_reply)) 
      @echo = EchoMsg.new(@_io, self, @_root)
    end
    self
  end
  class DestinationUnreachableMsg < Kaitai::Struct::Struct

    DESTINATION_UNREACHABLE_CODE = {
      0 => :destination_unreachable_code_net_unreachable,
      1 => :destination_unreachable_code_host_unreachable,
      2 => :destination_unreachable_code_protocol_unreachable,
      3 => :destination_unreachable_code_port_unreachable,
      4 => :destination_unreachable_code_fragmentation_needed_and_df_set,
      5 => :destination_unreachable_code_source_route_failed,
      6 => :destination_unreachable_code_dst_net_unkown,
      7 => :destination_unreachable_code_sdt_host_unkown,
      8 => :destination_unreachable_code_src_isolated,
      9 => :destination_unreachable_code_net_prohibited_by_admin,
      10 => :destination_unreachable_code_host_prohibited_by_admin,
      11 => :destination_unreachable_code_net_unreachable_for_tos,
      12 => :destination_unreachable_code_host_unreachable_for_tos,
      13 => :destination_unreachable_code_communication_prohibited_by_admin,
      14 => :destination_unreachable_code_host_precedence_violation,
      15 => :destination_unreachable_code_precedence_cuttoff_in_effect,
    }
    I__DESTINATION_UNREACHABLE_CODE = DESTINATION_UNREACHABLE_CODE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(DESTINATION_UNREACHABLE_CODE, @_io.read_u1)
      @checksum = @_io.read_u2be
      self
    end
    attr_reader :code
    attr_reader :checksum
  end
  class TimeExceededMsg < Kaitai::Struct::Struct

    TIME_EXCEEDED_CODE = {
      0 => :time_exceeded_code_time_to_live_exceeded_in_transit,
      1 => :time_exceeded_code_fragment_reassembly_time_exceeded,
    }
    I__TIME_EXCEEDED_CODE = TIME_EXCEEDED_CODE.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = Kaitai::Struct::Stream::resolve_enum(TIME_EXCEEDED_CODE, @_io.read_u1)
      @checksum = @_io.read_u2be
      self
    end
    attr_reader :code
    attr_reader :checksum
  end
  class EchoMsg < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @code = @_io.ensure_fixed_contents([0].pack('C*'))
      @checksum = @_io.read_u2be
      @identifier = @_io.read_u2be
      @seq_num = @_io.read_u2be
      @data = @_io.read_bytes_full
      self
    end
    attr_reader :code
    attr_reader :checksum
    attr_reader :identifier
    attr_reader :seq_num
    attr_reader :data
  end
  attr_reader :icmp_type
  attr_reader :destination_unreachable
  attr_reader :time_exceeded
  attr_reader :echo
end
