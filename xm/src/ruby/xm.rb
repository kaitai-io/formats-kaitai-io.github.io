# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# @see http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
#   ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
#    Source
class Xm < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @preheader = Preheader.new(@_io, self, @_root)
    @_raw_header = @_io.read_bytes((preheader.header_size - 4))
    io = Kaitai::Struct::Stream.new(@_raw_header)
    @header = Header.new(io, self, @_root)
    @patterns = Array.new(header.number_of_patterns)
    (header.number_of_patterns).times { |i|
      @patterns[i] = Pattern.new(@_io, self, @_root)
    }
    @instruments = Array.new(header.number_of_instruments)
    (header.number_of_instruments).times { |i|
      @instruments[i] = Instrument.new(@_io, self, @_root)
    }
    self
  end
  class Preheader < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @signature0 = @_io.ensure_fixed_contents([69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32].pack('C*'))
      @module_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(20), 0, false)).force_encoding("utf-8")
      @signature1 = @_io.ensure_fixed_contents([26].pack('C*'))
      @tracker_name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(20), 0, false)).force_encoding("utf-8")
      @version_number = Version.new(@_io, self, @_root)
      @header_size = @_io.read_u4le
      self
    end
    class Version < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @minor = @_io.read_u1
        @major = @_io.read_u1
        self
      end
      def value
        return @value unless @value.nil?
        @value = ((major << 8) | minor)
        @value
      end

      ##
      # currently 0x04
      attr_reader :minor

      ##
      # currently 0x01
      attr_reader :major
    end
    attr_reader :signature0

    ##
    # Module name, padded with zeroes
    attr_reader :module_name
    attr_reader :signature1

    ##
    # Tracker name
    attr_reader :tracker_name

    ##
    # Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
    attr_reader :version_number

    ##
    # Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
    attr_reader :header_size
  end
  class Pattern < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header = Header.new(@_io, self, @_root)
      @packed_data = @_io.read_bytes(header.main.packed_pattern_data_size)
      self
    end
    class Header < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @header_length = @_io.read_u4le
        @_raw_main = @_io.read_bytes((header_length - 4))
        io = Kaitai::Struct::Stream.new(@_raw_main)
        @main = HeaderMain.new(io, self, @_root)
        self
      end
      class HeaderMain < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @packing_type = @_io.read_u1
          case _root.preheader.version_number.value
          when 258
            @number_of_rows_raw = @_io.read_u1
          else
            @number_of_rows_raw = @_io.read_u2le
          end
          @packed_pattern_data_size = @_io.read_u2le
          self
        end
        def number_of_rows
          return @number_of_rows unless @number_of_rows.nil?
          @number_of_rows = (number_of_rows_raw + (_root.preheader.version_number.value == 258 ? 1 : 0))
          @number_of_rows
        end

        ##
        # Packing type (always 0)
        attr_reader :packing_type

        ##
        # Number of rows in pattern (1..256)
        attr_reader :number_of_rows_raw

        ##
        # Packed pattern data size
        attr_reader :packed_pattern_data_size
      end

      ##
      # Pattern header length
      attr_reader :header_length
      attr_reader :main
      attr_reader :_raw_main
    end
    attr_reader :header
    attr_reader :packed_data
  end
  class Flags < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @reserved = @_io.read_bits_int(15)
      @freq_table_type = @_io.read_bits_int(1) != 0
      self
    end
    attr_reader :reserved

    ##
    # 0 = Amiga frequency table (see below); 1 = Linear frequency table
    attr_reader :freq_table_type
  end
  class Header < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @song_length = @_io.read_u2le
      @restart_position = @_io.read_u2le
      @number_of_channels = @_io.read_u2le
      @number_of_patterns = @_io.read_u2le
      @number_of_instruments = @_io.read_u2le
      @flags = Flags.new(@_io, self, @_root)
      @default_tempo = @_io.read_u2le
      @default_bpm = @_io.read_u2le
      @pattern_order_table = Array.new(256)
      (256).times { |i|
        @pattern_order_table[i] = @_io.read_u1
      }
      self
    end

    ##
    # Song length (in pattern order table)
    attr_reader :song_length
    attr_reader :restart_position

    ##
    # (2,4,6,8,10,...,32)
    attr_reader :number_of_channels

    ##
    # (max 256)
    attr_reader :number_of_patterns

    ##
    # (max 128)
    attr_reader :number_of_instruments
    attr_reader :flags
    attr_reader :default_tempo
    attr_reader :default_bpm

    ##
    # max 256
    attr_reader :pattern_order_table
  end
  class Instrument < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @header_size = @_io.read_u4le
      @_raw_header = @_io.read_bytes((header_size - 4))
      io = Kaitai::Struct::Stream.new(@_raw_header)
      @header = Header.new(io, self, @_root)
      @samples_headers = Array.new(header.number_of_samples)
      (header.number_of_samples).times { |i|
        @samples_headers[i] = SampleHeader.new(@_io, self, @_root)
      }
      @samples = Array.new(header.number_of_samples)
      (header.number_of_samples).times { |i|
        @samples[i] = SamplesData.new(@_io, self, @_root, i)
      }
      self
    end
    class Header < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(22), 0, false)).force_encoding("utf-8")
        @type = @_io.read_u1
        @number_of_samples = @_io.read_u2le
        if number_of_samples > 0
          @extra_header = ExtraHeader.new(@_io, self, @_root)
        end
        self
      end
      attr_reader :name

      ##
      # Usually zero, but this seems pretty random, don't assume it's zero
      attr_reader :type
      attr_reader :number_of_samples
      attr_reader :extra_header
    end
    class ExtraHeader < Kaitai::Struct::Struct

      TYPE = {
        0 => :type_true,
        1 => :type_sustain,
        2 => :type_loop,
      }
      I__TYPE = TYPE.invert
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @sample_header_size = @_io.read_u4le
        @sample_number_for_all_notes = Array.new(96)
        (96).times { |i|
          @sample_number_for_all_notes[i] = @_io.read_u1
        }
        @points_for_volume_envelope = Array.new(12)
        (12).times { |i|
          @points_for_volume_envelope[i] = EnvelopePoint.new(@_io, self, @_root)
        }
        @points_for_panning_envelope = Array.new(12)
        (12).times { |i|
          @points_for_panning_envelope[i] = EnvelopePoint.new(@_io, self, @_root)
        }
        @number_of_volume_points = @_io.read_u1
        @number_of_panning_points = @_io.read_u1
        @volume_sustain_point = @_io.read_u1
        @volume_loop_start_point = @_io.read_u1
        @volume_loop_end_point = @_io.read_u1
        @panning_sustain_point = @_io.read_u1
        @panning_loop_start_point = @_io.read_u1
        @panning_loop_end_point = @_io.read_u1
        @volume_type = Kaitai::Struct::Stream::resolve_enum(TYPE, @_io.read_u1)
        @panning_type = Kaitai::Struct::Stream::resolve_enum(TYPE, @_io.read_u1)
        @vibrato_type = @_io.read_u1
        @vibrato_sweep = @_io.read_u1
        @vibrato_depth = @_io.read_u1
        @vibrato_rate = @_io.read_u1
        @volume_fadeout = @_io.read_u2le
        @reserved = @_io.read_u2le
        self
      end

      ##
      # Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
      # BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
      # Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
      # !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
      # Of course it does not help if all instruments have the values inside FT2 supported range.
      # The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
      class EnvelopePoint < Kaitai::Struct::Struct
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @x = @_io.read_u2le
          @y = @_io.read_u2le
          self
        end

        ##
        # Frame number of the point
        attr_reader :x

        ##
        # Value of the point
        attr_reader :y
      end
      attr_reader :sample_header_size
      attr_reader :sample_number_for_all_notes
      attr_reader :points_for_volume_envelope
      attr_reader :points_for_panning_envelope
      attr_reader :number_of_volume_points
      attr_reader :number_of_panning_points
      attr_reader :volume_sustain_point
      attr_reader :volume_loop_start_point
      attr_reader :volume_loop_end_point
      attr_reader :panning_sustain_point
      attr_reader :panning_loop_start_point
      attr_reader :panning_loop_end_point
      attr_reader :volume_type
      attr_reader :panning_type
      attr_reader :vibrato_type
      attr_reader :vibrato_sweep
      attr_reader :vibrato_depth
      attr_reader :vibrato_rate
      attr_reader :volume_fadeout
      attr_reader :reserved
    end

    ##
    # The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
    # Pseudocode for converting the delta-coded data to normal data,
    # old = 0;
    # for i in range(data_len):
    #   new = sample[i] + old;
    #   sample[i] = new;
    #   old = new;
    class SamplesData < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self, index)
        super(_io, _parent, _root)
        @index = index
        _read
      end

      def _read
        @samples_data = Array.new(_parent.samples_headers[index].sample_length)
        (_parent.samples_headers[index].sample_length).times { |i|
          case _parent.samples_headers[index].type.is_sample_data_16_bit
          when true
            @samples_data[i] = @_io.read_u2le
          when false
            @samples_data[i] = @_io.read_u1
          end
        }
        self
      end
      attr_reader :samples_data
      attr_reader :index
    end
    class SampleHeader < Kaitai::Struct::Struct
      def initialize(_io, _parent = nil, _root = self)
        super(_io, _parent, _root)
        _read
      end

      def _read
        @sample_length = @_io.read_u4le
        @sample_loop_start = @_io.read_u4le
        @sample_loop_length = @_io.read_u4le
        @volume = @_io.read_u1
        @fine_tune = @_io.read_s1
        @type = LoopType.new(@_io, self, @_root)
        @panning = @_io.read_u1
        @relative_note_number = @_io.read_s1
        @reserved = @_io.read_u1
        @name = (Kaitai::Struct::Stream::bytes_terminate(@_io.read_bytes(22), 0, false)).force_encoding("utf-8")
        self
      end
      class LoopType < Kaitai::Struct::Struct

        LOOP_TYPE = {
          0 => :loop_type_none,
          1 => :loop_type_forward,
          2 => :loop_type_ping_pong,
        }
        I__LOOP_TYPE = LOOP_TYPE.invert
        def initialize(_io, _parent = nil, _root = self)
          super(_io, _parent, _root)
          _read
        end

        def _read
          @reserved0 = @_io.read_bits_int(3)
          @is_sample_data_16_bit = @_io.read_bits_int(1) != 0
          @reserved1 = @_io.read_bits_int(2)
          @loop_type = Kaitai::Struct::Stream::resolve_enum(LOOP_TYPE, @_io.read_bits_int(2))
          self
        end
        attr_reader :reserved0
        attr_reader :is_sample_data_16_bit
        attr_reader :reserved1
        attr_reader :loop_type
      end
      attr_reader :sample_length
      attr_reader :sample_loop_start
      attr_reader :sample_loop_length
      attr_reader :volume

      ##
      # -16..+15
      attr_reader :fine_tune
      attr_reader :type

      ##
      # (0-255)
      attr_reader :panning
      attr_reader :relative_note_number
      attr_reader :reserved
      attr_reader :name
    end

    ##
    # Instrument size << header that is >>
    # << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
    attr_reader :header_size
    attr_reader :header
    attr_reader :samples_headers
    attr_reader :samples
    attr_reader :_raw_header
  end
  attr_reader :preheader
  attr_reader :header
  attr_reader :patterns
  attr_reader :instruments
  attr_reader :_raw_header
end
