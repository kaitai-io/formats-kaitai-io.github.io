// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)


/**
 * The data format of Macintosh resource forks,
 * used on Classic Mac OS and Mac OS X/macOS to store additional structured data along with a file's main data (the data fork).
 * The kinds of data stored in resource forks include:
 * 
 * * Document resources:
 *   images, sounds, etc. used by a document
 * * Application resources:
 *   graphics, GUI layouts, localizable strings,
 *   and even code used by an application, a library, or system files
 * * Common metadata:
 *   custom icons and version metadata that could be displayed by the Finder
 * * Application-specific metadata:
 *   because resource forks follow a common format,
 *   other applications can store new metadata in them,
 *   even if the original application does not recognize or understand it
 * 
 * Macintosh file systems (MFS, HFS, HFS+, APFS) support resource forks natively,
 * which allows storing resources along with any file.
 * Non-Macintosh file systems and protocols have little or no support for resource forks,
 * so the resource fork data must be stored in some other way when using such file systems or protocols.
 * Various file formats and tools exist for this purpose,
 * such as BinHex, MacBinary, AppleSingle, AppleDouble, or QuickTime RezWack.
 * In some cases,
 * resource forks are stored as plain data in separate files with a .rsrc extension,
 * even on Mac systems that natively support resource forks.
 * 
 * On modern Mac OS X/macOS systems,
 * resource forks are used far less commonly than on classic Mac OS systems,
 * because of compatibility issues with other systems and historical limitations in the format.
 * Modern macOS APIs and libraries do not use resource forks,
 * and the legacy Carbon API that still used them has been deprecated since OS X 10.8.
 * Despite this,
 * even current macOS systems still use resource forks for certain purposes,
 * such as custom file icons.
 * @see <a href="https://developer.apple.com/library/archive/documentation/mac/pdf/MoreMacintoshToolbox.pdf#page=151">Inside Macintosh, More Macintosh Toolbox, Resource Manager, Resource Manager Reference, Resource File Format</a>
 * @see <a href="http://www.pagetable.com/?p=50">Inside Macintosh, Volume I, The Resource Manager, Format of a Resource File</a>
 * @see <a href="https://github.com/kreativekorp/ksfl/wiki/Macintosh-Resource-File-Format">Source</a>
 * @see <a href="https://github.com/dgelessus/mac_file_format_docs/blob/master/README.md#resource-forks">Source</a>
 */
type ResourceFork struct {
	Header *ResourceFork_FileHeader
	SystemData []byte
	ApplicationData []byte
	_io *kaitai.Stream
	_root *ResourceFork
	_parent interface{}
	_raw_dataBlocksWithIo []byte
	_raw_resourceMap []byte
	_f_dataBlocksWithIo bool
	dataBlocksWithIo *BytesWithIo
	_f_dataBlocks bool
	dataBlocks []byte
	_f_resourceMap bool
	resourceMap *ResourceFork_ResourceMap
}
func NewResourceFork() *ResourceFork {
	return &ResourceFork{
	}
}

func (this *ResourceFork) Read(io *kaitai.Stream, parent interface{}, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewResourceFork_FileHeader()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Header = tmp1
	tmp2, err := this._io.ReadBytes(int(112))
	if err != nil {
		return err
	}
	tmp2 = tmp2
	this.SystemData = tmp2
	tmp3, err := this._io.ReadBytes(int(128))
	if err != nil {
		return err
	}
	tmp3 = tmp3
	this.ApplicationData = tmp3
	return err
}

/**
 * Use `data_blocks` instead,
 * unless you need access to this instance's `_io`.
 */
func (this *ResourceFork) DataBlocksWithIo() (v *BytesWithIo, err error) {
	if (this._f_dataBlocksWithIo) {
		return this.dataBlocksWithIo, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.OfsDataBlocks), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp4, err := this._io.ReadBytes(int(this.Header.LenDataBlocks))
	if err != nil {
		return nil, err
	}
	tmp4 = tmp4
	this._raw_dataBlocksWithIo = tmp4
	_io__raw_dataBlocksWithIo := kaitai.NewStream(bytes.NewReader(this._raw_dataBlocksWithIo))
	tmp5 := NewBytesWithIo()
	err = tmp5.Read(_io__raw_dataBlocksWithIo, this, nil)
	if err != nil {
		return nil, err
	}
	this.dataBlocksWithIo = tmp5
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_dataBlocksWithIo = true
	this._f_dataBlocksWithIo = true
	return this.dataBlocksWithIo, nil
}

