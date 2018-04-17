#ifndef AVANTES_ROH60_H_
#define AVANTES_ROH60_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>
#include <vector>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

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

class avantes_roh60_t : public kaitai::kstruct {

public:

    avantes_roh60_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, avantes_roh60_t* p__root = 0);

private:
    void _read();

public:
    ~avantes_roh60_t();

private:
    float m_unknown1;
    float m_wlintercept;
    float m_wlx1;
    float m_wlx2;
    float m_wlx3;
    float m_wlx4;
    std::vector<float>* m_unknown2;
    float m_ipixfirst;
    float m_ipixlast;
    std::vector<float>* m_unknown3;
    std::vector<float>* m_spectrum;
    float m_integration_ms;
    float m_averaging;
    float m_pixel_smoothing;
    avantes_roh60_t* m__root;
    kaitai::kstruct* m__parent;

public:
    float unknown1() const { return m_unknown1; }
    float wlintercept() const { return m_wlintercept; }
    float wlx1() const { return m_wlx1; }
    float wlx2() const { return m_wlx2; }
    float wlx3() const { return m_wlx3; }
    float wlx4() const { return m_wlx4; }
    std::vector<float>* unknown2() const { return m_unknown2; }
    float ipixfirst() const { return m_ipixfirst; }
    float ipixlast() const { return m_ipixlast; }
    std::vector<float>* unknown3() const { return m_unknown3; }
    std::vector<float>* spectrum() const { return m_spectrum; }
    float integration_ms() const { return m_integration_ms; }
    float averaging() const { return m_averaging; }
    float pixel_smoothing() const { return m_pixel_smoothing; }
    avantes_roh60_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // AVANTES_ROH60_H_
