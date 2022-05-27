// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 * @see <a href="https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme">Source</a>
 */

type Mcap_Opcode int
const (
	Mcap_Opcode__Header Mcap_Opcode = 1
	Mcap_Opcode__Footer Mcap_Opcode = 2
	Mcap_Opcode__Schema Mcap_Opcode = 3
	Mcap_Opcode__Channel Mcap_Opcode = 4
	Mcap_Opcode__Message Mcap_Opcode = 5
	Mcap_Opcode__Chunk Mcap_Opcode = 6
	Mcap_Opcode__MessageIndex Mcap_Opcode = 7
	Mcap_Opcode__ChunkIndex Mcap_Opcode = 8
	Mcap_Opcode__Attachment Mcap_Opcode = 9
	Mcap_Opcode__AttachmentIndex Mcap_Opcode = 10
	Mcap_Opcode__Statistics Mcap_Opcode = 11
	Mcap_Opcode__Metadata Mcap_Opcode = 12
	Mcap_Opcode__MetadataIndex Mcap_Opcode = 13
	Mcap_Opcode__SummaryOffset Mcap_Opcode = 14
	Mcap_Opcode__DataEnd Mcap_Opcode = 15
)
type Mcap struct {
	HeaderMagic *Mcap_Magic
	Records []*Mcap_Record
	FooterMagic *Mcap_Magic
	_io *kaitai.Stream
	_root *Mcap
	_parent interface{}
	_raw_footer []byte
	_f_footer bool
	footer *Mcap_Record
	_f_ofsFooter bool
	ofsFooter int
}
func NewMcap() *Mcap {
	return &Mcap{
	}
}

func (this *Mcap) Read(io *kaitai.Stream, parent interface{}, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewMcap_Magic()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.HeaderMagic = tmp1
	for i := 1;; i++ {
		tmp2 := NewMcap_Record()
		err = tmp2.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp2
		this.Records = append(this.Records, _it)
		if _it.Op == Mcap_Opcode__Footer {
			break
		}
	}
	tmp3 := NewMcap_Magic()
	err = tmp3.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.FooterMagic = tmp3
	return err
}
func (this *Mcap) Footer() (v *Mcap_Record, err error) {
	if (this._f_footer) {
		return this.footer, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	tmp4, err := this.OfsFooter()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(tmp4), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp5, err := this._io.ReadBytesFull()
	if err != nil {
		return nil, err
	}
	tmp5 = tmp5
	this._raw_footer = tmp5
	_io__raw_footer := kaitai.NewStream(bytes.NewReader(this._raw_footer))
	tmp6 := NewMcap_Record()
	err = tmp6.Read(_io__raw_footer, this, this._root)
	if err != nil {
		return nil, err
	}
	this.footer = tmp6
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_footer = true
	this._f_footer = true
	return this.footer, nil
}
func (this *Mcap) OfsFooter() (v int, err error) {
	if (this._f_ofsFooter) {
		return this.ofsFooter, nil
	}
	tmp7, err := this._io.Size()
	if err != nil {
		return 0, err
	}
	this.ofsFooter = int(((((tmp7 - 1) - 8) - 20) - 8))
	this._f_ofsFooter = true
	return this.ofsFooter, nil
}
type Mcap_PrefixedStr struct {
	LenStr uint32
	Str string
	_io *kaitai.Stream
	_root *Mcap
	_parent interface{}
}
func NewMcap_PrefixedStr() *Mcap_PrefixedStr {
	return &Mcap_PrefixedStr{
	}
}

func (this *Mcap_PrefixedStr) Read(io *kaitai.Stream, parent interface{}, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStr = uint32(tmp8)
	tmp9, err := this._io.ReadBytes(int(this.LenStr))
	if err != nil {
		return err
	}
	tmp9 = tmp9
	this.Str = string(tmp9)
	return err
}
type Mcap_Chunk struct {
	MessageStartTime uint64
	MessageEndTime uint64
	UncompressedSize uint64
	UncompressedCrc32 uint32
	Compression *Mcap_PrefixedStr
	LenRecords uint64
	Records interface{}
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_Records []byte
}
func NewMcap_Chunk() *Mcap_Chunk {
	return &Mcap_Chunk{
	}
}

func (this *Mcap_Chunk) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp10, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageStartTime = uint64(tmp10)
	tmp11, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageEndTime = uint64(tmp11)
	tmp12, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.UncompressedSize = uint64(tmp12)
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.UncompressedCrc32 = uint32(tmp13)
	tmp14 := NewMcap_PrefixedStr()
	err = tmp14.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Compression = tmp14
	tmp15, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenRecords = uint64(tmp15)
	switch (this.Compression.Str) {
	case "":
		tmp16, err := this._io.ReadBytes(int(this.LenRecords))
		if err != nil {
			return err
		}
		tmp16 = tmp16
		this._raw_Records = tmp16
		_io__raw_Records := kaitai.NewStream(bytes.NewReader(this._raw_Records))
		tmp17 := NewMcap_Records()
		err = tmp17.Read(_io__raw_Records, this, this._root)
		if err != nil {
			return err
		}
		this.Records = tmp17
	default:
		tmp18, err := this._io.ReadBytes(int(this.LenRecords))
		if err != nil {
			return err
		}
		tmp18 = tmp18
		this._raw_Records = tmp18
	}
	return err
}