/**
 * Storage area for the data blocks of all resources.
 * 
 * These data blocks are not required to appear in any particular order,
 * and there may be unused space between and around them.
 * 
 * In practice,
 * the data blocks in newly created resource files are usually contiguous.
 * When existing resources are shortened,
 * the Mac OS resource manager leaves unused space where the now removed resource data was,
 * as this is quicker than moving the following resource data into the newly freed space.
 * Such unused space may be cleaned up later when the resource manager "compacts" the resource file,
 * which happens when resources are removed entirely,
 * or when resources are added or grown so that more space is needed in the data area.
 */
func (this *ResourceFork) DataBlocks() (v []byte, err error) {
	if (this._f_dataBlocks) {
		return this.dataBlocks, nil
	}
	tmp6, err := this.DataBlocksWithIo()
	if err != nil {
		return nil, err
	}
	this.dataBlocks = []byte(tmp6.Data)
	this._f_dataBlocks = true
	return this.dataBlocks, nil
}

/**
 * The resource file's resource map.
 */
func (this *ResourceFork) ResourceMap() (v *ResourceFork_ResourceMap, err error) {
	if (this._f_resourceMap) {
		return this.resourceMap, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Header.OfsResourceMap), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp7, err := this._io.ReadBytes(int(this.Header.LenResourceMap))
	if err != nil {
		return nil, err
	}
	tmp7 = tmp7
	this._raw_resourceMap = tmp7
	_io__raw_resourceMap := kaitai.NewStream(bytes.NewReader(this._raw_resourceMap))
	tmp8 := NewResourceFork_ResourceMap()
	err = tmp8.Read(_io__raw_resourceMap, this, this._root)
	if err != nil {
		return nil, err
	}
	this.resourceMap = tmp8
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_resourceMap = true
	this._f_resourceMap = true
	return this.resourceMap, nil
}

/**
 * The resource file's header information.
 */

/**
 * System-reserved data area.
 * This field can generally be ignored when reading and writing.
 * 
 * This field is used by the Classic Mac OS Finder as temporary storage space.
 * It usually contains parts of the file metadata (name, type/creator code, etc.).
 * Any existing data in this field is ignored and overwritten.
 * 
 * In resource files written by Mac OS X,
 * this field is set to all zero bytes.
 */

/**
 * Application-specific data area.
 * This field can generally be ignored when reading and writing.
 * 
 * According to early revisions of Inside Macintosh,
 * this field is "available for application data".
 * In practice, it is almost never used for this purpose,
 * and usually contains only junk data.
 * 
 * In resource files written by Mac OS X,
 * this field is set to all zero bytes.
 */

/**
 * Resource file header,
 * containing the offsets and lengths of the resource data area and resource map.
 */
type ResourceFork_FileHeader struct {
	OfsDataBlocks uint32
	OfsResourceMap uint32
	LenDataBlocks uint32
	LenResourceMap uint32
	_io *kaitai.Stream
	_root *ResourceFork
	_parent interface{}
}
func NewResourceFork_FileHeader() *ResourceFork_FileHeader {
	return &ResourceFork_FileHeader{
	}
}

func (this *ResourceFork_FileHeader) Read(io *kaitai.Stream, parent interface{}, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsDataBlocks = uint32(tmp9)
	tmp10, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.OfsResourceMap = uint32(tmp10)
	tmp11, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenDataBlocks = uint32(tmp11)
	tmp12, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenResourceMap = uint32(tmp12)
	return err
}

/**
 * Offset of the resource data area,
 * from the start of the resource file.
 * 
 * In practice,
 * this should always be `256`,
 * i. e. the resource data area should directly follow the application-specific data area.
 */

