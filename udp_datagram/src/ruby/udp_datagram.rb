# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class UdpDatagram < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @src_port = @_io.read_u2be
    @dst_port = @_io.read_u2be
    @length = @_io.read_u2be
    @checksum = @_io.read_u2be
    @body = @_io.read_bytes_full
    self
  end
  attr_reader :src_port
  attr_reader :dst_port
  attr_reader :length
  attr_reader :checksum
  attr_reader :body
end