/**
 * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
 * CRC validation should not be performed.
 */
type Mcap_DataEnd struct {
	DataSectionCrc32 uint32
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_DataEnd() *Mcap_DataEnd {
	return &Mcap_DataEnd{
	}
}

func (this *Mcap_DataEnd) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp19, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.DataSectionCrc32 = uint32(tmp19)
	return err
}

/**
 * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
 * available.
 */
type Mcap_Channel struct {
	Id uint16
	SchemaId uint16
	Topic *Mcap_PrefixedStr
	MessageEncoding *Mcap_PrefixedStr
	Metadata *Mcap_MapStrStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_Channel() *Mcap_Channel {
	return &Mcap_Channel{
	}
}

func (this *Mcap_Channel) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp20)
	tmp21, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SchemaId = uint16(tmp21)
	tmp22 := NewMcap_PrefixedStr()
	err = tmp22.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Topic = tmp22
	tmp23 := NewMcap_PrefixedStr()
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.MessageEncoding = tmp23
	tmp24 := NewMcap_MapStrStr()
	err = tmp24.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Metadata = tmp24
	return err
}
type Mcap_MessageIndex struct {
	ChannelId uint16
	LenRecords uint32
	Records *Mcap_MessageIndex_MessageIndexEntries
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_Records []byte
}
func NewMcap_MessageIndex() *Mcap_MessageIndex {
	return &Mcap_MessageIndex{
	}
}

func (this *Mcap_MessageIndex) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelId = uint16(tmp25)
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenRecords = uint32(tmp26)
	tmp27, err := this._io.ReadBytes(int(this.LenRecords))
	if err != nil {
		return err
	}
	tmp27 = tmp27
	this._raw_Records = tmp27
	_io__raw_Records := kaitai.NewStream(bytes.NewReader(this._raw_Records))
	tmp28 := NewMcap_MessageIndex_MessageIndexEntries()
	err = tmp28.Read(_io__raw_Records, this, this._root)
	if err != nil {
		return err
	}
	this.Records = tmp28
	return err
}
type Mcap_MessageIndex_MessageIndexEntry struct {
	LogTime uint64
	Offset uint64
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_MessageIndex_MessageIndexEntries
}
func NewMcap_MessageIndex_MessageIndexEntry() *Mcap_MessageIndex_MessageIndexEntry {
	return &Mcap_MessageIndex_MessageIndexEntry{
	}
}

func (this *Mcap_MessageIndex_MessageIndexEntry) Read(io *kaitai.Stream, parent *Mcap_MessageIndex_MessageIndexEntries, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp29, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LogTime = uint64(tmp29)
	tmp30, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp30)
	return err
}
type Mcap_MessageIndex_MessageIndexEntries struct {
	Entries []*Mcap_MessageIndex_MessageIndexEntry
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_MessageIndex
}
func NewMcap_MessageIndex_MessageIndexEntries() *Mcap_MessageIndex_MessageIndexEntries {
	return &Mcap_MessageIndex_MessageIndexEntries{
	}
}

func (this *Mcap_MessageIndex_MessageIndexEntries) Read(io *kaitai.Stream, parent *Mcap_MessageIndex, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp31, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp31 {
			break
		}
		tmp32 := NewMcap_MessageIndex_MessageIndexEntry()
		err = tmp32.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp32)
	}
	return err
}
type Mcap_Statistics struct {
	MessageCount uint64
	SchemaCount uint16
	ChannelCount uint32
	AttachmentCount uint32
	MetadataCount uint32
	ChunkCount uint32
	MessageStartTime uint64
	MessageEndTime uint64
	LenChannelMessageCounts uint32
	ChannelMessageCounts *Mcap_Statistics_ChannelMessageCounts
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_ChannelMessageCounts []byte
}
func NewMcap_Statistics() *Mcap_Statistics {
	return &Mcap_Statistics{
	}
}