/**
 * Offset of the resource map,
 * from the start of the resource file.
 * 
 * In practice,
 * this should always be `ofs_data_blocks + len_data_blocks`,
 * i. e. the resource map should directly follow the resource data area.
 */

/**
 * Length of the resource data area.
 */

/**
 * Length of the resource map.
 * 
 * In practice,
 * this should always be `_root._io.size - ofs_resource_map`,
 * i. e. the resource map should extend to the end of the resource file.
 */

/**
 * A resource data block,
 * as stored in the resource data area.
 * 
 * Each data block stores the data contained in a resource,
 * along with its length.
 */
type ResourceFork_DataBlock struct {
	LenData uint32
	Data []byte
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
}
func NewResourceFork_DataBlock() *ResourceFork_DataBlock {
	return &ResourceFork_DataBlock{
	}
}

func (this *ResourceFork_DataBlock) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.LenData = uint32(tmp13)
	tmp14, err := this._io.ReadBytes(int(this.LenData))
	if err != nil {
		return err
	}
	tmp14 = tmp14
	this.Data = tmp14
	return err
}

/**
 * The length of the resource data stored in this block.
 */

/**
 * The data stored in this block.
 */

/**
 * Resource map,
 * containing information about the resources in the file and where they are located in the data area.
 */
type ResourceFork_ResourceMap struct {
	ReservedFileHeaderCopy *ResourceFork_FileHeader
	ReservedNextResourceMapHandle uint32
	ReservedFileReferenceNumber uint16
	FileAttributes *ResourceFork_ResourceMap_FileAttributes
	OfsTypeList uint16
	OfsNames uint16
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork
	_raw_FileAttributes []byte
	_raw_typeListAndReferenceLists []byte
	_raw_namesWithIo []byte
	_f_typeListAndReferenceLists bool
	typeListAndReferenceLists *ResourceFork_ResourceMap_TypeListAndReferenceLists
	_f_namesWithIo bool
	namesWithIo *BytesWithIo
	_f_names bool
	names []byte
}
func NewResourceFork_ResourceMap() *ResourceFork_ResourceMap {
	return &ResourceFork_ResourceMap{
	}
}

func (this *ResourceFork_ResourceMap) Read(io *kaitai.Stream, parent *ResourceFork, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp15 := NewResourceFork_FileHeader()
	err = tmp15.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.ReservedFileHeaderCopy = tmp15
	tmp16, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ReservedNextResourceMapHandle = uint32(tmp16)
	tmp17, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.ReservedFileReferenceNumber = uint16(tmp17)
	tmp18, err := this._io.ReadBytes(int(2))
	if err != nil {
		return err
	}
	tmp18 = tmp18
	this._raw_FileAttributes = tmp18
	_io__raw_FileAttributes := kaitai.NewStream(bytes.NewReader(this._raw_FileAttributes))
	tmp19 := NewResourceFork_ResourceMap_FileAttributes()
	err = tmp19.Read(_io__raw_FileAttributes, this, this._root)
	if err != nil {
		return err
	}
	this.FileAttributes = tmp19
	tmp20, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.OfsTypeList = uint16(tmp20)
	tmp21, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.OfsNames = uint16(tmp21)
	return err
}

/**
 * The resource map's resource type list, followed by the resource reference list area.
 */
func (this *ResourceFork_ResourceMap) TypeListAndReferenceLists() (v *ResourceFork_ResourceMap_TypeListAndReferenceLists, err error) {
	if (this._f_typeListAndReferenceLists) {
		return this.typeListAndReferenceLists, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsTypeList), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp22, err := this._io.ReadBytes(int((this.OfsNames - this.OfsTypeList)))
	if err != nil {
		return nil, err
	}
	tmp22 = tmp22
	this._raw_typeListAndReferenceLists = tmp22
	_io__raw_typeListAndReferenceLists := kaitai.NewStream(bytes.NewReader(this._raw_typeListAndReferenceLists))
	tmp23 := NewResourceFork_ResourceMap_TypeListAndReferenceLists()
	err = tmp23.Read(_io__raw_typeListAndReferenceLists, this, this._root)
	if err != nil {
		return nil, err
	}
	this.typeListAndReferenceLists = tmp23
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_typeListAndReferenceLists = true
	this._f_typeListAndReferenceLists = true
	return this.typeListAndReferenceLists, nil
}

