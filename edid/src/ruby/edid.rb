# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.7')
  raise "Incompatible Kaitai Struct Ruby API: 0.7 or later is required, but you have #{Kaitai::Struct::VERSION}"
end

class Edid < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end
  def _read
    @magic = @_io.ensure_fixed_contents([0, 255, 255, 255, 255, 255, 255, 0].pack('C*'))
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
    @chromacity = @_io.read_bytes(10)
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
  attr_reader :chromacity
end
