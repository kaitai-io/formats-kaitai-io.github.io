// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
)

type Exif struct {
	Endianness uint16
	Body *Exif_ExifBody
	_io *kaitai.Stream
	_root *Exif
	_parent interface{}
}
func NewExif() *Exif {
	return &Exif{
	}
}

func (this *Exif) Read(io *kaitai.Stream, parent interface{}, root *Exif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Endianness = uint16(tmp1)
	tmp2 := NewExif_ExifBody()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Body = tmp2
	return err
}
type Exif_ExifBody struct {
	Version uint16
	Ifd0Ofs uint32
	_io *kaitai.Stream
	_root *Exif
	_parent *Exif
	_f_ifd0 bool
	ifd0 *Exif_ExifBody_Ifd
	_is_le int
}
func NewExif_ExifBody() *Exif_ExifBody {
	return &Exif_ExifBody{
	}
}

func (this *Exif_ExifBody) Read(io *kaitai.Stream, parent *Exif, root *Exif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = -1

	switch (this._root.Endianness) {
	case 18761:
		this._is_le = int(1)
	case 19789:
		this._is_le = int(0)
	}

	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Exif_ExifBody) _read_le() (err error) {
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp3)
	tmp4, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Ifd0Ofs = uint32(tmp4)
	return err
}

func (this *Exif_ExifBody) _read_be() (err error) {
	tmp5, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Version = uint16(tmp5)
	tmp6, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Ifd0Ofs = uint32(tmp6)
	return err
}
func (this *Exif_ExifBody) Ifd0() (v *Exif_ExifBody_Ifd, err error) {
	if (this._f_ifd0) {
		return this.ifd0, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Ifd0Ofs), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		tmp7 := NewExif_ExifBody_Ifd()
		err = tmp7.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.ifd0 = tmp7
	case 1:
		tmp8 := NewExif_ExifBody_Ifd()
		err = tmp8.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.ifd0 = tmp8
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_ifd0 = true
	this._f_ifd0 = true
	return this.ifd0, nil
}
type Exif_ExifBody_Ifd struct {
	NumFields uint16
	Fields []*Exif_ExifBody_IfdField
	NextIfdOfs uint32
	_io *kaitai.Stream
	_root *Exif
	_parent interface{}
	_f_nextIfd bool
	nextIfd *Exif_ExifBody_Ifd
	_is_le int
}
func NewExif_ExifBody_Ifd() *Exif_ExifBody_Ifd {
	return &Exif_ExifBody_Ifd{
	}
}

func (this *Exif_ExifBody_Ifd) Read(io *kaitai.Stream, parent interface{}, root *Exif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Exif_ExifBody_Ifd) _read_le() (err error) {
	tmp9, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumFields = uint16(tmp9)
	this.Fields = make([]*Exif_ExifBody_IfdField, this.NumFields)
	for i := range this.Fields {
		tmp10 := NewExif_ExifBody_IfdField()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Fields[i] = tmp10
	}
	tmp11, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NextIfdOfs = uint32(tmp11)
	return err
}

func (this *Exif_ExifBody_Ifd) _read_be() (err error) {
	tmp12, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumFields = uint16(tmp12)
	this.Fields = make([]*Exif_ExifBody_IfdField, this.NumFields)
	for i := range this.Fields {
		tmp13 := NewExif_ExifBody_IfdField()
		err = tmp13.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Fields[i] = tmp13
	}
	tmp14, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NextIfdOfs = uint32(tmp14)
	return err
}
func (this *Exif_ExifBody_Ifd) NextIfd() (v *Exif_ExifBody_Ifd, err error) {
	if (this._f_nextIfd) {
		return this.nextIfd, nil
	}
	if (this.NextIfdOfs != 0) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(this.NextIfdOfs), io.SeekStart)
		if err != nil {
			return nil, err
		}
		switch this._is_le {
		case 0:
			tmp15 := NewExif_ExifBody_Ifd()
			err = tmp15.Read(this._io, this, this._root)
			if err != nil {
				return nil, err
			}
			this.nextIfd = tmp15
		case 1:
			tmp16 := NewExif_ExifBody_Ifd()
			err = tmp16.Read(this._io, this, this._root)
			if err != nil {
				return nil, err
			}
			this.nextIfd = tmp16
		default:
			err = kaitai.UndecidedEndiannessError{}
		}
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_nextIfd = true
	}
	this._f_nextIfd = true
	return this.nextIfd, nil
}

type Exif_ExifBody_IfdField_FieldTypeEnum int
const (
	Exif_ExifBody_IfdField_FieldTypeEnum__Byte Exif_ExifBody_IfdField_FieldTypeEnum = 1
	Exif_ExifBody_IfdField_FieldTypeEnum__AsciiString Exif_ExifBody_IfdField_FieldTypeEnum = 2
	Exif_ExifBody_IfdField_FieldTypeEnum__Word Exif_ExifBody_IfdField_FieldTypeEnum = 3
	Exif_ExifBody_IfdField_FieldTypeEnum__Dword Exif_ExifBody_IfdField_FieldTypeEnum = 4
	Exif_ExifBody_IfdField_FieldTypeEnum__Rational Exif_ExifBody_IfdField_FieldTypeEnum = 5
	Exif_ExifBody_IfdField_FieldTypeEnum__Undefined Exif_ExifBody_IfdField_FieldTypeEnum = 7
	Exif_ExifBody_IfdField_FieldTypeEnum__Slong Exif_ExifBody_IfdField_FieldTypeEnum = 9
	Exif_ExifBody_IfdField_FieldTypeEnum__Srational Exif_ExifBody_IfdField_FieldTypeEnum = 10
)

