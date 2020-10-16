// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import "github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"


/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms724950.aspx">Source</a>
 */
type WindowsSystemtime struct {
	Year uint16
	Month uint16
	Dow uint16
	Day uint16
	Hour uint16
	Min uint16
	Sec uint16
	Msec uint16
	_io *kaitai.Stream
	_root *WindowsSystemtime
	_parent interface{}
}
func NewWindowsSystemtime() *WindowsSystemtime {
	return &WindowsSystemtime{
	}
}

func (this *WindowsSystemtime) Read(io *kaitai.Stream, parent interface{}, root *WindowsSystemtime) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Year = uint16(tmp1)
	tmp2, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Month = uint16(tmp2)
	tmp3, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Dow = uint16(tmp3)
	tmp4, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Day = uint16(tmp4)
	tmp5, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Hour = uint16(tmp5)
	tmp6, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Min = uint16(tmp6)
	tmp7, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Sec = uint16(tmp7)
	tmp8, err := this._io.ReadU2le()
	if err != nil {
		return err
	}
	this.Msec = uint16(tmp8)
	return err
}

/**
 * Year
 */

/**
 * Month (January = 1)
 */

/**
 * Day of week (Sun = 0)
 */

/**
 * Day of month
 */

/**
 * Hours
 */

/**
 * Minutes
 */

/**
 * Seconds
 */

/**
 * Milliseconds
 */
