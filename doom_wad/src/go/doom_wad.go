// Code generated by kaitai-struct-compiler from a .ksy source file. DO NOT EDIT.

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"io"
	"bytes"
)

type DoomWad struct {
	Magic string
	NumIndexEntries int32
	IndexOffset int32
	_io *kaitai.Stream
	_root *DoomWad
	_parent interface{}
	_f_index bool
	index []*DoomWad_IndexEntry
}
func NewDoomWad() *DoomWad {
	return &DoomWad{
	}
}

func (this *DoomWad) Read(io *kaitai.Stream, parent interface{}, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadBytes(int(4))
	if err != nil {
		return err
	}
	tmp1 = tmp1
	this.Magic = string(tmp1)
	tmp2, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumIndexEntries = int32(tmp2)
	tmp3, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.IndexOffset = int32(tmp3)
	return err
}
func (this *DoomWad) Index() (v []*DoomWad_IndexEntry, err error) {
	if (this._f_index) {
		return this.index, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.IndexOffset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 0; i < int(this.NumIndexEntries); i++ {
		_ = i
		tmp4 := NewDoomWad_IndexEntry()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return nil, err
		}
		this.index = append(this.index, tmp4)
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_index = true
	this._f_index = true
	return this.index, nil
}

/**
 * Number of entries in the lump index
 */

/**
 * Offset to the start of the index
 */
type DoomWad_Sectors struct {
	Entries []*DoomWad_Sector
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Sectors() *DoomWad_Sectors {
	return &DoomWad_Sectors{
	}
}

func (this *DoomWad_Sectors) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp5, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp5 {
			break
		}
		tmp6 := NewDoomWad_Sector()
		err = tmp6.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp6)
	}
	return err
}
type DoomWad_Vertex struct {
	X int16
	Y int16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Vertexes
}
func NewDoomWad_Vertex() *DoomWad_Vertex {
	return &DoomWad_Vertex{
	}
}

func (this *DoomWad_Vertex) Read(io *kaitai.Stream, parent *DoomWad_Vertexes, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp7, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.X = int16(tmp7)
	tmp8, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Y = int16(tmp8)
	return err
}

/**
 * Used for TEXTURE1 and TEXTURE2 lumps, which designate how to
 * combine wall patches to make wall textures. This essentially
 * provides a very simple form of image compression, allowing
 * certain elements ("patches") to be reused / recombined on
 * different textures for more variety in the game.
 * @see <a href="https://doom.fandom.com/wiki/TEXTURE1_and_TEXTURE2">Source</a>
 */
type DoomWad_Texture12 struct {
	NumTextures int32
	Textures []*DoomWad_Texture12_TextureIndex
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Texture12() *DoomWad_Texture12 {
	return &DoomWad_Texture12{
	}
}

func (this *DoomWad_Texture12) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.NumTextures = int32(tmp9)
	for i := 0; i < int(this.NumTextures); i++ {
		_ = i
		tmp10 := NewDoomWad_Texture12_TextureIndex()
		err = tmp10.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Textures = append(this.Textures, tmp10)
	}
	return err
}

/**
 * Number of wall textures
 */
type DoomWad_Texture12_TextureIndex struct {
	Offset int32
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Texture12
	_f_body bool
	body *DoomWad_Texture12_TextureBody
}
func NewDoomWad_Texture12_TextureIndex() *DoomWad_Texture12_TextureIndex {
	return &DoomWad_Texture12_TextureIndex{
	}
}

