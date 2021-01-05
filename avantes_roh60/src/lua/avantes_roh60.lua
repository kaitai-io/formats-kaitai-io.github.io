-- This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild
--
-- This file is compatible with Lua 5.3

local class = require("class")
require("kaitaistruct")

-- 
-- Avantes USB spectrometers are supplied with a Windows binary which
-- generates one ROH and one RCM file when the user clicks "Save
-- experiment". In the version of 6.0, the ROH file contains a header
-- of 22 four-byte floats, then the spectrum as a float array and a
-- footer of 3 floats. The first and last pixel numbers are specified in the
-- header and determine the (length+1) of the spectral data. In the tested
-- files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this
-- automatically anyway.
-- 
-- The wavelength calibration is stored as a polynomial with coefficients
-- of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
-- (pixel number + 1), as found out by comparing with the original
-- Avantes converted data files. There is no intensity calibration saved,
-- but it is recommended to do it in your program - the CCD in the spectrometer
-- is so uneven that one should prepare exact pixel-to-pixel calibration curves
-- to get reasonable spectral results.
-- 
-- The rest of the header floats is not known to the author. Note that the
-- newer version of Avantes software has a different format, see also
-- https://kr.mathworks.com/examples/matlab/community/20341-reading-spectra-from-avantes-binary-files-demonstration
-- 
-- The RCM file contains the user-specified comment, so it may be useful
-- for automatic conversion of data. You may wish to divide the spectra by
-- the integration time before comparing them.
-- 
-- Written and tested by Filip Dominec, 2017-2018
AvantesRoh60 = class.class(KaitaiStruct)

function AvantesRoh60:_init(io, parent, root)
  KaitaiStruct._init(self, io)
  self._parent = parent
  self._root = root or self
  self:_read()
end

function AvantesRoh60:_read()
  self.unknown1 = self._io:read_f4le()
  self.wlintercept = self._io:read_f4le()
  self.wlx1 = self._io:read_f4le()
  self.wlx2 = self._io:read_f4le()
  self.wlx3 = self._io:read_f4le()
  self.wlx4 = self._io:read_f4le()
  self.unknown2 = {}
  for i = 0, 9 - 1 do
    self.unknown2[i + 1] = self._io:read_f4le()
  end
  self.ipixfirst = self._io:read_f4le()
  self.ipixlast = self._io:read_f4le()
  self.unknown3 = {}
  for i = 0, 4 - 1 do
    self.unknown3[i + 1] = self._io:read_f4le()
  end
  self.spectrum = {}
  for i = 0, (((self.ipixlast > 0) and math.floor(self.ipixlast) or math.ceil(self.ipixlast) - (self.ipixfirst > 0) and math.floor(self.ipixfirst) or math.ceil(self.ipixfirst)) - 1) - 1 do
    self.spectrum[i + 1] = self._io:read_f4le()
  end
  self.integration_ms = self._io:read_f4le()
  self.averaging = self._io:read_f4le()
  self.pixel_smoothing = self._io:read_f4le()
end