/**
 * Use `names` instead,
 * unless you need access to this instance's `_io`.
 */
func (this *ResourceFork_ResourceMap) NamesWithIo() (v *BytesWithIo, err error) {
	if (this._f_namesWithIo) {
		return this.namesWithIo, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.OfsNames), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp24, err := this._io.ReadBytesFull()
	if err != nil {
		return nil, err
	}
	tmp24 = tmp24
	this._raw_namesWithIo = tmp24
	_io__raw_namesWithIo := kaitai.NewStream(bytes.NewReader(this._raw_namesWithIo))
	tmp25 := NewBytesWithIo()
	err = tmp25.Read(_io__raw_namesWithIo, this, nil)
	if err != nil {
		return nil, err
	}
	this.namesWithIo = tmp25
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_namesWithIo = true
	this._f_namesWithIo = true
	return this.namesWithIo, nil
}

/**
 * Storage area for the names of all resources.
 */
func (this *ResourceFork_ResourceMap) Names() (v []byte, err error) {
	if (this._f_names) {
		return this.names, nil
	}
	tmp26, err := this.NamesWithIo()
	if err != nil {
		return nil, err
	}
	this.names = []byte(tmp26.Data)
	this._f_names = true
	return this.names, nil
}

/**
 * Reserved space for a copy of the resource file header.
 */

/**
 * Reserved space for a handle to the next loaded resource map in memory.
 */

/**
 * Reserved space for the resource file's file reference number.
 */

/**
 * The resource file's attributes.
 */

/**
 * Offset of the resource type list,
 * from the start of the resource map.
 * 
 * In practice,
 * this should always be `sizeof<resource_map>`,
 * i. e. the resource type list should directly follow the resource map.
 */

/**
 * Offset of the resource name area,
 * from the start of the resource map.
 */

/**
 * A resource file's attributes,
 * as stored in the resource map.
 * 
 * These attributes are sometimes also referred to as resource map attributes,
 * because of where they are stored in the file.
 */
type ResourceFork_ResourceMap_FileAttributes struct {
	ResourcesLocked bool
	Reserved0 uint64
	PrinterDriverMultifinderCompatible bool
	NoWriteChanges bool
	NeedsCompact bool
	MapNeedsWrite bool
	Reserved1 uint64
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap
	_f_asInt bool
	asInt uint16
}
func NewResourceFork_ResourceMap_FileAttributes() *ResourceFork_ResourceMap_FileAttributes {
	return &ResourceFork_ResourceMap_FileAttributes{
	}
}

func (this *ResourceFork_ResourceMap_FileAttributes) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp27, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.ResourcesLocked = tmp27 != 0
	tmp28, err := this._io.ReadBitsIntBe(6)
	if err != nil {
		return err
	}
	this.Reserved0 = tmp28
	tmp29, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.PrinterDriverMultifinderCompatible = tmp29 != 0
	tmp30, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NoWriteChanges = tmp30 != 0
	tmp31, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NeedsCompact = tmp31 != 0
	tmp32, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.MapNeedsWrite = tmp32 != 0
	tmp33, err := this._io.ReadBitsIntBe(5)
	if err != nil {
		return err
	}
	this.Reserved1 = tmp33
	return err
}

/**
 * The attributes as a packed integer,
 * as they are stored in the file.
 */
