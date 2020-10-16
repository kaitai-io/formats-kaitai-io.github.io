// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Gzip is a popular and standard single-file archiving format. It
 * essentially provides a container that stores original file name,
 * timestamp and a few other things (like optional comment), basic
 * CRCs, etc, and a file compressed by a chosen compression algorithm.
 * 
 * As of 2019, there is actually only one working solution for
 * compression algorithms, so it's typically raw DEFLATE stream
 * (without zlib header) in all gzipped files.
 * @see <a href="https://tools.ietf.org/html/rfc1952">Source</a>
 */

type Gzip_CompressionMethods int
const (
	Gzip_CompressionMethods__Deflate Gzip_CompressionMethods = 8
)

type Gzip_Oses int
const (
	Gzip_Oses__Fat Gzip_Oses = 0
	Gzip_Oses__Amiga Gzip_Oses = 1
	Gzip_Oses__Vms Gzip_Oses = 2
	Gzip_Oses__Unix Gzip_Oses = 3
	Gzip_Oses__VmCms Gzip_Oses = 4
	Gzip_Oses__AtariTos Gzip_Oses = 5
	Gzip_Oses__Hpfs Gzip_Oses = 6
	Gzip_Oses__Macintosh Gzip_Oses = 7
	Gzip_Oses__ZSystem Gzip_Oses = 8
	Gzip_Oses__CpM Gzip_Oses = 9
	Gzip_Oses__Tops20 Gzip_Oses = 10
	Gzip_Oses__Ntfs Gzip_Oses = 11
	Gzip_Oses__Qdos Gzip_Oses = 12
	Gzip_Oses__AcornRiscos Gzip_Oses = 13
	Gzip_Oses__Unknown Gzip_Oses = 255
)
type Gzip struct {
	Magic []byte
	CompressionMethod Gzip_CompressionMethods
	Flags *Gzip_Flags
	ModTime uint32
	ExtraFlags *Gzip_ExtraFlagsDeflate
	Os Gzip_Oses
	Extras *Gzip_Extras
	Name []byte
	Comment []byte
	HeaderCrc16 uint16
	Body []byte
	BodyCrc32 uint32
	LenUncompressed uint32
	_io *kaitai.Stream
	_root *Gzip
	_parent interface{}
}
func NewGzip() *Gzip {
	return &Gzip{
	}
}

func (this *Gzip) Read(io *kaitai.Stream, parent interface{}, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = tmp1
	if !(bytes.Equal(this.Magic, []uint8{31, 139})) {
		return kaitai.NewValidationNotEqualError([]uint8{31, 139}, this.Magic, this._io, "/seq/0")
	}
	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionMethod = Gzip_CompressionMethods(tmp2)
	tmp3 := NewGzip_Flags()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Flags = tmp3
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ModTime = uint32(tmp4)
	switch (this.CompressionMethod) {
	case Gzip_CompressionMethods__Deflate:
		tmp5 := NewGzip_ExtraFlagsDeflate()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.ExtraFlags = tmp5
	}
	tmp6, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Os = Gzip_Oses(tmp6)
	if (this.Flags.HasExtra) {
		tmp7 := NewGzip_Extras()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Extras = tmp7
	}
	if (this.Flags.HasName) {
		tmp8, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Name = tmp8
	}
	if (this.Flags.HasComment) {
		tmp9, err := this._io.ReadBytesTerm(0, false, true, true)
		if err != nil {
			return err
		}
		this.Comment = tmp9
	}
	if (this.Flags.HasHeaderCrc) {
		tmp10, err := this._io.ReadU2le()
		if err != nil {
			return err
		}
		this.HeaderCrc16 = uint16(tmp10)
	}
	tmp11, err := this._io.Size()
	if err != nil {
		return err
	}
	tmp12, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp13, err := this._io.ReadBytes(int(((tmp11 - tmp12) - 8)))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.Body = tmp13
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.BodyCrc32 = uint32(tmp14)
	tmp15, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenUncompressed = uint32(tmp15)
	return err
}

/**
 * Compression method used to compress file body. In practice, only
 * one method is widely used: 8 = deflate.
 */

/**
 * Last modification time of a file archived in UNIX timestamp format.
 */

/**
 * Extra flags, specific to compression method chosen.
 */

/**
 * OS used to compress this file.
 */

/**
 * Compressed body of a file archived. Note that we don't make an
 * attempt to decompress it here.
 */

/**
 * CRC32 checksum of an uncompressed file body
 */

/**
 * Size of original uncompressed data in bytes (truncated to 32
 * bits).
 */
