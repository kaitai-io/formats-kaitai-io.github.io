# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Scream Tracker 3 module is a tracker music file format that, as all
# tracker music, bundles both sound samples and instructions on which
# notes to play. It originates from a Scream Tracker 3 music editor
# (1994) by Future Crew, derived from original Scream Tracker 2 (.stm)
# module format.
# 
# Instrument descriptions in S3M format allow to use either digital
# samples or setup and control AdLib (OPL2) synth.
# 
# Music is organized in so called `patterns`. "Pattern" is a generally
# a 64-row long table, which instructs which notes to play on which
# time measure. "Patterns" are played one-by-one in a sequence
# determined by `orders`, which is essentially an array of pattern IDs
# - this way it's possible to reuse certain patterns more than once
# for repetitive musical phrases.
# @see http://hackipedia.org/File%20formats/Music/Sample%20based/text/Scream%20Tracker%203.20%20file%20format.cp437.txt.utf-8.txt Source
class S3m < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @song_name = Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(28), 0, false)
    @magic1 = @_io.ensure_fixed_contents([26].pack('C*'))
    @file_type = @_io.read_u1
    @reserved1 = @_io.read_bytes(2)
    @num_orders = @_io.read_u2le
    @num_instruments = @_io.read_u2le
    @num_patterns = @_io.read_u2le
    @flags = @_io.read_u2le
    @version = @_io.read_u2le
    @samples_format = @_io.read_u2le
    @magic2 = @_io.ensure_fixed_contents([83, 67, 82, 77].pack('C*'))
    @global_volume = @_io.read_u1
    @initial_speed = @_io.read_u1
    @initial_tempo = @_io.read_u1
    @is_stereo = @_io.read_bits_int(1) != 0
    @master_volume = @_io.read_bits_int(7)
    @_io.align_to_byte
    @ultra_click_removal = @_io.read_u1
    @has_custom_pan = @_io.read_u1
    @reserved2 = @_io.read_bytes(8)
    @ofs_special = @_io.read_u2le
    @channels = Array.new(32)
    (32).times { |i|
      @channels[i] = Channel.new(@_io, self, @_root)
    }
    @orders = @_io.read_bytes(num_orders)
    @instruments = Array.new(num_instruments)
    (num_instruments).times { |i|
      @instruments[i] = InstrumentPtr.new(@_io, self, @_root)
    }
    @patterns = Array.new(num_patterns)
    (num_patterns).times { |i|
      @patterns[i] = PatternPtr.new(@_io, self, @_root)
    }
    if has_custom_pan == 252
      @channel_pans = Array.new(32)
      (32).times { |i|
        @channel_pans[i] = ChannelPan.new(@_io, self, @_root)
      }
    end
    self
  end
  class ChannelPan < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved1 = @_io.read_bits_int(2)
      @has_custom_pan = @_io.read_bits_int(1) != 0
      @reserved2 = @_io.read_bits_int(1) != 0
      @pan = @_io.read_bits_int(4)
      self
    end
    attr_reader :reserved1

    ##
    # If true, then use a custom pan setting provided in the `pan`
    # field. If false, the channel would use the default setting
    # (0x7 for mono, 0x3 or 0xc for stereo).
    attr_reader :has_custom_pan
    attr_reader :reserved2
    attr_reader :pan
  end
  class PatternCell < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @has_fx = @_io.read_bits_int(1) != 0
      @has_volume = @_io.read_bits_int(1) != 0
      @has_note_and_instrument = @_io.read_bits_int(1) != 0
      @channel_num = @_io.read_bits_int(5)
      @_io.align_to_byte
      if has_note_and_instrument
        @note = @_io.read_u1
      end
      if has_note_and_instrument
        @instrument = @_io.read_u1
      end
      if has_volume
        @volume = @_io.read_u1
      end
      if has_fx
        @fx_type = @_io.read_u1
      end
      if has_fx
        @fx_value = @_io.read_u1
      end
      self
    end
    attr_reader :has_fx
    attr_reader :has_volume
    attr_reader :has_note_and_instrument
    attr_reader :channel_num
    attr_reader :note
    attr_reader :instrument
    attr_reader :volume
    attr_reader :fx_type
    attr_reader :fx_value
  end
  class PatternCells < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @cells = []
      while not @_io.eof?
        @cells << PatternCell.new(@_io, self, @_root)
      end
      self
    end
    attr_reader :cells
  end
  class Channel < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @is_disabled = @_io.read_bits_int(1) != 0
      @ch_type = @_io.read_bits_int(7)
      self
    end
    attr_reader :is_disabled

    ##
    # Channel type (0..7 = left sample channels, 8..15 = right sample channels, 16..31 = AdLib synth channels)
    attr_reader :ch_type
  end

  ##
  # Custom 3-byte integer, stored in mixed endian manner.
  class SwappedU3 < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @hi = @_io.read_u1
      @lo = @_io.read_u2le
      self
    end
    def value
      return @value unless @value.nil?
      @value = (lo | (hi << 16))
      @value
    end
    attr_reader :hi
    attr_reader :lo
  end
  class Pattern < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @size = @_io.read_u2le
      @_raw_body = @_io.read_bytes((size - 2))
      io = Kaitai::Struct::Stream.new(@_raw_body)
      @body = PatternCells.new(io, self, @_root)
      self
    end
    attr_reader :size
    attr_reader :body
    attr_reader :_raw_body
  end
  class PatternPtr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @paraptr = @_io.read_u2le
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek((paraptr * 16))
      @body = Pattern.new(@_io, self, @_root)
      @_io.seek(_pos)
      @body
    end
    attr_reader :paraptr
  end
  class InstrumentPtr < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @paraptr = @_io.read_u2le
      self
    end
    def body
      return @body unless @body.nil?
      _pos = @_io.pos
      @_io.seek((paraptr * 16))
      @body = Instrument.new(@_io, self, @_root)
      @_io.seek(_pos)
      @body
    end
    attr_reader :paraptr
  end
  class Instrument < Kaitai::Struct::Struct

    INST_TYPES = {
      1 => :inst_types_sample,
      2 => :inst_types_melodic,
      3 => :inst_types_bass_drum,
      4 => :inst_types_snare_drum,
      5 => :inst_types_tom,
      6 => :inst_types_cymbal,
      7 => :inst_types_hihat,
    }
    I__INST_TYPES = INST_TYPES.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @type = Kaitai::Struct::Stream::resolve_enum(INST_TYPES, @_io.read_u1)
      @filename = Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(12), 0, false)
      case type
      when :inst_types_sample
        @body = Sampled.new(@_io, self, @_root)
      else
        @body = Adlib.new(@_io, self, @_root)
      end
      @tuning_hz = @_io.read_u4le
      @reserved2 = @_io.read_bytes(12)
      @sample_name = Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(28), 0, false)
      @magic = @_io.ensure_fixed_contents([83, 67, 82, 83].pack('C*'))
      self
    end
    class Sampled < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @paraptr_sample = SwappedU3.new(@_io, self, @_root)
        @len_sample = @_io.read_u4le
        @loop_begin = @_io.read_u4le
        @loop_end = @_io.read_u4le
        @default_volume = @_io.read_u1
        @reserved1 = @_io.read_u1
        @is_packed = @_io.read_u1
        @flags = @_io.read_u1
        self
      end
      def sample
        return @sample unless @sample.nil?
        _pos = @_io.pos
        @_io.seek((paraptr_sample.value * 16))
        @sample = @_io.read_bytes(len_sample)
        @_io.seek(_pos)
        @sample
      end
      attr_reader :paraptr_sample
      attr_reader :len_sample
      attr_reader :loop_begin
      attr_reader :loop_end

      ##
      # Default volume
      attr_reader :default_volume
      attr_reader :reserved1

      ##
      # 0 = unpacked, 1 = DP30ADPCM packing
      attr_reader :is_packed
      attr_reader :flags
    end
    class Adlib < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @reserved1 = @_io.ensure_fixed_contents([0, 0, 0].pack('C*'))
        @_unnamed1 = @_io.read_bytes(16)
        self
      end
      attr_reader :reserved1
      attr_reader :_unnamed1
    end
    attr_reader :type
    attr_reader :filename
    attr_reader :body
    attr_reader :tuning_hz
    attr_reader :reserved2
    attr_reader :sample_name
    attr_reader :magic
  end
  attr_reader :song_name
  attr_reader :magic1
  attr_reader :file_type
  attr_reader :reserved1

  ##
  # Number of orders in a song
  attr_reader :num_orders

  ##
  # Number of instruments in a song
  attr_reader :num_instruments

  ##
  # Number of patterns in a song
  attr_reader :num_patterns
  attr_reader :flags

  ##
  # Scream Tracker version that was used to save this file
  attr_reader :version

  ##
  # 1 = signed samples, 2 = unsigned samples
  attr_reader :samples_format
  attr_reader :magic2
  attr_reader :global_volume
  attr_reader :initial_speed
  attr_reader :initial_tempo
  attr_reader :is_stereo
  attr_reader :master_volume
  attr_reader :ultra_click_removal
  attr_reader :has_custom_pan
  attr_reader :reserved2

  ##
  # Offset of special data, not used by Scream Tracker directly.
  attr_reader :ofs_special
  attr_reader :channels
  attr_reader :orders
  attr_reader :instruments
  attr_reader :patterns
  attr_reader :channel_pans
end