func (this *Mcap_Statistics) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp33, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageCount = uint64(tmp33)
	tmp34, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SchemaCount = uint16(tmp34)
	tmp35, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ChannelCount = uint32(tmp35)
	tmp36, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.AttachmentCount = uint32(tmp36)
	tmp37, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.MetadataCount = uint32(tmp37)
	tmp38, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ChunkCount = uint32(tmp38)
	tmp39, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageStartTime = uint64(tmp39)
	tmp40, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageEndTime = uint64(tmp40)
	tmp41, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenChannelMessageCounts = uint32(tmp41)
	tmp42, err := this._io.ReadBytes(int(this.LenChannelMessageCounts))
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this._raw_ChannelMessageCounts = tmp42
	_io__raw_ChannelMessageCounts := kaitai.NewStream(bytes.NewReader(this._raw_ChannelMessageCounts))
	tmp43 := NewMcap_Statistics_ChannelMessageCounts()
	err = tmp43.Read(_io__raw_ChannelMessageCounts, this, this._root)
	if err != nil {
		return err
	}
	this.ChannelMessageCounts = tmp43
	return err
}
type Mcap_Statistics_ChannelMessageCounts struct {
	Entries []*Mcap_Statistics_ChannelMessageCount
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Statistics
}
func NewMcap_Statistics_ChannelMessageCounts() *Mcap_Statistics_ChannelMessageCounts {
	return &Mcap_Statistics_ChannelMessageCounts{
	}
}

func (this *Mcap_Statistics_ChannelMessageCounts) Read(io *kaitai.Stream, parent *Mcap_Statistics, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp44, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp44 {
			break
		}
		tmp45 := NewMcap_Statistics_ChannelMessageCount()
		err = tmp45.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp45)
	}
	return err
}
type Mcap_Statistics_ChannelMessageCount struct {
	ChannelId uint16
	MessageCount uint64
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Statistics_ChannelMessageCounts
}
func NewMcap_Statistics_ChannelMessageCount() *Mcap_Statistics_ChannelMessageCount {
	return &Mcap_Statistics_ChannelMessageCount{
	}
}

func (this *Mcap_Statistics_ChannelMessageCount) Read(io *kaitai.Stream, parent *Mcap_Statistics_ChannelMessageCounts, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp46, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelId = uint16(tmp46)
	tmp47, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageCount = uint64(tmp47)
	return err
}
type Mcap_AttachmentIndex struct {
	OfsAttachment uint64
	LenAttachment uint64
	LogTime uint64
	CreateTime uint64
	DataSize uint64
	Name *Mcap_PrefixedStr
	ContentType *Mcap_PrefixedStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_attachment []byte
	_f_attachment bool
	attachment *Mcap_Record
}
func NewMcap_AttachmentIndex() *Mcap_AttachmentIndex {
	return &Mcap_AttachmentIndex{
	}
}

func (this *Mcap_AttachmentIndex) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsAttachment = uint64(tmp48)
	tmp49, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenAttachment = uint64(tmp49)
	tmp50, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LogTime = uint64(tmp50)
	tmp51, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.CreateTime = uint64(tmp51)
	tmp52, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.DataSize = uint64(tmp52)
	tmp53 := NewMcap_PrefixedStr()
	err = tmp53.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp53
	tmp54 := NewMcap_PrefixedStr()
	err = tmp54.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ContentType = tmp54
	return err
}
func (this *Mcap_AttachmentIndex) Attachment() (v *Mcap_Record, err error) {
	if (this._f_attachment) {
		return this.attachment, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsAttachment), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp55, err := thisIo.ReadBytes(int(this.LenAttachment))
	if err != nil {
		return nil, err
	}
	tmp55 = tmp55
	this._raw_attachment = tmp55
	_io__raw_attachment := kaitai.NewStream(bytes.NewReader(this._raw_attachment))
	tmp56 := NewMcap_Record()
	err = tmp56.Read(_io__raw_attachment, this, this._root)
	if err != nil {
		return nil, err
	}
	this.attachment = tmp56
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_attachment = true
	this._f_attachment = true
	return this.attachment, nil
}
type Mcap_Schema struct {
	Id uint16
	Name *Mcap_PrefixedStr
	Encoding *Mcap_PrefixedStr
	LenData uint32
	Data []byte
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_Schema() *Mcap_Schema {
	return &Mcap_Schema{
	}
}

func (this *Mcap_Schema) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp57, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Id = uint16(tmp57)
	tmp58 := NewMcap_PrefixedStr()
	err = tmp58.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp58
	tmp59 := NewMcap_PrefixedStr()
	err = tmp59.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Encoding = tmp59
	tmp60, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp60)
	tmp61, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp61 = tmp61
	this.Data = tmp61
	return err
}
type Mcap_MapStrStr struct {
	LenEntries uint32
	Entries *Mcap_MapStrStr_Entries
	_io *kaitai.Stream
	_root *Mcap
	_parent interface{}
	_raw_Entries []byte
}
func NewMcap_MapStrStr() *Mcap_MapStrStr {
	return &Mcap_MapStrStr{
	}
}

