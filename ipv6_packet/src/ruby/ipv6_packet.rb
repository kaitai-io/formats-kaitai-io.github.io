# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'protocol_body'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Ipv6Packet < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @version = @_io.read_bits_int_be(4)
    @traffic_class = @_io.read_bits_int_be(8)
    @flow_label = @_io.read_bits_int_be(20)
    @_io.align_to_byte
    @payload_length = @_io.read_u2be
    @next_header_type = @_io.read_u1
    @hop_limit = @_io.read_u1
    @src_ipv6_addr = @_io.read_bytes(16)
    @dst_ipv6_addr = @_io.read_bytes(16)
    @next_header = ProtocolBody.new(@_io, next_header_type)
    @rest = @_io.read_bytes_full
    self
  end
  attr_reader :version
  attr_reader :traffic_class
  attr_reader :flow_label
  attr_reader :payload_length
  attr_reader :next_header_type
  attr_reader :hop_limit
  attr_reader :src_ipv6_addr
  attr_reader :dst_ipv6_addr
  attr_reader :next_header
  attr_reader :rest
end
