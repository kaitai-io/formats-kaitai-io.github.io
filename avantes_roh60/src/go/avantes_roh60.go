// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


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
type AvantesRoh60 struct {
	Unknown1 float32
	Wlintercept float32
	Wlx1 float32
	Wlx2 float32
	Wlx3 float32
	Wlx4 float32
	Unknown2 []float32
	Ipixfirst float32
	Ipixlast float32
	Unknown3 []float32
	Spectrum []float32
	IntegrationMs float32
	Averaging float32
	PixelSmoothing float32
	_io *kaitai.Stream
	_root *AvantesRoh60
	_parent interface{}
}
func NewAvantesRoh60() *AvantesRoh60 {
	return &AvantesRoh60{
	}
}

func (this *AvantesRoh60) Read(io *kaitai.Stream, parent interface{}, root *AvantesRoh60) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Unknown1 = float32(tmp1)
	tmp2, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Wlintercept = float32(tmp2)
	tmp3, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Wlx1 = float32(tmp3)
	tmp4, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Wlx2 = float32(tmp4)
	tmp5, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Wlx3 = float32(tmp5)
	tmp6, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Wlx4 = float32(tmp6)
	this.Unknown2 = make([]float32, 9)
	for i := range this.Unknown2 {
		tmp7, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Unknown2[i] = tmp7
	}
	tmp8, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Ipixfirst = float32(tmp8)
	tmp9, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Ipixlast = float32(tmp9)
	this.Unknown3 = make([]float32, 4)
	for i := range this.Unknown3 {
		tmp10, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Unknown3[i] = tmp10
	}
	this.Spectrum = make([]float32, ((int(this.Ipixlast) - int(this.Ipixfirst)) - 1))
	for i := range this.Spectrum {
		tmp11, err := this._io.ReadF4le()
		if err != nil {
			return err
		}
		this.Spectrum[i] = tmp11
	}
	tmp12, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.IntegrationMs = float32(tmp12)
	tmp13, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.Averaging = float32(tmp13)
	tmp14, err := this._io.ReadF4le()
	if err != nil {
		return err
	}
	this.PixelSmoothing = float32(tmp14)
	return err
}
