// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Avantes USB spectrometers are supplied with a Windows binary which 
    /// generates one ROH and one RCM file when the user clicks &quot;Save
    /// experiment&quot;. In the version of 6.0, the ROH file contains a header 
    /// of 22 four-byte floats, then the spectrum as a float array and a 
    /// footer of 3 floats. The first and last pixel numbers are specified in the 
    /// header and determine the (length+1) of the spectral data. In the tested 
    /// files, the length is (2032-211-1)=1820 pixels, but Kaitai determines this 
    /// automatically anyway.
    /// 
    /// The wavelength calibration is stored as a polynomial with coefficients
    /// of 'wlintercept', 'wlx1', ... 'wlx4', the argument of which is the
    /// (pixel number + 1), as found out by comparing with the original 
    /// Avantes converted data files. There is no intensity calibration saved,
    /// but it is recommended to do it in your program - the CCD in the spectrometer 
    /// is so uneven that one should prepare exact pixel-to-pixel calibration curves 
    /// to get reasonable spectral results.
    /// 
    /// The rest of the header floats is not known to the author. Note that the 
    /// newer version of Avantes software has a different format, see also
    /// https://kr.mathworks.com/examples/matlab/community/20341-reading-spectra-from-avantes-binary-files-demonstration
    /// 
    /// The RCM file contains the user-specified comment, so it may be useful
    /// for automatic conversion of data. You may wish to divide the spectra by 
    /// the integration time before comparing them.
    /// 
    /// Written and tested by Filip Dominec, 2017-2018
    /// </summary>
    public partial class AvantesRoh60 : KaitaiStruct
    {
        public static AvantesRoh60 FromFile(string fileName)
        {
            return new AvantesRoh60(new KaitaiStream(fileName));
        }

        public AvantesRoh60(KaitaiStream p__io, KaitaiStruct p__parent = null, AvantesRoh60 p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _unknown1 = m_io.ReadF4le();
            _wlintercept = m_io.ReadF4le();
            _wlx1 = m_io.ReadF4le();
            _wlx2 = m_io.ReadF4le();
            _wlx3 = m_io.ReadF4le();
            _wlx4 = m_io.ReadF4le();
            _unknown2 = new List<float>((int) (9));
            for (var i = 0; i < 9; i++)
            {
                _unknown2.Add(m_io.ReadF4le());
            }
            _ipixfirst = m_io.ReadF4le();
            _ipixlast = m_io.ReadF4le();
            _unknown3 = new List<float>((int) (4));
            for (var i = 0; i < 4; i++)
            {
                _unknown3.Add(m_io.ReadF4le());
            }
            _spectrum = new List<float>((int) ((((long) (Ipixlast) - (long) (Ipixfirst)) - 1)));
            for (var i = 0; i < (((long) (Ipixlast) - (long) (Ipixfirst)) - 1); i++)
            {
                _spectrum.Add(m_io.ReadF4le());
            }
            _integrationMs = m_io.ReadF4le();
            _averaging = m_io.ReadF4le();
            _pixelSmoothing = m_io.ReadF4le();
        }
        private float _unknown1;
        private float _wlintercept;
        private float _wlx1;
        private float _wlx2;
        private float _wlx3;
        private float _wlx4;
        private List<float> _unknown2;
        private float _ipixfirst;
        private float _ipixlast;
        private List<float> _unknown3;
        private List<float> _spectrum;
        private float _integrationMs;
        private float _averaging;
        private float _pixelSmoothing;
        private AvantesRoh60 m_root;
        private KaitaiStruct m_parent;
        public float Unknown1 { get { return _unknown1; } }
        public float Wlintercept { get { return _wlintercept; } }
        public float Wlx1 { get { return _wlx1; } }
        public float Wlx2 { get { return _wlx2; } }
        public float Wlx3 { get { return _wlx3; } }
        public float Wlx4 { get { return _wlx4; } }
        public List<float> Unknown2 { get { return _unknown2; } }
        public float Ipixfirst { get { return _ipixfirst; } }
        public float Ipixlast { get { return _ipixlast; } }
        public List<float> Unknown3 { get { return _unknown3; } }
        public List<float> Spectrum { get { return _spectrum; } }
        public float IntegrationMs { get { return _integrationMs; } }
        public float Averaging { get { return _averaging; } }
        public float PixelSmoothing { get { return _pixelSmoothing; } }
        public AvantesRoh60 M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