func (this *Mcap_MapStrStr) Read(io *kaitai.Stream, parent interface{}, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp62, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenEntries = uint32(tmp62)
	tmp63, err := this._io.ReadBytes(int(this.LenEntries))
	if err != nil {
		return err
	}
	tmp63 = tmp63
	this._raw_Entries = tmp63
	_io__raw_Entries := kaitai.NewStream(bytes.NewReader(this._raw_Entries))
	tmp64 := NewMcap_MapStrStr_Entries()
	err = tmp64.Read(_io__raw_Entries, this, this._root)
	if err != nil {
		return err
	}
	this.Entries = tmp64
	return err
}
type Mcap_MapStrStr_Entries struct {
	Entries []*Mcap_TupleStrStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_MapStrStr
}
func NewMcap_MapStrStr_Entries() *Mcap_MapStrStr_Entries {
	return &Mcap_MapStrStr_Entries{
	}
}

func (this *Mcap_MapStrStr_Entries) Read(io *kaitai.Stream, parent *Mcap_MapStrStr, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp65, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp65 {
			break
		}
		tmp66 := NewMcap_TupleStrStr()
		err = tmp66.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp66)
	}
	return err
}
type Mcap_SummaryOffset struct {
	GroupOpcode Mcap_Opcode
	OfsGroup uint64
	LenGroup uint64
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_group []byte
	_f_group bool
	group *Mcap_Records
}
func NewMcap_SummaryOffset() *Mcap_SummaryOffset {
	return &Mcap_SummaryOffset{
	}
}

func (this *Mcap_SummaryOffset) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp67, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.GroupOpcode = Mcap_Opcode(tmp67)
	tmp68, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsGroup = uint64(tmp68)
	tmp69, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenGroup = uint64(tmp69)
	return err
}
func (this *Mcap_SummaryOffset) Group() (v *Mcap_Records, err error) {
	if (this._f_group) {
		return this.group, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsGroup), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp70, err := thisIo.ReadBytes(int(this.LenGroup))
	if err != nil {
		return nil, err
	}
	tmp70 = tmp70
	this._raw_group = tmp70
	_io__raw_group := kaitai.NewStream(bytes.NewReader(this._raw_group))
	tmp71 := NewMcap_Records()
	err = tmp71.Read(_io__raw_group, this, this._root)
	if err != nil {
		return nil, err
	}
	this.group = tmp71
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_group = true
	this._f_group = true
	return this.group, nil
}
type Mcap_Attachment struct {
	LogTime uint64
	CreateTime uint64
	Name *Mcap_PrefixedStr
	ContentType *Mcap_PrefixedStr
	LenData uint64
	Data []byte
	InvokeCrc32InputEnd []byte
	Crc32 uint32
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_f_crc32InputEnd bool
	crc32InputEnd int
	_f_crc32Input bool
	crc32Input []byte
}
func NewMcap_Attachment() *Mcap_Attachment {
	return &Mcap_Attachment{
	}
}

