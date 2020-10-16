// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */

type Specpr_RecordType int
const (
	Specpr_RecordType__DataInitial Specpr_RecordType = 0
	Specpr_RecordType__TextInitial Specpr_RecordType = 1
	Specpr_RecordType__DataContinuation Specpr_RecordType = 2
	Specpr_RecordType__TextContinuation Specpr_RecordType = 3
)
type Specpr struct {
	Records []*Specpr_Record
	_io *kaitai.Stream
	_root *Specpr
	_parent interface{}
}
func NewSpecpr() *Specpr {
	return &Specpr{
	}
}

func (this *Specpr) Read(io *kaitai.Stream, parent interface{}, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp1 {
			break
		}
		tmp2 := NewSpecpr_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp2)
	}
	return err
}
type Specpr_DataInitial struct {
	Ids *Specpr_Identifiers
	Iscta *Specpr_CoarseTimestamp
	Isctb *Specpr_CoarseTimestamp
	Jdatea int32
	Jdateb int32
	Istb *Specpr_CoarseTimestamp
	Isra int32
	Isdec int32
	Itchan int32
	Irmas int32
	Revs int32
	Iband []int32
	Irwav int32
	Irespt int32
	Irecno int32
	Itpntr int32
	Ihist string
	Mhist []string
	Nruns int32
	Siangl *Specpr_IllumAngle
	Seangl *Specpr_IllumAngle
	Sphase int32
	Iwtrns int32
	Itimch int32
	Xnrm float32
	Scatim float32
	Timint float32
	Tempd float32
	Data []float32
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_Record
	_f_phaseAngleArcsec bool
	phaseAngleArcsec float64
}
func NewSpecpr_DataInitial() *Specpr_DataInitial {
	return &Specpr_DataInitial{
	}
}

func (this *Specpr_DataInitial) Read(io *kaitai.Stream, parent *Specpr_Record, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3 := NewSpecpr_Identifiers()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ids = tmp3
	tmp4 := NewSpecpr_CoarseTimestamp()
	err = tmp4.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Iscta = tmp4
	tmp5 := NewSpecpr_CoarseTimestamp()
	err = tmp5.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Isctb = tmp5
	tmp6, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Jdatea = int32(tmp6)
	tmp7, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Jdateb = int32(tmp7)
	tmp8 := NewSpecpr_CoarseTimestamp()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Istb = tmp8
	tmp9, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Isra = int32(tmp9)
	tmp10, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Isdec = int32(tmp10)
	tmp11, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Itchan = int32(tmp11)
	tmp12, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Irmas = int32(tmp12)
	tmp13, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Revs = int32(tmp13)
	this.Iband = make([]int32, 2)
	for i := range this.Iband {
		tmp14, err := this._io.ReadS4be()
		if err != nil {
			return err
		}
		this.Iband[i] = tmp14
	}
	tmp15, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Irwav = int32(tmp15)
	tmp16, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Irespt = int32(tmp16)
	tmp17, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Irecno = int32(tmp17)
	tmp18, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Itpntr = int32(tmp18)
	tmp19, err := this._io.ReadBytes(int(60))
	if err != nil {
		return err
	}
	tmp19 = kaitai.BytesStripRight(tmp19, 32)
	this.Ihist = string(tmp19)
	this.Mhist = make([]string, 4)
	for i := range this.Mhist {
		tmp20, err := this._io.ReadBytes(int(74))
		if err != nil {
			return err
		}
		tmp20 = tmp20
		this.Mhist[i] = string(tmp20)
	}
	tmp21, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Nruns = int32(tmp21)
	tmp22 := NewSpecpr_IllumAngle()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Siangl = tmp22
	tmp23 := NewSpecpr_IllumAngle()
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Seangl = tmp23
	tmp24, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Sphase = int32(tmp24)
	tmp25, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Iwtrns = int32(tmp25)
	tmp26, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Itimch = int32(tmp26)
	tmp27, err := this._io.ReadF4be()
	if err != nil {
		return err
	}
	this.Xnrm = float32(tmp27)
	tmp28, err := this._io.ReadF4be()
	if err != nil {
		return err
	}
	this.Scatim = float32(tmp28)
	tmp29, err := this._io.ReadF4be()
	if err != nil {
		return err
	}
	this.Timint = float32(tmp29)
	tmp30, err := this._io.ReadF4be()
	if err != nil {
		return err
	}
	this.Tempd = float32(tmp30)
	this.Data = make([]float32, 256)
	for i := range this.Data {
		tmp31, err := this._io.ReadF4be()
		if err != nil {
			return err
		}
		this.Data[i] = tmp31
	}
	return err
}