func (this *DoomWad_Texture12_TextureIndex) Read(io *kaitai.Stream, parent *DoomWad_Texture12, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Offset = int32(tmp11)
	return err
}
func (this *DoomWad_Texture12_TextureIndex) Body() (v *DoomWad_Texture12_TextureBody, err error) {
	if (this._f_body) {
		return this.body, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	tmp12 := NewDoomWad_Texture12_TextureBody()
	err = tmp12.Read(this._io, this, this._root)
	if err != nil {
		return nil, err
	}
	this.body = tmp12
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_body = true
	this._f_body = true
	return this.body, nil
}
type DoomWad_Texture12_TextureBody struct {
	Name string
	Masked uint32
	Width uint16
	Height uint16
	ColumnDirectory uint32
	NumPatches uint16
	Patches []*DoomWad_Texture12_Patch
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Texture12_TextureIndex
}
func NewDoomWad_Texture12_TextureBody() *DoomWad_Texture12_TextureBody {
	return &DoomWad_Texture12_TextureBody{
	}
}

func (this *DoomWad_Texture12_TextureBody) Read(io *kaitai.Stream, parent *DoomWad_Texture12_TextureIndex, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp13, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp13 = kaitai.BytesStripRight(tmp13, 0)
	this.Name = string(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.Masked = uint32(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Width = uint16(tmp15)
	tmp16, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Height = uint16(tmp16)
	tmp17, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.ColumnDirectory = uint32(tmp17)
	tmp18, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.NumPatches = uint16(tmp18)
	for i := 0; i < int(this.NumPatches); i++ {
		_ = i
		tmp19 := NewDoomWad_Texture12_Patch()
		err = tmp19.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Patches = append(this.Patches, tmp19)
	}
	return err
}

/**
 * Name of a texture, only `A-Z`, `0-9`, `[]_-` are valid
 */

/**
 * Obsolete, ignored by all DOOM versions
 */

/**
 * Number of patches that are used in a texture
 */
type DoomWad_Texture12_Patch struct {
	OriginX int16
	OriginY int16
	PatchId uint16
	StepDir uint16
	Colormap uint16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Texture12_TextureBody
}
func NewDoomWad_Texture12_Patch() *DoomWad_Texture12_Patch {
	return &DoomWad_Texture12_Patch{
	}
}

func (this *DoomWad_Texture12_Patch) Read(io *kaitai.Stream, parent *DoomWad_Texture12_TextureBody, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp20, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OriginX = int16(tmp20)
	tmp21, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OriginY = int16(tmp21)
	tmp22, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.PatchId = uint16(tmp22)
	tmp23, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.StepDir = uint16(tmp23)
	tmp24, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Colormap = uint16(tmp24)
	return err
}

/**
 * X offset to draw a patch at (pixels from left boundary of a texture)
 */

/**
 * Y offset to draw a patch at (pixels from upper boundary of a texture)
 */

/**
 * Identifier of a patch (as listed in PNAMES lump) to draw
 */
type DoomWad_Linedef struct {
	VertexStartIdx uint16
	VertexEndIdx uint16
	Flags uint16
	LineType uint16
	SectorTag uint16
	SidedefRightIdx uint16
	SidedefLeftIdx uint16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Linedefs
}
func NewDoomWad_Linedef() *DoomWad_Linedef {
	return &DoomWad_Linedef{
	}
}

func (this *DoomWad_Linedef) Read(io *kaitai.Stream, parent *DoomWad_Linedefs, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp25, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VertexStartIdx = uint16(tmp25)
	tmp26, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.VertexEndIdx = uint16(tmp26)
	tmp27, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp27)
	tmp28, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LineType = uint16(tmp28)
	tmp29, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SectorTag = uint16(tmp29)
	tmp30, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SidedefRightIdx = uint16(tmp30)
	tmp31, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SidedefLeftIdx = uint16(tmp31)
	return err
}

/**
 * @see <a href="https://doom.fandom.com/wiki/PNAMES">Source</a>
 */
type DoomWad_Pnames struct {
	NumPatches uint32
	Names []string
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Pnames() *DoomWad_Pnames {
	return &DoomWad_Pnames{
	}
}

func (this *DoomWad_Pnames) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp32, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.NumPatches = uint32(tmp32)
	for i := 0; i < int(this.NumPatches); i++ {
		_ = i
		tmp33, err := this._io.ReadBytes(int(8))
		if err != nil {
			return err
		}
		tmp33 = kaitai.BytesStripRight(tmp33, 0)
		this.Names = append(this.Names, string(tmp33))
	}
	return err
}

/**
 * Number of patches registered in this global game directory
 */
type DoomWad_Thing struct {
	X int16
	Y int16
	Angle uint16
	Type uint16
	Flags uint16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Things
}
func NewDoomWad_Thing() *DoomWad_Thing {
	return &DoomWad_Thing{
	}
}

func (this *DoomWad_Thing) Read(io *kaitai.Stream, parent *DoomWad_Things, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp34, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.X = int16(tmp34)
	tmp35, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Y = int16(tmp35)
	tmp36, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Angle = uint16(tmp36)
	tmp37, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Type = uint16(tmp37)
	tmp38, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Flags = uint16(tmp38)
	return err
}

type DoomWad_Sector_SpecialSector int
const (
	DoomWad_Sector_SpecialSector__Normal DoomWad_Sector_SpecialSector = 0
	DoomWad_Sector_SpecialSector__DLightFlicker DoomWad_Sector_SpecialSector = 1
	DoomWad_Sector_SpecialSector__DLightStrobeFast DoomWad_Sector_SpecialSector = 2
	DoomWad_Sector_SpecialSector__DLightStrobeSlow DoomWad_Sector_SpecialSector = 3
	DoomWad_Sector_SpecialSector__DLightStrobeHurt DoomWad_Sector_SpecialSector = 4
	DoomWad_Sector_SpecialSector__DDamageHellslime DoomWad_Sector_SpecialSector = 5
	DoomWad_Sector_SpecialSector__DDamageNukage DoomWad_Sector_SpecialSector = 7
	DoomWad_Sector_SpecialSector__DLightGlow DoomWad_Sector_SpecialSector = 8
	DoomWad_Sector_SpecialSector__Secret DoomWad_Sector_SpecialSector = 9
	DoomWad_Sector_SpecialSector__DSectorDoorCloseIn30 DoomWad_Sector_SpecialSector = 10
	DoomWad_Sector_SpecialSector__DDamageEnd DoomWad_Sector_SpecialSector = 11
	DoomWad_Sector_SpecialSector__DLightStrobeSlowSync DoomWad_Sector_SpecialSector = 12
	DoomWad_Sector_SpecialSector__DLightStrobeFastSync DoomWad_Sector_SpecialSector = 13
	DoomWad_Sector_SpecialSector__DSectorDoorRaiseIn5Mins DoomWad_Sector_SpecialSector = 14
	DoomWad_Sector_SpecialSector__DFrictionLow DoomWad_Sector_SpecialSector = 15
	DoomWad_Sector_SpecialSector__DDamageSuperHellslime DoomWad_Sector_SpecialSector = 16
	DoomWad_Sector_SpecialSector__DLightFireFlicker DoomWad_Sector_SpecialSector = 17
	DoomWad_Sector_SpecialSector__DDamageLavaWimpy DoomWad_Sector_SpecialSector = 18
	DoomWad_Sector_SpecialSector__DDamageLavaHefty DoomWad_Sector_SpecialSector = 19
	DoomWad_Sector_SpecialSector__DScrollEastLavaDamage DoomWad_Sector_SpecialSector = 20
	DoomWad_Sector_SpecialSector__LightPhased DoomWad_Sector_SpecialSector = 21
	DoomWad_Sector_SpecialSector__LightSequenceStart DoomWad_Sector_SpecialSector = 22
	DoomWad_Sector_SpecialSector__LightSequenceSpecial1 DoomWad_Sector_SpecialSector = 23
	DoomWad_Sector_SpecialSector__LightSequenceSpecial2 DoomWad_Sector_SpecialSector = 24
)
type DoomWad_Sector struct {
	FloorZ int16
	CeilZ int16
	FloorFlat string
	CeilFlat string
	Light int16
	SpecialType DoomWad_Sector_SpecialSector
	Tag uint16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Sectors
}
func NewDoomWad_Sector() *DoomWad_Sector {
	return &DoomWad_Sector{
	}
}

func (this *DoomWad_Sector) Read(io *kaitai.Stream, parent *DoomWad_Sectors, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp39, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.FloorZ = int16(tmp39)
	tmp40, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.CeilZ = int16(tmp40)
	tmp41, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp41 = tmp41
	this.FloorFlat = string(tmp41)
	tmp42, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp42 = tmp42
	this.CeilFlat = string(tmp42)
	tmp43, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.Light = int16(tmp43)
	tmp44, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.SpecialType = DoomWad_Sector_SpecialSector(tmp44)
	tmp45, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Tag = uint16(tmp45)
	return err
}

/**
 * Light level of the sector [0..255]. Original engine uses
 * COLORMAP to render lighting, so only 32 actual levels are
 * available (i.e. 0..7, 8..15, etc).
 */

/**
 * Tag number. When the linedef with the same tag number is
 * activated, some effect will be triggered in this sector.
 */
type DoomWad_Vertexes struct {
	Entries []*DoomWad_Vertex
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Vertexes() *DoomWad_Vertexes {
	return &DoomWad_Vertexes{
	}
}

func (this *DoomWad_Vertexes) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp46, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp46 {
			break
		}
		tmp47 := NewDoomWad_Vertex()
		err = tmp47.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp47)
	}
	return err
}
type DoomWad_Sidedef struct {
	OffsetX int16
	OffsetY int16
	UpperTextureName string
	LowerTextureName string
	NormalTextureName string
	SectorId int16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Sidedefs
}
func NewDoomWad_Sidedef() *DoomWad_Sidedef {
	return &DoomWad_Sidedef{
	}
}

