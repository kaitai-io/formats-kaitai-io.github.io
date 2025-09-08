// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;


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
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/sysinfo/ms-dos-date-and-time">Source</a>
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/winbase/nf-winbase-dosdatetimetofiletime">Source</a>
 * @see <a href="https://github.com/reactos/reactos/blob/c6b64448ce4/dll/win32/kernel32/client/time.c#L82-L87">DosDateTimeToFileTime</a>
 * @see <a href="https://download.microsoft.com/download/0/8/4/084c452b-b772-4fe5-89bb-a0cbf082286a/fatgen103.doc">page 25/34</a>
 */
public class DosDatetime extends KaitaiStruct.ReadWrite {
    public static DosDatetime fromFile(String fileName) throws IOException {
        return new DosDatetime(new ByteBufferKaitaiStream(fileName));
    }
    public DosDatetime() {
        this(null, null, null);
    }

    public DosDatetime(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DosDatetime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DosDatetime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DosDatetime _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.time = new Time(this._io, this, _root);
        this.time._read();
        this.date = new Date(this._io, this, _root);
        this.date._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.time._fetchInstances();
        this.date._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.time._write_Seq(this._io);
        this.date._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.time._root(), _root()))
            throw new ConsistencyError("time", _root(), this.time._root());
        if (!Objects.equals(this.time._parent(), this))
            throw new ConsistencyError("time", this, this.time._parent());
        if (!Objects.equals(this.date._root(), _root()))
            throw new ConsistencyError("date", _root(), this.date._root());
        if (!Objects.equals(this.date._parent(), this))
            throw new ConsistencyError("date", this, this.date._parent());
        _dirty = false;
    }
    public static class Date extends KaitaiStruct.ReadWrite {
        public static Date fromFile(String fileName) throws IOException {
            return new Date(new ByteBufferKaitaiStream(fileName));
        }
        public Date() {
            this(null, null, null);
        }

        public Date(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Date(KaitaiStream _io, DosDatetime _parent) {
            this(_io, _parent, null);
        }

        public Date(KaitaiStream _io, DosDatetime _parent, DosDatetime _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.day = this._io.readBitsIntLe(5);
            if (!(this.day >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.day, this._io, "/types/date/seq/0");
            }
            this.month = this._io.readBitsIntLe(4);
            if (!(this.month >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.month, this._io, "/types/date/seq/1");
            }
            if (!(this.month <= 12)) {
                throw new KaitaiStream.ValidationGreaterThanError(12, this.month, this._io, "/types/date/seq/1");
            }
            this.yearMinus1980 = this._io.readBitsIntLe(7);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntLe(5, this.day);
            this._io.writeBitsIntLe(4, this.month);
            this._io.writeBitsIntLe(7, this.yearMinus1980);
        }

        public void _check() {
            if (!(this.day >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.day, null, "/types/date/seq/0");
            }
            if (!(this.month >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, this.month, null, "/types/date/seq/1");
            }
            if (!(this.month <= 12)) {
                throw new KaitaiStream.ValidationGreaterThanError(12, this.month, null, "/types/date/seq/1");
            }
            _dirty = false;
        }
        private String paddedDay;
        public String paddedDay() {
            if (this.paddedDay != null)
                return this.paddedDay;
            this.paddedDay = (day() <= 9 ? "0" : "") + Long.toString(day());
            return this.paddedDay;
        }
        public void _invalidatePaddedDay() { this.paddedDay = null; }
        private String paddedMonth;
        public String paddedMonth() {
            if (this.paddedMonth != null)
                return this.paddedMonth;
            this.paddedMonth = (month() <= 9 ? "0" : "") + Long.toString(month());
            return this.paddedMonth;
        }
        public void _invalidatePaddedMonth() { this.paddedMonth = null; }
        private String paddedYear;
        public String paddedYear() {
            if (this.paddedYear != null)
                return this.paddedYear;
            this.paddedYear = (year() <= 999 ? "0" + (year() <= 99 ? "0" + (year() <= 9 ? "0" : "") : "") : "") + Long.toString(year());
            return this.paddedYear;
        }
        public void _invalidatePaddedYear() { this.paddedYear = null; }
        private Integer year;

        /**
         * only years from 1980 to 2107 (1980 + 127) can be represented
         */
        public Integer year() {
            if (this.year != null)
                return this.year;
            this.year = ((Number) (1980 + yearMinus1980())).intValue();
            return this.year;
        }
        public void _invalidateYear() { this.year = null; }
        private long day;
        private long month;
        private long yearMinus1980;
        private DosDatetime _root;
        private DosDatetime _parent;
        public long day() { return day; }
        public void setDay(long _v) { _dirty = true; day = _v; }
        public long month() { return month; }
        public void setMonth(long _v) { _dirty = true; month = _v; }
        public long yearMinus1980() { return yearMinus1980; }
        public void setYearMinus1980(long _v) { _dirty = true; yearMinus1980 = _v; }
        public DosDatetime _root() { return _root; }
        public void set_root(DosDatetime _v) { _dirty = true; _root = _v; }
        public DosDatetime _parent() { return _parent; }
        public void set_parent(DosDatetime _v) { _dirty = true; _parent = _v; }
    }
    public static class Time extends KaitaiStruct.ReadWrite {
        public static Time fromFile(String fileName) throws IOException {
            return new Time(new ByteBufferKaitaiStream(fileName));
        }
        public Time() {
            this(null, null, null);
        }

        public Time(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Time(KaitaiStream _io, DosDatetime _parent) {
            this(_io, _parent, null);
        }

        public Time(KaitaiStream _io, DosDatetime _parent, DosDatetime _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.secondDiv2 = this._io.readBitsIntLe(5);
            if (!(this.secondDiv2 <= 29)) {
                throw new KaitaiStream.ValidationGreaterThanError(29, this.secondDiv2, this._io, "/types/time/seq/0");
            }
            this.minute = this._io.readBitsIntLe(6);
            if (!(this.minute <= 59)) {
                throw new KaitaiStream.ValidationGreaterThanError(59, this.minute, this._io, "/types/time/seq/1");
            }
            this.hour = this._io.readBitsIntLe(5);
            if (!(this.hour <= 23)) {
                throw new KaitaiStream.ValidationGreaterThanError(23, this.hour, this._io, "/types/time/seq/2");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntLe(5, this.secondDiv2);
            this._io.writeBitsIntLe(6, this.minute);
            this._io.writeBitsIntLe(5, this.hour);
        }

        public void _check() {
            if (!(this.secondDiv2 <= 29)) {
                throw new KaitaiStream.ValidationGreaterThanError(29, this.secondDiv2, null, "/types/time/seq/0");
            }
            if (!(this.minute <= 59)) {
                throw new KaitaiStream.ValidationGreaterThanError(59, this.minute, null, "/types/time/seq/1");
            }
            if (!(this.hour <= 23)) {
                throw new KaitaiStream.ValidationGreaterThanError(23, this.hour, null, "/types/time/seq/2");
            }
            _dirty = false;
        }
        private String paddedHour;
        public String paddedHour() {
            if (this.paddedHour != null)
                return this.paddedHour;
            this.paddedHour = (hour() <= 9 ? "0" : "") + Long.toString(hour());
            return this.paddedHour;
        }
        public void _invalidatePaddedHour() { this.paddedHour = null; }
        private String paddedMinute;
        public String paddedMinute() {
            if (this.paddedMinute != null)
                return this.paddedMinute;
            this.paddedMinute = (minute() <= 9 ? "0" : "") + Long.toString(minute());
            return this.paddedMinute;
        }
        public void _invalidatePaddedMinute() { this.paddedMinute = null; }
        private String paddedSecond;
        public String paddedSecond() {
            if (this.paddedSecond != null)
                return this.paddedSecond;
            this.paddedSecond = (second() <= 9 ? "0" : "") + Long.toString(second());
            return this.paddedSecond;
        }
        public void _invalidatePaddedSecond() { this.paddedSecond = null; }
        private Integer second;
        public Integer second() {
            if (this.second != null)
                return this.second;
            this.second = ((Number) (2 * secondDiv2())).intValue();
            return this.second;
        }
        public void _invalidateSecond() { this.second = null; }
        private long secondDiv2;
        private long minute;
        private long hour;
        private DosDatetime _root;
        private DosDatetime _parent;
        public long secondDiv2() { return secondDiv2; }
        public void setSecondDiv2(long _v) { _dirty = true; secondDiv2 = _v; }
        public long minute() { return minute; }
        public void setMinute(long _v) { _dirty = true; minute = _v; }
        public long hour() { return hour; }
        public void setHour(long _v) { _dirty = true; hour = _v; }
        public DosDatetime _root() { return _root; }
        public void set_root(DosDatetime _v) { _dirty = true; _root = _v; }
        public DosDatetime _parent() { return _parent; }
        public void set_parent(DosDatetime _v) { _dirty = true; _parent = _v; }
    }
    private Time time;
    private Date date;
    private DosDatetime _root;
    private KaitaiStruct.ReadWrite _parent;
    public Time time() { return time; }
    public void setTime(Time _v) { _dirty = true; time = _v; }
    public Date date() { return date; }
    public void setDate(Date _v) { _dirty = true; date = _v; }
    public DosDatetime _root() { return _root; }
    public void set_root(DosDatetime _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