/**
 * The phase angle between iangl and eangl in seconds
 */
func (this *Specpr_DataInitial) PhaseAngleArcsec() (v float64, err error) {
	if (this._f_phaseAngleArcsec) {
		return this.phaseAngleArcsec, nil
	}
	this.phaseAngleArcsec = float64((this.Sphase / 1500))
	this._f_phaseAngleArcsec = true
	return this.phaseAngleArcsec, nil
}

/**
 * Civil or Universal time when data was last processed
 */

/**
 * Civil or Universal time at the start of the spectral run
 */

/**
 * Date when data was last processed. Stored as integer*4 Julian Day number *10
 */

/**
 * Date when the spectral run began. Stored as integer*4 Julian Day number *10
 */

/**
 * Siderial time when the spectral run started. See flag #05.
 */

/**
 * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
 */

/**
 * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
 */

/**
 * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
 */

/**
 * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
 */

/**
 * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
 */

/**
 * The channel numbers which define the band normalization (scaling to unity). (integers*4).
 */

/**
 * The record number within the file where the wavelengths are found (integer*4).
 */

/**
 * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
 */

/**
 * The record number within the file where the data is located (integer*4 number).
 */

/**
 * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
 */

/**
 * The program automatic 60 character history.
 */

/**
 * Manual history. Program automatic for large history requirements.
 */

/**
 * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
 */

/**
 * The angle of incidence of illuminating radiation
 *       integrating sphere = 2000000000
 *       Geometric albedo   = 2000000001
 */

/**
 * The angle of emission of illuminating radiation
 *       integrating sphere = 2000000000
 *       Geometric albedo   = 2000000001
 */

/**
 * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
 *       integrating sphere = 2000000000
 */

/**
 * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
 */

/**
 * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
 */

/**
 * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
 */

/**
 * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
 */

/**
 * Total integration time (usually=scatime * nruns) (32 bit real number).
 */

/**
 * Temperature in degrees Kelvin (32 bit real number).
 */

/**
 * The spectral data (256 channels of 32 bit real data numbers).
 */
type Specpr_CoarseTimestamp struct {
	ScaledSeconds int32
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_DataInitial
	_f_seconds bool
	seconds float64
}
func NewSpecpr_CoarseTimestamp() *Specpr_CoarseTimestamp {
	return &Specpr_CoarseTimestamp{
	}
}

func (this *Specpr_CoarseTimestamp) Read(io *kaitai.Stream, parent *Specpr_DataInitial, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.ScaledSeconds = int32(tmp32)
	return err
}
func (this *Specpr_CoarseTimestamp) Seconds() (v float64, err error) {
	if (this._f_seconds) {
		return this.seconds, nil
	}
	this.seconds = float64((this.ScaledSeconds * 24000))
	this._f_seconds = true
	return this.seconds, nil
}

/**
 * it is big endian
 */
type Specpr_Icflag struct {
	Reserved uint64
	IsctbType bool
	IsctaType bool
	CoordinateMode bool
	Errors bool
	Text bool
	Continuation bool
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_Record
	_f_type bool
	type Specpr_RecordType
}
func NewSpecpr_Icflag() *Specpr_Icflag {
	return &Specpr_Icflag{
	}
}

