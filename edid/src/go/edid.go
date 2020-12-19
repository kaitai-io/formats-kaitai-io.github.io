// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)

type Edid struct {
	Magic []byte
	MfgBytes uint16
	ProductCode uint16
	Serial uint32
	MfgWeek uint8
	MfgYearMod uint8
	EdidVersionMajor uint8
	EdidVersionMinor uint8
	InputFlags uint8
	ScreenSizeH uint8
	ScreenSizeV uint8
	GammaMod uint8
	FeaturesFlags uint8
	Chromacity *Edid_ChromacityInfo
	EstTimings *Edid_EstTimingsInfo
	StdTimings []*Edid_StdTiming
	_io *kaitai.Stream
	_root *Edid
	_parent interface{}
	_f_mfgYear bool
	mfgYear int
	_f_mfgIdCh1 bool
	mfgIdCh1 int
	_f_mfgIdCh3 bool
	mfgIdCh3 int
	_f_gamma bool
	gamma float64
	_f_mfgIdCh2 bool
	mfgIdCh2 int
}
func NewEdid() *Edid {
	return &Edid{
	}
}

func (this *Edid) Read(io *kaitai.Stream, parent interface{}, root *Edid) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{0, 255, 255, 255, 255, 255, 255, 0})) {
		return kaitai.NewValidationNotEqualError([]uint8{0, 255, 255, 255, 255, 255, 255, 0}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.MfgBytes = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ProductCode = uint16(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Serial = uint32(tmp4)
	tmp5, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MfgWeek = tmp5
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.MfgYearMod = tmp6
	tmp7, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.EdidVersionMajor = tmp7
	tmp8, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.EdidVersionMinor = tmp8
	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.InputFlags = tmp9
	tmp10, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ScreenSizeH = tmp10
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ScreenSizeV = tmp11
	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.GammaMod = tmp12
	tmp13, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FeaturesFlags = tmp13
	tmp14 := NewEdid_ChromacityInfo()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Chromacity = tmp14
	tmp15 := NewEdid_EstTimingsInfo()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.EstTimings = tmp15
	this.StdTimings = make([]*Edid_StdTiming, 8)
	for i := range this.StdTimings {
		tmp16 := NewEdid_StdTiming()
		err = tmp16.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.StdTimings[i] = tmp16
	}
	return err
}
func (this *Edid) MfgYear() (v int, err error) {
	if (this._f_mfgYear) {
		return this.mfgYear, nil
	}
	this.mfgYear = int((this.MfgYearMod + 1990))
	this._f_mfgYear = true
	return this.mfgYear, nil
}
func (this *Edid) MfgIdCh1() (v int, err error) {
	if (this._f_mfgIdCh1) {
		return this.mfgIdCh1, nil
	}
	this.mfgIdCh1 = int(((this.MfgBytes & 31744) >> 10))
	this._f_mfgIdCh1 = true
	return this.mfgIdCh1, nil
}
func (this *Edid) MfgIdCh3() (v int, err error) {
	if (this._f_mfgIdCh3) {
		return this.mfgIdCh3, nil
	}
	this.mfgIdCh3 = int((this.MfgBytes & 31))
	this._f_mfgIdCh3 = true
	return this.mfgIdCh3, nil
}
func (this *Edid) Gamma() (v float64, err error) {
	if (this._f_gamma) {
		return this.gamma, nil
	}
	if (this.GammaMod != 255) {
		this.gamma = float64(((this.GammaMod + 100) / 100.0))
	}
	this._f_gamma = true
	return this.gamma, nil
}
func (this *Edid) MfgIdCh2() (v int, err error) {
	if (this._f_mfgIdCh2) {
		return this.mfgIdCh2, nil
	}
	this.mfgIdCh2 = int(((this.MfgBytes & 992) >> 5))
	this._f_mfgIdCh2 = true
	return this.mfgIdCh2, nil
}

/**
 * Manufacturer product code
 */

/**
 * Serial number
 */

/**
 * Week of manufacture. Week numbering is not consistent between manufacturers.
 */

/**
 * Year of manufacture, less 1990. (1990–2245). If week=255, it is the model year instead.
 */

/**
 * EDID version, usually 1 (for 1.3)
 */

/**
 * EDID revision, usually 3 (for 1.3)
 */

/**
 * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
 */

/**
 * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
 */

/**
 * Display gamma, datavalue = (gamma*100)-100 (range 1.00–3.54)
 */

/**
 * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
 * @see "Standard, section 3.7"
 */

/**
 * Block of bit flags that indicates support of so called
 * "established timings", which is a commonly used subset of VESA
 * DMT (Discrete Monitor Timings) modes.
 * @see "Standard, section 3.8"
 */

/**
 * Array of descriptions of so called "standard timings", which are
 * used to specify up to 8 additional timings not included in
 * "established timings".
 */

/**
 * Chromaticity information: colorimetry and white point
 * coordinates. All coordinates are stored as fixed precision
 * 10-bit numbers, bits are shuffled for compactness.
 */
type Edid_ChromacityInfo struct {
	RedX10 uint64
	RedY10 uint64
	GreenX10 uint64
	GreenY10 uint64
	BlueX10 uint64
	BlueY10 uint64
	WhiteX10 uint64
	WhiteY10 uint64
	RedX92 uint8
	RedY92 uint8
	GreenX92 uint8
	GreenY92 uint8
	BlueX92 uint8
	BlueY92 uint8
	WhiteX92 uint8
	WhiteY92 uint8
	_io *kaitai.Stream
	_root *Edid
	_parent *Edid
	_f_greenXInt bool
	greenXInt int
	_f_redY bool
	redY float64
	_f_greenYInt bool
	greenYInt int
	_f_whiteY bool
	whiteY float64
	_f_redX bool
	redX float64
	_f_whiteX bool
	whiteX float64
	_f_blueX bool
	blueX float64
	_f_whiteXInt bool
	whiteXInt int
	_f_whiteYInt bool
	whiteYInt int
	_f_greenX bool
	greenX float64
	_f_redXInt bool
	redXInt int
	_f_redYInt bool
	redYInt int
	_f_blueXInt bool
	blueXInt int
	_f_blueY bool
	blueY float64
	_f_greenY bool
	greenY float64
	_f_blueYInt bool
	blueYInt int
}
func NewEdid_ChromacityInfo() *Edid_ChromacityInfo {
	return &Edid_ChromacityInfo{
	}
}

func (this *Edid_ChromacityInfo) Read(io *kaitai.Stream, parent *Edid, root *Edid) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp17, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.RedX10 = tmp17
	tmp18, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.RedY10 = tmp18
	tmp19, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.GreenX10 = tmp19
	tmp20, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.GreenY10 = tmp20
	tmp21, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.BlueX10 = tmp21
	tmp22, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.BlueY10 = tmp22
	tmp23, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.WhiteX10 = tmp23
	tmp24, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.WhiteY10 = tmp24
	this._io.AlignToByte()
	tmp25, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RedX92 = tmp25
	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.RedY92 = tmp26
	tmp27, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.GreenX92 = tmp27
	tmp28, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.GreenY92 = tmp28
	tmp29, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlueX92 = tmp29
	tmp30, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.BlueY92 = tmp30
	tmp31, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.WhiteX92 = tmp31
	tmp32, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.WhiteY92 = tmp32
	return err
}
func (this *Edid_ChromacityInfo) GreenXInt() (v int, err error) {
	if (this._f_greenXInt) {
		return this.greenXInt, nil
	}
	this.greenXInt = int(((this.GreenX92 << 2) | this.GreenX10))
	this._f_greenXInt = true
	return this.greenXInt, nil
}

/**
 * Red Y coordinate
 */
func (this *Edid_ChromacityInfo) RedY() (v float64, err error) {
	if (this._f_redY) {
		return this.redY, nil
	}
	tmp33, err := this.RedYInt()
	if err != nil {
		return 0, err
	}
	this.redY = float64((tmp33 / 1024.0))
	this._f_redY = true
	return this.redY, nil
}
func (this *Edid_ChromacityInfo) GreenYInt() (v int, err error) {
	if (this._f_greenYInt) {
		return this.greenYInt, nil
	}
	this.greenYInt = int(((this.GreenY92 << 2) | this.GreenY10))
	this._f_greenYInt = true
	return this.greenYInt, nil
}

/**
 * White Y coordinate
 */
func (this *Edid_ChromacityInfo) WhiteY() (v float64, err error) {
	if (this._f_whiteY) {
		return this.whiteY, nil
	}
	tmp34, err := this.WhiteYInt()
	if err != nil {
		return 0, err
	}
	this.whiteY = float64((tmp34 / 1024.0))
	this._f_whiteY = true
	return this.whiteY, nil
}

/**
 * Red X coordinate
 */
func (this *Edid_ChromacityInfo) RedX() (v float64, err error) {
	if (this._f_redX) {
		return this.redX, nil
	}
	tmp35, err := this.RedXInt()
	if err != nil {
		return 0, err
	}
	this.redX = float64((tmp35 / 1024.0))
	this._f_redX = true
	return this.redX, nil
}

/**
 * White X coordinate
 */
func (this *Edid_ChromacityInfo) WhiteX() (v float64, err error) {
	if (this._f_whiteX) {
		return this.whiteX, nil
	}
	tmp36, err := this.WhiteXInt()
	if err != nil {
		return 0, err
	}
	this.whiteX = float64((tmp36 / 1024.0))
	this._f_whiteX = true
	return this.whiteX, nil
}

/**
 * Blue X coordinate
 */
func (this *Edid_ChromacityInfo) BlueX() (v float64, err error) {
	if (this._f_blueX) {
		return this.blueX, nil
	}
	tmp37, err := this.BlueXInt()
	if err != nil {
		return 0, err
	}
	this.blueX = float64((tmp37 / 1024.0))
	this._f_blueX = true
	return this.blueX, nil
}
func (this *Edid_ChromacityInfo) WhiteXInt() (v int, err error) {
	if (this._f_whiteXInt) {
		return this.whiteXInt, nil
	}
	this.whiteXInt = int(((this.WhiteX92 << 2) | this.WhiteX10))
	this._f_whiteXInt = true
	return this.whiteXInt, nil
}
func (this *Edid_ChromacityInfo) WhiteYInt() (v int, err error) {
	if (this._f_whiteYInt) {
		return this.whiteYInt, nil
	}
	this.whiteYInt = int(((this.WhiteY92 << 2) | this.WhiteY10))
	this._f_whiteYInt = true
	return this.whiteYInt, nil
}

/**
 * Green X coordinate
 */
func (this *Edid_ChromacityInfo) GreenX() (v float64, err error) {
	if (this._f_greenX) {
		return this.greenX, nil
	}
	tmp38, err := this.GreenXInt()
	if err != nil {
		return 0, err
	}
	this.greenX = float64((tmp38 / 1024.0))
	this._f_greenX = true
	return this.greenX, nil
}
func (this *Edid_ChromacityInfo) RedXInt() (v int, err error) {
	if (this._f_redXInt) {
		return this.redXInt, nil
	}
	this.redXInt = int(((this.RedX92 << 2) | this.RedX10))
	this._f_redXInt = true
	return this.redXInt, nil
}
func (this *Edid_ChromacityInfo) RedYInt() (v int, err error) {
	if (this._f_redYInt) {
		return this.redYInt, nil
	}
	this.redYInt = int(((this.RedY92 << 2) | this.RedY10))
	this._f_redYInt = true
	return this.redYInt, nil
}
func (this *Edid_ChromacityInfo) BlueXInt() (v int, err error) {
	if (this._f_blueXInt) {
		return this.blueXInt, nil
	}
	this.blueXInt = int(((this.BlueX92 << 2) | this.BlueX10))
	this._f_blueXInt = true
	return this.blueXInt, nil
}

/**
 * Blue Y coordinate
 */
func (this *Edid_ChromacityInfo) BlueY() (v float64, err error) {
	if (this._f_blueY) {
		return this.blueY, nil
	}
	tmp39, err := this.BlueYInt()
	if err != nil {
		return 0, err
	}
	this.blueY = float64((tmp39 / 1024.0))
	this._f_blueY = true
	return this.blueY, nil
}

/**
 * Green Y coordinate
 */
func (this *Edid_ChromacityInfo) GreenY() (v float64, err error) {
	if (this._f_greenY) {
		return this.greenY, nil
	}
	tmp40, err := this.GreenYInt()
	if err != nil {
		return 0, err
	}
	this.greenY = float64((tmp40 / 1024.0))
	this._f_greenY = true
	return this.greenY, nil
}
func (this *Edid_ChromacityInfo) BlueYInt() (v int, err error) {
	if (this._f_blueYInt) {
		return this.blueYInt, nil
	}
	this.blueYInt = int(((this.BlueY92 << 2) | this.BlueY10))
	this._f_blueYInt = true
	return this.blueYInt, nil
}

/**
 * Red X, bits 1..0
 */

/**
 * Red Y, bits 1..0
 */

/**
 * Green X, bits 1..0
 */

/**
 * Green Y, bits 1..0
 */

/**
 * Blue X, bits 1..0
 */

/**
 * Blue Y, bits 1..0
 */

/**
 * White X, bits 1..0
 */

/**
 * White Y, bits 1..0
 */

/**
 * Red X, bits 9..2
 */

/**
 * Red Y, bits 9..2
 */

/**
 * Green X, bits 9..2
 */

/**
 * Green Y, bits 9..2
 */

/**
 * Blue X, bits 9..2
 */

/**
 * Blue Y, bits 9..2
 */

/**
 * White X, bits 9..2
 */

/**
 * White Y, bits 9..2
 */
type Edid_EstTimingsInfo struct {
	Can72040070 bool
	Can72040088 bool
	Can64048060 bool
	Can64048067 bool
	Can64048072 bool
	Can64048075 bool
	Can80060056 bool
	Can80060060 bool
	Can80060072 bool
	Can80060075 bool
	Can83262475 bool
	Can102476887I bool
	Can102476860 bool
	Can102476870 bool
	Can102476875 bool
	Can1280102475 bool
	Can115287075 bool
	Reserved uint64
	_io *kaitai.Stream
	_root *Edid
	_parent *Edid
}
func NewEdid_EstTimingsInfo() *Edid_EstTimingsInfo {
	return &Edid_EstTimingsInfo{
	}
}

func (this *Edid_EstTimingsInfo) Read(io *kaitai.Stream, parent *Edid, root *Edid) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can72040070 = tmp41 != 0
	tmp42, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can72040088 = tmp42 != 0
	tmp43, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can64048060 = tmp43 != 0
	tmp44, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can64048067 = tmp44 != 0
	tmp45, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can64048072 = tmp45 != 0
	tmp46, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can64048075 = tmp46 != 0
	tmp47, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can80060056 = tmp47 != 0
	tmp48, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can80060060 = tmp48 != 0
	tmp49, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can80060072 = tmp49 != 0
	tmp50, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can80060075 = tmp50 != 0
	tmp51, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can83262475 = tmp51 != 0
	tmp52, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can102476887I = tmp52 != 0
	tmp53, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can102476860 = tmp53 != 0
	tmp54, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can102476870 = tmp54 != 0
	tmp55, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can102476875 = tmp55 != 0
	tmp56, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can1280102475 = tmp56 != 0
	tmp57, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Can115287075 = tmp57 != 0
	tmp58, err := this._io.ReadBitsIntBe(7)
	if err != nil {
		return err
	}
	this.Reserved = tmp58
	return err
}