func (this *DoomWad_Sidedef) Read(io *kaitai.Stream, parent *DoomWad_Sidedefs, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp48, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OffsetX = int16(tmp48)
	tmp49, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OffsetY = int16(tmp49)
	tmp50, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp50 = tmp50
	this.UpperTextureName = string(tmp50)
	tmp51, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp51 = tmp51
	this.LowerTextureName = string(tmp51)
	tmp52, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp52 = tmp52
	this.NormalTextureName = string(tmp52)
	tmp53, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.SectorId = int16(tmp53)
	return err
}
type DoomWad_Things struct {
	Entries []*DoomWad_Thing
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Things() *DoomWad_Things {
	return &DoomWad_Things{
	}
}

func (this *DoomWad_Things) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp54, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp54 {
			break
		}
		tmp55 := NewDoomWad_Thing()
		err = tmp55.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp55)
	}
	return err
}
type DoomWad_Linedefs struct {
	Entries []*DoomWad_Linedef
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Linedefs() *DoomWad_Linedefs {
	return &DoomWad_Linedefs{
	}
}

func (this *DoomWad_Linedefs) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp56, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp56 {
			break
		}
		tmp57 := NewDoomWad_Linedef()
		err = tmp57.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp57)
	}
	return err
}
type DoomWad_IndexEntry struct {
	Offset int32
	Size int32
	Name string
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad
	_raw_contents []byte
	_f_contents bool
	contents interface{}
}
func NewDoomWad_IndexEntry() *DoomWad_IndexEntry {
	return &DoomWad_IndexEntry{
	}
}

