// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/api/minwinbase/ns-minwinbase-systemtime">Source</a>
 */
public class WindowsSystemtime extends KaitaiStruct.ReadWrite {
    public static WindowsSystemtime fromFile(String fileName) throws IOException {
        return new WindowsSystemtime(new ByteBufferKaitaiStream(fileName));
    }
    public WindowsSystemtime() {
        this(null, null, null);
    }

    public WindowsSystemtime(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsSystemtime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsSystemtime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsSystemtime _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.year = this._io.readU2le();
        this.month = this._io.readU2le();
        this.dow = this._io.readU2le();
        this.day = this._io.readU2le();
        this.hour = this._io.readU2le();
        this.min = this._io.readU2le();
        this.sec = this._io.readU2le();
        this.msec = this._io.readU2le();
        _dirty = false;
    }

    public void _fetchInstances() {
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeU2le(this.year);
        this._io.writeU2le(this.month);
        this._io.writeU2le(this.dow);
        this._io.writeU2le(this.day);
        this._io.writeU2le(this.hour);
        this._io.writeU2le(this.min);
        this._io.writeU2le(this.sec);
        this._io.writeU2le(this.msec);
    }

    public void _check() {
        _dirty = false;
    }
    private int year;
    private int month;
    private int dow;
    private int day;
    private int hour;
    private int min;
    private int sec;
    private int msec;
    private WindowsSystemtime _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Year
     */
    public int year() { return year; }
    public void setYear(int _v) { _dirty = true; year = _v; }

    /**
     * Month (January = 1)
     */
    public int month() { return month; }
    public void setMonth(int _v) { _dirty = true; month = _v; }

    /**
     * Day of week (Sun = 0)
     */
    public int dow() { return dow; }
    public void setDow(int _v) { _dirty = true; dow = _v; }

    /**
     * Day of month
     */
    public int day() { return day; }
    public void setDay(int _v) { _dirty = true; day = _v; }

    /**
     * Hours
     */
    public int hour() { return hour; }
    public void setHour(int _v) { _dirty = true; hour = _v; }

    /**
     * Minutes
     */
    public int min() { return min; }
    public void setMin(int _v) { _dirty = true; min = _v; }

    /**
     * Seconds
     */
    public int sec() { return sec; }
    public void setSec(int _v) { _dirty = true; sec = _v; }

    /**
     * Milliseconds
     */
    public int msec() { return msec; }
    public void setMsec(int _v) { _dirty = true; msec = _v; }
    public WindowsSystemtime _root() { return _root; }
    public void set_root(WindowsSystemtime _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