func (this *ResourceFork_ResourceMap_FileAttributes) AsInt() (v uint16, err error) {
	if (this._f_asInt) {
		return this.asInt, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp34, err := this._io.ReadU2be()
	if err != nil {
		return 0, err
	}
	this.asInt = tmp34
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_asInt = true
	this._f_asInt = true
	return this.asInt, nil
}

/**
 * TODO What does this attribute actually do,
 * and how is it different from `read_only`?
 * 
 * This attribute is undocumented and not defined in <CarbonCore/Resources.h>,
 * but ResEdit has a checkbox called "Resources Locked" for this attribute.
 */

/**
 * These attributes have no known usage or meaning and should always be zero.
 */

/**
 * Indicates that this printer driver is compatible with MultiFinder,
 * i. e. can be used simultaneously by multiple applications.
 * This attribute is only meant to be set on printer driver resource forks.
 * 
 * This attribute is not documented in Inside Macintosh and is not defined in <CarbonCore/Resources.h>.
 * It is documented in technote PR510,
 * and ResEdit has a checkbox called "Printer Driver MultiFinder Compatible" for this attribute.
 * @see <a href="https://www.fenestrated.net/mirrors/Apple%20Technotes%20(As%20of%202002)/pr/pr_510.html">Apple Technical Note PR510 - Printer Driver Q&As, section '"Printer driver is MultiFinder compatible" bit'</a>
 */

/**
 * Indicates that the Resource Manager should not write any changes from memory into the resource file.
 * Any modification operations requested by the application will return successfully,
 * but will not actually update the resource file.
 * 
 * TODO Is this attribute supposed to be set on disk or only in memory?
 */

/**
 * Indicates that the resource file should be compacted the next time it is written by the Resource Manager.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is mainly used internally by the Resource Manager,
 * but may also be set manually by the application.
 */

/**
 * Indicates that the resource map has been changed in memory and should be written to the resource file on the next update.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is mainly used internally by the Resource Manager,
 * but may also be set manually by the application.
 */

/**
 * These attributes have no known usage or meaning and should always be zero.
 */

/**
 * Resource type list and storage area for resource reference lists in the resource map.
 * 
 * The two parts are combined into a single type here for technical reasons:
 * the start of the resource reference list area is not stored explicitly in the file,
 * instead it always starts directly after the resource type list.
 * The simplest way to implement this is by placing both types into a single `seq`.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists struct {
	TypeList *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList
	ReferenceLists []byte
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists() *ResourceFork_ResourceMap_TypeListAndReferenceLists {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists{
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp35 := NewResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList()
	err = tmp35.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.TypeList = tmp35
	tmp36, err := this._io.ReadBytesFull()
	if err != nil {
		return err
	}
	tmp36 = tmp36
	this.ReferenceLists = tmp36
	return err
}

/**
 * The resource map's resource type list.
 */

/**
 * Storage area for the resource map's resource reference lists.
 * 
 * According to Inside Macintosh,
 * the reference lists are stored contiguously,
 * in the same order as their corresponding resource type list entries.
 */

/**
 * Resource type list in the resource map.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList struct {
	NumTypesM1 uint16
	Entries []*ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists
	_f_numTypes bool
	numTypes int
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList() *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList{
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp37, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumTypesM1 = uint16(tmp37)
	tmp38, err := this.NumTypes()
	if err != nil {
		return err
	}
	this.Entries = make([]*ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry, tmp38)
	for i := range this.Entries {
		tmp39 := NewResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry()
		err = tmp39.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries[i] = tmp39
	}
	return err
}

/**
 * The number of resource types in this list.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList) NumTypes() (v int, err error) {
	if (this._f_numTypes) {
		return this.numTypes, nil
	}
	tmp40 := (this.NumTypesM1 + 1) % 65536
	if tmp40 < 0 {
		tmp40 += 65536
	}
	this.numTypes = int(tmp40)
	this._f_numTypes = true
	return this.numTypes, nil
}

/**
 * The number of resource types in this list,
 * minus one.
 * 
 * If the resource list is empty,
 * the value of this field is `0xffff`,
 * i. e. `-1` truncated to a 16-bit unsigned integer.
 */

/**
 * Entries in the resource type list.
 */

/**
 * A single entry in the resource type list.
 * 
 * Each entry corresponds to exactly one resource reference list.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry struct {
	Type []byte
	NumReferencesM1 uint16
	OfsReferenceList uint16
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList
	_f_numReferences bool
	numReferences int
	_f_referenceList bool
	referenceList *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry() *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry{
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp41, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.Type = tmp41
	tmp42, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.NumReferencesM1 = uint16(tmp42)
	tmp43, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.OfsReferenceList = uint16(tmp43)
	return err
}

/**
 * The number of resources in the reference list for this type.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry) NumReferences() (v int, err error) {
	if (this._f_numReferences) {
		return this.numReferences, nil
	}
	tmp44 := (this.NumReferencesM1 + 1) % 65536
	if tmp44 < 0 {
		tmp44 += 65536
	}
	this.numReferences = int(tmp44)
	this._f_numReferences = true
	return this.numReferences, nil
}

/**
 * The resource reference list for this resource type.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry) ReferenceList() (v *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList, err error) {
	if (this._f_referenceList) {
		return this.referenceList, nil
	}
	thisIo := this._parent._parent._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsReferenceList), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp46, err := this.NumReferences()
	if err != nil {
		return nil, err
	}
	tmp45 := NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList(tmp46)
	err = tmp45.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.referenceList = tmp45
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_referenceList = true
	this._f_referenceList = true
	return this.referenceList, nil
}

/**
 * The four-character type code of the resources in the reference list.
 */

/**
 * The number of resources in the reference list for this type,
 * minus one.
 * 
 * Empty reference lists should never exist.
 */

/**
 * Offset of the resource reference list for this resource type,
 * from the start of the resource type list.
 * 
 * Although the offset is relative to the start of the type list,
 * it should never point into the type list itself,
 * but into the reference list storage area that directly follows it.
 * That is,
 * it should always be at least `_parent._sizeof`.
 */

/**
 * A resource reference list,
 * as stored in the reference list area.
 * 
 * Each reference list has exactly one matching entry in the resource type list,
 * and describes all resources of a single type in the file.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList struct {
	References []*ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
	NumReferences uint16
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList(numReferences uint16) *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList{
		NumReferences: numReferences,
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_TypeList_TypeListEntry, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	this.References = make([]*ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference, this.NumReferences)
	for i := range this.References {
		tmp47 := NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.References[i] = tmp47
	}
	return err
}

/**
 * The resource references in this reference list.
 */

/**
 * A single resource reference in a resource reference list.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference struct {
	Id int16
	OfsName uint16
	Attributes *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes
	OfsDataBlock uint64
	ReservedHandle uint32
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList
	_raw_Attributes []byte
	_f_name bool
	name *ResourceFork_ResourceMap_Name
	_f_dataBlock bool
	dataBlock *ResourceFork_DataBlock
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference() *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference{
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadS2be()
	if err != nil {
		return err
	}
	this.Id = int16(tmp48)
	tmp49, err := this._io.ReadU2be()
	if err != nil {
		return err
	}
	this.OfsName = uint16(tmp49)
	tmp50, err := this._io.ReadBytes(int(1))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this._raw_Attributes = tmp50
	_io__raw_Attributes := kaitai.NewStream(bytes.NewReader(this._raw_Attributes))
	tmp51 := NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes()
	err = tmp51.Read(_io__raw_Attributes, this, this._root)
	if err != nil {
		return err
	}
	this.Attributes = tmp51
	tmp52, err := this._io.ReadBitsIntBe(24)
	if err != nil {
		return err
	}
	this.OfsDataBlock = tmp52
	this._io.AlignToByte()
	tmp53, err := this._io.ReadU4be()
	if err != nil {
		return err
	}
	this.ReservedHandle = uint32(tmp53)
	return err
}

/**
 * The name (if any) of the resource described by this reference.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference) Name() (v *ResourceFork_ResourceMap_Name, err error) {
	if (this._f_name) {
		return this.name, nil
	}
	if (this.OfsName != 65535) {
		tmp54, err := this._root.ResourceMap()
		if err != nil {
			return nil, err
		}
		tmp55, err := tmp54.NamesWithIo()
		if err != nil {
			return nil, err
		}
		thisIo := tmp55._io
		_pos, err := thisIo.Pos()
		if err != nil {
			return nil, err
		}
		_, err = thisIo.Seek(int64(this.OfsName), io.SeekStart)
		if err != nil {
			return nil, err
		}
		tmp56 := NewResourceFork_ResourceMap_Name()
		err = tmp56.Read(thisIo, this, this._root)
		if err != nil {
			return nil, err
		}
		this.name = tmp56
		_, err = thisIo.Seek(_pos, io.SeekStart)
		if err != nil {
			return nil, err
		}
		this._f_name = true
	}
	this._f_name = true
	return this.name, nil
}

/**
 * The data block containing the data for the resource described by this reference.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference) DataBlock() (v *ResourceFork_DataBlock, err error) {
	if (this._f_dataBlock) {
		return this.dataBlock, nil
	}
	tmp57, err := this._root.DataBlocksWithIo()
	if err != nil {
		return nil, err
	}
	thisIo := tmp57._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.OfsDataBlock), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp58 := NewResourceFork_DataBlock()
	err = tmp58.Read(thisIo, this, this._root)
	if err != nil {
		return nil, err
	}
	this.dataBlock = tmp58
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_dataBlock = true
	this._f_dataBlock = true
	return this.dataBlock, nil
}

/**
 * ID of the resource described by this reference.
 */

/**
 * Offset of the name for the resource described by this reference,
 * from the start of the resource name area.
 * 
 * If the resource has no name,
 * the value of this field is `0xffff`
 * i. e. `-1` truncated to a 16-bit unsigned integer.
 */

/**
 * Attributes of the resource described by this reference.
 */

/**
 * Offset of the data block for the resource described by this reference,
 * from the start of the resource data area.
 */

/**
 * Reserved space for the resource's handle in memory.
 */

/**
 * A resource's attributes,
 * as stored in a resource reference.
 */
type ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes struct {
	SystemReference bool
	LoadIntoSystemHeap bool
	Purgeable bool
	Locked bool
	Protected bool
	Preload bool
	NeedsWrite bool
	Compressed bool
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
	_f_asInt bool
	asInt uint8
}
func NewResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes() *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes {
	return &ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes{
	}
}

func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp59, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.SystemReference = tmp59 != 0
	tmp60, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.LoadIntoSystemHeap = tmp60 != 0
	tmp61, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Purgeable = tmp61 != 0
	tmp62, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Locked = tmp62 != 0
	tmp63, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Protected = tmp63 != 0
	tmp64, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Preload = tmp64 != 0
	tmp65, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.NeedsWrite = tmp65 != 0
	tmp66, err := this._io.ReadBitsIntBe(1)
	if err != nil {
		return err
	}
	this.Compressed = tmp66 != 0
	return err
}