func (this *Specpr_Icflag) Read(io *kaitai.Stream, parent *Specpr_Record, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadBitsIntBe(26)
	if err != nil {
		return err
	}
	this.Reserved = tmp33
	tmp34, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsctbType = tmp34 != 0
	tmp35, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsctaType = tmp35 != 0
	tmp36, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.CoordinateMode = tmp36 != 0
	tmp37, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Errors = tmp37 != 0
	tmp38, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Text = tmp38 != 0
	tmp39, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Continuation = tmp39 != 0
	return err
}
func (this *Specpr_Icflag) Type() (v Specpr_RecordType, err error) {
	if (this._f_type) {
		return this.type, nil
	}
	tmp40 := 0
	if this.Text {
		tmp40 = 1
	}
	tmp41 := 0
	if this.Continuation {
		tmp41 = 1
	}
	this.type = Specpr_RecordType(Specpr_RecordType(((tmp40 * 1) + (tmp41 * 2))))
	this._f_type = true
	return this.type, nil
}

/**
 * =0 ctb is civil time
 * =1 ctb is universal time
 */

/**
 * =0 cta is civil time
 * =1 cta is universal time
 */

/**
 * RA, Dec / Long., Lat flag
 * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
 * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
 */

/**
 * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
 */

/**
 * =0 the data in the array "data" is data
 * =1 the data in the array "data" is ascii text as is most of the header info.
 */

/**
 * =0 first record of a spectrum consists of: header then 256 data channels
 * =1 continuation data record consisting of:
 *   # bit flags followed by 1532 bytes of
 *   # real data (bit 1=0) (383 channels)
 *   # or 1532 bytes of text (bit 1=1).
 *   # A maximum of 12 continuation records
 *   # are allowed for a total of 4852
 *   # channels (limited by arrays of 4864)
 *   # or 19860 characters of text (bit 1=1).
 */
type Specpr_DataContinuation struct {
	Cdata []float32
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_Record
}
func NewSpecpr_DataContinuation() *Specpr_DataContinuation {
	return &Specpr_DataContinuation{
	}
}

func (this *Specpr_DataContinuation) Read(io *kaitai.Stream, parent *Specpr_Record, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.Cdata = make([]float32, 383)
	for i := range this.Cdata {
		tmp42, err := this._io.ReadF4be()
		if err != nil {
			return err
		}
		this.Cdata[i] = tmp42
	}
	return err
}

/**
 * The continuation of the data values (383 channels of 32 bit real numbers).
 */
type Specpr_Identifiers struct {
	Ititle string
	Usernm string
	_io *kaitai.Stream
	_root *Specpr
	_parent interface{}
}
func NewSpecpr_Identifiers() *Specpr_Identifiers {
	return &Specpr_Identifiers{
	}
}

func (this *Specpr_Identifiers) Read(io *kaitai.Stream, parent interface{}, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp43, err := this._io.ReadBytes(int(40))
	if err != nil {
		return err
	}
	tmp43 = kaitai.BytesStripRight(tmp43, 32)
	this.Ititle = string(tmp43)
	tmp44, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp44 = tmp44
	this.Usernm = string(tmp44)
	return err
}

/**
 * Title which describes the data
 */

/**
 * The name of the user who created the data record
 */
type Specpr_IllumAngle struct {
	Angl int32
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_DataInitial
	_f_secondsTotal bool
	secondsTotal int
	_f_minutesTotal bool
	minutesTotal int
	_f_degreesTotal bool
	degreesTotal int
}
func NewSpecpr_IllumAngle() *Specpr_IllumAngle {
	return &Specpr_IllumAngle{
	}
}

func (this *Specpr_IllumAngle) Read(io *kaitai.Stream, parent *Specpr_DataInitial, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp45, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Angl = int32(tmp45)
	return err
}
func (this *Specpr_IllumAngle) SecondsTotal() (v int, err error) {
	if (this._f_secondsTotal) {
		return this.secondsTotal, nil
	}
	this.secondsTotal = int((this.Angl / 6000))
	this._f_secondsTotal = true
	return this.secondsTotal, nil
}
func (this *Specpr_IllumAngle) MinutesTotal() (v int, err error) {
	if (this._f_minutesTotal) {
		return this.minutesTotal, nil
	}
	tmp46, err := this.SecondsTotal()
	if err != nil {
		return 0, err
	}
	this.minutesTotal = int((tmp46 / 60))
	this._f_minutesTotal = true
	return this.minutesTotal, nil
}
func (this *Specpr_IllumAngle) DegreesTotal() (v int, err error) {
	if (this._f_degreesTotal) {
		return this.degreesTotal, nil
	}
	tmp47, err := this.MinutesTotal()
	if err != nil {
		return 0, err
	}
	this.degreesTotal = int((tmp47 / 60))
	this._f_degreesTotal = true
	return this.degreesTotal, nil
}

