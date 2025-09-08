# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.11')
  raise "Incompatible Kaitai Struct Ruby API: 0.11 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# TCP is one of the core Internet protocols on transport layer (AKA
# OSI layer 4), providing stateful connections with error checking,
# guarantees of delivery, order of segments and avoidance of duplicate
# delivery.
class TcpSegment < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = nil)
    super(_io, _parent, _root || self)
    _read
  end

  def _read
    @src_port = @_io.read_u2be
    @dst_port = @_io.read_u2be
    @seq_num = @_io.read_u4be
    @ack_num = @_io.read_u4be
    @data_offset = @_io.read_bits_int_be(4)
    @reserved = @_io.read_bits_int_be(4)
    @_io.align_to_byte
    @flags = Flags.new(@_io, self, @_root)
    @window_size = @_io.read_u2be
    @checksum = @_io.read_u2be
    @urgent_pointer = @_io.read_u2be
    if data_offset * 4 - 20 != 0
      @options = @_io.read_bytes(data_offset * 4 - 20)
    end
    @body = @_io.read_bytes_full
    self
  end

  ##
  # TCP header flags as defined "TCP Header Flags" registry.
  class Flags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = nil)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cwr = @_io.read_bits_int_be(1) != 0
      @ece = @_io.read_bits_int_be(1) != 0
      @urg = @_io.read_bits_int_be(1) != 0
      @ack = @_io.read_bits_int_be(1) != 0
      @psh = @_io.read_bits_int_be(1) != 0
      @rst = @_io.read_bits_int_be(1) != 0
      @syn = @_io.read_bits_int_be(1) != 0
      @fin = @_io.read_bits_int_be(1) != 0
      self
    end

    ##
    # Congestion Window Reduced
    attr_reader :cwr

    ##
    # ECN-Echo
    attr_reader :ece

    ##
    # Urgent pointer field is significant
    attr_reader :urg

    ##
    # Acknowledgment field is significant
    attr_reader :ack

    ##
    # Push function
    attr_reader :psh

    ##
    # Reset the connection
    attr_reader :rst

    ##
    # Synchronize sequence numbers
    attr_reader :syn

    ##
    # No more data from sender
    attr_reader :fin

    def to_s
      (((((((cwr ? "|CWR" : "") + (ece ? "|ECE" : "")) + (urg ? "|URG" : "")) + (ack ? "|ACK" : "")) + (psh ? "|PSH" : "")) + (rst ? "|RST" : "")) + (syn ? "|SYN" : "")) + (fin ? "|FIN" : "")
    end
  end

  ##
  # Source port
  attr_reader :src_port

  ##
  # Destination port
  attr_reader :dst_port

  ##
  # Sequence number
  attr_reader :seq_num

  ##
  # Acknowledgment number
  attr_reader :ack_num

  ##
  # Data offset (in 32-bit words from the beginning of this type, normally 32 or can be extended if there are any TCP options or padding is present)
  attr_reader :data_offset
  attr_reader :reserved
  attr_reader :flags
  attr_reader :window_size
  attr_reader :checksum
  attr_reader :urgent_pointer
  attr_reader :options
  attr_reader :body
end
