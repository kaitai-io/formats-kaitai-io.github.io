// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;

public class Ines extends KaitaiStruct {
    public static Ines fromFile(String fileName) throws IOException {
        return new Ines(new KaitaiStream(fileName));
    }

    public Ines(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Ines(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Ines(KaitaiStream _io, KaitaiStruct _parent, Ines _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.rom = this._io.readBytesFull();
    }
    public static class F7 extends KaitaiStruct {
        public static F7 fromFile(String fileName) throws IOException {
            return new F7(new KaitaiStream(fileName));
        }

        public F7(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public F7(KaitaiStream _io, Ines.Header _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public F7(KaitaiStream _io, Ines.Header _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.upperNibble = this._io.readBitsInt(4);
            this.format = this._io.readBitsInt(2);
            this.arcade2 = this._io.readBitsInt(1) != 0;
            this.arcade1 = this._io.readBitsInt(1) != 0;
        }
        private long upperNibble;
        private long format;
        private boolean arcade2;
        private boolean arcade1;
        private Ines _root;
        private Ines.Header _parent;

        /**
         * Upper nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
         */
        public long upperNibble() { return upperNibble; }

        /**
         * If equal to 2, flags 8-15 are in NES 2.0 format
         */
        public long format() { return format; }

        /**
         * Determines if it made for a Nintendo PlayChoice-10 or not
         */
        public boolean arcade2() { return arcade2; }

        /**
         * Determines if it is made for a Nintendo VS Unisystem or not
         */
        public boolean arcade1() { return arcade1; }
        public Ines _root() { return _root; }
        public Ines.Header _parent() { return _parent; }
    }
    public static class F6 extends KaitaiStruct {
        public static F6 fromFile(String fileName) throws IOException {
            return new F6(new KaitaiStream(fileName));
        }

        public F6(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public F6(KaitaiStream _io, Ines.Header _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public F6(KaitaiStream _io, Ines.Header _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.lowerNibble = this._io.readBitsInt(4);
            this.ignoreMirror = this._io.readBitsInt(1) != 0;
            this.trainer = this._io.readBitsInt(1) != 0;
            this.hasBatteryRam = this._io.readBitsInt(1) != 0;
            this.mirror = this._io.readBitsInt(1) != 0;
        }
        private long lowerNibble;
        private boolean ignoreMirror;
        private boolean trainer;
        private boolean hasBatteryRam;
        private boolean mirror;
        private Ines _root;
        private Ines.Header _parent;

        /**
         * Lower nibble of mapper number (see https://wiki.nesdev.com/w/index.php/Mapper)
         */
        public long lowerNibble() { return lowerNibble; }

        /**
         * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
         */
        public boolean ignoreMirror() { return ignoreMirror; }

        /**
         * 512-byte trainer at $7000-$71FF (stored before PRG data)
         */
        public boolean trainer() { return trainer; }

        /**
         * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
         */
        public boolean hasBatteryRam() { return hasBatteryRam; }

        /**
         * if 0, horizontal arrangement. if 1, vertical arrangement
         */
        public boolean mirror() { return mirror; }
        public Ines _root() { return _root; }
        public Ines.Header _parent() { return _parent; }
    }
    public static class F10 extends KaitaiStruct {
        public static F10 fromFile(String fileName) throws IOException {
            return new F10(new KaitaiStream(fileName));
        }

        public F10(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public F10(KaitaiStream _io, Ines.Header _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public F10(KaitaiStream _io, Ines.Header _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.nothing1 = this._io.readBitsInt(2);
            this.busConflict = this._io.readBitsInt(1) != 0;
            this.prgRam = this._io.readBitsInt(1) != 0;
            this.nothing2 = this._io.readBitsInt(2);
            this.tvSystem = this._io.readBitsInt(2);
        }
        private long nothing1;
        private boolean busConflict;
        private boolean prgRam;
        private long nothing2;
        private long tvSystem;
        private Ines _root;
        private Ines.Header _parent;
        public long nothing1() { return nothing1; }

        /**
         * If 0, no bus conflicts. If 1, bus conflicts.
         */
        public boolean busConflict() { return busConflict; }

        /**
         * If 0, PRG ram is present. If 1, not present.
         */
        public boolean prgRam() { return prgRam; }
        public long nothing2() { return nothing2; }

        /**
         * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
         */
        public long tvSystem() { return tvSystem; }
        public Ines _root() { return _root; }
        public Ines.Header _parent() { return _parent; }
    }
    public static class F9 extends KaitaiStruct {
        public static F9 fromFile(String fileName) throws IOException {
            return new F9(new KaitaiStream(fileName));
        }

        public F9(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public F9(KaitaiStream _io, Ines.Header _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public F9(KaitaiStream _io, Ines.Header _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.reserved = this._io.readBitsInt(7);
            this.tvSystem = this._io.readBitsInt(1) != 0;
        }
        private long reserved;
        private boolean tvSystem;
        private Ines _root;
        private Ines.Header _parent;
        public long reserved() { return reserved; }

        /**
         * if 0, NTSC. If 1, PAL.
         */
        public boolean tvSystem() { return tvSystem; }
        public Ines _root() { return _root; }
        public Ines.Header _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new KaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Header(KaitaiStream _io, Ines _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Header(KaitaiStream _io, Ines _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 78, 69, 83, 26 });
            this.prgRomSize = this._io.readU1();
            this.chrRomSize = this._io.readU1();
            this.f6 = new F6(this._io, this, _root);
            this.f7 = new F7(this._io, this, _root);
            this.prgRamSize = this._io.readU1();
            this.f9 = new F9(this._io, this, _root);
            this.f10 = new F10(this._io, this, _root);
            this.zeroFill = this._io.readBytes(4);
        }
        private byte[] magic;
        private int prgRomSize;
        private int chrRomSize;
        private F6 f6;
        private F7 f7;
        private int prgRamSize;
        private F9 f9;
        private F10 f10;
        private byte[] zeroFill;
        private Ines _root;
        private Ines _parent;
        public byte[] magic() { return magic; }

        /**
         * Size of PRG ROM in 16 KB units
         */
        public int prgRomSize() { return prgRomSize; }

        /**
         * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
         */
        public int chrRomSize() { return chrRomSize; }
        public F6 f6() { return f6; }
        public F7 f7() { return f7; }

        /**
         * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
         */
        public int prgRamSize() { return prgRamSize; }
        public F9 f9() { return f9; }

        /**
         * this one is unofficial
         */
        public F10 f10() { return f10; }
        public byte[] zeroFill() { return zeroFill; }
        public Ines _root() { return _root; }
        public Ines _parent() { return _parent; }
    }
    private Integer mapper;
    public Integer mapper() {
        if (this.mapper != null)
            return this.mapper;
        int _tmp = (int) ((_root.header().f6().lowerNibble() | (_root.header().f7().upperNibble() << 4)));
        this.mapper = _tmp;
        return this.mapper;
    }
    private Header header;
    private byte[] rom;
    private Ines _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public byte[] rom() { return rom; }
    public Ines _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