type Exif_ExifBody_IfdField_TagEnum int
const (
	Exif_ExifBody_IfdField_TagEnum__ImageWidth Exif_ExifBody_IfdField_TagEnum = 256
	Exif_ExifBody_IfdField_TagEnum__ImageHeight Exif_ExifBody_IfdField_TagEnum = 257
	Exif_ExifBody_IfdField_TagEnum__BitsPerSample Exif_ExifBody_IfdField_TagEnum = 258
	Exif_ExifBody_IfdField_TagEnum__Compression Exif_ExifBody_IfdField_TagEnum = 259
	Exif_ExifBody_IfdField_TagEnum__PhotometricInterpretation Exif_ExifBody_IfdField_TagEnum = 262
	Exif_ExifBody_IfdField_TagEnum__Thresholding Exif_ExifBody_IfdField_TagEnum = 263
	Exif_ExifBody_IfdField_TagEnum__CellWidth Exif_ExifBody_IfdField_TagEnum = 264
	Exif_ExifBody_IfdField_TagEnum__CellLength Exif_ExifBody_IfdField_TagEnum = 265
	Exif_ExifBody_IfdField_TagEnum__FillOrder Exif_ExifBody_IfdField_TagEnum = 266
	Exif_ExifBody_IfdField_TagEnum__DocumentName Exif_ExifBody_IfdField_TagEnum = 269
	Exif_ExifBody_IfdField_TagEnum__ImageDescription Exif_ExifBody_IfdField_TagEnum = 270
	Exif_ExifBody_IfdField_TagEnum__Make Exif_ExifBody_IfdField_TagEnum = 271
	Exif_ExifBody_IfdField_TagEnum__Model Exif_ExifBody_IfdField_TagEnum = 272
	Exif_ExifBody_IfdField_TagEnum__StripOffsets Exif_ExifBody_IfdField_TagEnum = 273
	Exif_ExifBody_IfdField_TagEnum__Orientation Exif_ExifBody_IfdField_TagEnum = 274
	Exif_ExifBody_IfdField_TagEnum__SamplesPerPixel Exif_ExifBody_IfdField_TagEnum = 277
	Exif_ExifBody_IfdField_TagEnum__RowsPerStrip Exif_ExifBody_IfdField_TagEnum = 278
	Exif_ExifBody_IfdField_TagEnum__StripByteCounts Exif_ExifBody_IfdField_TagEnum = 279
	Exif_ExifBody_IfdField_TagEnum__MinSampleValue Exif_ExifBody_IfdField_TagEnum = 280
	Exif_ExifBody_IfdField_TagEnum__MaxSampleValue Exif_ExifBody_IfdField_TagEnum = 281
	Exif_ExifBody_IfdField_TagEnum__XResolution Exif_ExifBody_IfdField_TagEnum = 282
	Exif_ExifBody_IfdField_TagEnum__YResolution Exif_ExifBody_IfdField_TagEnum = 283
	Exif_ExifBody_IfdField_TagEnum__PlanarConfiguration Exif_ExifBody_IfdField_TagEnum = 284
	Exif_ExifBody_IfdField_TagEnum__PageName Exif_ExifBody_IfdField_TagEnum = 285
	Exif_ExifBody_IfdField_TagEnum__XPosition Exif_ExifBody_IfdField_TagEnum = 286
	Exif_ExifBody_IfdField_TagEnum__YPosition Exif_ExifBody_IfdField_TagEnum = 287
	Exif_ExifBody_IfdField_TagEnum__FreeOffsets Exif_ExifBody_IfdField_TagEnum = 288
	Exif_ExifBody_IfdField_TagEnum__FreeByteCounts Exif_ExifBody_IfdField_TagEnum = 289
	Exif_ExifBody_IfdField_TagEnum__GrayResponseUnit Exif_ExifBody_IfdField_TagEnum = 290
	Exif_ExifBody_IfdField_TagEnum__GrayResponseCurve Exif_ExifBody_IfdField_TagEnum = 291
	Exif_ExifBody_IfdField_TagEnum__T4Options Exif_ExifBody_IfdField_TagEnum = 292
	Exif_ExifBody_IfdField_TagEnum__T6Options Exif_ExifBody_IfdField_TagEnum = 293
	Exif_ExifBody_IfdField_TagEnum__ResolutionUnit Exif_ExifBody_IfdField_TagEnum = 296
	Exif_ExifBody_IfdField_TagEnum__PageNumber Exif_ExifBody_IfdField_TagEnum = 297
	Exif_ExifBody_IfdField_TagEnum__ColorResponseUnit Exif_ExifBody_IfdField_TagEnum = 300
	Exif_ExifBody_IfdField_TagEnum__TransferFunction Exif_ExifBody_IfdField_TagEnum = 301
	Exif_ExifBody_IfdField_TagEnum__Software Exif_ExifBody_IfdField_TagEnum = 305
	Exif_ExifBody_IfdField_TagEnum__ModifyDate Exif_ExifBody_IfdField_TagEnum = 306
	Exif_ExifBody_IfdField_TagEnum__Artist Exif_ExifBody_IfdField_TagEnum = 315
	Exif_ExifBody_IfdField_TagEnum__HostComputer Exif_ExifBody_IfdField_TagEnum = 316
	Exif_ExifBody_IfdField_TagEnum__Predictor Exif_ExifBody_IfdField_TagEnum = 317
	Exif_ExifBody_IfdField_TagEnum__WhitePoint Exif_ExifBody_IfdField_TagEnum = 318
	Exif_ExifBody_IfdField_TagEnum__PrimaryChromaticities Exif_ExifBody_IfdField_TagEnum = 319
	Exif_ExifBody_IfdField_TagEnum__ColorMap Exif_ExifBody_IfdField_TagEnum = 320
	Exif_ExifBody_IfdField_TagEnum__HalftoneHints Exif_ExifBody_IfdField_TagEnum = 321
	Exif_ExifBody_IfdField_TagEnum__TileWidth Exif_ExifBody_IfdField_TagEnum = 322
	Exif_ExifBody_IfdField_TagEnum__TileLength Exif_ExifBody_IfdField_TagEnum = 323
	Exif_ExifBody_IfdField_TagEnum__TileOffsets Exif_ExifBody_IfdField_TagEnum = 324
	Exif_ExifBody_IfdField_TagEnum__TileByteCounts Exif_ExifBody_IfdField_TagEnum = 325
	Exif_ExifBody_IfdField_TagEnum__BadFaxLines Exif_ExifBody_IfdField_TagEnum = 326
	Exif_ExifBody_IfdField_TagEnum__CleanFaxData Exif_ExifBody_IfdField_TagEnum = 327
	Exif_ExifBody_IfdField_TagEnum__ConsecutiveBadFaxLines Exif_ExifBody_IfdField_TagEnum = 328
	Exif_ExifBody_IfdField_TagEnum__SubIfd Exif_ExifBody_IfdField_TagEnum = 330
	Exif_ExifBody_IfdField_TagEnum__InkSet Exif_ExifBody_IfdField_TagEnum = 332
	Exif_ExifBody_IfdField_TagEnum__InkNames Exif_ExifBody_IfdField_TagEnum = 333
	Exif_ExifBody_IfdField_TagEnum__NumberofInks Exif_ExifBody_IfdField_TagEnum = 334
	Exif_ExifBody_IfdField_TagEnum__DotRange Exif_ExifBody_IfdField_TagEnum = 336
	Exif_ExifBody_IfdField_TagEnum__TargetPrinter Exif_ExifBody_IfdField_TagEnum = 337
	Exif_ExifBody_IfdField_TagEnum__ExtraSamples Exif_ExifBody_IfdField_TagEnum = 338
	Exif_ExifBody_IfdField_TagEnum__SampleFormat Exif_ExifBody_IfdField_TagEnum = 339
	Exif_ExifBody_IfdField_TagEnum__SMinSampleValue Exif_ExifBody_IfdField_TagEnum = 340
	Exif_ExifBody_IfdField_TagEnum__SMaxSampleValue Exif_ExifBody_IfdField_TagEnum = 341
	Exif_ExifBody_IfdField_TagEnum__TransferRange Exif_ExifBody_IfdField_TagEnum = 342
	Exif_ExifBody_IfdField_TagEnum__ClipPath Exif_ExifBody_IfdField_TagEnum = 343
	Exif_ExifBody_IfdField_TagEnum__XClipPathUnits Exif_ExifBody_IfdField_TagEnum = 344
	Exif_ExifBody_IfdField_TagEnum__YClipPathUnits Exif_ExifBody_IfdField_TagEnum = 345
	Exif_ExifBody_IfdField_TagEnum__Indexed Exif_ExifBody_IfdField_TagEnum = 346
	Exif_ExifBody_IfdField_TagEnum__JpegTables Exif_ExifBody_IfdField_TagEnum = 347
	Exif_ExifBody_IfdField_TagEnum__OpiProxy Exif_ExifBody_IfdField_TagEnum = 351
	Exif_ExifBody_IfdField_TagEnum__GlobalParametersIfd Exif_ExifBody_IfdField_TagEnum = 400
	Exif_ExifBody_IfdField_TagEnum__ProfileType Exif_ExifBody_IfdField_TagEnum = 401
	Exif_ExifBody_IfdField_TagEnum__FaxProfile Exif_ExifBody_IfdField_TagEnum = 402
	Exif_ExifBody_IfdField_TagEnum__CodingMethods Exif_ExifBody_IfdField_TagEnum = 403
	Exif_ExifBody_IfdField_TagEnum__VersionYear Exif_ExifBody_IfdField_TagEnum = 404
	Exif_ExifBody_IfdField_TagEnum__ModeNumber Exif_ExifBody_IfdField_TagEnum = 405
	Exif_ExifBody_IfdField_TagEnum__Decode Exif_ExifBody_IfdField_TagEnum = 433
	Exif_ExifBody_IfdField_TagEnum__DefaultImageColor Exif_ExifBody_IfdField_TagEnum = 434
	Exif_ExifBody_IfdField_TagEnum__T82Options Exif_ExifBody_IfdField_TagEnum = 435
	Exif_ExifBody_IfdField_TagEnum__JpegTables2 Exif_ExifBody_IfdField_TagEnum = 437
	Exif_ExifBody_IfdField_TagEnum__JpegProc Exif_ExifBody_IfdField_TagEnum = 512
	Exif_ExifBody_IfdField_TagEnum__ThumbnailOffset Exif_ExifBody_IfdField_TagEnum = 513
	Exif_ExifBody_IfdField_TagEnum__ThumbnailLength Exif_ExifBody_IfdField_TagEnum = 514
	Exif_ExifBody_IfdField_TagEnum__JpegRestartInterval Exif_ExifBody_IfdField_TagEnum = 515
	Exif_ExifBody_IfdField_TagEnum__JpegLosslessPredictors Exif_ExifBody_IfdField_TagEnum = 517
	Exif_ExifBody_IfdField_TagEnum__JpegPointTransforms Exif_ExifBody_IfdField_TagEnum = 518
	Exif_ExifBody_IfdField_TagEnum__JpegqTables Exif_ExifBody_IfdField_TagEnum = 519
	Exif_ExifBody_IfdField_TagEnum__JpegdcTables Exif_ExifBody_IfdField_TagEnum = 520
	Exif_ExifBody_IfdField_TagEnum__JpegacTables Exif_ExifBody_IfdField_TagEnum = 521
	Exif_ExifBody_IfdField_TagEnum__YCbCrCoefficients Exif_ExifBody_IfdField_TagEnum = 529
	Exif_ExifBody_IfdField_TagEnum__YCbCrSubSampling Exif_ExifBody_IfdField_TagEnum = 530
	Exif_ExifBody_IfdField_TagEnum__YCbCrPositioning Exif_ExifBody_IfdField_TagEnum = 531
	Exif_ExifBody_IfdField_TagEnum__ReferenceBlackWhite Exif_ExifBody_IfdField_TagEnum = 532
	Exif_ExifBody_IfdField_TagEnum__StripRowCounts Exif_ExifBody_IfdField_TagEnum = 559
	Exif_ExifBody_IfdField_TagEnum__ApplicationNotes Exif_ExifBody_IfdField_TagEnum = 700
	Exif_ExifBody_IfdField_TagEnum__UsptoMiscellaneous Exif_ExifBody_IfdField_TagEnum = 999
	Exif_ExifBody_IfdField_TagEnum__RelatedImageFileFormat Exif_ExifBody_IfdField_TagEnum = 4096
	Exif_ExifBody_IfdField_TagEnum__RelatedImageWidth Exif_ExifBody_IfdField_TagEnum = 4097
	Exif_ExifBody_IfdField_TagEnum__RelatedImageHeight Exif_ExifBody_IfdField_TagEnum = 4098
	Exif_ExifBody_IfdField_TagEnum__Rating Exif_ExifBody_IfdField_TagEnum = 18246
	Exif_ExifBody_IfdField_TagEnum__XpDipXml Exif_ExifBody_IfdField_TagEnum = 18247
	Exif_ExifBody_IfdField_TagEnum__StitchInfo Exif_ExifBody_IfdField_TagEnum = 18248
	Exif_ExifBody_IfdField_TagEnum__RatingPercent Exif_ExifBody_IfdField_TagEnum = 18249
	Exif_ExifBody_IfdField_TagEnum__SonyRawFileType Exif_ExifBody_IfdField_TagEnum = 28672
	Exif_ExifBody_IfdField_TagEnum__LightFalloffParams Exif_ExifBody_IfdField_TagEnum = 28722
	Exif_ExifBody_IfdField_TagEnum__ChromaticAberrationCorrParams Exif_ExifBody_IfdField_TagEnum = 28725
	Exif_ExifBody_IfdField_TagEnum__DistortionCorrParams Exif_ExifBody_IfdField_TagEnum = 28727
	Exif_ExifBody_IfdField_TagEnum__ImageId Exif_ExifBody_IfdField_TagEnum = 32781
	Exif_ExifBody_IfdField_TagEnum__WangTag1 Exif_ExifBody_IfdField_TagEnum = 32931
	Exif_ExifBody_IfdField_TagEnum__WangAnnotation Exif_ExifBody_IfdField_TagEnum = 32932
	Exif_ExifBody_IfdField_TagEnum__WangTag3 Exif_ExifBody_IfdField_TagEnum = 32933
	Exif_ExifBody_IfdField_TagEnum__WangTag4 Exif_ExifBody_IfdField_TagEnum = 32934
	Exif_ExifBody_IfdField_TagEnum__ImageReferencePoints Exif_ExifBody_IfdField_TagEnum = 32953
	Exif_ExifBody_IfdField_TagEnum__RegionXformTackPoint Exif_ExifBody_IfdField_TagEnum = 32954
	Exif_ExifBody_IfdField_TagEnum__WarpQuadrilateral Exif_ExifBody_IfdField_TagEnum = 32955
	Exif_ExifBody_IfdField_TagEnum__AffineTransformMat Exif_ExifBody_IfdField_TagEnum = 32956
	Exif_ExifBody_IfdField_TagEnum__Matteing Exif_ExifBody_IfdField_TagEnum = 32995
	Exif_ExifBody_IfdField_TagEnum__DataType Exif_ExifBody_IfdField_TagEnum = 32996
	Exif_ExifBody_IfdField_TagEnum__ImageDepth Exif_ExifBody_IfdField_TagEnum = 32997
	Exif_ExifBody_IfdField_TagEnum__TileDepth Exif_ExifBody_IfdField_TagEnum = 32998
	Exif_ExifBody_IfdField_TagEnum__ImageFullWidth Exif_ExifBody_IfdField_TagEnum = 33300
	Exif_ExifBody_IfdField_TagEnum__ImageFullHeight Exif_ExifBody_IfdField_TagEnum = 33301
	Exif_ExifBody_IfdField_TagEnum__TextureFormat Exif_ExifBody_IfdField_TagEnum = 33302
	Exif_ExifBody_IfdField_TagEnum__WrapModes Exif_ExifBody_IfdField_TagEnum = 33303
	Exif_ExifBody_IfdField_TagEnum__FovCot Exif_ExifBody_IfdField_TagEnum = 33304
	Exif_ExifBody_IfdField_TagEnum__MatrixWorldToScreen Exif_ExifBody_IfdField_TagEnum = 33305
	Exif_ExifBody_IfdField_TagEnum__MatrixWorldToCamera Exif_ExifBody_IfdField_TagEnum = 33306
	Exif_ExifBody_IfdField_TagEnum__Model2 Exif_ExifBody_IfdField_TagEnum = 33405
	Exif_ExifBody_IfdField_TagEnum__CfaRepeatPatternDim Exif_ExifBody_IfdField_TagEnum = 33421
	Exif_ExifBody_IfdField_TagEnum__CfaPattern2 Exif_ExifBody_IfdField_TagEnum = 33422
	Exif_ExifBody_IfdField_TagEnum__BatteryLevel Exif_ExifBody_IfdField_TagEnum = 33423
	Exif_ExifBody_IfdField_TagEnum__KodakIfd Exif_ExifBody_IfdField_TagEnum = 33424
	Exif_ExifBody_IfdField_TagEnum__Copyright Exif_ExifBody_IfdField_TagEnum = 33432
	Exif_ExifBody_IfdField_TagEnum__ExposureTime Exif_ExifBody_IfdField_TagEnum = 33434
	Exif_ExifBody_IfdField_TagEnum__FNumber Exif_ExifBody_IfdField_TagEnum = 33437
	Exif_ExifBody_IfdField_TagEnum__MdFileTag Exif_ExifBody_IfdField_TagEnum = 33445
	Exif_ExifBody_IfdField_TagEnum__MdScalePixel Exif_ExifBody_IfdField_TagEnum = 33446
	Exif_ExifBody_IfdField_TagEnum__MdColorTable Exif_ExifBody_IfdField_TagEnum = 33447
	Exif_ExifBody_IfdField_TagEnum__MdLabName Exif_ExifBody_IfdField_TagEnum = 33448
	Exif_ExifBody_IfdField_TagEnum__MdSampleInfo Exif_ExifBody_IfdField_TagEnum = 33449
	Exif_ExifBody_IfdField_TagEnum__MdPrepDate Exif_ExifBody_IfdField_TagEnum = 33450
	Exif_ExifBody_IfdField_TagEnum__MdPrepTime Exif_ExifBody_IfdField_TagEnum = 33451
	Exif_ExifBody_IfdField_TagEnum__MdFileUnits Exif_ExifBody_IfdField_TagEnum = 33452
	Exif_ExifBody_IfdField_TagEnum__PixelScale Exif_ExifBody_IfdField_TagEnum = 33550
	Exif_ExifBody_IfdField_TagEnum__AdventScale Exif_ExifBody_IfdField_TagEnum = 33589
	Exif_ExifBody_IfdField_TagEnum__AdventRevision Exif_ExifBody_IfdField_TagEnum = 33590
	Exif_ExifBody_IfdField_TagEnum__Uic1Tag Exif_ExifBody_IfdField_TagEnum = 33628
	Exif_ExifBody_IfdField_TagEnum__Uic2Tag Exif_ExifBody_IfdField_TagEnum = 33629
	Exif_ExifBody_IfdField_TagEnum__Uic3Tag Exif_ExifBody_IfdField_TagEnum = 33630
	Exif_ExifBody_IfdField_TagEnum__Uic4Tag Exif_ExifBody_IfdField_TagEnum = 33631
	Exif_ExifBody_IfdField_TagEnum__IptcNaa Exif_ExifBody_IfdField_TagEnum = 33723
	Exif_ExifBody_IfdField_TagEnum__IntergraphPacketData Exif_ExifBody_IfdField_TagEnum = 33918
	Exif_ExifBody_IfdField_TagEnum__IntergraphFlagRegisters Exif_ExifBody_IfdField_TagEnum = 33919
	Exif_ExifBody_IfdField_TagEnum__IntergraphMatrix Exif_ExifBody_IfdField_TagEnum = 33920
	Exif_ExifBody_IfdField_TagEnum__IngrReserved Exif_ExifBody_IfdField_TagEnum = 33921
	Exif_ExifBody_IfdField_TagEnum__ModelTiePoint Exif_ExifBody_IfdField_TagEnum = 33922
	Exif_ExifBody_IfdField_TagEnum__Site Exif_ExifBody_IfdField_TagEnum = 34016
	Exif_ExifBody_IfdField_TagEnum__ColorSequence Exif_ExifBody_IfdField_TagEnum = 34017
	Exif_ExifBody_IfdField_TagEnum__It8Header Exif_ExifBody_IfdField_TagEnum = 34018
	Exif_ExifBody_IfdField_TagEnum__RasterPadding Exif_ExifBody_IfdField_TagEnum = 34019
	Exif_ExifBody_IfdField_TagEnum__BitsPerRunLength Exif_ExifBody_IfdField_TagEnum = 34020
	Exif_ExifBody_IfdField_TagEnum__BitsPerExtendedRunLength Exif_ExifBody_IfdField_TagEnum = 34021
	Exif_ExifBody_IfdField_TagEnum__ColorTable Exif_ExifBody_IfdField_TagEnum = 34022
	Exif_ExifBody_IfdField_TagEnum__ImageColorIndicator Exif_ExifBody_IfdField_TagEnum = 34023
	Exif_ExifBody_IfdField_TagEnum__BackgroundColorIndicator Exif_ExifBody_IfdField_TagEnum = 34024
	Exif_ExifBody_IfdField_TagEnum__ImageColorValue Exif_ExifBody_IfdField_TagEnum = 34025
	Exif_ExifBody_IfdField_TagEnum__BackgroundColorValue Exif_ExifBody_IfdField_TagEnum = 34026
	Exif_ExifBody_IfdField_TagEnum__PixelIntensityRange Exif_ExifBody_IfdField_TagEnum = 34027
	Exif_ExifBody_IfdField_TagEnum__TransparencyIndicator Exif_ExifBody_IfdField_TagEnum = 34028
	Exif_ExifBody_IfdField_TagEnum__ColorCharacterization Exif_ExifBody_IfdField_TagEnum = 34029
	Exif_ExifBody_IfdField_TagEnum__HcUsage Exif_ExifBody_IfdField_TagEnum = 34030
	Exif_ExifBody_IfdField_TagEnum__TrapIndicator Exif_ExifBody_IfdField_TagEnum = 34031
	Exif_ExifBody_IfdField_TagEnum__CmykEquivalent Exif_ExifBody_IfdField_TagEnum = 34032
	Exif_ExifBody_IfdField_TagEnum__SemInfo Exif_ExifBody_IfdField_TagEnum = 34118
	Exif_ExifBody_IfdField_TagEnum__AfcpIptc Exif_ExifBody_IfdField_TagEnum = 34152
	Exif_ExifBody_IfdField_TagEnum__PixelMagicJbigOptions Exif_ExifBody_IfdField_TagEnum = 34232
	Exif_ExifBody_IfdField_TagEnum__JplCartoIfd Exif_ExifBody_IfdField_TagEnum = 34263
	Exif_ExifBody_IfdField_TagEnum__ModelTransform Exif_ExifBody_IfdField_TagEnum = 34264
	Exif_ExifBody_IfdField_TagEnum__WbGrgbLevels Exif_ExifBody_IfdField_TagEnum = 34306
	Exif_ExifBody_IfdField_TagEnum__LeafData Exif_ExifBody_IfdField_TagEnum = 34310
	Exif_ExifBody_IfdField_TagEnum__PhotoshopSettings Exif_ExifBody_IfdField_TagEnum = 34377
	Exif_ExifBody_IfdField_TagEnum__ExifOffset Exif_ExifBody_IfdField_TagEnum = 34665
	Exif_ExifBody_IfdField_TagEnum__IccProfile Exif_ExifBody_IfdField_TagEnum = 34675
	Exif_ExifBody_IfdField_TagEnum__TiffFxExtensions Exif_ExifBody_IfdField_TagEnum = 34687
	Exif_ExifBody_IfdField_TagEnum__MultiProfiles Exif_ExifBody_IfdField_TagEnum = 34688
	Exif_ExifBody_IfdField_TagEnum__SharedData Exif_ExifBody_IfdField_TagEnum = 34689
	Exif_ExifBody_IfdField_TagEnum__T88Options Exif_ExifBody_IfdField_TagEnum = 34690
	Exif_ExifBody_IfdField_TagEnum__ImageLayer Exif_ExifBody_IfdField_TagEnum = 34732
	Exif_ExifBody_IfdField_TagEnum__GeoTiffDirectory Exif_ExifBody_IfdField_TagEnum = 34735
	Exif_ExifBody_IfdField_TagEnum__GeoTiffDoubleParams Exif_ExifBody_IfdField_TagEnum = 34736
	Exif_ExifBody_IfdField_TagEnum__GeoTiffAsciiParams Exif_ExifBody_IfdField_TagEnum = 34737
	Exif_ExifBody_IfdField_TagEnum__JbigOptions Exif_ExifBody_IfdField_TagEnum = 34750
	Exif_ExifBody_IfdField_TagEnum__ExposureProgram Exif_ExifBody_IfdField_TagEnum = 34850
	Exif_ExifBody_IfdField_TagEnum__SpectralSensitivity Exif_ExifBody_IfdField_TagEnum = 34852
	Exif_ExifBody_IfdField_TagEnum__GpsInfo Exif_ExifBody_IfdField_TagEnum = 34853
	Exif_ExifBody_IfdField_TagEnum__Iso Exif_ExifBody_IfdField_TagEnum = 34855
	Exif_ExifBody_IfdField_TagEnum__OptoElectricConvFactor Exif_ExifBody_IfdField_TagEnum = 34856
	Exif_ExifBody_IfdField_TagEnum__Interlace Exif_ExifBody_IfdField_TagEnum = 34857
	Exif_ExifBody_IfdField_TagEnum__TimeZoneOffset Exif_ExifBody_IfdField_TagEnum = 34858
	Exif_ExifBody_IfdField_TagEnum__SelfTimerMode Exif_ExifBody_IfdField_TagEnum = 34859
	Exif_ExifBody_IfdField_TagEnum__SensitivityType Exif_ExifBody_IfdField_TagEnum = 34864
	Exif_ExifBody_IfdField_TagEnum__StandardOutputSensitivity Exif_ExifBody_IfdField_TagEnum = 34865
	Exif_ExifBody_IfdField_TagEnum__RecommendedExposureIndex Exif_ExifBody_IfdField_TagEnum = 34866
	Exif_ExifBody_IfdField_TagEnum__IsoSpeed Exif_ExifBody_IfdField_TagEnum = 34867
	Exif_ExifBody_IfdField_TagEnum__IsoSpeedLatitudeyyy Exif_ExifBody_IfdField_TagEnum = 34868
	Exif_ExifBody_IfdField_TagEnum__IsoSpeedLatitudezzz Exif_ExifBody_IfdField_TagEnum = 34869
	Exif_ExifBody_IfdField_TagEnum__FaxRecvParams Exif_ExifBody_IfdField_TagEnum = 34908
	Exif_ExifBody_IfdField_TagEnum__FaxSubAddress Exif_ExifBody_IfdField_TagEnum = 34909
	Exif_ExifBody_IfdField_TagEnum__FaxRecvTime Exif_ExifBody_IfdField_TagEnum = 34910
	Exif_ExifBody_IfdField_TagEnum__FedexEdr Exif_ExifBody_IfdField_TagEnum = 34929
	Exif_ExifBody_IfdField_TagEnum__LeafSubIfd Exif_ExifBody_IfdField_TagEnum = 34954
	Exif_ExifBody_IfdField_TagEnum__ExifVersion Exif_ExifBody_IfdField_TagEnum = 36864
	Exif_ExifBody_IfdField_TagEnum__DateTimeOriginal Exif_ExifBody_IfdField_TagEnum = 36867
	Exif_ExifBody_IfdField_TagEnum__CreateDate Exif_ExifBody_IfdField_TagEnum = 36868
	Exif_ExifBody_IfdField_TagEnum__GooglePlusUploadCode Exif_ExifBody_IfdField_TagEnum = 36873
	Exif_ExifBody_IfdField_TagEnum__OffsetTime Exif_ExifBody_IfdField_TagEnum = 36880
	Exif_ExifBody_IfdField_TagEnum__OffsetTimeOriginal Exif_ExifBody_IfdField_TagEnum = 36881
	Exif_ExifBody_IfdField_TagEnum__OffsetTimeDigitized Exif_ExifBody_IfdField_TagEnum = 36882
	Exif_ExifBody_IfdField_TagEnum__ComponentsConfiguration Exif_ExifBody_IfdField_TagEnum = 37121
	Exif_ExifBody_IfdField_TagEnum__CompressedBitsPerPixel Exif_ExifBody_IfdField_TagEnum = 37122
	Exif_ExifBody_IfdField_TagEnum__ShutterSpeedValue Exif_ExifBody_IfdField_TagEnum = 37377
	Exif_ExifBody_IfdField_TagEnum__ApertureValue Exif_ExifBody_IfdField_TagEnum = 37378
	Exif_ExifBody_IfdField_TagEnum__BrightnessValue Exif_ExifBody_IfdField_TagEnum = 37379
	Exif_ExifBody_IfdField_TagEnum__ExposureCompensation Exif_ExifBody_IfdField_TagEnum = 37380
	Exif_ExifBody_IfdField_TagEnum__MaxApertureValue Exif_ExifBody_IfdField_TagEnum = 37381
	Exif_ExifBody_IfdField_TagEnum__SubjectDistance Exif_ExifBody_IfdField_TagEnum = 37382
	Exif_ExifBody_IfdField_TagEnum__MeteringMode Exif_ExifBody_IfdField_TagEnum = 37383
	Exif_ExifBody_IfdField_TagEnum__LightSource Exif_ExifBody_IfdField_TagEnum = 37384
	Exif_ExifBody_IfdField_TagEnum__Flash Exif_ExifBody_IfdField_TagEnum = 37385
	Exif_ExifBody_IfdField_TagEnum__FocalLength Exif_ExifBody_IfdField_TagEnum = 37386
	Exif_ExifBody_IfdField_TagEnum__FlashEnergy Exif_ExifBody_IfdField_TagEnum = 37387
	Exif_ExifBody_IfdField_TagEnum__SpatialFrequencyResponse Exif_ExifBody_IfdField_TagEnum = 37388
	Exif_ExifBody_IfdField_TagEnum__Noise Exif_ExifBody_IfdField_TagEnum = 37389
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneXResolution Exif_ExifBody_IfdField_TagEnum = 37390
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneYResolution Exif_ExifBody_IfdField_TagEnum = 37391
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneResolutionUnit Exif_ExifBody_IfdField_TagEnum = 37392
	Exif_ExifBody_IfdField_TagEnum__ImageNumber Exif_ExifBody_IfdField_TagEnum = 37393
	Exif_ExifBody_IfdField_TagEnum__SecurityClassification Exif_ExifBody_IfdField_TagEnum = 37394
	Exif_ExifBody_IfdField_TagEnum__ImageHistory Exif_ExifBody_IfdField_TagEnum = 37395
	Exif_ExifBody_IfdField_TagEnum__SubjectArea Exif_ExifBody_IfdField_TagEnum = 37396
	Exif_ExifBody_IfdField_TagEnum__ExposureIndex Exif_ExifBody_IfdField_TagEnum = 37397
	Exif_ExifBody_IfdField_TagEnum__TiffEpStandardId Exif_ExifBody_IfdField_TagEnum = 37398
	Exif_ExifBody_IfdField_TagEnum__SensingMethod Exif_ExifBody_IfdField_TagEnum = 37399
	Exif_ExifBody_IfdField_TagEnum__Cip3DataFile Exif_ExifBody_IfdField_TagEnum = 37434
	Exif_ExifBody_IfdField_TagEnum__Cip3Sheet Exif_ExifBody_IfdField_TagEnum = 37435
	Exif_ExifBody_IfdField_TagEnum__Cip3Side Exif_ExifBody_IfdField_TagEnum = 37436
	Exif_ExifBody_IfdField_TagEnum__StoNits Exif_ExifBody_IfdField_TagEnum = 37439
	Exif_ExifBody_IfdField_TagEnum__MakerNote Exif_ExifBody_IfdField_TagEnum = 37500
	Exif_ExifBody_IfdField_TagEnum__UserComment Exif_ExifBody_IfdField_TagEnum = 37510
	Exif_ExifBody_IfdField_TagEnum__SubSecTime Exif_ExifBody_IfdField_TagEnum = 37520
	Exif_ExifBody_IfdField_TagEnum__SubSecTimeOriginal Exif_ExifBody_IfdField_TagEnum = 37521
	Exif_ExifBody_IfdField_TagEnum__SubSecTimeDigitized Exif_ExifBody_IfdField_TagEnum = 37522
	Exif_ExifBody_IfdField_TagEnum__MsDocumentText Exif_ExifBody_IfdField_TagEnum = 37679
	Exif_ExifBody_IfdField_TagEnum__MsPropertySetStorage Exif_ExifBody_IfdField_TagEnum = 37680
	Exif_ExifBody_IfdField_TagEnum__MsDocumentTextPosition Exif_ExifBody_IfdField_TagEnum = 37681
	Exif_ExifBody_IfdField_TagEnum__ImageSourceData Exif_ExifBody_IfdField_TagEnum = 37724
	Exif_ExifBody_IfdField_TagEnum__AmbientTemperature Exif_ExifBody_IfdField_TagEnum = 37888
	Exif_ExifBody_IfdField_TagEnum__Humidity Exif_ExifBody_IfdField_TagEnum = 37889
	Exif_ExifBody_IfdField_TagEnum__Pressure Exif_ExifBody_IfdField_TagEnum = 37890
	Exif_ExifBody_IfdField_TagEnum__WaterDepth Exif_ExifBody_IfdField_TagEnum = 37891
	Exif_ExifBody_IfdField_TagEnum__Acceleration Exif_ExifBody_IfdField_TagEnum = 37892
	Exif_ExifBody_IfdField_TagEnum__CameraElevationAngle Exif_ExifBody_IfdField_TagEnum = 37893
	Exif_ExifBody_IfdField_TagEnum__XpTitle Exif_ExifBody_IfdField_TagEnum = 40091
	Exif_ExifBody_IfdField_TagEnum__XpComment Exif_ExifBody_IfdField_TagEnum = 40092
	Exif_ExifBody_IfdField_TagEnum__XpAuthor Exif_ExifBody_IfdField_TagEnum = 40093
	Exif_ExifBody_IfdField_TagEnum__XpKeywords Exif_ExifBody_IfdField_TagEnum = 40094
	Exif_ExifBody_IfdField_TagEnum__XpSubject Exif_ExifBody_IfdField_TagEnum = 40095
	Exif_ExifBody_IfdField_TagEnum__FlashpixVersion Exif_ExifBody_IfdField_TagEnum = 40960
	Exif_ExifBody_IfdField_TagEnum__ColorSpace Exif_ExifBody_IfdField_TagEnum = 40961
	Exif_ExifBody_IfdField_TagEnum__ExifImageWidth Exif_ExifBody_IfdField_TagEnum = 40962
	Exif_ExifBody_IfdField_TagEnum__ExifImageHeight Exif_ExifBody_IfdField_TagEnum = 40963
	Exif_ExifBody_IfdField_TagEnum__RelatedSoundFile Exif_ExifBody_IfdField_TagEnum = 40964
	Exif_ExifBody_IfdField_TagEnum__InteropOffset Exif_ExifBody_IfdField_TagEnum = 40965
	Exif_ExifBody_IfdField_TagEnum__SamsungRawPointersOffset Exif_ExifBody_IfdField_TagEnum = 40976
	Exif_ExifBody_IfdField_TagEnum__SamsungRawPointersLength Exif_ExifBody_IfdField_TagEnum = 40977
	Exif_ExifBody_IfdField_TagEnum__SamsungRawByteOrder Exif_ExifBody_IfdField_TagEnum = 41217
	Exif_ExifBody_IfdField_TagEnum__SamsungRawUnknown Exif_ExifBody_IfdField_TagEnum = 41218
	Exif_ExifBody_IfdField_TagEnum__FlashEnergy2 Exif_ExifBody_IfdField_TagEnum = 41483
	Exif_ExifBody_IfdField_TagEnum__SpatialFrequencyResponse2 Exif_ExifBody_IfdField_TagEnum = 41484
	Exif_ExifBody_IfdField_TagEnum__Noise2 Exif_ExifBody_IfdField_TagEnum = 41485
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneXResolution2 Exif_ExifBody_IfdField_TagEnum = 41486
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneYResolution2 Exif_ExifBody_IfdField_TagEnum = 41487
	Exif_ExifBody_IfdField_TagEnum__FocalPlaneResolutionUnit2 Exif_ExifBody_IfdField_TagEnum = 41488
	Exif_ExifBody_IfdField_TagEnum__ImageNumber2 Exif_ExifBody_IfdField_TagEnum = 41489
	Exif_ExifBody_IfdField_TagEnum__SecurityClassification2 Exif_ExifBody_IfdField_TagEnum = 41490
	Exif_ExifBody_IfdField_TagEnum__ImageHistory2 Exif_ExifBody_IfdField_TagEnum = 41491
	Exif_ExifBody_IfdField_TagEnum__SubjectLocation Exif_ExifBody_IfdField_TagEnum = 41492
	Exif_ExifBody_IfdField_TagEnum__ExposureIndex2 Exif_ExifBody_IfdField_TagEnum = 41493
	Exif_ExifBody_IfdField_TagEnum__TiffEpStandardId2 Exif_ExifBody_IfdField_TagEnum = 41494
	Exif_ExifBody_IfdField_TagEnum__SensingMethod2 Exif_ExifBody_IfdField_TagEnum = 41495
	Exif_ExifBody_IfdField_TagEnum__FileSource Exif_ExifBody_IfdField_TagEnum = 41728
	Exif_ExifBody_IfdField_TagEnum__SceneType Exif_ExifBody_IfdField_TagEnum = 41729
	Exif_ExifBody_IfdField_TagEnum__CfaPattern Exif_ExifBody_IfdField_TagEnum = 41730
	Exif_ExifBody_IfdField_TagEnum__CustomRendered Exif_ExifBody_IfdField_TagEnum = 41985
	Exif_ExifBody_IfdField_TagEnum__ExposureMode Exif_ExifBody_IfdField_TagEnum = 41986
	Exif_ExifBody_IfdField_TagEnum__WhiteBalance Exif_ExifBody_IfdField_TagEnum = 41987
	Exif_ExifBody_IfdField_TagEnum__DigitalZoomRatio Exif_ExifBody_IfdField_TagEnum = 41988
	Exif_ExifBody_IfdField_TagEnum__FocalLengthIn35mmFormat Exif_ExifBody_IfdField_TagEnum = 41989
	Exif_ExifBody_IfdField_TagEnum__SceneCaptureType Exif_ExifBody_IfdField_TagEnum = 41990
	Exif_ExifBody_IfdField_TagEnum__GainControl Exif_ExifBody_IfdField_TagEnum = 41991
	Exif_ExifBody_IfdField_TagEnum__Contrast Exif_ExifBody_IfdField_TagEnum = 41992
	Exif_ExifBody_IfdField_TagEnum__Saturation Exif_ExifBody_IfdField_TagEnum = 41993
	Exif_ExifBody_IfdField_TagEnum__Sharpness Exif_ExifBody_IfdField_TagEnum = 41994
	Exif_ExifBody_IfdField_TagEnum__DeviceSettingDescription Exif_ExifBody_IfdField_TagEnum = 41995
	Exif_ExifBody_IfdField_TagEnum__SubjectDistanceRange Exif_ExifBody_IfdField_TagEnum = 41996
	Exif_ExifBody_IfdField_TagEnum__ImageUniqueId Exif_ExifBody_IfdField_TagEnum = 42016
	Exif_ExifBody_IfdField_TagEnum__OwnerName Exif_ExifBody_IfdField_TagEnum = 42032
	Exif_ExifBody_IfdField_TagEnum__SerialNumber Exif_ExifBody_IfdField_TagEnum = 42033
	Exif_ExifBody_IfdField_TagEnum__LensInfo Exif_ExifBody_IfdField_TagEnum = 42034
	Exif_ExifBody_IfdField_TagEnum__LensMake Exif_ExifBody_IfdField_TagEnum = 42035
	Exif_ExifBody_IfdField_TagEnum__LensModel Exif_ExifBody_IfdField_TagEnum = 42036
	Exif_ExifBody_IfdField_TagEnum__LensSerialNumber Exif_ExifBody_IfdField_TagEnum = 42037
	Exif_ExifBody_IfdField_TagEnum__GdalMetadata Exif_ExifBody_IfdField_TagEnum = 42112
	Exif_ExifBody_IfdField_TagEnum__GdalNoData Exif_ExifBody_IfdField_TagEnum = 42113
	Exif_ExifBody_IfdField_TagEnum__Gamma Exif_ExifBody_IfdField_TagEnum = 42240
	Exif_ExifBody_IfdField_TagEnum__ExpandSoftware Exif_ExifBody_IfdField_TagEnum = 44992
	Exif_ExifBody_IfdField_TagEnum__ExpandLens Exif_ExifBody_IfdField_TagEnum = 44993
	Exif_ExifBody_IfdField_TagEnum__ExpandFilm Exif_ExifBody_IfdField_TagEnum = 44994
	Exif_ExifBody_IfdField_TagEnum__ExpandFilterLens Exif_ExifBody_IfdField_TagEnum = 44995
	Exif_ExifBody_IfdField_TagEnum__ExpandScanner Exif_ExifBody_IfdField_TagEnum = 44996
	Exif_ExifBody_IfdField_TagEnum__ExpandFlashLamp Exif_ExifBody_IfdField_TagEnum = 44997
	Exif_ExifBody_IfdField_TagEnum__PixelFormat Exif_ExifBody_IfdField_TagEnum = 48129
	Exif_ExifBody_IfdField_TagEnum__Transformation Exif_ExifBody_IfdField_TagEnum = 48130
	Exif_ExifBody_IfdField_TagEnum__Uncompressed Exif_ExifBody_IfdField_TagEnum = 48131
	Exif_ExifBody_IfdField_TagEnum__ImageType Exif_ExifBody_IfdField_TagEnum = 48132
	Exif_ExifBody_IfdField_TagEnum__ImageWidth2 Exif_ExifBody_IfdField_TagEnum = 48256
	Exif_ExifBody_IfdField_TagEnum__ImageHeight2 Exif_ExifBody_IfdField_TagEnum = 48257
	Exif_ExifBody_IfdField_TagEnum__WidthResolution Exif_ExifBody_IfdField_TagEnum = 48258
	Exif_ExifBody_IfdField_TagEnum__HeightResolution Exif_ExifBody_IfdField_TagEnum = 48259
	Exif_ExifBody_IfdField_TagEnum__ImageOffset Exif_ExifBody_IfdField_TagEnum = 48320
	Exif_ExifBody_IfdField_TagEnum__ImageByteCount Exif_ExifBody_IfdField_TagEnum = 48321
	Exif_ExifBody_IfdField_TagEnum__AlphaOffset Exif_ExifBody_IfdField_TagEnum = 48322
	Exif_ExifBody_IfdField_TagEnum__AlphaByteCount Exif_ExifBody_IfdField_TagEnum = 48323
	Exif_ExifBody_IfdField_TagEnum__ImageDataDiscard Exif_ExifBody_IfdField_TagEnum = 48324
	Exif_ExifBody_IfdField_TagEnum__AlphaDataDiscard Exif_ExifBody_IfdField_TagEnum = 48325
	Exif_ExifBody_IfdField_TagEnum__OceScanjobDesc Exif_ExifBody_IfdField_TagEnum = 50215
	Exif_ExifBody_IfdField_TagEnum__OceApplicationSelector Exif_ExifBody_IfdField_TagEnum = 50216
	Exif_ExifBody_IfdField_TagEnum__OceIdNumber Exif_ExifBody_IfdField_TagEnum = 50217
	Exif_ExifBody_IfdField_TagEnum__OceImageLogic Exif_ExifBody_IfdField_TagEnum = 50218
	Exif_ExifBody_IfdField_TagEnum__Annotations Exif_ExifBody_IfdField_TagEnum = 50255
	Exif_ExifBody_IfdField_TagEnum__PrintIm Exif_ExifBody_IfdField_TagEnum = 50341
	Exif_ExifBody_IfdField_TagEnum__OriginalFileName Exif_ExifBody_IfdField_TagEnum = 50547
	Exif_ExifBody_IfdField_TagEnum__UsptoOriginalContentType Exif_ExifBody_IfdField_TagEnum = 50560
	Exif_ExifBody_IfdField_TagEnum__DngVersion Exif_ExifBody_IfdField_TagEnum = 50706
	Exif_ExifBody_IfdField_TagEnum__DngBackwardVersion Exif_ExifBody_IfdField_TagEnum = 50707
	Exif_ExifBody_IfdField_TagEnum__UniqueCameraModel Exif_ExifBody_IfdField_TagEnum = 50708
	Exif_ExifBody_IfdField_TagEnum__LocalizedCameraModel Exif_ExifBody_IfdField_TagEnum = 50709
	Exif_ExifBody_IfdField_TagEnum__CfaPlaneColor Exif_ExifBody_IfdField_TagEnum = 50710
	Exif_ExifBody_IfdField_TagEnum__CfaLayout Exif_ExifBody_IfdField_TagEnum = 50711
	Exif_ExifBody_IfdField_TagEnum__LinearizationTable Exif_ExifBody_IfdField_TagEnum = 50712
	Exif_ExifBody_IfdField_TagEnum__BlackLevelRepeatDim Exif_ExifBody_IfdField_TagEnum = 50713
	Exif_ExifBody_IfdField_TagEnum__BlackLevel Exif_ExifBody_IfdField_TagEnum = 50714
	Exif_ExifBody_IfdField_TagEnum__BlackLevelDeltaH Exif_ExifBody_IfdField_TagEnum = 50715
	Exif_ExifBody_IfdField_TagEnum__BlackLevelDeltaV Exif_ExifBody_IfdField_TagEnum = 50716
	Exif_ExifBody_IfdField_TagEnum__WhiteLevel Exif_ExifBody_IfdField_TagEnum = 50717
	Exif_ExifBody_IfdField_TagEnum__DefaultScale Exif_ExifBody_IfdField_TagEnum = 50718
	Exif_ExifBody_IfdField_TagEnum__DefaultCropOrigin Exif_ExifBody_IfdField_TagEnum = 50719
	Exif_ExifBody_IfdField_TagEnum__DefaultCropSize Exif_ExifBody_IfdField_TagEnum = 50720
	Exif_ExifBody_IfdField_TagEnum__ColorMatrix1 Exif_ExifBody_IfdField_TagEnum = 50721
	Exif_ExifBody_IfdField_TagEnum__ColorMatrix2 Exif_ExifBody_IfdField_TagEnum = 50722
	Exif_ExifBody_IfdField_TagEnum__CameraCalibration1 Exif_ExifBody_IfdField_TagEnum = 50723
	Exif_ExifBody_IfdField_TagEnum__CameraCalibration2 Exif_ExifBody_IfdField_TagEnum = 50724
	Exif_ExifBody_IfdField_TagEnum__ReductionMatrix1 Exif_ExifBody_IfdField_TagEnum = 50725
	Exif_ExifBody_IfdField_TagEnum__ReductionMatrix2 Exif_ExifBody_IfdField_TagEnum = 50726
	Exif_ExifBody_IfdField_TagEnum__AnalogBalance Exif_ExifBody_IfdField_TagEnum = 50727
	Exif_ExifBody_IfdField_TagEnum__AsShotNeutral Exif_ExifBody_IfdField_TagEnum = 50728
	Exif_ExifBody_IfdField_TagEnum__AsShotWhiteXy Exif_ExifBody_IfdField_TagEnum = 50729
	Exif_ExifBody_IfdField_TagEnum__BaselineExposure Exif_ExifBody_IfdField_TagEnum = 50730
	Exif_ExifBody_IfdField_TagEnum__BaselineNoise Exif_ExifBody_IfdField_TagEnum = 50731
	Exif_ExifBody_IfdField_TagEnum__BaselineSharpness Exif_ExifBody_IfdField_TagEnum = 50732
	Exif_ExifBody_IfdField_TagEnum__BayerGreenSplit Exif_ExifBody_IfdField_TagEnum = 50733
	Exif_ExifBody_IfdField_TagEnum__LinearResponseLimit Exif_ExifBody_IfdField_TagEnum = 50734
	Exif_ExifBody_IfdField_TagEnum__CameraSerialNumber Exif_ExifBody_IfdField_TagEnum = 50735
	Exif_ExifBody_IfdField_TagEnum__DngLensInfo Exif_ExifBody_IfdField_TagEnum = 50736
	Exif_ExifBody_IfdField_TagEnum__ChromaBlurRadius Exif_ExifBody_IfdField_TagEnum = 50737
	Exif_ExifBody_IfdField_TagEnum__AntiAliasStrength Exif_ExifBody_IfdField_TagEnum = 50738
	Exif_ExifBody_IfdField_TagEnum__ShadowScale Exif_ExifBody_IfdField_TagEnum = 50739
	Exif_ExifBody_IfdField_TagEnum__Sr2Private Exif_ExifBody_IfdField_TagEnum = 50740
	Exif_ExifBody_IfdField_TagEnum__MakerNoteSafety Exif_ExifBody_IfdField_TagEnum = 50741
	Exif_ExifBody_IfdField_TagEnum__RawImageSegmentation Exif_ExifBody_IfdField_TagEnum = 50752
	Exif_ExifBody_IfdField_TagEnum__CalibrationIlluminant1 Exif_ExifBody_IfdField_TagEnum = 50778
	Exif_ExifBody_IfdField_TagEnum__CalibrationIlluminant2 Exif_ExifBody_IfdField_TagEnum = 50779
	Exif_ExifBody_IfdField_TagEnum__BestQualityScale Exif_ExifBody_IfdField_TagEnum = 50780
	Exif_ExifBody_IfdField_TagEnum__RawDataUniqueId Exif_ExifBody_IfdField_TagEnum = 50781
	Exif_ExifBody_IfdField_TagEnum__AliasLayerMetadata Exif_ExifBody_IfdField_TagEnum = 50784
	Exif_ExifBody_IfdField_TagEnum__OriginalRawFileName Exif_ExifBody_IfdField_TagEnum = 50827
	Exif_ExifBody_IfdField_TagEnum__OriginalRawFileData Exif_ExifBody_IfdField_TagEnum = 50828
	Exif_ExifBody_IfdField_TagEnum__ActiveArea Exif_ExifBody_IfdField_TagEnum = 50829
	Exif_ExifBody_IfdField_TagEnum__MaskedAreas Exif_ExifBody_IfdField_TagEnum = 50830
	Exif_ExifBody_IfdField_TagEnum__AsShotIccProfile Exif_ExifBody_IfdField_TagEnum = 50831
	Exif_ExifBody_IfdField_TagEnum__AsShotPreProfileMatrix Exif_ExifBody_IfdField_TagEnum = 50832
	Exif_ExifBody_IfdField_TagEnum__CurrentIccProfile Exif_ExifBody_IfdField_TagEnum = 50833
	Exif_ExifBody_IfdField_TagEnum__CurrentPreProfileMatrix Exif_ExifBody_IfdField_TagEnum = 50834
	Exif_ExifBody_IfdField_TagEnum__ColorimetricReference Exif_ExifBody_IfdField_TagEnum = 50879
	Exif_ExifBody_IfdField_TagEnum__SRawType Exif_ExifBody_IfdField_TagEnum = 50885
	Exif_ExifBody_IfdField_TagEnum__PanasonicTitle Exif_ExifBody_IfdField_TagEnum = 50898
	Exif_ExifBody_IfdField_TagEnum__PanasonicTitle2 Exif_ExifBody_IfdField_TagEnum = 50899
	Exif_ExifBody_IfdField_TagEnum__CameraCalibrationSig Exif_ExifBody_IfdField_TagEnum = 50931
	Exif_ExifBody_IfdField_TagEnum__ProfileCalibrationSig Exif_ExifBody_IfdField_TagEnum = 50932
	Exif_ExifBody_IfdField_TagEnum__ProfileIfd Exif_ExifBody_IfdField_TagEnum = 50933
	Exif_ExifBody_IfdField_TagEnum__AsShotProfileName Exif_ExifBody_IfdField_TagEnum = 50934
	Exif_ExifBody_IfdField_TagEnum__NoiseReductionApplied Exif_ExifBody_IfdField_TagEnum = 50935
	Exif_ExifBody_IfdField_TagEnum__ProfileName Exif_ExifBody_IfdField_TagEnum = 50936
	Exif_ExifBody_IfdField_TagEnum__ProfileHueSatMapDims Exif_ExifBody_IfdField_TagEnum = 50937
	Exif_ExifBody_IfdField_TagEnum__ProfileHueSatMapData1 Exif_ExifBody_IfdField_TagEnum = 50938
	Exif_ExifBody_IfdField_TagEnum__ProfileHueSatMapData2 Exif_ExifBody_IfdField_TagEnum = 50939
	Exif_ExifBody_IfdField_TagEnum__ProfileToneCurve Exif_ExifBody_IfdField_TagEnum = 50940
	Exif_ExifBody_IfdField_TagEnum__ProfileEmbedPolicy Exif_ExifBody_IfdField_TagEnum = 50941
	Exif_ExifBody_IfdField_TagEnum__ProfileCopyright Exif_ExifBody_IfdField_TagEnum = 50942
	Exif_ExifBody_IfdField_TagEnum__ForwardMatrix1 Exif_ExifBody_IfdField_TagEnum = 50964
	Exif_ExifBody_IfdField_TagEnum__ForwardMatrix2 Exif_ExifBody_IfdField_TagEnum = 50965
	Exif_ExifBody_IfdField_TagEnum__PreviewApplicationName Exif_ExifBody_IfdField_TagEnum = 50966
	Exif_ExifBody_IfdField_TagEnum__PreviewApplicationVersion Exif_ExifBody_IfdField_TagEnum = 50967
	Exif_ExifBody_IfdField_TagEnum__PreviewSettingsName Exif_ExifBody_IfdField_TagEnum = 50968
	Exif_ExifBody_IfdField_TagEnum__PreviewSettingsDigest Exif_ExifBody_IfdField_TagEnum = 50969
	Exif_ExifBody_IfdField_TagEnum__PreviewColorSpace Exif_ExifBody_IfdField_TagEnum = 50970
	Exif_ExifBody_IfdField_TagEnum__PreviewDateTime Exif_ExifBody_IfdField_TagEnum = 50971
	Exif_ExifBody_IfdField_TagEnum__RawImageDigest Exif_ExifBody_IfdField_TagEnum = 50972
	Exif_ExifBody_IfdField_TagEnum__OriginalRawFileDigest Exif_ExifBody_IfdField_TagEnum = 50973
	Exif_ExifBody_IfdField_TagEnum__SubTileBlockSize Exif_ExifBody_IfdField_TagEnum = 50974
	Exif_ExifBody_IfdField_TagEnum__RowInterleaveFactor Exif_ExifBody_IfdField_TagEnum = 50975
	Exif_ExifBody_IfdField_TagEnum__ProfileLookTableDims Exif_ExifBody_IfdField_TagEnum = 50981
	Exif_ExifBody_IfdField_TagEnum__ProfileLookTableData Exif_ExifBody_IfdField_TagEnum = 50982
	Exif_ExifBody_IfdField_TagEnum__OpcodeList1 Exif_ExifBody_IfdField_TagEnum = 51008
	Exif_ExifBody_IfdField_TagEnum__OpcodeList2 Exif_ExifBody_IfdField_TagEnum = 51009
	Exif_ExifBody_IfdField_TagEnum__OpcodeList3 Exif_ExifBody_IfdField_TagEnum = 51022
	Exif_ExifBody_IfdField_TagEnum__NoiseProfile Exif_ExifBody_IfdField_TagEnum = 51041
	Exif_ExifBody_IfdField_TagEnum__TimeCodes Exif_ExifBody_IfdField_TagEnum = 51043
	Exif_ExifBody_IfdField_TagEnum__FrameRate Exif_ExifBody_IfdField_TagEnum = 51044
	Exif_ExifBody_IfdField_TagEnum__TStop Exif_ExifBody_IfdField_TagEnum = 51058
	Exif_ExifBody_IfdField_TagEnum__ReelName Exif_ExifBody_IfdField_TagEnum = 51081
	Exif_ExifBody_IfdField_TagEnum__OriginalDefaultFinalSize Exif_ExifBody_IfdField_TagEnum = 51089
	Exif_ExifBody_IfdField_TagEnum__OriginalBestQualitySize Exif_ExifBody_IfdField_TagEnum = 51090
	Exif_ExifBody_IfdField_TagEnum__OriginalDefaultCropSize Exif_ExifBody_IfdField_TagEnum = 51091
	Exif_ExifBody_IfdField_TagEnum__CameraLabel Exif_ExifBody_IfdField_TagEnum = 51105
	Exif_ExifBody_IfdField_TagEnum__ProfileHueSatMapEncoding Exif_ExifBody_IfdField_TagEnum = 51107
	Exif_ExifBody_IfdField_TagEnum__ProfileLookTableEncoding Exif_ExifBody_IfdField_TagEnum = 51108
	Exif_ExifBody_IfdField_TagEnum__BaselineExposureOffset Exif_ExifBody_IfdField_TagEnum = 51109
	Exif_ExifBody_IfdField_TagEnum__DefaultBlackRender Exif_ExifBody_IfdField_TagEnum = 51110
	Exif_ExifBody_IfdField_TagEnum__NewRawImageDigest Exif_ExifBody_IfdField_TagEnum = 51111
	Exif_ExifBody_IfdField_TagEnum__RawToPreviewGain Exif_ExifBody_IfdField_TagEnum = 51112
	Exif_ExifBody_IfdField_TagEnum__DefaultUserCrop Exif_ExifBody_IfdField_TagEnum = 51125
	Exif_ExifBody_IfdField_TagEnum__Padding Exif_ExifBody_IfdField_TagEnum = 59932
	Exif_ExifBody_IfdField_TagEnum__OffsetSchema Exif_ExifBody_IfdField_TagEnum = 59933
	Exif_ExifBody_IfdField_TagEnum__OwnerName2 Exif_ExifBody_IfdField_TagEnum = 65000
	Exif_ExifBody_IfdField_TagEnum__SerialNumber2 Exif_ExifBody_IfdField_TagEnum = 65001
	Exif_ExifBody_IfdField_TagEnum__Lens Exif_ExifBody_IfdField_TagEnum = 65002
	Exif_ExifBody_IfdField_TagEnum__KdcIfd Exif_ExifBody_IfdField_TagEnum = 65024
	Exif_ExifBody_IfdField_TagEnum__RawFile Exif_ExifBody_IfdField_TagEnum = 65100
	Exif_ExifBody_IfdField_TagEnum__Converter Exif_ExifBody_IfdField_TagEnum = 65101
	Exif_ExifBody_IfdField_TagEnum__WhiteBalance2 Exif_ExifBody_IfdField_TagEnum = 65102
	Exif_ExifBody_IfdField_TagEnum__Exposure Exif_ExifBody_IfdField_TagEnum = 65105
	Exif_ExifBody_IfdField_TagEnum__Shadows Exif_ExifBody_IfdField_TagEnum = 65106
	Exif_ExifBody_IfdField_TagEnum__Brightness Exif_ExifBody_IfdField_TagEnum = 65107
	Exif_ExifBody_IfdField_TagEnum__Contrast2 Exif_ExifBody_IfdField_TagEnum = 65108
	Exif_ExifBody_IfdField_TagEnum__Saturation2 Exif_ExifBody_IfdField_TagEnum = 65109
	Exif_ExifBody_IfdField_TagEnum__Sharpness2 Exif_ExifBody_IfdField_TagEnum = 65110
	Exif_ExifBody_IfdField_TagEnum__Smoothness Exif_ExifBody_IfdField_TagEnum = 65111
	Exif_ExifBody_IfdField_TagEnum__MoireFilter Exif_ExifBody_IfdField_TagEnum = 65112
)
type Exif_ExifBody_IfdField struct {
	Tag Exif_ExifBody_IfdField_TagEnum
	FieldType Exif_ExifBody_IfdField_FieldTypeEnum
	Length uint32
	OfsOrData uint32
	_io *kaitai.Stream
	_root *Exif
	_parent *Exif_ExifBody_Ifd
	_f_typeByteLength bool
	typeByteLength int8
	_f_byteLength bool
	byteLength int
	_f_isImmediateData bool
	isImmediateData bool
	_f_data bool
	data []byte
	_is_le int
}
func NewExif_ExifBody_IfdField() *Exif_ExifBody_IfdField {
	return &Exif_ExifBody_IfdField{
	}
}

