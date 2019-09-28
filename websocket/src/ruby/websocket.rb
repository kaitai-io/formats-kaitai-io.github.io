# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# The WebSocket protocol establishes a two-way communication channel via TCP.
# Messages are made up of one or more dataframes, and are delineated by
# frames with the `fin` bit set.
class Websocket < Kaitai::Struct::Struct

  OPCODE = {
    0 => :opcode_continuation,
    1 => :opcode_text,
    2 => :opcode_binary,
    3 => :opcode_reserved_3,
    4 => :opcode_reserved_4,
    5 => :opcode_reserved_5,
    6 => :opcode_reserved_6,
    7 => :opcode_reserved_7,
    8 => :opcode_close,
    9 => :opcode_ping,
    10 => :opcode_pong,
    11 => :opcode_reserved_control_b,
    12 => :opcode_reserved_control_c,
    13 => :opcode_reserved_control_d,
    14 => :opcode_reserved_control_e,
    15 => :opcode_reserved_control_f,
  }
  I__OPCODE = OPCODE.invert
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @initial_frame = InitialFrame.new(@_io, self, @_root)
    if initial_frame.header.finished != true
      @trailing_frames = []
      i = 0
      begin
        _ = Dataframe.new(@_io, self, @_root)
        @trailing_frames << _
        i += 1
      end until _.header.finished
    end
    self
  end
  class FrameHeader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @finished = @_io.read_bits_int(1) != 0
      @reserved = @_io.read_bits_int(3)
      @opcode = Kaitai::Struct::Stream::resolve_enum(Websocket::OPCODE, @_io.read_bits_int(4))
      @is_masked = @_io.read_bits_int(1) != 0
      @len_payload_primary = @_io.read_bits_int(7)
      @_io.align_to_byte
      if len_payload_primary == 126
        @len_payload_extended_1 = @_io.read_u2be
      end
      if len_payload_primary == 127
        @len_payload_extended_2 = @_io.read_u4be
      end
      if is_masked
        @mask_key = @_io.read_u4be
      end
      self
    end
    def len_payload
      return @len_payload unless @len_payload.nil?
      @len_payload = (len_payload_primary <= 125 ? len_payload_primary : (len_payload_primary == 126 ? len_payload_extended_1 : len_payload_extended_2))
      @len_payload
    end
    attr_reader :finished
    attr_reader :reserved
    attr_reader :opcode
    attr_reader :is_masked
    attr_reader :len_payload_primary
    attr_reader :len_payload_extended_1
    attr_reader :len_payload_extended_2
    attr_reader :mask_key
  end
  class InitialFrame < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = FrameHeader.new(@_io, self, @_root)
      if header.opcode != :opcode_text
        @payload_bytes = @_io.read_bytes(header.len_payload)
      end
      if header.opcode == :opcode_text
        @payload_text = (@_io.read_bytes(header.len_payload)).force_encoding("UTF-8")
      end
      self
    end
    attr_reader :header
    attr_reader :payload_bytes
    attr_reader :payload_text
  end
  class Dataframe < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = FrameHeader.new(@_io, self, @_root)
      if _root.initial_frame.header.opcode != :opcode_text
        @payload_bytes = @_io.read_bytes(header.len_payload)
      end
      if _root.initial_frame.header.opcode == :opcode_text
        @payload_text = (@_io.read_bytes(header.len_payload)).force_encoding("UTF-8")
      end
      self
    end
    attr_reader :header
    attr_reader :payload_bytes
    attr_reader :payload_text
  end
  attr_reader :initial_frame
  attr_reader :trailing_frames
end