/**
 * The attributes as a packed integer,
 * as they are stored in the file.
 */
func (this *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference_Attributes) AsInt() (v uint8, err error) {
	if (this._f_asInt) {
		return this.asInt, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return 0, err
	}
	_, err = this._io.Seek(int64(0), io.SeekStart)
	if err != nil {
		return 0, err
	}
	tmp67, err := this._io.ReadU1()
	if err != nil {
		return 0, err
	}
	this.asInt = tmp67
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return 0, err
	}
	this._f_asInt = true
	this._f_asInt = true
	return this.asInt, nil
}

/**
 * Indicates that this resource reference is a system reference rather than a regular local reference.
 * This attribute is nearly undocumented.
 * For all practical purposes,
 * it should be considered reserved and should always be zero.
 * 
 * This attribute was last documented in the Promotional Edition of Inside Macintosh,
 * in the Resource Manager chapter,
 * on pages 37-41,
 * in a "System References" section that calls itself "of historical interest only".
 * The final versions of Inside Macintosh only mention this attribute as "reserved for use by the Resource Manager".
 * <CarbonCore/Resources.h> contains a `resSysRefBit` constant,
 * but no corresponding `resSysRef` constant like for all other resource attributes.
 * 
 * According to the Inside Macintosh Promotional Edition,
 * a system reference was effectively an alias pointing to a resource stored in the system file,
 * possibly with a different ID and name (but not type) than the system reference.
 * If this attribute is set,
 * `ofs_data_block` is ignored and should be zero,
 * and `reserved_handle` contains
 * (in its high and low two bytes, respectively)
 * the ID and name offset of the real system resource that this system reference points to.
 * 
 * TODO Do any publicly available Mac OS versions support system references,
 * and do any real files/applications use them?
 * So far the answer seems to be no,
 * but I would like to be proven wrong!
 */

