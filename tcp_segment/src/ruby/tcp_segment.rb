# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# TCP is one of the core Internet protocols on transport layer (AKA
# OSI layer 4), providing stateful connections with error checking,
# guarantees of delivery, order of segments and avoidance of duplicate
# delivery.
class TcpSegment < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @src_port = @_io.read_u2be
    @dst_port = @_io.read_u2be
    @seq_num = @_io.read_u4be
    @ack_num = @_io.read_u4be
    @b12 = @_io.read_u1
    @b13 = @_io.read_u1
    @window_size = @_io.read_u2be
    @checksum = @_io.read_u2be
    @urgent_pointer = @_io.read_u2be
    @body = @_io.read_bytes_full
    self
  end
  attr_reader :src_port
  attr_reader :dst_port
  attr_reader :seq_num
  attr_reader :ack_num
  attr_reader :b12
  attr_reader :b13
  attr_reader :window_size
  attr_reader :checksum
  attr_reader :urgent_pointer
  attr_reader :body
end
