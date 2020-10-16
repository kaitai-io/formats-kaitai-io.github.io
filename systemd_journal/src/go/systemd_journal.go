// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
	"io"
)


/**
 * systemd, a popular user-space system/service management suite on Linux,
 * offers logging functionality, storing incoming logs in a binary journal
 * format.
 * 
 * On live Linux system running systemd, these journals are typically located at:
 * 
 * * /run/log/journal/machine-id/*.journal (volatile, lost after reboot)
 * * /var/log/journal/machine-id/*.journal (persistent, but disabled by default on Debian / Ubuntu)
 * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/">Source</a>
 */

type SystemdJournal_State int
const (
	SystemdJournal_State__Offline SystemdJournal_State = 0
	SystemdJournal_State__Online SystemdJournal_State = 1
	SystemdJournal_State__Archived SystemdJournal_State = 2
)
type SystemdJournal struct {
	Header *SystemdJournal_Header
	Objects []*SystemdJournal_JournalObject
	_io *kaitai.Stream
	_root *SystemdJournal
	_parent interface{}
	_raw_Header []byte
	_f_lenHeader bool
	lenHeader uint64
	_f_dataHashTable bool
	dataHashTable []byte
	_f_fieldHashTable bool
	fieldHashTable []byte
}
func NewSystemdJournal() *SystemdJournal {
	return &SystemdJournal{
	}
}

func (this *SystemdJournal) Read(io *kaitai.Stream, parent interface{}, root *SystemdJournal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this.LenHeader()
	if err != nil {
		return err
	}
	tmp2, err := this._io.ReadBytes(int(tmp1))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this._raw_Header = tmp2
	_io__raw_Header := kaitai.NewStream(bytes.NewReader(this._raw_Header))
	tmp3 := NewSystemdJournal_Header()
	err = tmp3.Read(_io__raw_Header, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp3
	this.Objects = make([]*SystemdJournal_JournalObject, this.Header.NumObjects)
	for i := range this.Objects {
		tmp4 := NewSystemdJournal_JournalObject()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Objects[i] = tmp4
	}
	return err
}

/**
 * Header length is used to set substream size, as it thus required
 * prior to declaration of header.
 */
func (this *SystemdJournal) LenHeader() (v uint64, err error) {
	if (this._f_lenHeader) {
		return this.lenHeader, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(88), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp5, err := this._io.ReadU8le()
	if err != nil {
		return 0, err
	}
	this.lenHeader = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_lenHeader = true
	this._f_lenHeader = true
	return this.lenHeader, nil
}
func (this *SystemdJournal) DataHashTable() (v []byte, err error) {
	if (this._f_dataHashTable) {
		return this.dataHashTable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.OfsDataHashTable), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp6, err := this._io.ReadBytes(int(this.Header.LenDataHashTable))
	if err != nil {
		return nil, err
	}
	tmp6 = tmp6
	this.dataHashTable = tmp6
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_dataHashTable = true
	this._f_dataHashTable = true
	return this.dataHashTable, nil
}
func (this *SystemdJournal) FieldHashTable() (v []byte, err error) {
	if (this._f_fieldHashTable) {
		return this.fieldHashTable, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.OfsFieldHashTable), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7, err := this._io.ReadBytes(int(this.Header.LenFieldHashTable))
	if err != nil {
		return nil, err
	}
	tmp7 = tmp7
	this.fieldHashTable = tmp7
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_fieldHashTable = true
	this._f_fieldHashTable = true
	return this.fieldHashTable, nil
}
type SystemdJournal_Header struct {
	Signature []byte
	CompatibleFlags uint32
	IncompatibleFlags uint32
	State SystemdJournal_State
	Reserved []byte
	FileId []byte
	MachineId []byte
	BootId []byte
	SeqnumId []byte
	LenHeader uint64
	LenArena uint64
	OfsDataHashTable uint64
	LenDataHashTable uint64
	OfsFieldHashTable uint64
	LenFieldHashTable uint64
	OfsTailObject uint64
	NumObjects uint64
	NumEntries uint64
	TailEntrySeqnum uint64
	HeadEntrySeqnum uint64
	OfsEntryArray uint64
	HeadEntryRealtime uint64
	TailEntryRealtime uint64
	TailEntryMonotonic uint64
	NumData uint64
	NumFields uint64
	NumTags uint64
	NumEntryArrays uint64
	_io *kaitai.Stream
	_root *SystemdJournal
	_parent *SystemdJournal
}
func NewSystemdJournal_Header() *SystemdJournal_Header {
	return &SystemdJournal_Header{
	}
}

func (this *SystemdJournal_Header) Read(io *kaitai.Stream, parent *SystemdJournal, root *SystemdJournal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp8, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp8 = tmp8
	this.Signature = tmp8
	if !(bytes.Equal(this.Signature, []uint8{76, 80, 75, 83, 72, 72, 82, 72})) {
		return kaitai.NewValidationNotEqualError([]uint8{76, 80, 75, 83, 72, 72, 82, 72}, this.Signature, this._io, "/types/header/seq/0")
	}
	tmp9, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.CompatibleFlags = uint32(tmp9)
	tmp10, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.IncompatibleFlags = uint32(tmp10)
	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.State = SystemdJournal_State(tmp11)
	tmp12, err := this._io.ReadBytes(int(7))
	if err != nil {
		return err
	}
	tmp12 = tmp12
	this.Reserved = tmp12
	tmp13, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp13 = tmp13
	this.FileId = tmp13
	tmp14, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.MachineId = tmp14
	tmp15, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp15 = tmp15
	this.BootId = tmp15
	tmp16, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp16 = tmp16
	this.SeqnumId = tmp16
	tmp17, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenHeader = uint64(tmp17)
	tmp18, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenArena = uint64(tmp18)
	tmp19, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsDataHashTable = uint64(tmp19)
	tmp20, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenDataHashTable = uint64(tmp20)
	tmp21, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsFieldHashTable = uint64(tmp21)
	tmp22, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenFieldHashTable = uint64(tmp22)
	tmp23, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsTailObject = uint64(tmp23)
	tmp24, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.NumObjects = uint64(tmp24)
	tmp25, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.NumEntries = uint64(tmp25)
	tmp26, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TailEntrySeqnum = uint64(tmp26)
	tmp27, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.HeadEntrySeqnum = uint64(tmp27)
	tmp28, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsEntryArray = uint64(tmp28)
	tmp29, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.HeadEntryRealtime = uint64(tmp29)
	tmp30, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TailEntryRealtime = uint64(tmp30)
	tmp31, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.TailEntryMonotonic = uint64(tmp31)
	tmp32, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp32)) {
		tmp33, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.NumData = uint64(tmp33)
	}
	tmp34, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp34)) {
		tmp35, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.NumFields = uint64(tmp35)
	}
	tmp36, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp36)) {
		tmp37, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.NumTags = uint64(tmp37)
	}
	tmp38, err := this._io.EOF()
	if err != nil {
		return err
	}
	if (!(tmp38)) {
		tmp39, err := this._io.ReadU8le()
		if err != nil {
			return err
		}
		this.NumEntryArrays = uint64(tmp39)
	}
	return err
}