/**
 * Indicates that this resource should be loaded into the system heap if possible,
 * rather than the application heap.
 * 
 * This attribute is only meant to be used by Mac OS itself,
 * for System and Finder resources,
 * and not by normal applications.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */

/**
 * Indicates that this resource's data should be purgeable by the Mac OS Memory Manager.
 * This allows the resource data to be purged from memory if space is needed on the heap.
 * Purged resources can later be reloaded from disk if their data is needed again.
 * 
 * If the `locked` attribute is set,
 * this attribute has no effect
 * (i. e. locked resources are never purgeable).
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */

/**
 * Indicates that this resource's data should be locked to the Mac OS Memory Manager.
 * This prevents the resource data from being moved when the heap is compacted.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */

/**
 * Indicates that this resource should be protected (i. e. unmodifiable) in memory.
 * This prevents the application from using the Resource Manager to change the resource's data or metadata,
 * or delete it.
 * The only exception are the resource's attributes,
 * which can always be changed,
 * even for protected resources.
 * This allows protected resources to be unprotected again by the application.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning while the resource file is loaded into memory.
 */

/**
 * Indicates that this resource's data should be immediately loaded into memory when the resource file is opened.
 * 
 * This attribute may be set both in memory and on disk,
 * but it only has any meaning when the resource file is first opened.
 */

