# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# rtpdump is a format used by rtptools to record and replay
# rtp data from network capture.
# @see https://chromium.googlesource.com/external/webrtc/stable/talk/+/master/media/base/rtpdump.h Source
class Rtpdump < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @file_header = HeaderT.new(@_io, self, @_root)
    @packets = []
    i = 0
    while not @_io.eof?
      @packets << PacketT.new(@_io, self, @_root)
      i += 1
    end
    self
  end
  class HeaderT < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @shebang = @_io.ensure_fixed_contents([35, 33, 114, 116, 112, 112, 108, 97, 121, 49, 46, 48].pack('C*'))
      @space = @_io.ensure_fixed_contents([32].pack('C*'))
      @ip = (@_io.read_bytes_term(47, false, true, true)).force_encoding("ascii")
      @port = (@_io.read_bytes_term(10, false, true, true)).force_encoding("ascii")
      @start_sec = @_io.read_u4be
      @start_usec = @_io.read_u4be
      @ip2 = @_io.read_u4be
      @port2 = @_io.read_u2be
      @padding = @_io.read_u2be
      self
    end
    attr_reader :shebang
    attr_reader :space
    attr_reader :ip
    attr_reader :port

    ##
    # start of recording, the seconds part.
    attr_reader :start_sec

    ##
    # start of recording, the microseconds part.
    attr_reader :start_usec

    ##
    # network source.
    attr_reader :ip2

    ##
    # port.
    attr_reader :port2

    ##
    # 2 bytes padding.
    attr_reader :padding
  end
  class PacketT < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @length = @_io.read_u2be
      @len_body = @_io.read_u2be
      @packet_usec = @_io.read_u4be
      @_raw_body = @_io.read_bytes(len_body)
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = RtpPacket.new(io)
      self
    end

    ##
    # packet length (including this header).
    attr_reader :length

    ##
    # payload length.
    attr_reader :len_body

    ##
    # timestamp of packet since the start.
    attr_reader :packet_usec
    attr_reader :body
    attr_reader :_raw_body
  end
  attr_reader :file_header
  attr_reader :packets
end
