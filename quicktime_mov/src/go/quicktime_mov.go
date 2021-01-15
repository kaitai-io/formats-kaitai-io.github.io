// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-BBCGDDDF">Source</a>
 */

type QuicktimeMov_AtomType int
const (
	QuicktimeMov_AtomType__Xtra QuicktimeMov_AtomType = 1484026465
	QuicktimeMov_AtomType__Dinf QuicktimeMov_AtomType = 1684631142
	QuicktimeMov_AtomType__Dref QuicktimeMov_AtomType = 1685218662
	QuicktimeMov_AtomType__Edts QuicktimeMov_AtomType = 1701082227
	QuicktimeMov_AtomType__Elst QuicktimeMov_AtomType = 1701606260
	QuicktimeMov_AtomType__Free QuicktimeMov_AtomType = 1718773093
	QuicktimeMov_AtomType__Ftyp QuicktimeMov_AtomType = 1718909296
	QuicktimeMov_AtomType__Hdlr QuicktimeMov_AtomType = 1751411826
	QuicktimeMov_AtomType__Iods QuicktimeMov_AtomType = 1768907891
	QuicktimeMov_AtomType__Mdat QuicktimeMov_AtomType = 1835295092
	QuicktimeMov_AtomType__Mdhd QuicktimeMov_AtomType = 1835296868
	QuicktimeMov_AtomType__Mdia QuicktimeMov_AtomType = 1835297121
	QuicktimeMov_AtomType__Meta QuicktimeMov_AtomType = 1835365473
	QuicktimeMov_AtomType__Minf QuicktimeMov_AtomType = 1835626086
	QuicktimeMov_AtomType__Moof QuicktimeMov_AtomType = 1836019558
	QuicktimeMov_AtomType__Moov QuicktimeMov_AtomType = 1836019574
	QuicktimeMov_AtomType__Mvhd QuicktimeMov_AtomType = 1836476516
	QuicktimeMov_AtomType__Smhd QuicktimeMov_AtomType = 1936549988
	QuicktimeMov_AtomType__Stbl QuicktimeMov_AtomType = 1937007212
	QuicktimeMov_AtomType__Stco QuicktimeMov_AtomType = 1937007471
	QuicktimeMov_AtomType__Stsc QuicktimeMov_AtomType = 1937011555
	QuicktimeMov_AtomType__Stsd QuicktimeMov_AtomType = 1937011556
	QuicktimeMov_AtomType__Stsz QuicktimeMov_AtomType = 1937011578
	QuicktimeMov_AtomType__Stts QuicktimeMov_AtomType = 1937011827
	QuicktimeMov_AtomType__Tkhd QuicktimeMov_AtomType = 1953196132
	QuicktimeMov_AtomType__Traf QuicktimeMov_AtomType = 1953653094
	QuicktimeMov_AtomType__Trak QuicktimeMov_AtomType = 1953653099
	QuicktimeMov_AtomType__Tref QuicktimeMov_AtomType = 1953654118
	QuicktimeMov_AtomType__Udta QuicktimeMov_AtomType = 1969517665
	QuicktimeMov_AtomType__Vmhd QuicktimeMov_AtomType = 1986881636
)

