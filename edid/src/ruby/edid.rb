# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Edid < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @magic = @_io.read_bytes(8)
    raise Kaitai::Struct::ValidationNotEqualError.new([0, 255, 255, 255, 255, 255, 255, 0].pack('C*'), magic, _io, "/seq/0") if not magic == [0, 255, 255, 255, 255, 255, 255, 0].pack('C*')
    @mfg_bytes = @_io.read_u2le
    @product_code = @_io.read_u2le
    @serial = @_io.read_u4le
    @mfg_week = @_io.read_u1
    @mfg_year_mod = @_io.read_u1
    @edid_version_major = @_io.read_u1
    @edid_version_minor = @_io.read_u1
    @input_flags = @_io.read_u1
    @screen_size_h = @_io.read_u1
    @screen_size_v = @_io.read_u1
    @gamma_mod = @_io.read_u1
    @features_flags = @_io.read_u1
    @chromacity = ChromacityInfo.new(@_io, self, @_root)
    @est_timings = EstTimingsInfo.new(@_io, self, @_root)
    @std_timings = Array.new(8)
    (8).times { |i|
      @std_timings[i] = StdTiming.new(@_io, self, @_root)
    }
    self
  end

  ##
  # Chromaticity information: colorimetry and white point
  # coordinates. All coordinates are stored as fixed precision
  # 10-bit numbers, bits are shuffled for compactness.
  class ChromacityInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @red_x_1_0 = @_io.read_bits_int_be(2)
      @red_y_1_0 = @_io.read_bits_int_be(2)
      @green_x_1_0 = @_io.read_bits_int_be(2)
      @green_y_1_0 = @_io.read_bits_int_be(2)
      @blue_x_1_0 = @_io.read_bits_int_be(2)
      @blue_y_1_0 = @_io.read_bits_int_be(2)
      @white_x_1_0 = @_io.read_bits_int_be(2)
      @white_y_1_0 = @_io.read_bits_int_be(2)
      @_io.align_to_byte
      @red_x_9_2 = @_io.read_u1
      @red_y_9_2 = @_io.read_u1
      @green_x_9_2 = @_io.read_u1
      @green_y_9_2 = @_io.read_u1
      @blue_x_9_2 = @_io.read_u1
      @blue_y_9_2 = @_io.read_u1
      @white_x_9_2 = @_io.read_u1
      @white_y_9_2 = @_io.read_u1
      self
    end
    def green_x_int
      return @green_x_int unless @green_x_int.nil?
      @green_x_int = ((green_x_9_2 << 2) | green_x_1_0)
      @green_x_int
    end

    ##
    # Red Y coordinate
    def red_y
      return @red_y unless @red_y.nil?
      @red_y = (red_y_int / 1024.0)
      @red_y
    end
    def green_y_int
      return @green_y_int unless @green_y_int.nil?
      @green_y_int = ((green_y_9_2 << 2) | green_y_1_0)
      @green_y_int
    end

    ##
    # White Y coordinate
    def white_y
      return @white_y unless @white_y.nil?
      @white_y = (white_y_int / 1024.0)
      @white_y
    end

    ##
    # Red X coordinate
    def red_x
      return @red_x unless @red_x.nil?
      @red_x = (red_x_int / 1024.0)
      @red_x
    end

    ##
    # White X coordinate
    def white_x
      return @white_x unless @white_x.nil?
      @white_x = (white_x_int / 1024.0)
      @white_x
    end

    ##
    # Blue X coordinate
    def blue_x
      return @blue_x unless @blue_x.nil?
      @blue_x = (blue_x_int / 1024.0)
      @blue_x
    end
    def white_x_int
      return @white_x_int unless @white_x_int.nil?
      @white_x_int = ((white_x_9_2 << 2) | white_x_1_0)
      @white_x_int
    end
    def white_y_int
      return @white_y_int unless @white_y_int.nil?
      @white_y_int = ((white_y_9_2 << 2) | white_y_1_0)
      @white_y_int
    end

    ##
    # Green X coordinate
    def green_x
      return @green_x unless @green_x.nil?
      @green_x = (green_x_int / 1024.0)
      @green_x
    end
    def red_x_int
      return @red_x_int unless @red_x_int.nil?
      @red_x_int = ((red_x_9_2 << 2) | red_x_1_0)
      @red_x_int
    end
    def red_y_int
      return @red_y_int unless @red_y_int.nil?
      @red_y_int = ((red_y_9_2 << 2) | red_y_1_0)
      @red_y_int
    end
    def blue_x_int
      return @blue_x_int unless @blue_x_int.nil?
      @blue_x_int = ((blue_x_9_2 << 2) | blue_x_1_0)
      @blue_x_int
    end

    ##
    # Blue Y coordinate
    def blue_y
      return @blue_y unless @blue_y.nil?
      @blue_y = (blue_y_int / 1024.0)
      @blue_y
    end

    ##
    # Green Y coordinate
    def green_y
      return @green_y unless @green_y.nil?
      @green_y = (green_y_int / 1024.0)
      @green_y
    end
    def blue_y_int
      return @blue_y_int unless @blue_y_int.nil?
      @blue_y_int = ((blue_y_9_2 << 2) | blue_y_1_0)
      @blue_y_int
    end

    ##
    # Red X, bits 1..0
    attr_reader :red_x_1_0

    ##
    # Red Y, bits 1..0
    attr_reader :red_y_1_0

    ##
    # Green X, bits 1..0
    attr_reader :green_x_1_0

    ##
    # Green Y, bits 1..0
    attr_reader :green_y_1_0

    ##
    # Blue X, bits 1..0
    attr_reader :blue_x_1_0

    ##
    # Blue Y, bits 1..0
    attr_reader :blue_y_1_0

    ##
    # White X, bits 1..0
    attr_reader :white_x_1_0

    ##
    # White Y, bits 1..0
    attr_reader :white_y_1_0

    ##
    # Red X, bits 9..2
    attr_reader :red_x_9_2

    ##
    # Red Y, bits 9..2
    attr_reader :red_y_9_2

    ##
    # Green X, bits 9..2
    attr_reader :green_x_9_2

    ##
    # Green Y, bits 9..2
    attr_reader :green_y_9_2

    ##
    # Blue X, bits 9..2
    attr_reader :blue_x_9_2

    ##
    # Blue Y, bits 9..2
    attr_reader :blue_y_9_2

    ##
    # White X, bits 9..2
    attr_reader :white_x_9_2

    ##
    # White Y, bits 9..2
    attr_reader :white_y_9_2
  end
  class EstTimingsInfo < Kaitai::Struct::Struct
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @can_720_400_70 = @_io.read_bits_int_be(1) != 0
      @can_720_400_88 = @_io.read_bits_int_be(1) != 0
      @can_640_480_60 = @_io.read_bits_int_be(1) != 0
      @can_640_480_67 = @_io.read_bits_int_be(1) != 0
      @can_640_480_72 = @_io.read_bits_int_be(1) != 0
      @can_640_480_75 = @_io.read_bits_int_be(1) != 0
      @can_800_600_56 = @_io.read_bits_int_be(1) != 0
      @can_800_600_60 = @_io.read_bits_int_be(1) != 0
      @can_800_600_72 = @_io.read_bits_int_be(1) != 0
      @can_800_600_75 = @_io.read_bits_int_be(1) != 0
      @can_832_624_75 = @_io.read_bits_int_be(1) != 0
      @can_1024_768_87_i = @_io.read_bits_int_be(1) != 0
      @can_1024_768_60 = @_io.read_bits_int_be(1) != 0
      @can_1024_768_70 = @_io.read_bits_int_be(1) != 0
      @can_1024_768_75 = @_io.read_bits_int_be(1) != 0
      @can_1280_1024_75 = @_io.read_bits_int_be(1) != 0
      @can_1152_870_75 = @_io.read_bits_int_be(1) != 0
      @reserved = @_io.read_bits_int_be(7)
      self
    end

    ##
    # Supports 720 x 400 @ 70Hz
    attr_reader :can_720_400_70

    ##
    # Supports 720 x 400 @ 88Hz
    attr_reader :can_720_400_88

    ##
    # Supports 640 x 480 @ 60Hz
    attr_reader :can_640_480_60

    ##
    # Supports 640 x 480 @ 67Hz
    attr_reader :can_640_480_67

    ##
    # Supports 640 x 480 @ 72Hz
    attr_reader :can_640_480_72

    ##
    # Supports 640 x 480 @ 75Hz
    attr_reader :can_640_480_75

    ##
    # Supports 800 x 600 @ 56Hz
    attr_reader :can_800_600_56

    ##
    # Supports 800 x 600 @ 60Hz
    attr_reader :can_800_600_60

    ##
    # Supports 800 x 600 @ 72Hz
    attr_reader :can_800_600_72

    ##
    # Supports 800 x 600 @ 75Hz
    attr_reader :can_800_600_75

    ##
    # Supports 832 x 624 @ 75Hz
    attr_reader :can_832_624_75

    ##
    # Supports 1024 x 768 @ 87Hz(I)
    attr_reader :can_1024_768_87_i

    ##
    # Supports 1024 x 768 @ 60Hz
    attr_reader :can_1024_768_60

    ##
    # Supports 1024 x 768 @ 70Hz
    attr_reader :can_1024_768_70

    ##
    # Supports 1024 x 768 @ 75Hz
    attr_reader :can_1024_768_75

    ##
    # Supports 1280 x 1024 @ 75Hz
    attr_reader :can_1280_1024_75

    ##
    # Supports 1152 x 870 @ 75Hz
    attr_reader :can_1152_870_75
    attr_reader :reserved
  end
  class StdTiming < Kaitai::Struct::Struct

    ASPECT_RATIOS = {
      0 => :aspect_ratios_ratio_16_10,
      1 => :aspect_ratios_ratio_4_3,
      2 => :aspect_ratios_ratio_5_4,
      3 => :aspect_ratios_ratio_16_9,
    }
    I__ASPECT_RATIOS = ASPECT_RATIOS.invert
    def initialize(_io, _parent = nil, _root = self)
      super(_io, _parent, _root)
      _read
    end

    def _read
      @horiz_active_pixels_mod = @_io.read_u1
      @aspect_ratio = Kaitai::Struct::Stream::resolve_enum(ASPECT_RATIOS, @_io.read_bits_int_be(2))
      @refresh_rate_mod = @_io.read_bits_int_be(5)
      self
    end

    ##
    # Range of horizontal active pixels.
    def horiz_active_pixels
      return @horiz_active_pixels unless @horiz_active_pixels.nil?
      @horiz_active_pixels = ((horiz_active_pixels_mod + 31) * 8)
      @horiz_active_pixels
    end

    ##
    # Vertical refresh rate, Hz.
    def refresh_rate
      return @refresh_rate unless @refresh_rate.nil?
      @refresh_rate = (refresh_rate_mod + 60)
      @refresh_rate
    end

    ##
    # Range of horizontal active pixels, written in modified form:
    # `(horiz_active_pixels / 8) - 31`. This yields an effective
    # range of 256..2288, with steps of 8 pixels.
    attr_reader :horiz_active_pixels_mod

    ##
    # Aspect ratio of the image. Can be used to calculate number
    # of vertical pixels.
    attr_reader :aspect_ratio

    ##
    # Refresh rate in Hz, written in modified form: `refresh_rate
    # - 60`. This yields an effective range of 60..123 Hz.
    attr_reader :refresh_rate_mod
  end
  def mfg_year
    return @mfg_year unless @mfg_year.nil?
    @mfg_year = (mfg_year_mod + 1990)
    @mfg_year
  end
  def mfg_id_ch1
    return @mfg_id_ch1 unless @mfg_id_ch1.nil?
    @mfg_id_ch1 = ((mfg_bytes & 31744) >> 10)
    @mfg_id_ch1
  end
  def mfg_id_ch3
    return @mfg_id_ch3 unless @mfg_id_ch3.nil?
    @mfg_id_ch3 = (mfg_bytes & 31)
    @mfg_id_ch3
  end
  def gamma
    return @gamma unless @gamma.nil?
    if gamma_mod != 255
      @gamma = ((gamma_mod + 100) / 100.0)
    end
    @gamma
  end
  def mfg_id_ch2
    return @mfg_id_ch2 unless @mfg_id_ch2.nil?
    @mfg_id_ch2 = ((mfg_bytes & 992) >> 5)
    @mfg_id_ch2
  end
  attr_reader :magic
  attr_reader :mfg_bytes

  ##
  # Manufacturer product code
  attr_reader :product_code

  ##
  # Serial number
  attr_reader :serial

  ##
  # Week of manufacture. Week numbering is not consistent between manufacturers.
  attr_reader :mfg_week

  ##
  # Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
  attr_reader :mfg_year_mod

  ##
  # EDID version, usually 1 (for 1.3)
  attr_reader :edid_version_major

  ##
  # EDID revision, usually 3 (for 1.3)
  attr_reader :edid_version_minor
  attr_reader :input_flags

  ##
  # Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
  attr_reader :screen_size_h

  ##
  # Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
  attr_reader :screen_size_v

  ##
  # Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
  attr_reader :gamma_mod
  attr_reader :features_flags

  ##
  # Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
  # @see '' Standard, section 3.7
  attr_reader :chromacity

  ##
  # Block of bit flags that indicates support of so called
  # "established timings", which is a commonly used subset of VESA
  # DMT (Discrete Monitor Timings) modes.
  # @see '' Standard, section 3.8
  attr_reader :est_timings

  ##
  # Array of descriptions of so called "standard timings", which are
  # used to specify up to 8 additional timings not included in
  # "established timings".
  attr_reader :std_timings
end
