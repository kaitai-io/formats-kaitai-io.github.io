// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.AvantesRoh60 = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
/**
 * Avantes USB spectrometers are supplied with a Windows binary which
 * generates one ROH and one RCM file when the user clicks "Save
 * experiment". In the version of 6.0, the ROH file contains a header
 * of 22 four-byte floats, then the spectrum as a float array and a
 * footer of 3 floats. The first and last pixel numbers are specified in the
 * header and determine the (length+1) of the spectral data. In the tested
 * files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this
 * automatically anyway.
 * 
 * The wavelength calibration is stored as a polynomial with coefficients
 * of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
 * (pixel number + 1), as found out by comparing with the original
 * Avantes converted data files. There is no intensity calibration saved,
 * but it is recommended to do it in your program - the CCD in the spectrometer
 * is so uneven that one should prepare exact pixel-to-pixel calibration curves
 * to get reasonable spectral results.
 * 
 * The rest of the header floats is not known to the author. Note that the
 * newer version of Avantes software has a different format, see also
 * https://kr.mathworks.com/examples/matlab/community/20341-reading-spectra-from-avantes-binary-files-demonstration
 * 
 * The RCM file contains the user-specified comment, so it may be useful
 * for automatic conversion of data. You may wish to divide the spectra by
 * the integration time before comparing them.
 * 
 * Written and tested by Filip Dominec, 2017-2018
 */

var AvantesRoh60 = (function() {
  function AvantesRoh60(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  AvantesRoh60.prototype._read = function() {
    this.unknown1 = this._io.readF4le();
    this.wlintercept = this._io.readF4le();
    this.wlx1 = this._io.readF4le();
    this.wlx2 = this._io.readF4le();
    this.wlx3 = this._io.readF4le();
    this.wlx4 = this._io.readF4le();
    this.unknown2 = new Array(9);
    for (var i = 0; i < 9; i++) {
      this.unknown2[i] = this._io.readF4le();
    }
    this.ipixfirst = this._io.readF4le();
    this.ipixlast = this._io.readF4le();
    this.unknown3 = new Array(4);
    for (var i = 0; i < 4; i++) {
      this.unknown3[i] = this._io.readF4le();
    }
    this.spectrum = new Array(((Math.trunc(this.ipixlast) - Math.trunc(this.ipixfirst)) - 1));
    for (var i = 0; i < ((Math.trunc(this.ipixlast) - Math.trunc(this.ipixfirst)) - 1); i++) {
      this.spectrum[i] = this._io.readF4le();
    }
    this.integrationMs = this._io.readF4le();
    this.averaging = this._io.readF4le();
    this.pixelSmoothing = this._io.readF4le();
  }

  return AvantesRoh60;
})();
return AvantesRoh60;
}));