type QuicktimeMov_Brand int
const (
	QuicktimeMov_Brand__X3g2a QuicktimeMov_Brand = 862401121
	QuicktimeMov_Brand__X3ge6 QuicktimeMov_Brand = 862414134
	QuicktimeMov_Brand__X3ge9 QuicktimeMov_Brand = 862414137
	QuicktimeMov_Brand__X3gf9 QuicktimeMov_Brand = 862414393
	QuicktimeMov_Brand__X3gg6 QuicktimeMov_Brand = 862414646
	QuicktimeMov_Brand__X3gg9 QuicktimeMov_Brand = 862414649
	QuicktimeMov_Brand__X3gh9 QuicktimeMov_Brand = 862414905
	QuicktimeMov_Brand__X3gm9 QuicktimeMov_Brand = 862416185
	QuicktimeMov_Brand__X3gp4 QuicktimeMov_Brand = 862416948
	QuicktimeMov_Brand__X3gp5 QuicktimeMov_Brand = 862416949
	QuicktimeMov_Brand__X3gp6 QuicktimeMov_Brand = 862416950
	QuicktimeMov_Brand__X3gp7 QuicktimeMov_Brand = 862416951
	QuicktimeMov_Brand__X3gp8 QuicktimeMov_Brand = 862416952
	QuicktimeMov_Brand__X3gp9 QuicktimeMov_Brand = 862416953
	QuicktimeMov_Brand__X3gr6 QuicktimeMov_Brand = 862417462
	QuicktimeMov_Brand__X3gr9 QuicktimeMov_Brand = 862417465
	QuicktimeMov_Brand__X3gs6 QuicktimeMov_Brand = 862417718
	QuicktimeMov_Brand__X3gs9 QuicktimeMov_Brand = 862417721
	QuicktimeMov_Brand__X3gt9 QuicktimeMov_Brand = 862417977
	QuicktimeMov_Brand__Arri QuicktimeMov_Brand = 1095914057
	QuicktimeMov_Brand__Caep QuicktimeMov_Brand = 1128351056
	QuicktimeMov_Brand__Cdes QuicktimeMov_Brand = 1128555891
	QuicktimeMov_Brand__J2p0 QuicktimeMov_Brand = 1244811312
	QuicktimeMov_Brand__J2p1 QuicktimeMov_Brand = 1244811313
	QuicktimeMov_Brand__Lcag QuicktimeMov_Brand = 1279476039
	QuicktimeMov_Brand__M4a QuicktimeMov_Brand = 1295270176
	QuicktimeMov_Brand__M4b QuicktimeMov_Brand = 1295270432
	QuicktimeMov_Brand__M4p QuicktimeMov_Brand = 1295274016
	QuicktimeMov_Brand__M4v QuicktimeMov_Brand = 1295275552
	QuicktimeMov_Brand__Mfsm QuicktimeMov_Brand = 1296454477
	QuicktimeMov_Brand__Mgsv QuicktimeMov_Brand = 1296520022
	QuicktimeMov_Brand__Mppi QuicktimeMov_Brand = 1297109065
	QuicktimeMov_Brand__Msnv QuicktimeMov_Brand = 1297305174
	QuicktimeMov_Brand__Ross QuicktimeMov_Brand = 1380930387
	QuicktimeMov_Brand__Seau QuicktimeMov_Brand = 1397047637
	QuicktimeMov_Brand__Sebk QuicktimeMov_Brand = 1397047883
	QuicktimeMov_Brand__Xavc QuicktimeMov_Brand = 1480676931
	QuicktimeMov_Brand__Avc1 QuicktimeMov_Brand = 1635148593
	QuicktimeMov_Brand__Bbxm QuicktimeMov_Brand = 1650620525
	QuicktimeMov_Brand__Caqv QuicktimeMov_Brand = 1667330422
	QuicktimeMov_Brand__Ccff QuicktimeMov_Brand = 1667458662
	QuicktimeMov_Brand__Da0a QuicktimeMov_Brand = 1684090977
	QuicktimeMov_Brand__Da0b QuicktimeMov_Brand = 1684090978
	QuicktimeMov_Brand__Da1a QuicktimeMov_Brand = 1684091233
	QuicktimeMov_Brand__Da1b QuicktimeMov_Brand = 1684091234
	QuicktimeMov_Brand__Da2a QuicktimeMov_Brand = 1684091489
	QuicktimeMov_Brand__Da2b QuicktimeMov_Brand = 1684091490
	QuicktimeMov_Brand__Da3a QuicktimeMov_Brand = 1684091745
	QuicktimeMov_Brand__Da3b QuicktimeMov_Brand = 1684091746
	QuicktimeMov_Brand__Dash QuicktimeMov_Brand = 1684108136
	QuicktimeMov_Brand__Dby1 QuicktimeMov_Brand = 1684175153
	QuicktimeMov_Brand__Dmb1 QuicktimeMov_Brand = 1684890161
	QuicktimeMov_Brand__Dsms QuicktimeMov_Brand = 1685286259
	QuicktimeMov_Brand__Dv1a QuicktimeMov_Brand = 1685467489
	QuicktimeMov_Brand__Dv1b QuicktimeMov_Brand = 1685467490
	QuicktimeMov_Brand__Dv2a QuicktimeMov_Brand = 1685467745
	QuicktimeMov_Brand__Dv2b QuicktimeMov_Brand = 1685467746
	QuicktimeMov_Brand__Dv3a QuicktimeMov_Brand = 1685468001
	QuicktimeMov_Brand__Dv3b QuicktimeMov_Brand = 1685468002
	QuicktimeMov_Brand__Dvr1 QuicktimeMov_Brand = 1685484081
	QuicktimeMov_Brand__Dvt1 QuicktimeMov_Brand = 1685484593
	QuicktimeMov_Brand__Dxo QuicktimeMov_Brand = 1685614368
	QuicktimeMov_Brand__Emsg QuicktimeMov_Brand = 1701671783
	QuicktimeMov_Brand__Ifrm QuicktimeMov_Brand = 1768321645
	QuicktimeMov_Brand__Isc2 QuicktimeMov_Brand = 1769169714
	QuicktimeMov_Brand__Iso2 QuicktimeMov_Brand = 1769172786
	QuicktimeMov_Brand__Iso3 QuicktimeMov_Brand = 1769172787
	QuicktimeMov_Brand__Iso4 QuicktimeMov_Brand = 1769172788
	QuicktimeMov_Brand__Iso5 QuicktimeMov_Brand = 1769172789
	QuicktimeMov_Brand__Iso6 QuicktimeMov_Brand = 1769172790
	QuicktimeMov_Brand__Isom QuicktimeMov_Brand = 1769172845
	QuicktimeMov_Brand__Jp2 QuicktimeMov_Brand = 1785737760
	QuicktimeMov_Brand__Jpm QuicktimeMov_Brand = 1785752864
	QuicktimeMov_Brand__Jpsi QuicktimeMov_Brand = 1785754473
	QuicktimeMov_Brand__Jpx QuicktimeMov_Brand = 1785755680
	QuicktimeMov_Brand__Jpxb QuicktimeMov_Brand = 1785755746
	QuicktimeMov_Brand__Lmsg QuicktimeMov_Brand = 1819112295
	QuicktimeMov_Brand__Mj2s QuicktimeMov_Brand = 1835676275
	QuicktimeMov_Brand__Mjp2 QuicktimeMov_Brand = 1835692082
	QuicktimeMov_Brand__Mp21 QuicktimeMov_Brand = 1836069425
	QuicktimeMov_Brand__Mp41 QuicktimeMov_Brand = 1836069937
	QuicktimeMov_Brand__Mp42 QuicktimeMov_Brand = 1836069938
	QuicktimeMov_Brand__Mp71 QuicktimeMov_Brand = 1836070705
	QuicktimeMov_Brand__Msdh QuicktimeMov_Brand = 1836278888
	QuicktimeMov_Brand__Msix QuicktimeMov_Brand = 1836280184
	QuicktimeMov_Brand__Niko QuicktimeMov_Brand = 1852402543
	QuicktimeMov_Brand__Odcf QuicktimeMov_Brand = 1868850022
	QuicktimeMov_Brand__Opf2 QuicktimeMov_Brand = 1869637170
	QuicktimeMov_Brand__Opx2 QuicktimeMov_Brand = 1869641778
	QuicktimeMov_Brand__Pana QuicktimeMov_Brand = 1885433441
	QuicktimeMov_Brand__Piff QuicktimeMov_Brand = 1885955686
	QuicktimeMov_Brand__Pnvi QuicktimeMov_Brand = 1886287465
	QuicktimeMov_Brand__Qt QuicktimeMov_Brand = 1903435808
	QuicktimeMov_Brand__Risx QuicktimeMov_Brand = 1919513464
	QuicktimeMov_Brand__Sdv QuicktimeMov_Brand = 1935963680
	QuicktimeMov_Brand__Senv QuicktimeMov_Brand = 1936027254
	QuicktimeMov_Brand__Sims QuicktimeMov_Brand = 1936289139
	QuicktimeMov_Brand__Sisx QuicktimeMov_Brand = 1936290680
	QuicktimeMov_Brand__Ssss QuicktimeMov_Brand = 1936946035
	QuicktimeMov_Brand__Uvvu QuicktimeMov_Brand = 1970697845
)
type QuicktimeMov struct {
	Atoms *QuicktimeMov_AtomList
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov() *QuicktimeMov {
	return &QuicktimeMov{
	}
}

func (this *QuicktimeMov) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewQuicktimeMov_AtomList()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Atoms = tmp1
	return err
}

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-BBCGFGJG">Source</a>
 */