/**
 * Supports 720 x 400 @ 70Hz
 */

/**
 * Supports 720 x 400 @ 88Hz
 */

/**
 * Supports 640 x 480 @ 60Hz
 */

/**
 * Supports 640 x 480 @ 67Hz
 */

/**
 * Supports 640 x 480 @ 72Hz
 */

/**
 * Supports 640 x 480 @ 75Hz
 */

/**
 * Supports 800 x 600 @ 56Hz
 */

/**
 * Supports 800 x 600 @ 60Hz
 */

/**
 * Supports 800 x 600 @ 72Hz
 */

/**
 * Supports 800 x 600 @ 75Hz
 */

/**
 * Supports 832 x 624 @ 75Hz
 */

/**
 * Supports 1024 x 768 @ 87Hz(I)
 */

/**
 * Supports 1024 x 768 @ 60Hz
 */

/**
 * Supports 1024 x 768 @ 70Hz
 */

/**
 * Supports 1024 x 768 @ 75Hz
 */

/**
 * Supports 1280 x 1024 @ 75Hz
 */

/**
 * Supports 1152 x 870 @ 75Hz
 */

type Edid_StdTiming_AspectRatios int
const (
	Edid_StdTiming_AspectRatios__Ratio1610 Edid_StdTiming_AspectRatios = 0
	Edid_StdTiming_AspectRatios__Ratio43 Edid_StdTiming_AspectRatios = 1
	Edid_StdTiming_AspectRatios__Ratio54 Edid_StdTiming_AspectRatios = 2
	Edid_StdTiming_AspectRatios__Ratio169 Edid_StdTiming_AspectRatios = 3
)
type Edid_StdTiming struct {
	HorizActivePixelsMod uint8
	AspectRatio Edid_StdTiming_AspectRatios
	RefreshRateMod uint64
	_io *kaitai.Stream
	_root *Edid
	_parent *Edid
	_f_horizActivePixels bool
	horizActivePixels int
	_f_refreshRate bool
	refreshRate int
}
func NewEdid_StdTiming() *Edid_StdTiming {
	return &Edid_StdTiming{
	}
}