type Gzip_Flags struct {
	Reserved1 uint64
	HasComment bool
	HasName bool
	HasExtra bool
	HasHeaderCrc bool
	IsText bool
	_io *kaitai.Stream
	_root *Gzip
	_parent *Gzip
}
func NewGzip_Flags() *Gzip_Flags {
	return &Gzip_Flags{
	}
}

func (this *Gzip_Flags) Read(io *kaitai.Stream, parent *Gzip, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp16, err := this._io.ReadBitsIntBe(3)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp16
	tmp17, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasComment = tmp17 != 0
	tmp18, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasName = tmp18 != 0
	tmp19, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasExtra = tmp19 != 0
	tmp20, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.HasHeaderCrc = tmp20 != 0
	tmp21, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.IsText = tmp21 != 0
	return err
}

/**
 * If true, optional extra fields are present in the archive.
 */

/**
 * If true, this archive includes a CRC16 checksum for the header.
 */

/**
 * If true, file inside this archive is a text file from
 * compressor's point of view.
 */

type Gzip_ExtraFlagsDeflate_CompressionStrengths int
const (
	Gzip_ExtraFlagsDeflate_CompressionStrengths__Best Gzip_ExtraFlagsDeflate_CompressionStrengths = 2
	Gzip_ExtraFlagsDeflate_CompressionStrengths__Fast Gzip_ExtraFlagsDeflate_CompressionStrengths = 4
)
type Gzip_ExtraFlagsDeflate struct {
	CompressionStrength Gzip_ExtraFlagsDeflate_CompressionStrengths
	_io *kaitai.Stream
	_root *Gzip
	_parent *Gzip
}
func NewGzip_ExtraFlagsDeflate() *Gzip_ExtraFlagsDeflate {
	return &Gzip_ExtraFlagsDeflate{
	}
}

func (this *Gzip_ExtraFlagsDeflate) Read(io *kaitai.Stream, parent *Gzip, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp22, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.CompressionStrength = Gzip_ExtraFlagsDeflate_CompressionStrengths(tmp22)
	return err
}

/**
 * Container for many subfields, constrained by size of stream.
 */
type Gzip_Subfields struct {
	Entries []*Gzip_Subfield
	_io *kaitai.Stream
	_root *Gzip
	_parent *Gzip_Extras
}
func NewGzip_Subfields() *Gzip_Subfields {
	return &Gzip_Subfields{
	}
}

func (this *Gzip_Subfields) Read(io *kaitai.Stream, parent *Gzip_Extras, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp23, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp23 {
			break
		}
		tmp24 := NewGzip_Subfield()
		err = tmp24.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp24)
	}
	return err
}

/**
 * Every subfield follows typical [TLV scheme](https://en.wikipedia.org/wiki/Type-length-value):
 * 
 * * `id` serves role of "T"ype
 * * `len_data` serves role of "L"ength
 * * `data` serves role of "V"alue
 * 
 * This way it's possible to for arbitrary parser to skip over
 * subfields it does not support.
 */
type Gzip_Subfield struct {
	Id uint16
	LenData uint16
	Data []byte
	_io *kaitai.Stream
	_root *Gzip
	_parent *Gzip_Subfields
}
func NewGzip_Subfield() *Gzip_Subfield {
	return &Gzip_Subfield{
	}
}

func (this *Gzip_Subfield) Read(io *kaitai.Stream, parent *Gzip_Subfields, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp25)
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenData = uint16(tmp26)
	tmp27, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this.Data = tmp27
	return err
}

/**
 * Subfield ID, typically two ASCII letters.
 */
type Gzip_Extras struct {
	LenSubfields uint16
	Subfields *Gzip_Subfields
	_io *kaitai.Stream
	_root *Gzip
	_parent *Gzip
	_raw_Subfields []byte
}
func NewGzip_Extras() *Gzip_Extras {
	return &Gzip_Extras{
	}
}

func (this *Gzip_Extras) Read(io *kaitai.Stream, parent *Gzip, root *Gzip) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenSubfields = uint16(tmp28)
	tmp29, err := this._io.ReadBytes(int(this.LenSubfields))
	if err != nil {
		return err
	}
	tmp29 = tmp29
	this._raw_Subfields = tmp29
	_io__raw_Subfields := kaitai.NewStream(bytes.NewReader(this._raw_Subfields))
	tmp30 := NewGzip_Subfields()
	err = tmp30.Read(_io__raw_Subfields, this, this._root)
	if err != nil {
		return err
	}
	this.Subfields = tmp30
	return err
}