type QuicktimeMov_MvhdBody struct {
	Version uint8
	Flags []byte
	CreationTime uint32
	ModificationTime uint32
	TimeScale uint32
	Duration uint32
	PreferredRate *QuicktimeMov_Fixed32
	PreferredVolume *QuicktimeMov_Fixed16
	Reserved1 []byte
	Matrix []byte
	PreviewTime uint32
	PreviewDuration uint32
	PosterTime uint32
	SelectionTime uint32
	SelectionDuration uint32
	CurrentTime uint32
	NextTrackId uint32
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_MvhdBody() *QuicktimeMov_MvhdBody {
	return &QuicktimeMov_MvhdBody{
	}
}

func (this *QuicktimeMov_MvhdBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp2
	tmp3, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.Flags = tmp3
	tmp4, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CreationTime = uint32(tmp4)
	tmp5, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ModificationTime = uint32(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TimeScale = uint32(tmp6)
	tmp7, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Duration = uint32(tmp7)
	tmp8 := NewQuicktimeMov_Fixed32()
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PreferredRate = tmp8
	tmp9 := NewQuicktimeMov_Fixed16()
	err = tmp9.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.PreferredVolume = tmp9
	tmp10, err := this._io.ReadBytes(int(10))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.Reserved1 = tmp10
	tmp11, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp11 = tmp11
	this.Matrix = tmp11
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PreviewTime = uint32(tmp12)
	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PreviewDuration = uint32(tmp13)
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.PosterTime = uint32(tmp14)
	tmp15, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SelectionTime = uint32(tmp15)
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.SelectionDuration = uint32(tmp16)
	tmp17, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CurrentTime = uint32(tmp17)
	tmp18, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NextTrackId = uint32(tmp18)
	return err
}

/**
 * Version of this movie header atom
 */

/**
 * A time value that indicates the time scale for this
 * movie - the number of time units that pass per second
 * in its time coordinate system. A time coordinate system that
 * measures time in sixtieths of a second, for example, has a
 * time scale of 60.
 */

/**
 * A time value that indicates the duration of the movie in
 * time scale units. Note that this property is derived from
 * the movie's tracks. The value of this field corresponds to
 * the duration of the longest track in the movie.
 */

/**
 * The rate at which to play this movie. A value of 1.0 indicates normal rate.
 */

/**
 * How loud to play this movie's sound. A value of 1.0 indicates full volume.
 */

/**
 * A matrix shows how to map points from one coordinate space into another.
 */

/**
 * The time value in the movie at which the preview begins.
 */

/**
 * The duration of the movie preview in movie time scale units.
 */

/**
 * The time value of the time of the movie poster.
 */

/**
 * The time value for the start time of the current selection.
 */

/**
 * The duration of the current selection in movie time scale units.
 */

/**
 * The time value for current time position within the movie.
 */

/**
 * Indicates a value to use for the track ID number of the next
 * track added to this movie. Note that 0 is not a valid track
 * ID value.
 */

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap1/qtff1.html#//apple_ref/doc/uid/TP40000939-CH203-CJBCBIFF">Source</a>
 */
type QuicktimeMov_FtypBody struct {
	MajorBrand QuicktimeMov_Brand
	MinorVersion []byte
	CompatibleBrands []QuicktimeMov_Brand
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_FtypBody() *QuicktimeMov_FtypBody {
	return &QuicktimeMov_FtypBody{
	}
}

func (this *QuicktimeMov_FtypBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.MajorBrand = QuicktimeMov_Brand(tmp19)
	tmp20, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp20 = tmp20
	this.MinorVersion = tmp20
	for i := 1;; i++ {
		tmp21, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp21 {
			break
		}
		tmp22, err := this._io.ReadU4be()
		if err != nil {
			return err
		}
		this.CompatibleBrands = append(this.CompatibleBrands, QuicktimeMov_Brand(tmp22))
	}
	return err
}

/**
 * Fixed-point 32-bit number.
 */
type QuicktimeMov_Fixed32 struct {
	IntPart int16
	FracPart uint16
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov_Fixed32() *QuicktimeMov_Fixed32 {
	return &QuicktimeMov_Fixed32{
	}
}

func (this *QuicktimeMov_Fixed32) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp23, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.IntPart = int16(tmp23)
	tmp24, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FracPart = uint16(tmp24)
	return err
}

/**
 * Fixed-point 16-bit number.
 */
type QuicktimeMov_Fixed16 struct {
	IntPart int8
	FracPart uint8
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_MvhdBody
}
func NewQuicktimeMov_Fixed16() *QuicktimeMov_Fixed16 {
	return &QuicktimeMov_Fixed16{
	}
}

func (this *QuicktimeMov_Fixed16) Read(io *kaitai.Stream, parent *QuicktimeMov_MvhdBody, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadS1()
	if err != nil {
		return err
	}
	this.IntPart = tmp25
	tmp26, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.FracPart = tmp26
	return err
}
type QuicktimeMov_Atom struct {
	Len32 uint32
	AtomType QuicktimeMov_AtomType
	Len64 uint64
	Body interface{}
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_AtomList
	_raw_Body []byte
	_f_len bool
	len int
}
func NewQuicktimeMov_Atom() *QuicktimeMov_Atom {
	return &QuicktimeMov_Atom{
	}
}

func (this *QuicktimeMov_Atom) Read(io *kaitai.Stream, parent *QuicktimeMov_AtomList, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Len32 = uint32(tmp27)
	tmp28, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.AtomType = QuicktimeMov_AtomType(tmp28)
	if (this.Len32 == 1) {
		tmp29, err := this._io.ReadU8be()
		if err != nil {
			return err
		}
		this.Len64 = uint64(tmp29)
	}
	switch (this.AtomType) {
	case QuicktimeMov_AtomType__Moof:
		tmp30, err := this.Len()
		if err != nil {
			return err
		}
		tmp31, err := this._io.ReadBytes(int(tmp30))
		if err != nil {
			return err
		}
		tmp31 = tmp31
		this._raw_Body = tmp31
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp32 := NewQuicktimeMov_AtomList()
		err = tmp32.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp32
	case QuicktimeMov_AtomType__Tkhd:
		tmp33, err := this.Len()
		if err != nil {
			return err
		}
		tmp34, err := this._io.ReadBytes(int(tmp33))
		if err != nil {
			return err
		}
		tmp34 = tmp34
		this._raw_Body = tmp34
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp35 := NewQuicktimeMov_TkhdBody()
		err = tmp35.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp35
	case QuicktimeMov_AtomType__Stbl:
		tmp36, err := this.Len()
		if err != nil {
			return err
		}
		tmp37, err := this._io.ReadBytes(int(tmp36))
		if err != nil {
			return err
		}
		tmp37 = tmp37
		this._raw_Body = tmp37
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp38 := NewQuicktimeMov_AtomList()
		err = tmp38.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp38
	case QuicktimeMov_AtomType__Traf:
		tmp39, err := this.Len()
		if err != nil {
			return err
		}
		tmp40, err := this._io.ReadBytes(int(tmp39))
		if err != nil {
			return err
		}
		tmp40 = tmp40
		this._raw_Body = tmp40
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp41 := NewQuicktimeMov_AtomList()
		err = tmp41.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp41
	case QuicktimeMov_AtomType__Minf:
		tmp42, err := this.Len()
		if err != nil {
			return err
		}
		tmp43, err := this._io.ReadBytes(int(tmp42))
		if err != nil {
			return err
		}
		tmp43 = tmp43
		this._raw_Body = tmp43
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp44 := NewQuicktimeMov_AtomList()
		err = tmp44.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp44
	case QuicktimeMov_AtomType__Trak:
		tmp45, err := this.Len()
		if err != nil {
			return err
		}
		tmp46, err := this._io.ReadBytes(int(tmp45))
		if err != nil {
			return err
		}
		tmp46 = tmp46
		this._raw_Body = tmp46
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp47 := NewQuicktimeMov_AtomList()
		err = tmp47.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp47
	case QuicktimeMov_AtomType__Moov:
		tmp48, err := this.Len()
		if err != nil {
			return err
		}
		tmp49, err := this._io.ReadBytes(int(tmp48))
		if err != nil {
			return err
		}
		tmp49 = tmp49
		this._raw_Body = tmp49
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp50 := NewQuicktimeMov_AtomList()
		err = tmp50.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp50
	case QuicktimeMov_AtomType__Mdia:
		tmp51, err := this.Len()
		if err != nil {
			return err
		}
		tmp52, err := this._io.ReadBytes(int(tmp51))
		if err != nil {
			return err
		}
		tmp52 = tmp52
		this._raw_Body = tmp52
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp53 := NewQuicktimeMov_AtomList()
		err = tmp53.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp53
	case QuicktimeMov_AtomType__Dinf:
		tmp54, err := this.Len()
		if err != nil {
			return err
		}
		tmp55, err := this._io.ReadBytes(int(tmp54))
		if err != nil {
			return err
		}
		tmp55 = tmp55
		this._raw_Body = tmp55
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp56 := NewQuicktimeMov_AtomList()
		err = tmp56.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp56
	case QuicktimeMov_AtomType__Mvhd:
		tmp57, err := this.Len()
		if err != nil {
			return err
		}
		tmp58, err := this._io.ReadBytes(int(tmp57))
		if err != nil {
			return err
		}
		tmp58 = tmp58
		this._raw_Body = tmp58
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp59 := NewQuicktimeMov_MvhdBody()
		err = tmp59.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp59
	case QuicktimeMov_AtomType__Ftyp:
		tmp60, err := this.Len()
		if err != nil {
			return err
		}
		tmp61, err := this._io.ReadBytes(int(tmp60))
		if err != nil {
			return err
		}
		tmp61 = tmp61
		this._raw_Body = tmp61
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp62 := NewQuicktimeMov_FtypBody()
		err = tmp62.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp62
	default:
		tmp63, err := this.Len()
		if err != nil {
			return err
		}
		tmp64, err := this._io.ReadBytes(int(tmp63))
		if err != nil {
			return err
		}
		tmp64 = tmp64
		this._raw_Body = tmp64
	}
	return err
}
func (this *QuicktimeMov_Atom) Len() (v int, err error) {
	if (this._f_len) {
		return this.len, nil
	}
	var tmp65 int;
	if (this.Len32 == 0) {
		tmp66, err := this._io.Size()
		if err != nil {
			return 0, err
		}
		tmp65 = (tmp66 - 8)
	} else {
		var tmp67 int;
		if (this.Len32 == 1) {
			tmp67 = (this.Len64 - 16)
		} else {
			tmp67 = (this.Len32 - 8)
		}
		tmp65 = tmp67
	}
	this.len = int(tmp65)
	this._f_len = true
	return this.len, nil
}

/**
 * @see <a href="https://developer.apple.com/library/content/documentation/QuickTime/QTFF/QTFFChap2/qtff2.html#//apple_ref/doc/uid/TP40000939-CH204-25550">Source</a>
 */
type QuicktimeMov_TkhdBody struct {
	Version uint8
	Flags []byte
	CreationTime uint32
	ModificationTime uint32
	TrackId uint32
	Reserved1 []byte
	Duration uint32
	Reserved2 []byte
	Layer uint16
	AlternativeGroup uint16
	Volume uint16
	Reserved3 uint16
	Matrix []byte
	Width *QuicktimeMov_Fixed32
	Height *QuicktimeMov_Fixed32
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent *QuicktimeMov_Atom
}
func NewQuicktimeMov_TkhdBody() *QuicktimeMov_TkhdBody {
	return &QuicktimeMov_TkhdBody{
	}
}

func (this *QuicktimeMov_TkhdBody) Read(io *kaitai.Stream, parent *QuicktimeMov_Atom, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Version = tmp68
	tmp69, err := this._io.ReadBytes(int(3))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.Flags = tmp69
	tmp70, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.CreationTime = uint32(tmp70)
	tmp71, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ModificationTime = uint32(tmp71)
	tmp72, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.TrackId = uint32(tmp72)
	tmp73, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp73 = tmp73
	this.Reserved1 = tmp73
	tmp74, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Duration = uint32(tmp74)
	tmp75, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp75 = tmp75
	this.Reserved2 = tmp75
	tmp76, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Layer = uint16(tmp76)
	tmp77, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.AlternativeGroup = uint16(tmp77)
	tmp78, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Volume = uint16(tmp78)
	tmp79, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Reserved3 = uint16(tmp79)
	tmp80, err := this._io.ReadBytes(int(36))
	if err != nil {
		return err
	}
	tmp80 = tmp80
	this.Matrix = tmp80
	tmp81 := NewQuicktimeMov_Fixed32()
	err = tmp81.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Width = tmp81
	tmp82 := NewQuicktimeMov_Fixed32()
	err = tmp82.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Height = tmp82
	return err
}

/**
 * Integer that uniquely identifies the track. The value 0 cannot be used.
 */
type QuicktimeMov_AtomList struct {
	Items []*QuicktimeMov_Atom
	_io *kaitai.Stream
	_root *QuicktimeMov
	_parent interface{}
}
func NewQuicktimeMov_AtomList() *QuicktimeMov_AtomList {
	return &QuicktimeMov_AtomList{
	}
}

func (this *QuicktimeMov_AtomList) Read(io *kaitai.Stream, parent interface{}, root *QuicktimeMov) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp83, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp83 {
			break
		}
		tmp84 := NewQuicktimeMov_Atom()
		err = tmp84.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Items = append(this.Items, tmp84)
	}
	return err
}
