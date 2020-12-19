// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import (
	"github.com/kaitai-io/kaitai_struct_go_runtime/kaitai"
	"strconv"
)


/**
 * MS-DOS date and time are packed 16-bit values that specify local date/time.
 * The time is always stored in the current UTC time offset set on the computer
 * which created the file. Note that the daylight saving time (DST) shifts
 * also change the UTC time offset.
 * 
 * For example, if you pack two files A and B into a ZIP archive, file A last modified
 * at 2020-03-29 00:59 UTC+00:00 (GMT) and file B at 2020-03-29 02:00 UTC+01:00 (BST),
 * the file modification times saved in MS-DOS format in the ZIP file will vary depending
 * on whether the computer packing the files is set to GMT or BST at the time of ZIP creation.
 * 
 *   - If set to GMT:
 *       - file A: 2020-03-29 00:59 (UTC+00:00)
 *       - file B: 2020-03-29 01:00 (UTC+00:00)
 *   - If set to BST:
 *       - file A: 2020-03-29 01:59 (UTC+01:00)
 *       - file B: 2020-03-29 02:00 (UTC+01:00)
 * 
 * It follows that you are unable to determine the actual last modified time
 * of any file stored in the ZIP archive, if you don't know the locale time
 * setting of the computer at the time it created the ZIP.
 * 
 * This format is used in some data formats from the MS-DOS era, for example:
 * 
 *   - [zip](/zip/)
 *   - [rar](/rar/)
 *   - [vfat](/vfat/) (FAT12)
 *   - [lzh](/lzh/)
 *   - [cab](http://justsolve.archiveteam.org/wiki/Cabinet)
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time">Source</a>
 * @see <a href="https://docs.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime">Source</a>
 * @see <a href="https://github.com/reactos/reactos/blob/c6b6444/dll/win32/kernel32/client/time.c#L82-L87">DosDateTimeToFileTime</a>
 * @see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">page 25/34</a>
 */
type DosDatetime struct {
	Time *DosDatetime_Time
	Date *DosDatetime_Date
	_io *kaitai.Stream
	_root *DosDatetime
	_parent interface{}
}
func NewDosDatetime() *DosDatetime {
	return &DosDatetime{
	}
}

func (this *DosDatetime) Read(io *kaitai.Stream, parent interface{}, root *DosDatetime) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp1 := NewDosDatetime_Time()
	err = tmp1.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Time = tmp1
	tmp2 := NewDosDatetime_Date()
	err = tmp2.Read(this._io, this, this._root)
	if err != nil {
		return err
	}
	this.Date = tmp2
	return err
}
type DosDatetime_Time struct {
	SecondDiv2 uint64
	Minute uint64
	Hour uint64
	_io *kaitai.Stream
	_root *DosDatetime
	_parent *DosDatetime
	_f_second bool
	second int
	_f_paddedSecond bool
	paddedSecond string
	_f_paddedMinute bool
	paddedMinute string
	_f_paddedHour bool
	paddedHour string
}
func NewDosDatetime_Time() *DosDatetime_Time {
	return &DosDatetime_Time{
	}
}

func (this *DosDatetime_Time) Read(io *kaitai.Stream, parent *DosDatetime, root *DosDatetime) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp3, err := this._io.ReadBitsIntLe(5)
	if err != nil {
		return err
	}
	this.SecondDiv2 = tmp3
	if !(this.SecondDiv2 <= 29) {
		return kaitai.NewValidationGreaterThanError(29, this.SecondDiv2, this._io, "/types/time/seq/0")
	}
	tmp4, err := this._io.ReadBitsIntLe(6)
	if err != nil {
		return err
	}
	this.Minute = tmp4
	if !(this.Minute <= 59) {
		return kaitai.NewValidationGreaterThanError(59, this.Minute, this._io, "/types/time/seq/1")
	}
	tmp5, err := this._io.ReadBitsIntLe(5)
	if err != nil {
		return err
	}
	this.Hour = tmp5
	if !(this.Hour <= 23) {
		return kaitai.NewValidationGreaterThanError(23, this.Hour, this._io, "/types/time/seq/2")
	}
	return err
}
func (this *DosDatetime_Time) Second() (v int, err error) {
	if (this._f_second) {
		return this.second, nil
	}
	this.second = int((2 * this.SecondDiv2))
	this._f_second = true
	return this.second, nil
}
func (this *DosDatetime_Time) PaddedSecond() (v string, err error) {
	if (this._f_paddedSecond) {
		return this.paddedSecond, nil
	}
	var tmp6 string;
	tmp7, err := this.Second()
	if err != nil {
		return "", err
	}
	if (tmp7 <= 9) {
		tmp6 = "0"
	} else {
		tmp6 = ""
	}
	tmp8, err := this.Second()
	if err != nil {
		return "", err
	}
	this.paddedSecond = string(tmp6 + strconv.FormatInt(int64(tmp8), 10))
	this._f_paddedSecond = true
	return this.paddedSecond, nil
}
func (this *DosDatetime_Time) PaddedMinute() (v string, err error) {
	if (this._f_paddedMinute) {
		return this.paddedMinute, nil
	}
	var tmp9 string;
	if (this.Minute <= 9) {
		tmp9 = "0"
	} else {
		tmp9 = ""
	}
	this.paddedMinute = string(tmp9 + strconv.FormatInt(int64(this.Minute), 10))
	this._f_paddedMinute = true
	return this.paddedMinute, nil
}
func (this *DosDatetime_Time) PaddedHour() (v string, err error) {
	if (this._f_paddedHour) {
		return this.paddedHour, nil
	}
	var tmp10 string;
	if (this.Hour <= 9) {
		tmp10 = "0"
	} else {
		tmp10 = ""
	}
	this.paddedHour = string(tmp10 + strconv.FormatInt(int64(this.Hour), 10))
	this._f_paddedHour = true
	return this.paddedHour, nil
}
type DosDatetime_Date struct {
	Day uint64
	Month uint64
	YearMinus1980 uint64
	_io *kaitai.Stream
	_root *DosDatetime
	_parent *DosDatetime
	_f_year bool
	year int
	_f_paddedDay bool
	paddedDay string
	_f_paddedMonth bool
	paddedMonth string
	_f_paddedYear bool
	paddedYear string
}
func NewDosDatetime_Date() *DosDatetime_Date {
	return &DosDatetime_Date{
	}
}

