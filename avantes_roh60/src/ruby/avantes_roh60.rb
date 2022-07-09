# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

require 'kaitai/struct/struct'

unless Gem::Version.new(Kaitai::Struct::VERSION) >= Gem::Version.new('0.9')
  raise "Incompatible Kaitai Struct Ruby API: 0.9 or later is required, but you have #{Kaitai::Struct::VERSION}"
end


##
# Avantes USB spectrometers are supplied with a Windows binary which
# generates one ROH and one RCM file when the user clicks "Save
# experiment". In the version of 6.0, the ROH file contains a header
# of 22 four-byte floats, then the spectrum as a float array and a
# footer of 3 floats. The first and last pixel numbers are specified in the
# header and determine the (length+1) of the spectral data. In the tested
# files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this
# automatically anyway.
# 
# The wavelength calibration is stored as a polynomial with coefficients
# of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
# (pixel number + 1), as found out by comparing with the original
# Avantes converted data files. There is no intensity calibration saved,
# but it is recommended to do it in your program - the CCD in the spectrometer
# is so uneven that one should prepare exact pixel-to-pixel calibration curves
# to get reasonable spectral results.
# 
# The rest of the header floats is not known to the author. Note that the
# newer version of Avantes software has a different format, see also
# <https://www.mathworks.com/matlabcentral/fileexchange/37103-avantes-to-matlab>
# 
# The RCM file contains the user-specified comment, so it may be useful
# for automatic conversion of data. You may wish to divide the spectra by
# the integration time before comparing them.
# 
# Written and tested by Filip Dominec, 2017-2018
class AvantesRoh60 < Kaitai::Struct::Struct
  def initialize(_io, _parent = nil, _root = self)
    super(_io, _parent, _root)
    _read
  end

  def _read
    @unknown1 = @_io.read_f4le
    @wlintercept = @_io.read_f4le
    @wlx1 = @_io.read_f4le
    @wlx2 = @_io.read_f4le
    @wlx3 = @_io.read_f4le
    @wlx4 = @_io.read_f4le
    @unknown2 = []
    (9).times { |i|
      @unknown2 << @_io.read_f4le
    }
    @ipixfirst = @_io.read_f4le
    @ipixlast = @_io.read_f4le
    @unknown3 = []
    (4).times { |i|
      @unknown3 << @_io.read_f4le
    }
    @spectrum = []
    ((((ipixlast).to_i - (ipixfirst).to_i) - 1)).times { |i|
      @spectrum << @_io.read_f4le
    }
    @integration_ms = @_io.read_f4le
    @averaging = @_io.read_f4le
    @pixel_smoothing = @_io.read_f4le
    self
  end
  attr_reader :unknown1
  attr_reader :wlintercept
  attr_reader :wlx1
  attr_reader :wlx2
  attr_reader :wlx3
  attr_reader :wlx4
  attr_reader :unknown2
  attr_reader :ipixfirst
  attr_reader :ipixlast
  attr_reader :unknown3
  attr_reader :spectrum
  attr_reader :integration_ms
  attr_reader :averaging
  attr_reader :pixel_smoothing
end
