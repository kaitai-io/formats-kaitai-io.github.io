// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;


/**
 * Microsoft Windows SYSTEMTIME structure, stores individual components
 * of date and time as individual fields, up to millisecond precision.
 */
public class WindowsSystemtime extends KaitaiStruct {
    public static WindowsSystemtime fromFile(String fileName) throws IOException {
        return new WindowsSystemtime(new KaitaiStream(fileName));
    }

    public WindowsSystemtime(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsSystemtime(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsSystemtime(KaitaiStream _io, KaitaiStruct _parent, WindowsSystemtime _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.year = this._io.readU2le();
        this.month = this._io.readU2le();
        this.dow = this._io.readU2le();
        this.day = this._io.readU2le();
        this.hour = this._io.readU2le();
        this.min = this._io.readU2le();
        this.sec = this._io.readU2le();
        this.msec = this._io.readU2le();
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
    private KaitaiStruct _parent;

    /**
     * Year
     */
    public int year() { return year; }

    /**
     * Month (January = 1)
     */
    public int month() { return month; }

    /**
     * Day of week (Sun = 0)
     */
    public int dow() { return dow; }

    /**
     * Day of month
     */
    public int day() { return day; }

    /**
     * Hours
     */
    public int hour() { return hour; }

    /**
     * Minutes
     */
    public int min() { return min; }

    /**
     * Seconds
     */
    public int sec() { return sec; }

    /**
     * Milliseconds
     */
    public int msec() { return msec; }
    public WindowsSystemtime _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