func (this *DoomWad_IndexEntry) Read(io *kaitai.Stream, parent *DoomWad, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp58, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Offset = int32(tmp58)
	tmp59, err := this._io.ReadS4le()
	if err != nil {
		return err
	}
	this.Size = int32(tmp59)
	tmp60, err := this._io.ReadBytes(int(8))
	if err != nil {
		return err
	}
	tmp60 = kaitai.BytesStripRight(tmp60, 0)
	this.Name = string(tmp60)
	return err
}
func (this *DoomWad_IndexEntry) Contents() (v interface{}, err error) {
	if (this._f_contents) {
		return this.contents, nil
	}
	thisIo := this._root._io
	_pos, err := thisIo.Pos()
	if err != nil {
		return nil, err
	}
	_, err = thisIo.Seek(int64(this.Offset), io.SeekStart)
	if err != nil {
		return nil, err
	}
	switch (this.Name) {
	case "SECTORS":
		tmp61, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp61 = tmp61
		this._raw_contents = tmp61
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp62 := NewDoomWad_Sectors()
		err = tmp62.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp62
	case "TEXTURE1":
		tmp63, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp63 = tmp63
		this._raw_contents = tmp63
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp64 := NewDoomWad_Texture12()
		err = tmp64.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp64
	case "VERTEXES":
		tmp65, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp65 = tmp65
		this._raw_contents = tmp65
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp66 := NewDoomWad_Vertexes()
		err = tmp66.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp66
	case "BLOCKMAP":
		tmp67, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp67 = tmp67
		this._raw_contents = tmp67
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp68 := NewDoomWad_Blockmap()
		err = tmp68.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp68
	case "PNAMES":
		tmp69, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp69 = tmp69
		this._raw_contents = tmp69
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp70 := NewDoomWad_Pnames()
		err = tmp70.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp70
	case "TEXTURE2":
		tmp71, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp71 = tmp71
		this._raw_contents = tmp71
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp72 := NewDoomWad_Texture12()
		err = tmp72.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp72
	case "THINGS":
		tmp73, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp73 = tmp73
		this._raw_contents = tmp73
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp74 := NewDoomWad_Things()
		err = tmp74.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp74
	case "LINEDEFS":
		tmp75, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp75 = tmp75
		this._raw_contents = tmp75
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp76 := NewDoomWad_Linedefs()
		err = tmp76.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp76
	case "SIDEDEFS":
		tmp77, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp77 = tmp77
		this._raw_contents = tmp77
		_io__raw_contents := kaitai.NewStream(bytes.NewReader(this._raw_contents))
		tmp78 := NewDoomWad_Sidedefs()
		err = tmp78.Read(_io__raw_contents, this, this._root)
		if err != nil {
			return nil, err
		}
		this.contents = tmp78
	default:
		tmp79, err := thisIo.ReadBytes(int(this.Size))
		if err != nil {
			return nil, err
		}
		tmp79 = tmp79
		this._raw_contents = tmp79
	}
	_, err = thisIo.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_contents = true
	this._f_contents = true
	return this.contents, nil
}
type DoomWad_Sidedefs struct {
	Entries []*DoomWad_Sidedef
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Sidedefs() *DoomWad_Sidedefs {
	return &DoomWad_Sidedefs{
	}
}

func (this *DoomWad_Sidedefs) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp80, err := this._io.EOF()
		if err != nil {
			return err
		}
		if tmp80 {
			break
		}
		tmp81 := NewDoomWad_Sidedef()
		err = tmp81.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Entries = append(this.Entries, tmp81)
	}
	return err
}
type DoomWad_Blockmap struct {
	OriginX int16
	OriginY int16
	NumCols int16
	NumRows int16
	LinedefsInBlock []*DoomWad_Blockmap_Blocklist
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_IndexEntry
}
func NewDoomWad_Blockmap() *DoomWad_Blockmap {
	return &DoomWad_Blockmap{
	}
}