func (this *Mcap_Attachment) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp72, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LogTime = uint64(tmp72)
	tmp73, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.CreateTime = uint64(tmp73)
	tmp74 := NewMcap_PrefixedStr()
	err = tmp74.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp74
	tmp75 := NewMcap_PrefixedStr()
	err = tmp75.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ContentType = tmp75
	tmp76, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenData = uint64(tmp76)
	tmp77, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp77 = tmp77
	this.Data = tmp77
	tmp78, err := this.Crc32InputEnd()
	if err != nil {
		return err
	}
	if (tmp78 >= 0) {
		tmp79, err := this._io.ReadBytes(int(0))
		if err != nil {
			return err
		}
		tmp79 = tmp79
		this.InvokeCrc32InputEnd = tmp79
	}
	tmp80, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Crc32 = uint32(tmp80)
	return err
}
func (this *Mcap_Attachment) Crc32InputEnd() (v int, err error) {
	if (this._f_crc32InputEnd) {
		return this.crc32InputEnd, nil
	}
	tmp81, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	this.crc32InputEnd = int(tmp81)
	this._f_crc32InputEnd = true
	return this.crc32InputEnd, nil
}
func (this *Mcap_Attachment) Crc32Input() (v []byte, err error) {
	if (this._f_crc32Input) {
		return this.crc32Input, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp82, err := this.Crc32InputEnd()
	if err != nil {
		return nil, err
	}
	tmp83, err := this._io.ReadBytes(int(tmp82))
	if err != nil {
		return nil, err
	}
	tmp83 = tmp83
	this.crc32Input = tmp83
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_crc32Input = true
	this._f_crc32Input = true
	return this.crc32Input, nil
}

/**
 * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
 * CRC validation should not be performed.
 */
type Mcap_Metadata struct {
	Name *Mcap_PrefixedStr
	Metadata *Mcap_MapStrStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_Metadata() *Mcap_Metadata {
	return &Mcap_Metadata{
	}
}

func (this *Mcap_Metadata) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp84 := NewMcap_PrefixedStr()
	err = tmp84.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp84
	tmp85 := NewMcap_MapStrStr()
	err = tmp85.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Metadata = tmp85
	return err
}
type Mcap_Header struct {
	Profile *Mcap_PrefixedStr
	Library *Mcap_PrefixedStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_Header() *Mcap_Header {
	return &Mcap_Header{
	}
}

func (this *Mcap_Header) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp86 := NewMcap_PrefixedStr()
	err = tmp86.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Profile = tmp86
	tmp87 := NewMcap_PrefixedStr()
	err = tmp87.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Library = tmp87
	return err
}
type Mcap_Message struct {
	ChannelId uint16
	Sequence uint32
	LogTime uint64
	PublishTime uint64
	Data []byte
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
}
func NewMcap_Message() *Mcap_Message {
	return &Mcap_Message{
	}
}

func (this *Mcap_Message) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp88, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelId = uint16(tmp88)
	tmp89, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Sequence = uint32(tmp89)
	tmp90, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LogTime = uint64(tmp90)
	tmp91, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.PublishTime = uint64(tmp91)
	tmp92, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp92 = tmp92
	this.Data = tmp92
	return err
}
type Mcap_TupleStrStr struct {
	Key *Mcap_PrefixedStr
	Value *Mcap_PrefixedStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_MapStrStr_Entries
}
func NewMcap_TupleStrStr() *Mcap_TupleStrStr {
	return &Mcap_TupleStrStr{
	}
}

func (this *Mcap_TupleStrStr) Read(io *kaitai.Stream, parent *Mcap_MapStrStr_Entries, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp93 := NewMcap_PrefixedStr()
	err = tmp93.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Key = tmp93
	tmp94 := NewMcap_PrefixedStr()
	err = tmp94.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Value = tmp94
	return err
}
type Mcap_MetadataIndex struct {
	OfsMetadata uint64
	LenMetadata uint64
	Name *Mcap_PrefixedStr
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_metadata []byte
	_f_metadata bool
	metadata *Mcap_Record
}
func NewMcap_MetadataIndex() *Mcap_MetadataIndex {
	return &Mcap_MetadataIndex{
	}
}

func (this *Mcap_MetadataIndex) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp95, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsMetadata = uint64(tmp95)
	tmp96, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenMetadata = uint64(tmp96)
	tmp97 := NewMcap_PrefixedStr()
	err = tmp97.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Name = tmp97
	return err
}
func (this *Mcap_MetadataIndex) Metadata() (v *Mcap_Record, err error) {
	if (this._f_metadata) {
		return this.metadata, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsMetadata), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp98, err := thisIo.ReadBytes(int(this.LenMetadata))
	if err != nil {
		return nil, err
	}
	tmp98 = tmp98
	this._raw_metadata = tmp98
	_io__raw_metadata := kaitai.NewStream(bytes.NewReader(this._raw_metadata))
	tmp99 := NewMcap_Record()
	err = tmp99.Read(_io__raw_metadata, this, this._root)
	if err != nil {
		return nil, err
	}
	this.metadata = tmp99
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_metadata = true
	this._f_metadata = true
	return this.metadata, nil
}
type Mcap_Magic struct {
	Magic []byte
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap
}
func NewMcap_Magic() *Mcap_Magic {
	return &Mcap_Magic{
	}
}