/**
 * Indicates that this resource's data has been changed in memory and should be written to the resource file on the next update.
 * This attribute is only meant to be set in memory;
 * it is cleared when the resource file is written to disk.
 * 
 * This attribute is used internally by the Resource Manager and should not be set manually by the application.
 */

/**
 * Indicates that this resource's data is compressed.
 * Compressed resource data is decompressed transparently by the Resource Manager when reading.
 * 
 * For a detailed description of the structure of compressed resources as they are stored in the file,
 * see the compressed_resource.ksy spec.
 */

/**
 * A resource name,
 * as stored in the resource name storage area in the resource map.
 * 
 * The resource names are not required to appear in any particular order.
 * There may be unused space between and around resource names,
 * but in practice they are often contiguous.
 */
type ResourceFork_ResourceMap_Name struct {
	LenValue uint8
	Value []byte
	_io *kaitai.Stream
	_root *ResourceFork
	_parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference
}
func NewResourceFork_ResourceMap_Name() *ResourceFork_ResourceMap_Name {
	return &ResourceFork_ResourceMap_Name{
	}
}

func (this *ResourceFork_ResourceMap_Name) Read(io *kaitai.Stream, parent *ResourceFork_ResourceMap_TypeListAndReferenceLists_ReferenceList_Reference, root *ResourceFork) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp68, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.LenValue = tmp68
	tmp69, err := this._io.ReadBytes(int(this.LenValue))
	if err != nil {
		return err
	}
	tmp69 = tmp69
	this.Value = tmp69
	return err
}

/**
 * The length of the resource name, in bytes.
 */

/**
 * The resource name.
 * 
 * This field is exposed as a byte array,
 * because there is no universal encoding for resource names.
 * Most Classic Mac software does not deal with encodings explicitly and instead assumes that all strings,
 * including resource names,
 * use the system encoding,
 * which varies depending on the system language.
 * This means that resource names can use different encodings depending on what system language they were created with.
 * 
 * Many resource names are plain ASCII,
 * meaning that the encoding often does not matter
 * (because all Mac OS encodings are ASCII-compatible).
 * For non-ASCII resource names,
 * the most common encoding is perhaps MacRoman
 * (used for English and other Western languages),
 * but other encodings are also sometimes used,
 * especially for software in non-Western languages.
 * 
 * There is no requirement that all names in a single resource file use the same encoding.
 * For example,
 * localized software may have some (but not all) of its resource names translated.
 * For non-Western languages,
 * this can lead to some resource names using MacRoman,
 * and others using a different encoding.
 */