/**
 * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#objects">Source</a>
 */

type SystemdJournal_JournalObject_ObjectTypes int
const (
	SystemdJournal_JournalObject_ObjectTypes__Unused SystemdJournal_JournalObject_ObjectTypes = 0
	SystemdJournal_JournalObject_ObjectTypes__Data SystemdJournal_JournalObject_ObjectTypes = 1
	SystemdJournal_JournalObject_ObjectTypes__Field SystemdJournal_JournalObject_ObjectTypes = 2
	SystemdJournal_JournalObject_ObjectTypes__Entry SystemdJournal_JournalObject_ObjectTypes = 3
	SystemdJournal_JournalObject_ObjectTypes__DataHashTable SystemdJournal_JournalObject_ObjectTypes = 4
	SystemdJournal_JournalObject_ObjectTypes__FieldHashTable SystemdJournal_JournalObject_ObjectTypes = 5
	SystemdJournal_JournalObject_ObjectTypes__EntryArray SystemdJournal_JournalObject_ObjectTypes = 6
	SystemdJournal_JournalObject_ObjectTypes__Tag SystemdJournal_JournalObject_ObjectTypes = 7
)
type SystemdJournal_JournalObject struct {
	Padding []byte
	ObjectType SystemdJournal_JournalObject_ObjectTypes
	Flags uint8
	Reserved []byte
	LenObject uint64
	Payload interface{}
	_io *kaitai.Stream
	_root *SystemdJournal
	_parent interface{}
	_raw_Payload []byte
}
func NewSystemdJournal_JournalObject() *SystemdJournal_JournalObject {
	return &SystemdJournal_JournalObject{
	}
}