/**
 * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
 */
type Specpr_TextInitial struct {
	Ids *Specpr_Identifiers
	Itxtpt uint32
	Itxtch int32
	Itext string
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_Record
}
func NewSpecpr_TextInitial() *Specpr_TextInitial {
	return &Specpr_TextInitial{
	}
}

func (this *Specpr_TextInitial) Read(io *kaitai.Stream, parent *Specpr_Record, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48 := NewSpecpr_Identifiers()
	err = tmp48.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Ids = tmp48
	tmp49, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Itxtpt = uint32(tmp49)
	tmp50, err := this._io.ReadS4be()
	if err != nil {
		return err
	}
	this.Itxtch = int32(tmp50)
	tmp51, err := this._io.ReadBytes(int(1476))
	if err != nil {
		return err
	}
	tmp51 = tmp51
	this.Itext = string(tmp51)
	return err
}

/**
 * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
 */

/**
 * The number of text characters (maximum= 19860).
 */

/**
 * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
 */
type Specpr_Record struct {
	Icflag *Specpr_Icflag
	Content interface{}
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr
	_raw_Content []byte
}
func NewSpecpr_Record() *Specpr_Record {
	return &Specpr_Record{
	}
}

func (this *Specpr_Record) Read(io *kaitai.Stream, parent *Specpr, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp52 := NewSpecpr_Icflag()
	err = tmp52.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Icflag = tmp52
	tmp53, err := this.Icflag.Type()
	if err != nil {
		return err
	}
	switch (tmp53) {
	case Specpr_RecordType__DataInitial:
		tmp54, err := this._io.ReadBytes(int((1536 - 4)))
		if err != nil {
			return err
		}
		tmp54 = tmp54
		this._raw_Content = tmp54
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp55 := NewSpecpr_DataInitial()
		err = tmp55.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp55
	case Specpr_RecordType__DataContinuation:
		tmp56, err := this._io.ReadBytes(int((1536 - 4)))
		if err != nil {
			return err
		}
		tmp56 = tmp56
		this._raw_Content = tmp56
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp57 := NewSpecpr_DataContinuation()
		err = tmp57.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp57
	case Specpr_RecordType__TextContinuation:
		tmp58, err := this._io.ReadBytes(int((1536 - 4)))
		if err != nil {
			return err
		}
		tmp58 = tmp58
		this._raw_Content = tmp58
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp59 := NewSpecpr_TextContinuation()
		err = tmp59.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp59
	case Specpr_RecordType__TextInitial:
		tmp60, err := this._io.ReadBytes(int((1536 - 4)))
		if err != nil {
			return err
		}
		tmp60 = tmp60
		this._raw_Content = tmp60
		_io__raw_Content := kaitai.NewStream(bytes.NewReader(this._raw_Content))
		tmp61 := NewSpecpr_TextInitial()
		err = tmp61.Read(_io__raw_Content, this, this._root)
		if err != nil {
			return err
		}
		this.Content = tmp61
	default:
		tmp62, err := this._io.ReadBytes(int((1536 - 4)))
		if err != nil {
			return err
		}
		tmp62 = tmp62
		this._raw_Content = tmp62
	}
	return err
}

/**
 * Total number of bytes comprising the document.
 */
type Specpr_TextContinuation struct {
	Tdata string
	_io *kaitai.Stream
	_root *Specpr
	_parent *Specpr_Record
}
func NewSpecpr_TextContinuation() *Specpr_TextContinuation {
	return &Specpr_TextContinuation{
	}
}

func (this *Specpr_TextContinuation) Read(io *kaitai.Stream, parent *Specpr_Record, root *Specpr) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp63, err := this._io.ReadBytes(int(1532))
	if err != nil {
		return err
	}
	tmp63 = tmp63
	this.Tdata = string(tmp63)
	return err
}

/**
 * 1532 characters of text.
 */
