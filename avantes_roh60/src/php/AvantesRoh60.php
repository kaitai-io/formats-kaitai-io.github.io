<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

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
 * <https://www.mathworks.com/matlabcentral/fileexchange/37103-avantes-to-matlab>
 * 
 * The RCM file contains the user-specified comment, so it may be useful
 * for automatic conversion of data. You may wish to divide the spectra by
 * the integration time before comparing them.
 * 
 * Written and tested by Filip Dominec, 2017-2018
 */

namespace {
    class AvantesRoh60 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, \Kaitai\Struct\Struct $_parent = null, \AvantesRoh60 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_unknown1 = $this->_io->readF4le();
            $this->_m_wlintercept = $this->_io->readF4le();
            $this->_m_wlx1 = $this->_io->readF4le();
            $this->_m_wlx2 = $this->_io->readF4le();
            $this->_m_wlx3 = $this->_io->readF4le();
            $this->_m_wlx4 = $this->_io->readF4le();
            $this->_m_unknown2 = [];
            $n = 9;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_unknown2[] = $this->_io->readF4le();
            }
            $this->_m_ipixfirst = $this->_io->readF4le();
            $this->_m_ipixlast = $this->_io->readF4le();
            $this->_m_unknown3 = [];
            $n = 4;
            for ($i = 0; $i < $n; $i++) {
                $this->_m_unknown3[] = $this->_io->readF4le();
            }
            $this->_m_spectrum = [];
            $n = ((intval($this->ipixlast()) - intval($this->ipixfirst())) - 1);
            for ($i = 0; $i < $n; $i++) {
                $this->_m_spectrum[] = $this->_io->readF4le();
            }
            $this->_m_integrationMs = $this->_io->readF4le();
            $this->_m_averaging = $this->_io->readF4le();
            $this->_m_pixelSmoothing = $this->_io->readF4le();
        }
        protected $_m_unknown1;
        protected $_m_wlintercept;
        protected $_m_wlx1;
        protected $_m_wlx2;
        protected $_m_wlx3;
        protected $_m_wlx4;
        protected $_m_unknown2;
        protected $_m_ipixfirst;
        protected $_m_ipixlast;
        protected $_m_unknown3;
        protected $_m_spectrum;
        protected $_m_integrationMs;
        protected $_m_averaging;
        protected $_m_pixelSmoothing;
        public function unknown1() { return $this->_m_unknown1; }
        public function wlintercept() { return $this->_m_wlintercept; }
        public function wlx1() { return $this->_m_wlx1; }
        public function wlx2() { return $this->_m_wlx2; }
        public function wlx3() { return $this->_m_wlx3; }
        public function wlx4() { return $this->_m_wlx4; }
        public function unknown2() { return $this->_m_unknown2; }
        public function ipixfirst() { return $this->_m_ipixfirst; }
        public function ipixlast() { return $this->_m_ipixlast; }
        public function unknown3() { return $this->_m_unknown3; }
        public function spectrum() { return $this->_m_spectrum; }
        public function integrationMs() { return $this->_m_integrationMs; }
        public function averaging() { return $this->_m_averaging; }
        public function pixelSmoothing() { return $this->_m_pixelSmoothing; }
    }
}