func (this *Exif_ExifBody_IfdField) Read(io *kaitai.Stream, parent *Exif_ExifBody_Ifd, root *Exif) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = this._parent._is_le


	switch this._is_le {
	case 0:
		err = this._read_be()
	case 1:
		err = this._read_le()
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	return err
}

func (this *Exif_ExifBody_IfdField) _read_le() (err error) {
	tmp17, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Tag = Exif_ExifBody_IfdField_TagEnum(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FieldType = Exif_ExifBody_IfdField_FieldTypeEnum(tmp18)
	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp19)
	tmp20, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsOrData = uint32(tmp20)
	return err
}

func (this *Exif_ExifBody_IfdField) _read_be() (err error) {
	tmp21, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.Tag = Exif_ExifBody_IfdField_TagEnum(tmp21)
	tmp22, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.FieldType = Exif_ExifBody_IfdField_FieldTypeEnum(tmp22)
	tmp23, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.Length = uint32(tmp23)
	tmp24, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsOrData = uint32(tmp24)
	return err
}
func (this *Exif_ExifBody_IfdField) TypeByteLength() (v int8, err error) {
	if (this._f_typeByteLength) {
		return this.typeByteLength, nil
	}
	var tmp25 int8;
	if (this.FieldType == Exif_ExifBody_IfdField_FieldTypeEnum__Word) {
		tmp25 = 2
	} else {
		var tmp26 int8;
		if (this.FieldType == Exif_ExifBody_IfdField_FieldTypeEnum__Dword) {
			tmp26 = 4
		} else {
			tmp26 = 1
		}
		tmp25 = tmp26
	}
	this.typeByteLength = int8(tmp25)
	this._f_typeByteLength = true
	return this.typeByteLength, nil
}
func (this *Exif_ExifBody_IfdField) ByteLength() (v int, err error) {
	if (this._f_byteLength) {
		return this.byteLength, nil
	}
	tmp27, err := this.TypeByteLength()
	if err != nil {
		return 0, err
	}
	this.byteLength = int((this.Length * tmp27))
	this._f_byteLength = true
	return this.byteLength, nil
}
func (this *Exif_ExifBody_IfdField) IsImmediateData() (v bool, err error) {
	if (this._f_isImmediateData) {
		return this.isImmediateData, nil
	}
	tmp28, err := this.ByteLength()
	if err != nil {
		return false, err
	}
	this.isImmediateData = bool(tmp28 <= 4)
	this._f_isImmediateData = true
	return this.isImmediateData, nil
}
func (this *Exif_ExifBody_IfdField) Data() (v []byte, err error) {
	if (this._f_data) {
		return this.data, nil
	}
	tmp29, err := this.IsImmediateData()
	if err != nil {
		return nil, err
	}
	if (!(tmp29)) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsOrData), io.SeekStart)
		if err != nil {
			return nil, err
		}
		switch this._is_le {
		case 0:
			tmp30, err := this.ByteLength()
			if err != nil {
				return nil, err
			}
			tmp31, err := thisIo.ReadBytes(int(tmp30))
			if err != nil {
				return nil, err
			}
			tmp31 = tmp31
			this.data = tmp31
		case 1:
			tmp32, err := this.ByteLength()
			if err != nil {
				return nil, err
			}
			tmp33, err := thisIo.ReadBytes(int(tmp32))
			if err != nil {
				return nil, err
			}
			tmp33 = tmp33
			this.data = tmp33
		default:
			err = kaitai.UndecidedEndiannessError{}
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_data = true
	}
	this._f_data = true
	return this.data, nil
}
