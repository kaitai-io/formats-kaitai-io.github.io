# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'
require_relative 'protocol_body'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Ipv4Packet < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @b1 = @_io.read_u1
    @b2 = @_io.read_u1
    @total_length = @_io.read_u2be
    @identification = @_io.read_u2be
    @b67 = @_io.read_u2be
    @ttl = @_io.read_u1
    @protocol = @_io.read_u1
    @header_checksum = @_io.read_u2be
    @src_ip_addr = @_io.read_bytes(4)
    @dst_ip_addr = @_io.read_bytes(4)
    _io_options = @_io.substream(ihl_bytes - 20)
    @options = Ipv4Options.new(_io_options, self, @_root)
    _io_body = @_io.substream(total_length - ihl_bytes)
    @body = ProtocolBody.new(_io_body, protocol)
    self
  end
  class Ipv4Option < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @b1 = @_io.read_u1
      @len = @_io.read_u1
      @body = @_io.read_bytes((len > 2 ? len - 2 : 0))
      self
    end
    def copy
      return @copy unless @copy.nil?
      @copy = (b1 & 128) >> 7
      @copy
    end
    def number
      return @number unless @number.nil?
      @number = b1 & 31
      @number
    end
    def opt_class
      return @opt_class unless @opt_class.nil?
      @opt_class = (b1 & 96) >> 5
      @opt_class
    end
    attr_reader :b1
    attr_reader :len
    attr_reader :body
  end
  class Ipv4Options < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @entries = []
      i = 0
      while not @_io.eof?
        @entries << Ipv4Option.new(@_io, self, @_root)
        i += 1
      end
      self
    end
    attr_reader :entries
  end
  def ihl
    return @ihl unless @ihl.nil?
    @ihl = b1 & 15
    @ihl
  end
  def ihl_bytes
    return @ihl_bytes unless @ihl_bytes.nil?
    @ihl_bytes = ihl * 4
    @ihl_bytes
  end
  def version
    return @version unless @version.nil?
    @version = (b1 & 240) >> 4
    @version
  end
  attr_reader :b1
  attr_reader :b2
  attr_reader :total_length
  attr_reader :identification
  attr_reader :b67
  attr_reader :ttl
  attr_reader :protocol
  attr_reader :header_checksum
  attr_reader :src_ip_addr
  attr_reader :dst_ip_addr
  attr_reader :options
  attr_reader :body
  attr_reader :_raw_options
  attr_reader :_raw_body
end