func (this *SystemdJournal_JournalObject) Read(io *kaitai.Stream, parent interface{}, root *SystemdJournal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.Pos()
	if err != nil {
		return err
	}
	tmp40 := (8 - tmp41) % 8
	if tmp40 < 0 {
		tmp40 += 8
	}
	tmp42, err := this._io.ReadBytes(int(tmp40))
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this.Padding = tmp42
	tmp43, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.ObjectType = SystemdJournal_JournalObject_ObjectTypes(tmp43)
	tmp44, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp44
	tmp45, err := this._io.ReadBytes(int(6))
	if err != nil {
		return err
	}
	tmp45 = tmp45
	this.Reserved = tmp45
	tmp46, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.LenObject = uint64(tmp46)
	switch (this.ObjectType) {
	case SystemdJournal_JournalObject_ObjectTypes__Data:
		tmp47, err := this._io.ReadBytes(int((this.LenObject - 16)))
		if err != nil {
			return err
		}
		tmp47 = tmp47
		this._raw_Payload = tmp47
		_io__raw_Payload := kaitai.NewStream(bytes.NewReader(this._raw_Payload))
		tmp48 := NewSystemdJournal_DataObject()
		err = tmp48.Read(_io__raw_Payload, this, this._root)
		if err != nil {
			return err
		}
		this.Payload = tmp48
	default:
		tmp49, err := this._io.ReadBytes(int((this.LenObject - 16)))
		if err != nil {
			return err
		}
		tmp49 = tmp49
		this._raw_Payload = tmp49
	}
	return err
}

/**
 * Data objects are designed to carry log payload, typically in
 * form of a "key=value" string in `payload` attribute.
 * @see <a href="https://www.freedesktop.org/wiki/Software/systemd/journal-files/#dataobjects">Source</a>
 */
type SystemdJournal_DataObject struct {
	Hash uint64
	OfsNextHash uint64
	OfsHeadField uint64
	OfsEntry uint64
	OfsEntryArray uint64
	NumEntries uint64
	Payload []byte
	_io *kaitai.Stream
	_root *SystemdJournal
	_parent *SystemdJournal_JournalObject
	_f_nextHash bool
	nextHash *SystemdJournal_JournalObject
	_f_headField bool
	headField *SystemdJournal_JournalObject
	_f_entry bool
	entry *SystemdJournal_JournalObject
	_f_entryArray bool
	entryArray *SystemdJournal_JournalObject
}
func NewSystemdJournal_DataObject() *SystemdJournal_DataObject {
	return &SystemdJournal_DataObject{
	}
}

func (this *SystemdJournal_DataObject) Read(io *kaitai.Stream, parent *SystemdJournal_JournalObject, root *SystemdJournal) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp50, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.Hash = uint64(tmp50)
	tmp51, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsNextHash = uint64(tmp51)
	tmp52, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsHeadField = uint64(tmp52)
	tmp53, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsEntry = uint64(tmp53)
	tmp54, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.OfsEntryArray = uint64(tmp54)
	tmp55, err := this._io.ReadU8le()
	if err != nil {
		return err
	}
	this.NumEntries = uint64(tmp55)
	tmp56, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp56 = tmp56
	this.Payload = tmp56
	return err
}
func (this *SystemdJournal_DataObject) NextHash() (v *SystemdJournal_JournalObject, err error) {
	if (this._f_nextHash) {
		return this.nextHash, nil
	}
	if (this.OfsNextHash != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsNextHash), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp57 := NewSystemdJournal_JournalObject()
		err = tmp57.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.nextHash = tmp57
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_nextHash = true
	}
	this._f_nextHash = true
	return this.nextHash, nil
}
func (this *SystemdJournal_DataObject) HeadField() (v *SystemdJournal_JournalObject, err error) {
	if (this._f_headField) {
		return this.headField, nil
	}
	if (this.OfsHeadField != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsHeadField), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp58 := NewSystemdJournal_JournalObject()
		err = tmp58.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.headField = tmp58
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_headField = true
	}
	this._f_headField = true
	return this.headField, nil
}
func (this *SystemdJournal_DataObject) Entry() (v *SystemdJournal_JournalObject, err error) {
	if (this._f_entry) {
		return this.entry, nil
	}
	if (this.OfsEntry != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsEntry), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp59 := NewSystemdJournal_JournalObject()
		err = tmp59.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.entry = tmp59
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_entry = true
	}
	this._f_entry = true
	return this.entry, nil
}
func (this *SystemdJournal_DataObject) EntryArray() (v *SystemdJournal_JournalObject, err error) {
	if (this._f_entryArray) {
		return this.entryArray, nil
	}
	if (this.OfsEntryArray != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsEntryArray), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp60 := NewSystemdJournal_JournalObject()
		err = tmp60.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.entryArray = tmp60
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_entryArray = true
	}
	this._f_entryArray = true
	return this.entryArray, nil
}