func (this *Edid_StdTiming) Read(io *kaitai.Stream, parent *Edid, root *Edid) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.HorizActivePixelsMod = tmp59
	tmp60, err := this._io.ReadBitsIntBe(2)
	if err != nil {
		return err
	}
	this.AspectRatio = Edid_StdTiming_AspectRatios(tmp60)
	tmp61, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.RefreshRateMod = tmp61
	return err
}

/**
 * Range of horizontal active pixels.
 */
func (this *Edid_StdTiming) HorizActivePixels() (v int, err error) {
	if (this._f_horizActivePixels) {
		return this.horizActivePixels, nil
	}
	this.horizActivePixels = int(((this.HorizActivePixelsMod + 31) * 8))
	this._f_horizActivePixels = true
	return this.horizActivePixels, nil
}

/**
 * Vertical refresh rate, Hz.
 */
func (this *Edid_StdTiming) RefreshRate() (v int, err error) {
	if (this._f_refreshRate) {
		return this.refreshRate, nil
	}
	this.refreshRate = int((this.RefreshRateMod + 60))
	this._f_refreshRate = true
	return this.refreshRate, nil
}

/**
 * Range of horizontal active pixels, written in modified form:
 * `(horiz_active_pixels / 8) - 31`. This yields an effective
 * range of 256..2288, with steps of 8 pixels.
 */

/**
 * Aspect ratio of the image. Can be used to calculate number
 * of vertical pixels.
 */

/**
 * Refresh rate in Hz, written in modified form: `refresh_rate
 * - 60`. This yields an effective range of 60..123 Hz.
 */