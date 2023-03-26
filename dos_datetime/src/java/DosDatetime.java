// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


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
public class DosDatetime extends KaitaiStruct {
    public static DosDatetime fromFile(String fileName) throws IOException {
        return new DosDatetime(new ByteBufferKaitaiStream(fileName));
    }

    public DosDatetime(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DosDatetime(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DosDatetime(KaitaiStream _io, KaitaiStruct _parent, DosDatetime _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.time = new Time(this._io, this, _root);
        this.date = new Date(this._io, this, _root);
    }
    public static class Time extends KaitaiStruct {
        public static Time fromFile(String fileName) throws IOException {
            return new Time(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.secondDiv2 = this._io.readBitsIntLe(5);
            if (!(secondDiv2() <= 29)) {
                throw new KaitaiStream.ValidationGreaterThanError(29, secondDiv2(), _io(), "/types/time/seq/0");
            }
            this.minute = this._io.readBitsIntLe(6);
            if (!(minute() <= 59)) {
                throw new KaitaiStream.ValidationGreaterThanError(59, minute(), _io(), "/types/time/seq/1");
            }
            this.hour = this._io.readBitsIntLe(5);
            if (!(hour() <= 23)) {
                throw new KaitaiStream.ValidationGreaterThanError(23, hour(), _io(), "/types/time/seq/2");
            }
        }
        private Integer second;
        public Integer second() {
            if (this.second != null)
                return this.second;
            int _tmp = (int) ((2 * secondDiv2()));
            this.second = _tmp;
            return this.second;
        }
        private String paddedSecond;
        public String paddedSecond() {
            if (this.paddedSecond != null)
                return this.paddedSecond;
            this.paddedSecond = (second() <= 9 ? "0" : "") + Long.toString(second(), 10);
            return this.paddedSecond;
        }
        private String paddedMinute;
        public String paddedMinute() {
            if (this.paddedMinute != null)
                return this.paddedMinute;
            this.paddedMinute = (minute() <= 9 ? "0" : "") + Long.toString(minute(), 10);
            return this.paddedMinute;
        }
        private String paddedHour;
        public String paddedHour() {
            if (this.paddedHour != null)
                return this.paddedHour;
            this.paddedHour = (hour() <= 9 ? "0" : "") + Long.toString(hour(), 10);
            return this.paddedHour;
        }
        private long secondDiv2;
        private long minute;
        private long hour;
        private DosDatetime _root;
        private DosDatetime _parent;
        public long secondDiv2() { return secondDiv2; }
        public long minute() { return minute; }
        public long hour() { return hour; }
        public DosDatetime _root() { return _root; }
        public DosDatetime _parent() { return _parent; }
    }
    public static class Date extends KaitaiStruct {
        public static Date fromFile(String fileName) throws IOException {
            return new Date(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.day = this._io.readBitsIntLe(5);
            if (!(day() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, day(), _io(), "/types/date/seq/0");
            }
            this.month = this._io.readBitsIntLe(4);
            if (!(month() >= 1)) {
                throw new KaitaiStream.ValidationLessThanError(1, month(), _io(), "/types/date/seq/1");
            }
            if (!(month() <= 12)) {
                throw new KaitaiStream.ValidationGreaterThanError(12, month(), _io(), "/types/date/seq/1");
            }
            this.yearMinus1980 = this._io.readBitsIntLe(7);
        }
        private Integer year;

        /**
         * only years from 1980 to 2107 (1980 + 127) can be represented
         */
        public Integer year() {
            if (this.year != null)
                return this.year;
            int _tmp = (int) ((1980 + yearMinus1980()));
            this.year = _tmp;
            return this.year;
        }
        private String paddedDay;
        public String paddedDay() {
            if (this.paddedDay != null)
                return this.paddedDay;
            this.paddedDay = (day() <= 9 ? "0" : "") + Long.toString(day(), 10);
            return this.paddedDay;
        }
        private String paddedMonth;
        public String paddedMonth() {
            if (this.paddedMonth != null)
                return this.paddedMonth;
            this.paddedMonth = (month() <= 9 ? "0" : "") + Long.toString(month(), 10);
            return this.paddedMonth;
        }
        private String paddedYear;
        public String paddedYear() {
            if (this.paddedYear != null)
                return this.paddedYear;
            this.paddedYear = (year() <= 999 ? "0" + (year() <= 99 ? "0" + (year() <= 9 ? "0" : "") : "") : "") + Long.toString(year(), 10);
            return this.paddedYear;
        }
        private long day;
        private long month;
        private long yearMinus1980;
        private DosDatetime _root;
        private DosDatetime _parent;
        public long day() { return day; }
        public long month() { return month; }
        public long yearMinus1980() { return yearMinus1980; }
        public DosDatetime _root() { return _root; }
        public DosDatetime _parent() { return _parent; }
    }
    private Time time;
    private Date date;
    private DosDatetime _root;
    private KaitaiStruct _parent;
    public Time time() { return time; }
    public Date date() { return date; }
    public DosDatetime _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