func (this *Mcap_Magic) Read(io *kaitai.Stream, parent *Mcap, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp100, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp100 = tmp100
	this.Magic = tmp100
	if !(bytes.Equal(this.Magic, []uint8{137, 77, 67, 65, 80, 48, 13, 10})) {
		return kaitai.NewValidationNotEqualError([]uint8{137, 77, 67, 65, 80, 48, 13, 10}, this.Magic, this._io, "/types/magic/seq/0")
	}
	return err
}
type Mcap_Records struct {
	Records []*Mcap_Record
	_io *kaitai.Stream
	_root *Mcap
	_parent interface{}
}
func NewMcap_Records() *Mcap_Records {
	return &Mcap_Records{
	}
}

func (this *Mcap_Records) Read(io *kaitai.Stream, parent interface{}, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp101, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp101 {
			break
		}
		tmp102 := NewMcap_Record()
		err = tmp102.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Records = append(this.Records, tmp102)
	}
	return err
}
type Mcap_Footer struct {
	OfsSummarySection uint64
	OfsSummaryOffsetSection uint64
	SummaryCrc32 uint32
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_summarySection []byte
	_raw_summaryOffsetSection []byte
	_f_summarySection bool
	summarySection *Mcap_Records
	_f_summaryOffsetSection bool
	summaryOffsetSection *Mcap_Records
	_f_ofsSummaryCrc32Input bool
	ofsSummaryCrc32Input int
	_f_summaryCrc32Input bool
	summaryCrc32Input []byte
}
func NewMcap_Footer() *Mcap_Footer {
	return &Mcap_Footer{
	}
}