func (this *DosDatetime_Date) Read(io *kaitai.Stream, parent *DosDatetime, root *DosDatetime) (err error) {
	this._io = io
	this._parent = parent
	this._root = root

	tmp11, err := this._io.ReadBitsIntLe(5)
	if err != nil {
		return err
	}
	this.Day = tmp11
	if !(this.Day >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Day, this._io, "/types/date/seq/0")
	}
	tmp12, err := this._io.ReadBitsIntLe(4)
	if err != nil {
		return err
	}
	this.Month = tmp12
	if !(this.Month >= 1) {
		return kaitai.NewValidationLessThanError(1, this.Month, this._io, "/types/date/seq/1")
	}
	if !(this.Month <= 12) {
		return kaitai.NewValidationGreaterThanError(12, this.Month, this._io, "/types/date/seq/1")
	}
	tmp13, err := this._io.ReadBitsIntLe(7)
	if err != nil {
		return err
	}
	this.YearMinus1980 = tmp13
	return err
}

/**
 * only years from 1980 to 2107 (1980 + 127) can be represented
 */
func (this *DosDatetime_Date) Year() (v int, err error) {
	if (this._f_year) {
		return this.year, nil
	}
	this.year = int((1980 + this.YearMinus1980))
	this._f_year = true
	return this.year, nil
}
func (this *DosDatetime_Date) PaddedDay() (v string, err error) {
	if (this._f_paddedDay) {
		return this.paddedDay, nil
	}
	var tmp14 string;
	if (this.Day <= 9) {
		tmp14 = "0"
	} else {
		tmp14 = ""
	}
	this.paddedDay = string(tmp14 + strconv.FormatInt(int64(this.Day), 10))
	this._f_paddedDay = true
	return this.paddedDay, nil
}
func (this *DosDatetime_Date) PaddedMonth() (v string, err error) {
	if (this._f_paddedMonth) {
		return this.paddedMonth, nil
	}
	var tmp15 string;
	if (this.Month <= 9) {
		tmp15 = "0"
	} else {
		tmp15 = ""
	}
	this.paddedMonth = string(tmp15 + strconv.FormatInt(int64(this.Month), 10))
	this._f_paddedMonth = true
	return this.paddedMonth, nil
}
func (this *DosDatetime_Date) PaddedYear() (v string, err error) {
	if (this._f_paddedYear) {
		return this.paddedYear, nil
	}
	var tmp16 string;
	tmp17, err := this.Year()
	if err != nil {
		return "", err
	}
	if (tmp17 <= 999) {
		var tmp18 string;
		tmp19, err := this.Year()
		if err != nil {
			return "", err
		}
		if (tmp19 <= 99) {
			var tmp20 string;
			tmp21, err := this.Year()
			if err != nil {
				return "", err
			}
			if (tmp21 <= 9) {
				tmp20 = "0"
			} else {
				tmp20 = ""
			}
			tmp18 = "0" + tmp20
		} else {
			tmp18 = ""
		}
		tmp16 = "0" + tmp18
	} else {
		tmp16 = ""
	}
	tmp22, err := this.Year()
	if err != nil {
		return "", err
	}
	this.paddedYear = string(tmp16 + strconv.FormatInt(int64(tmp22), 10))
	this._f_paddedYear = true
	return this.paddedYear, nil
}