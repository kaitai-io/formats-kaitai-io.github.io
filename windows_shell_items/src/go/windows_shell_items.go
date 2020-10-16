// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"bytes"
)


/**
 * Windows Shell Items (AKA "shellbags") is an undocumented set of
 * structures used internally within Windows to identify paths in
 * Windows Folder Hierarchy. It is widely used in Windows Shell (and
 * most visible in File Explorer), both as in-memory and in-file
 * structures. Some formats embed them, namely:
 * 
 * * Windows Shell link files (.lnk) Windows registry
 * * Windows registry "ShellBags" keys
 * 
 * The format is mostly undocumented, and is known to vary between
 * various Windows versions.
 * @see <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc">Source</a>
 */
type WindowsShellItems struct {
	Items []*WindowsShellItems_ShellItem
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent interface{}
}
func NewWindowsShellItems() *WindowsShellItems {
	return &WindowsShellItems{
	}
}

func (this *WindowsShellItems) Read(io *kaitai.Stream, parent interface{}, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	for i := 1;; i++ {
		tmp1 := NewWindowsShellItems_ShellItem()
		err = tmp1.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		_it := tmp1
		this.Items = append(this.Items, _it)
		if _it.LenData == 0 {
			break
		}
	}
	return err
}

/**
 * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.1</a>
 */
type WindowsShellItems_ShellItemData struct {
	Code uint8
	Body1 *WindowsShellItems_RootFolderBody
	Body2 interface{}
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent *WindowsShellItems_ShellItem
}
func NewWindowsShellItems_ShellItemData() *WindowsShellItems_ShellItemData {
	return &WindowsShellItems_ShellItemData{
	}
}

func (this *WindowsShellItems_ShellItemData) Read(io *kaitai.Stream, parent *WindowsShellItems_ShellItem, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp2, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Code = tmp2
	switch (this.Code) {
	case 31:
		tmp3 := NewWindowsShellItems_RootFolderBody()
		err = tmp3.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body1 = tmp3
	}
	switch ((this.Code & 112)) {
	case 32:
		tmp4 := NewWindowsShellItems_VolumeBody()
		err = tmp4.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body2 = tmp4
	case 48:
		tmp5 := NewWindowsShellItems_FileEntryBody()
		err = tmp5.Read(this._io, this, this._root)
		if err != nil {
			return err
		}
		this.Body2 = tmp5
	}
	return err
}

/**
 * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.2</a>
 */
type WindowsShellItems_ShellItem struct {
	LenData uint16
	Data *WindowsShellItems_ShellItemData
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent *WindowsShellItems
	_raw_Data []byte
}
func NewWindowsShellItems_ShellItem() *WindowsShellItems_ShellItem {
	return &WindowsShellItems_ShellItem{
	}
}

func (this *WindowsShellItems_ShellItem) Read(io *kaitai.Stream, parent *WindowsShellItems, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.LenData = uint16(tmp6)
	if (this.LenData >= 2) {
		tmp7, err := this._io.ReadBytes(int((this.LenData - 2)))
		if err != nil {
			return err
		}
		tmp7 = tmp7
		this._raw_Data = tmp7
		_io__raw_Data := kaitai.NewStream(bytes.NewReader(this._raw_Data))
		tmp8 := NewWindowsShellItems_ShellItemData()
		err = tmp8.Read(_io__raw_Data, this, this._root)
		if err != nil {
			return err
		}
		this.Data = tmp8
	}
	return err
}

/**
 * @see <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item">Source</a>
 */
type WindowsShellItems_RootFolderBody struct {
	SortIndex uint8
	ShellFolderId []byte
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent *WindowsShellItems_ShellItemData
}
func NewWindowsShellItems_RootFolderBody() *WindowsShellItems_RootFolderBody {
	return &WindowsShellItems_RootFolderBody{
	}
}

func (this *WindowsShellItems_RootFolderBody) Read(io *kaitai.Stream, parent *WindowsShellItems_ShellItemData, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp9, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.SortIndex = tmp9
	tmp10, err := this._io.ReadBytes(int(16))
	if err != nil {
		return err
	}
	tmp10 = tmp10
	this.ShellFolderId = tmp10
	return err
}

/**
 * @see <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item">Source</a>
 */
type WindowsShellItems_VolumeBody struct {
	Flags uint8
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent *WindowsShellItems_ShellItemData
}
func NewWindowsShellItems_VolumeBody() *WindowsShellItems_VolumeBody {
	return &WindowsShellItems_VolumeBody{
	}
}

func (this *WindowsShellItems_VolumeBody) Read(io *kaitai.Stream, parent *WindowsShellItems_ShellItemData, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this.Flags = tmp11
	return err
}

/**
 * @see <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item">Source</a>
 */
type WindowsShellItems_FileEntryBody struct {
	_unnamed0 uint8
	FileSize uint32
	LastModTime uint32
	FileAttrs uint16
	_io *kaitai.Stream
	_root *WindowsShellItems
	_parent *WindowsShellItems_ShellItemData
	_f_isDir bool
	isDir bool
	_f_isFile bool
	isFile bool
}
func NewWindowsShellItems_FileEntryBody() *WindowsShellItems_FileEntryBody {
	return &WindowsShellItems_FileEntryBody{
	}
}

func (this *WindowsShellItems_FileEntryBody) Read(io *kaitai.Stream, parent *WindowsShellItems_ShellItemData, root *WindowsShellItems) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp12, err := this._io.ReadU1()
	if err != nil {
		return err
	}
	this._unnamed0 = tmp12
	tmp13, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.FileSize = uint32(tmp13)
	tmp14, err := this._io.ReadU4le()
	if err != nil {
		return err
	}
	this.LastModTime = uint32(tmp14)
	tmp15, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.FileAttrs = uint16(tmp15)
	return err
}
func (this *WindowsShellItems_FileEntryBody) IsDir() (v bool, err error) {
	if (this._f_isDir) {
		return this.isDir, nil
	}
	this.isDir = bool((this._parent.Code & 1) != 0)
	this._f_isDir = true
	return this.isDir, nil
}
func (this *WindowsShellItems_FileEntryBody) IsFile() (v bool, err error) {
	if (this._f_isFile) {
		return this.isFile, nil
	}
	this.isFile = bool((this._parent.Code & 2) != 0)
	this._f_isFile = true
	return this.isFile, nil
}