func (this *Mcap_Footer) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp103, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsSummarySection = uint64(tmp103)
	tmp104, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsSummaryOffsetSection = uint64(tmp104)
	tmp105, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.SummaryCrc32 = uint32(tmp105)
	return err
}
func (this *Mcap_Footer) SummarySection() (v *Mcap_Records, err error) {
	if (this._f_summarySection) {
		return this.summarySection, nil
	}
	if (this.OfsSummarySection != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsSummarySection), io.SeekStart)
		if err != nil {
			return nil, err
		}
		var tmp106 uint64;
		if (this.OfsSummaryOffsetSection != 0) {
			tmp106 = this.OfsSummaryOffsetSection
		} else {
			tmp107, err := this._root.OfsFooter()
			if err != nil {
				return nil, err
			}
			tmp106 = tmp107
		}
		tmp108, err := thisIo.ReadBytes(int((tmp106 - this.OfsSummarySection)))
		if err != nil {
			return nil, err
		}
		tmp108 = tmp108
		this._raw_summarySection = tmp108
		_io__raw_summarySection := kaitai.NewStream(bytes.NewReader(this._raw_summarySection))
		tmp109 := NewMcap_Records()
		err = tmp109.Read(_io__raw_summarySection, this, this._root)
		if err != nil {
			return nil, err
		}
		this.summarySection = tmp109
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_summarySection = true
	}
	this._f_summarySection = true
	return this.summarySection, nil
}
func (this *Mcap_Footer) SummaryOffsetSection() (v *Mcap_Records, err error) {
	if (this._f_summaryOffsetSection) {
		return this.summaryOffsetSection, nil
	}
	if (this.OfsSummaryOffsetSection != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsSummaryOffsetSection), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp110, err := this._root.OfsFooter()
		if err != nil {
			return nil, err
		}
		tmp111, err := thisIo.ReadBytes(int((tmp110 - this.OfsSummaryOffsetSection)))
		if err != nil {
			return nil, err
		}
		tmp111 = tmp111
		this._raw_summaryOffsetSection = tmp111
		_io__raw_summaryOffsetSection := kaitai.NewStream(bytes.NewReader(this._raw_summaryOffsetSection))
		tmp112 := NewMcap_Records()
		err = tmp112.Read(_io__raw_summaryOffsetSection, this, this._root)
		if err != nil {
			return nil, err
		}
		this.summaryOffsetSection = tmp112
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_summaryOffsetSection = true
	}
	this._f_summaryOffsetSection = true
	return this.summaryOffsetSection, nil
}
func (this *Mcap_Footer) OfsSummaryCrc32Input() (v int, err error) {
	if (this._f_ofsSummaryCrc32Input) {
		return this.ofsSummaryCrc32Input, nil
	}
	var tmp113 uint64;
	if (this.OfsSummarySection != 0) {
		tmp113 = this.OfsSummarySection
	} else {
		tmp114, err := this._root.OfsFooter()
		if err != nil {
			return 0, err
		}
		tmp113 = tmp114
	}
	this.ofsSummaryCrc32Input = int(tmp113)
	this._f_ofsSummaryCrc32Input = true
	return this.ofsSummaryCrc32Input, nil
}
func (this *Mcap_Footer) SummaryCrc32Input() (v []byte, err error) {
	if (this._f_summaryCrc32Input) {
		return this.summaryCrc32Input, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	tmp115, err := this.OfsSummaryCrc32Input()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(tmp115), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp116, err := this._root._io.Size()
	if err != nil {
		return nil, err
	}
	tmp117, err := this.OfsSummaryCrc32Input()
	if err != nil {
		return nil, err
	}
	tmp118, err := thisIo.ReadBytes(int((((tmp116 - tmp117) - 8) - 4)))
	if err != nil {
		return nil, err
	}
	tmp118 = tmp118
	this.summaryCrc32Input = tmp118
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_summaryCrc32Input = true
	this._f_summaryCrc32Input = true
	return this.summaryCrc32Input, nil
}

/**
 * A CRC-32 of all bytes from the start of the Summary section up through and
 * including the end of the previous field (summary_offset_start) in the footer
 * record. A value of 0 indicates the CRC-32 is not available.
 */
type Mcap_Record struct {
	Op Mcap_Opcode
	LenBody uint64
	Body interface{}
	_io *kaitai.Stream
	_root *Mcap
	_parent interface{}
	_raw_Body []byte
}
func NewMcap_Record() *Mcap_Record {
	return &Mcap_Record{
	}
}

func (this *Mcap_Record) Read(io *kaitai.Stream, parent interface{}, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp119, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Op = Mcap_Opcode(tmp119)
	tmp120, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenBody = uint64(tmp120)
	switch (this.Op) {
	case Mcap_Opcode__Message:
		tmp121, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp121 = tmp121
		this._raw_Body = tmp121
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp122 := NewMcap_Message()
		err = tmp122.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp122
	case Mcap_Opcode__MetadataIndex:
		tmp123, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp123 = tmp123
		this._raw_Body = tmp123
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp124 := NewMcap_MetadataIndex()
		err = tmp124.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp124
	case Mcap_Opcode__Chunk:
		tmp125, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp125 = tmp125
		this._raw_Body = tmp125
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp126 := NewMcap_Chunk()
		err = tmp126.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp126
	case Mcap_Opcode__Schema:
		tmp127, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp127 = tmp127
		this._raw_Body = tmp127
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp128 := NewMcap_Schema()
		err = tmp128.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp128
	case Mcap_Opcode__ChunkIndex:
		tmp129, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp129 = tmp129
		this._raw_Body = tmp129
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp130 := NewMcap_ChunkIndex()
		err = tmp130.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp130
	case Mcap_Opcode__DataEnd:
		tmp131, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp131 = tmp131
		this._raw_Body = tmp131
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp132 := NewMcap_DataEnd()
		err = tmp132.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp132
	case Mcap_Opcode__AttachmentIndex:
		tmp133, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp133 = tmp133
		this._raw_Body = tmp133
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp134 := NewMcap_AttachmentIndex()
		err = tmp134.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp134
	case Mcap_Opcode__Statistics:
		tmp135, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp135 = tmp135
		this._raw_Body = tmp135
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp136 := NewMcap_Statistics()
		err = tmp136.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp136
	case Mcap_Opcode__MessageIndex:
		tmp137, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp137 = tmp137
		this._raw_Body = tmp137
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp138 := NewMcap_MessageIndex()
		err = tmp138.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp138
	case Mcap_Opcode__Channel:
		tmp139, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp139 = tmp139
		this._raw_Body = tmp139
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp140 := NewMcap_Channel()
		err = tmp140.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp140
	case Mcap_Opcode__Metadata:
		tmp141, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp141 = tmp141
		this._raw_Body = tmp141
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp142 := NewMcap_Metadata()
		err = tmp142.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp142
	case Mcap_Opcode__Attachment:
		tmp143, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp143 = tmp143
		this._raw_Body = tmp143
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp144 := NewMcap_Attachment()
		err = tmp144.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp144
	case Mcap_Opcode__Header:
		tmp145, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp145 = tmp145
		this._raw_Body = tmp145
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp146 := NewMcap_Header()
		err = tmp146.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp146
	case Mcap_Opcode__Footer:
		tmp147, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp147 = tmp147
		this._raw_Body = tmp147
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp148 := NewMcap_Footer()
		err = tmp148.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp148
	case Mcap_Opcode__SummaryOffset:
		tmp149, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp149 = tmp149
		this._raw_Body = tmp149
		_io__raw_Body := kaitai.NewStream(bytes.NewReader(this._raw_Body))
		tmp150 := NewMcap_SummaryOffset()
		err = tmp150.Read(_io__raw_Body, this, this._root)
		if err != nil {
			return err
		}
		this.Body = tmp150
	default:
		tmp151, err := this._io.ReadBytes(int(this.LenBody))
		if err != nil {
			return err
		}
		tmp151 = tmp151
		this._raw_Body = tmp151
	}
	return err
}
type Mcap_ChunkIndex struct {
	MessageStartTime uint64
	MessageEndTime uint64
	OfsChunk uint64
	LenChunk uint64
	LenMessageIndexOffsets uint32
	MessageIndexOffsets *Mcap_ChunkIndex_MessageIndexOffsets
	MessageIndexLength uint64
	Compression *Mcap_PrefixedStr
	CompressedSize uint64
	UncompressedSize uint64
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_Record
	_raw_MessageIndexOffsets []byte
	_raw_chunk []byte
	_f_chunk bool
	chunk *Mcap_Record
}
func NewMcap_ChunkIndex() *Mcap_ChunkIndex {
	return &Mcap_ChunkIndex{
	}
}

func (this *Mcap_ChunkIndex) Read(io *kaitai.Stream, parent *Mcap_Record, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp152, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageStartTime = uint64(tmp152)
	tmp153, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageEndTime = uint64(tmp153)
	tmp154, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsChunk = uint64(tmp154)
	tmp155, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenChunk = uint64(tmp155)
	tmp156, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenMessageIndexOffsets = uint32(tmp156)
	tmp157, err := this._io.ReadBytes(int(this.LenMessageIndexOffsets))
	if err != nil {
		return err
	}
	tmp157 = tmp157
	this._raw_MessageIndexOffsets = tmp157
	_io__raw_MessageIndexOffsets := kaitai.NewStream(bytes.NewReader(this._raw_MessageIndexOffsets))
	tmp158 := NewMcap_ChunkIndex_MessageIndexOffsets()
	err = tmp158.Read(_io__raw_MessageIndexOffsets, this, this._root)
	if err != nil {
		return err
	}
	this.MessageIndexOffsets = tmp158
	tmp159, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.MessageIndexLength = uint64(tmp159)
	tmp160 := NewMcap_PrefixedStr()
	err = tmp160.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Compression = tmp160
	tmp161, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.CompressedSize = uint64(tmp161)
	tmp162, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.UncompressedSize = uint64(tmp162)
	return err
}
func (this *Mcap_ChunkIndex) Chunk() (v *Mcap_Record, err error) {
	if (this._f_chunk) {
		return this.chunk, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsChunk), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp163, err := thisIo.ReadBytes(int(this.LenChunk))
	if err != nil {
		return nil, err
	}
	tmp163 = tmp163
	this._raw_chunk = tmp163
	_io__raw_chunk := kaitai.NewStream(bytes.NewReader(this._raw_chunk))
	tmp164 := NewMcap_Record()
	err = tmp164.Read(_io__raw_chunk, this, this._root)
	if err != nil {
		return nil, err
	}
	this.chunk = tmp164
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_chunk = true
	this._f_chunk = true
	return this.chunk, nil
}
type Mcap_ChunkIndex_MessageIndexOffset struct {
	ChannelId uint16
	Offset uint64
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_ChunkIndex_MessageIndexOffsets
}
func NewMcap_ChunkIndex_MessageIndexOffset() *Mcap_ChunkIndex_MessageIndexOffset {
	return &Mcap_ChunkIndex_MessageIndexOffset{
	}
}

func (this *Mcap_ChunkIndex_MessageIndexOffset) Read(io *kaitai.Stream, parent *Mcap_ChunkIndex_MessageIndexOffsets, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp165, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.ChannelId = uint16(tmp165)
	tmp166, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Offset = uint64(tmp166)
	return err
}
type Mcap_ChunkIndex_MessageIndexOffsets struct {
	Entries []*Mcap_ChunkIndex_MessageIndexOffset
	_io *kaitai.Stream
	_root *Mcap
	_parent *Mcap_ChunkIndex
}
func NewMcap_ChunkIndex_MessageIndexOffsets() *Mcap_ChunkIndex_MessageIndexOffsets {
	return &Mcap_ChunkIndex_MessageIndexOffsets{
	}
}

func (this *Mcap_ChunkIndex_MessageIndexOffsets) Read(io *kaitai.Stream, parent *Mcap_ChunkIndex, root *Mcap) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp167, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp167 {
			break
		}
		tmp168 := NewMcap_ChunkIndex_MessageIndexOffset()
		err = tmp168.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp168)
	}
	return err
}