func (this *DoomWad_Blockmap) Read(io *kaitai.Stream, parent *DoomWad_IndexEntry, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp82, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OriginX = int16(tmp82)
	tmp83, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.OriginY = int16(tmp83)
	tmp84, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.NumCols = int16(tmp84)
	tmp85, err := this._io.ReadS2le()
	if err != nil {
		return err
	}
	this.NumRows = int16(tmp85)
	for i := 0; i < int((this.NumCols * this.NumRows)); i++ {
		_ = i
		tmp86 := NewDoomWad_Blockmap_Blocklist()
		err = tmp86.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.LinedefsInBlock = append(this.LinedefsInBlock, tmp86)
	}
	return err
}

/**
 * Grid origin, X coord
 */

/**
 * Grid origin, Y coord
 */

/**
 * Number of columns
 */

/**
 * Number of rows
 */

/**
 * Lists of linedefs for every block
 */
type DoomWad_Blockmap_Blocklist struct {
	Offset uint16
	_io *kaitai.Stream
	_root *DoomWad
	_parent *DoomWad_Blockmap
	_f_linedefs bool
	linedefs []int16
}
func NewDoomWad_Blockmap_Blocklist() *DoomWad_Blockmap_Blocklist {
	return &DoomWad_Blockmap_Blocklist{
	}
}

func (this *DoomWad_Blockmap_Blocklist) Read(io *kaitai.Stream, parent *DoomWad_Blockmap, root *DoomWad) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp87, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Offset = uint16(tmp87)
	return err
}

/**
 * List of linedefs found in this block
 */
func (this *DoomWad_Blockmap_Blocklist) Linedefs() (v []int16, err error) {
	if (this._f_linedefs) {
		return this.linedefs, nil
	}
	_pos, err := this._io.Pos()
	if err != nil {
		return nil, err
	}
	_, err = this._io.Seek(int64((this.Offset * 2)), io.SeekStart)
	if err != nil {
		return nil, err
	}
	for i := 1;; i++ {
		tmp88, err := this._io.ReadS2le()
		if err != nil {
			return nil, err
		}
		_it := tmp88
		this.linedefs = append(this.linedefs, _it)
		if _it == -1 {
			break
		}
	}
	_, err = this._io.Seek(_pos, io.SeekStart)
	if err != nil {
		return nil, err
	}
	this._f_linedefs = true
	this._f_linedefs = true
	return this.linedefs, nil
}

/**
 * Offset to the list of linedefs
 */
