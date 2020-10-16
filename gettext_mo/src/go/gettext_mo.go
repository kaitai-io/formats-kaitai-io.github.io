// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * @see <a href="https://gitlab.com/worr/libintl">Source</a>
 */
type GettextMo struct {
	Signature []byte
	Mo *GettextMo_Mo
	_io *kaitai.Stream
	_root *GettextMo
	_parent interface{}
}
func NewGettextMo() *GettextMo {
	return &GettextMo{
	}
}

func (this *GettextMo) Read(io *kaitai.Stream, parent interface{}, root *GettextMo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Signature = tmp1
	tmp2 := NewGettextMo_Mo()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Mo = tmp2
	return err
}
type GettextMo_HashLookupIteration struct {
	Idx uint32
	CollisionStep uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent interface{}
	_f_original bool
	original string
	_f_translation bool
	translation string
	_f_nextIdx bool
	nextIdx int
	_f_next bool
	next *GettextMo_HashLookupIteration
}
func NewGettextMo_HashLookupIteration(idx uint32, collisionStep uint32) *GettextMo_HashLookupIteration {
	return &GettextMo_HashLookupIteration{
		Idx: idx,
		CollisionStep: collisionStep,
	}
}

func (this *GettextMo_HashLookupIteration) Read(io *kaitai.Stream, parent interface{}, root *GettextMo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *GettextMo_HashLookupIteration) Original() (v string, err error) {
	if (this._f_original) {
		return this.original, nil
	}
	tmp3, err := this._root.Mo.Originals()
	if err != nil {
		return "", err
	}
	tmp4, err := tmp3[this.Idx].Str()
	if err != nil {
		return "", err
	}
	this.original = string(tmp4)
	this._f_original = true
	return this.original, nil
}
func (this *GettextMo_HashLookupIteration) Translation() (v string, err error) {
	if (this._f_translation) {
		return this.translation, nil
	}
	tmp5, err := this._root.Mo.Translations()
	if err != nil {
		return "", err
	}
	tmp6, err := tmp5[this.Idx].Str()
	if err != nil {
		return "", err
	}
	this.translation = string(tmp6)
	this._f_translation = true
	return this.translation, nil
}
func (this *GettextMo_HashLookupIteration) NextIdx() (v int, err error) {
	if (this._f_nextIdx) {
		return this.nextIdx, nil
	}
	var tmp7 uint32;
	if (this.Idx >= (this._root.Mo.NumHashtableItems - this.CollisionStep)) {
		tmp7 = this._root.Mo.NumHashtableItems
	} else {
		tmp7 = 0
	}
	this.nextIdx = int(((this.Idx + this.CollisionStep) - tmp7))
	this._f_nextIdx = true
	return this.nextIdx, nil
}
func (this *GettextMo_HashLookupIteration) Next() (v *GettextMo_HashLookupIteration, err error) {
	if (this._f_next) {
		return this.next, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp9, err := this._root.Mo.HashtableItems()
	if err != nil {
		return nil, err
	}
	tmp10, err := this.NextIdx()
	if err != nil {
		return nil, err
	}
	tmp11, err := tmp9[tmp10].Val()
	if err != nil {
		return nil, err
	}
	tmp8 := NewGettextMo_HashLookupIteration(tmp11, this.CollisionStep)
	err = tmp8.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.next = tmp8
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_next = true
	this._f_next = true
	return this.next, nil
}
type GettextMo_LookupIteration struct {
	Current *GettextMo_HashLookupIteration
	Query string
	_io *kaitai.Stream
	_root *GettextMo
	_parent interface{}
	_f_found bool
	found bool
	_f_next bool
	next *GettextMo_LookupIteration
}
func NewGettextMo_LookupIteration(current *GettextMo_HashLookupIteration, query string) *GettextMo_LookupIteration {
	return &GettextMo_LookupIteration{
		Current: current,
		Query: query,
	}
}

func (this *GettextMo_LookupIteration) Read(io *kaitai.Stream, parent interface{}, root *GettextMo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *GettextMo_LookupIteration) Found() (v bool, err error) {
	if (this._f_found) {
		return this.found, nil
	}
	tmp12, err := this.Current.Original()
	if err != nil {
		return false, err
	}
	this.found = bool(this.Query == tmp12)
	this._f_found = true
	return this.found, nil
}
func (this *GettextMo_LookupIteration) Next() (v *GettextMo_LookupIteration, err error) {
	if (this._f_next) {
		return this.next, nil
	}
	tmp13, err := this.Found()
	if err != nil {
		return nil, err
	}
	if (!(tmp13)) {
		_pos, err := this._io.Pos()
		if err != nil {
			return nil, err
		}
		_, err = this._io.Seek(int64(0), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp15, err := this.Current.Next()
		if err != nil {
			return nil, err
		}
		tmp14 := NewGettextMo_LookupIteration(tmp15, this.Query)
		err = tmp14.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.next = tmp14
		_, err = this._io.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_next = true
	}
	this._f_next = true
	return this.next, nil
}

/**
 * def lookup(s:str, t:gettext_mo.GettextMo):
 *   try:
 *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
 *     e=l.entry
 *     while(not e.found):
 *       e=e.next
 *     return e.current
 *   except:
 *     raise Exception("Not found "+s+" in the hashtable!")
 * 
 * lookup(t.mo.originals[145].str, t)
 * @see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c">Source</a>
 */
type GettextMo_HashtableLookup struct {
	Query string
	Hash uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent interface{}
	_f_collisionStep bool
	collisionStep int
	_f_idx bool
	idx int
	_f_hashLookupIteration bool
	hashLookupIteration *GettextMo_HashLookupIteration
	_f_entry bool
	entry *GettextMo_LookupIteration
}
func NewGettextMo_HashtableLookup(query string, hash uint32) *GettextMo_HashtableLookup {
	return &GettextMo_HashtableLookup{
		Query: query,
		Hash: hash,
	}
}

func (this *GettextMo_HashtableLookup) Read(io *kaitai.Stream, parent interface{}, root *GettextMo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	return err
}
func (this *GettextMo_HashtableLookup) CollisionStep() (v int, err error) {
	if (this._f_collisionStep) {
		return this.collisionStep, nil
	}
	tmp16 := this.Hash % (this._root.Mo.NumHashtableItems - 2)
	if tmp16 < 0 {
		tmp16 += (this._root.Mo.NumHashtableItems - 2)
	}
	this.collisionStep = int((tmp16 + 1))
	this._f_collisionStep = true
	return this.collisionStep, nil
}
func (this *GettextMo_HashtableLookup) Idx() (v int, err error) {
	if (this._f_idx) {
		return this.idx, nil
	}
	tmp17 := this.Hash % this._root.Mo.NumHashtableItems
	if tmp17 < 0 {
		tmp17 += this._root.Mo.NumHashtableItems
	}
	this.idx = int(tmp17)
	this._f_idx = true
	return this.idx, nil
}
func (this *GettextMo_HashtableLookup) HashLookupIteration() (v *GettextMo_HashLookupIteration, err error) {
	if (this._f_hashLookupIteration) {
		return this.hashLookupIteration, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp19, err := this._root.Mo.HashtableItems()
	if err != nil {
		return nil, err
	}
	tmp20, err := this.Idx()
	if err != nil {
		return nil, err
	}
	tmp21, err := tmp19[tmp20].Val()
	if err != nil {
		return nil, err
	}
	tmp22, err := this.CollisionStep()
	if err != nil {
		return nil, err
	}
	tmp18 := NewGettextMo_HashLookupIteration(tmp21, tmp22)
	err = tmp18.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.hashLookupIteration = tmp18
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_hashLookupIteration = true
	this._f_hashLookupIteration = true
	return this.hashLookupIteration, nil
}
func (this *GettextMo_HashtableLookup) Entry() (v *GettextMo_LookupIteration, err error) {
	if (this._f_entry) {
		return this.entry, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp24, err := this.HashLookupIteration()
	if err != nil {
		return nil, err
	}
	tmp23 := NewGettextMo_LookupIteration(tmp24, this.Query)
	err = tmp23.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.entry = tmp23
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_entry = true
	this._f_entry = true
	return this.entry, nil
}
type GettextMo_Mo struct {
	Version *GettextMo_Mo_Version
	NumTranslations uint32
	OfsOriginals uint32
	OfsTranslations uint32
	NumHashtableItems uint32
	OfsHashtableItems uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent *GettextMo
	_f_originals bool
	originals []*GettextMo_Mo_Descriptor
	_f_translations bool
	translations []*GettextMo_Mo_Descriptor
	_f_hashtableItems bool
	hashtableItems []*GettextMo_Mo_HashtableItem
	_is_le int
}
func NewGettextMo_Mo() *GettextMo_Mo {
	return &GettextMo_Mo{
	}
}

func (this *GettextMo_Mo) Read(io *kaitai.Stream, parent *GettextMo, root *GettextMo) (err error) {
	this._io = io
	this._parent = parent
	this._root = root
	this._is_le = -1

	switch (true) {
	case bytes.Equal(this._root.Signature, []uint8{222, 18, 4, 149}):
		this._is_le = int(1)
	case bytes.Equal(this._root.Signature, []uint8{149, 4, 18, 222}):
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

func (this *GettextMo_Mo) _read_le() (err error) {
	tmp25 := NewGettextMo_Mo_Version()
	err = tmp25.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp25
	tmp26, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumTranslations = uint32(tmp26)
	tmp27, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsOriginals = uint32(tmp27)
	tmp28, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsTranslations = uint32(tmp28)
	tmp29, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumHashtableItems = uint32(tmp29)
	tmp30, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsHashtableItems = uint32(tmp30)
	return err
}

func (this *GettextMo_Mo) _read_be() (err error) {
	tmp31 := NewGettextMo_Mo_Version()
	err = tmp31.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Version = tmp31
	tmp32, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumTranslations = uint32(tmp32)
	tmp33, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsOriginals = uint32(tmp33)
	tmp34, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsTranslations = uint32(tmp34)
	tmp35, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.NumHashtableItems = uint32(tmp35)
	tmp36, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsHashtableItems = uint32(tmp36)
	return err
}
func (this *GettextMo_Mo) Originals() (v []*GettextMo_Mo_Descriptor, err error) {
	if (this._f_originals) {
		return this.originals, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsOriginals), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		this.originals = make([]*GettextMo_Mo_Descriptor, this.NumTranslations)
		for i := range this.originals {
			tmp37 := NewGettextMo_Mo_Descriptor()
			err = tmp37.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.originals[i] = tmp37
		}
	case 1:
		this.originals = make([]*GettextMo_Mo_Descriptor, this.NumTranslations)
		for i := range this.originals {
			tmp38 := NewGettextMo_Mo_Descriptor()
			err = tmp38.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.originals[i] = tmp38
		}
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_originals = true
	this._f_originals = true
	return this.originals, nil
}
func (this *GettextMo_Mo) Translations() (v []*GettextMo_Mo_Descriptor, err error) {
	if (this._f_translations) {
		return this.translations, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsTranslations), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch this._is_le {
	case 0:
		this.translations = make([]*GettextMo_Mo_Descriptor, this.NumTranslations)
		for i := range this.translations {
			tmp39 := NewGettextMo_Mo_Descriptor()
			err = tmp39.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.translations[i] = tmp39
		}
	case 1:
		this.translations = make([]*GettextMo_Mo_Descriptor, this.NumTranslations)
		for i := range this.translations {
			tmp40 := NewGettextMo_Mo_Descriptor()
			err = tmp40.Read(thisIo, this, this._root)
			if err != nil {
				return nil, err
			}
			this.translations[i] = tmp40
		}
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_translations = true
	this._f_translations = true
	return this.translations, nil
}
func (this *GettextMo_Mo) HashtableItems() (v []*GettextMo_Mo_HashtableItem, err error) {
	if (this._f_hashtableItems) {
		return this.hashtableItems, nil
	}
	if (this.OfsHashtableItems != 0) {
		thisIo := this._root._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsHashtableItems), io.SeekStart)
		if err != nil {
			return nil, err
		}
		switch this._is_le {
		case 0:
			this.hashtableItems = make([]*GettextMo_Mo_HashtableItem, this.NumHashtableItems)
			for i := range this.hashtableItems {
				tmp41 := NewGettextMo_Mo_HashtableItem()
				err = tmp41.Read(thisIo, this, this._root)
				if err != nil {
					return nil, err
				}
				this.hashtableItems[i] = tmp41
			}
		case 1:
			this.hashtableItems = make([]*GettextMo_Mo_HashtableItem, this.NumHashtableItems)
			for i := range this.hashtableItems {
				tmp42 := NewGettextMo_Mo_HashtableItem()
				err = tmp42.Read(thisIo, this, this._root)
				if err != nil {
					return nil, err
				}
				this.hashtableItems[i] = tmp42
			}
		default:
			err = kaitai.UndecidedEndiannessError{}
		}
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_hashtableItems = true
	}
	this._f_hashtableItems = true
	return this.hashtableItems, nil
}
type GettextMo_Mo_Version struct {
	VersionRaw uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent *GettextMo_Mo
	_f_major bool
	major int
	_f_minor bool
	minor int
	_is_le int
}
func NewGettextMo_Mo_Version() *GettextMo_Mo_Version {
	return &GettextMo_Mo_Version{
	}
}

func (this *GettextMo_Mo_Version) Read(io *kaitai.Stream, parent *GettextMo_Mo, root *GettextMo) (err error) {
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

func (this *GettextMo_Mo_Version) _read_le() (err error) {
	tmp43, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.VersionRaw = uint32(tmp43)
	return err
}

func (this *GettextMo_Mo_Version) _read_be() (err error) {
	tmp44, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.VersionRaw = uint32(tmp44)
	return err
}
func (this *GettextMo_Mo_Version) Major() (v int, err error) {
	if (this._f_major) {
		return this.major, nil
	}
	this.major = int((this.VersionRaw >> 16))
	this._f_major = true
	return this.major, nil
}
func (this *GettextMo_Mo_Version) Minor() (v int, err error) {
	if (this._f_minor) {
		return this.minor, nil
	}
	this.minor = int((this.VersionRaw & 65535))
	this._f_minor = true
	return this.minor, nil
}
type GettextMo_Mo_HashtableItem struct {
	RawVal uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent *GettextMo_Mo
	_f_mask bool
	mask int
	_f_val1 bool
	val1 int
	_f_isSystemDependent bool
	isSystemDependent bool
	_f_val bool
	val int
	_is_le int
}
func NewGettextMo_Mo_HashtableItem() *GettextMo_Mo_HashtableItem {
	return &GettextMo_Mo_HashtableItem{
	}
}

func (this *GettextMo_Mo_HashtableItem) Read(io *kaitai.Stream, parent *GettextMo_Mo, root *GettextMo) (err error) {
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

func (this *GettextMo_Mo_HashtableItem) _read_le() (err error) {
	tmp45, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.RawVal = uint32(tmp45)
	return err
}

func (this *GettextMo_Mo_HashtableItem) _read_be() (err error) {
	tmp46, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.RawVal = uint32(tmp46)
	return err
}
func (this *GettextMo_Mo_HashtableItem) Mask() (v int, err error) {
	if (this._f_mask) {
		return this.mask, nil
	}
	this.mask = int(uint32(2147483648))
	this._f_mask = true
	return this.mask, nil
}
func (this *GettextMo_Mo_HashtableItem) Val1() (v int, err error) {
	if (this._f_val1) {
		return this.val1, nil
	}
	if (this.RawVal != 0) {
		this.val1 = int((this.RawVal - 1))
	}
	this._f_val1 = true
	return this.val1, nil
}
func (this *GettextMo_Mo_HashtableItem) IsSystemDependent() (v bool, err error) {
	if (this._f_isSystemDependent) {
		return this.isSystemDependent, nil
	}
	if (this.RawVal != 0) {
		tmp47, err := this.Val1()
		if err != nil {
			return false, err
		}
		tmp48, err := this.Mask()
		if err != nil {
			return false, err
		}
		this.isSystemDependent = bool((tmp47 & tmp48) == 1)
	}
	this._f_isSystemDependent = true
	return this.isSystemDependent, nil
}
func (this *GettextMo_Mo_HashtableItem) Val() (v int, err error) {
	if (this._f_val) {
		return this.val, nil
	}
	if (this.RawVal != 0) {
		tmp49, err := this.Val1()
		if err != nil {
			return 0, err
		}
		tmp50, err := this.Mask()
		if err != nil {
			return 0, err
		}
		this.val = int((tmp49 & ^(tmp50)))
	}
	this._f_val = true
	return this.val, nil
}
type GettextMo_Mo_Descriptor struct {
	LenStr uint32
	OfsStr uint32
	_io *kaitai.Stream
	_root *GettextMo
	_parent *GettextMo_Mo
	_f_str bool
	str string
	_is_le int
}
func NewGettextMo_Mo_Descriptor() *GettextMo_Mo_Descriptor {
	return &GettextMo_Mo_Descriptor{
	}
}

func (this *GettextMo_Mo_Descriptor) Read(io *kaitai.Stream, parent *GettextMo_Mo, root *GettextMo) (err error) {
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

func (this *GettextMo_Mo_Descriptor) _read_le() (err error) {
	tmp51, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LenStr = uint32(tmp51)
	tmp52, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.OfsStr = uint32(tmp52)
	return err
}

func (this *GettextMo_Mo_Descriptor) _read_be() (err error) {
	tmp53, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenStr = uint32(tmp53)
	tmp54, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsStr = uint32(tmp54)
	return err
}
func (this *GettextMo_Mo_Descriptor) Str() (v string, err error) {
	if (this._f_str) {
		return this.str, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return "", err
	}
	_, err = thisIo.Seek(int64(this.OfsStr), io.SeekStart)
	if err != nil {
		return "", err
	}
	switch this._is_le {
	case 0:
		tmp55, err := thisIo.ReadBytes(int(this.LenStr))
		if err != nil {
			return "", err
		}
		tmp55 = kaitai.BytesTerminate(tmp55, 0, false)
		this.str = string(tmp55)
	case 1:
		tmp56, err := thisIo.ReadBytes(int(this.LenStr))
		if err != nil {
			return "", err
		}
		tmp56 = kaitai.BytesTerminate(tmp56, 0, false)
		this.str = string(tmp56)
	default:
		err = kaitai.UndecidedEndiannessError{}
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return "", err
	}
	this._f_str = true
	this._f_str = true
	return this.str, nil
}
