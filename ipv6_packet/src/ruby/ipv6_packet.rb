# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Ipv6Packet < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @version = @_io.read_bits_int(4)
    @traffic_class = @_io.read_bits_int(8)
    @flow_label = @_io.read_bits_int(20)
    @_io.align_to_byte
    @payload_length = @_io.read_u2be
    @next_header_type = @_io.read_u1
    @hop_limit = @_io.read_u1
    @src_ipv6_addr = @_io.read_bytes(16)
    @dst_ipv6_addr = @_io.read_bytes(16)
    case next_header_type
    when 17
      @next_header = UdpDatagram.new(@_io)
    when 0
      @next_header = OptionHopByHop.new(@_io, self, @_root)
    when 4
      @next_header = Ipv4Packet.new(@_io)
    when 6
      @next_header = TcpSegment.new(@_io)
    when 59
      @next_header = NoNextHeader.new(@_io, self, @_root)
    end
    @rest = @_io.read_bytes_full
    self
  end
  class NoNextHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      self
    end
  end
  class OptionHopByHop < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @next_header_type = @_io.read_u1
      @hdr_ext_len = @_io.read_u1
      @body = @_io.read_bytes((hdr_ext_len - 1))
      case next_header_type
      when 0
        @next_header = OptionHopByHop.new(@_io, self, @_root)
      when 6
        @next_header = TcpSegment.new(@_io)
      when 59
        @next_header = NoNextHeader.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :next_header_type
    attr_reader :hdr_ext_len
    attr_reader :body
    attr_reader :next_header
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
