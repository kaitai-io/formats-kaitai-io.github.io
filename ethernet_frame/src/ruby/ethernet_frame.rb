# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class EthernetFrame < Kaitai::Struct::Struct

  ETHER_TYPE_ENUM = {
    2048 => :ether_type_enum_ipv4,
    2049 => :ether_type_enum_x_75_internet,
    2050 => :ether_type_enum_nbs_internet,
    2051 => :ether_type_enum_ecma_internet,
    2052 => :ether_type_enum_chaosnet,
    2053 => :ether_type_enum_x_25_level_3,
    2054 => :ether_type_enum_arp,
    34525 => :ether_type_enum_ipv6,
  }
  I__ETHER_TYPE_ENUM = ETHER_TYPE_ENUM.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @dst_mac = @_io.read_bytes(6)
    @src_mac = @_io.read_bytes(6)
    @ether_type = Kaitai::Struct::Stream::resolve_enum(ETHER_TYPE_ENUM, @_io.read_u2be)
    case ether_type
    when :ether_type_enum_ipv4
      @_raw_body = @_io.read_bytes_full
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = Ipv4Packet.new(io)
    when :ether_type_enum_ipv6
      @_raw_body = @_io.read_bytes_full
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = Ipv6Packet.new(io)
    else
      @body = @_io.read_bytes_full
    end
  end
  attr_reader :dst_mac
  attr_reader :src_mac
  attr_reader :ether_type
  attr_reader :body
  attr_reader :_raw_body
end
