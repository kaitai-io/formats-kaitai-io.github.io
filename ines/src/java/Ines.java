// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;


/**
 * @see <a href="https://wiki.nesdev.com/w/index.php/INES">Source</a>
 */
public class Ines extends KaitaiStruct {
    public static Ines fromFile(String fileName) throws IOException {
        return new Ines(new ByteBufferKaitaiStream(fileName));
    }

    public Ines(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ines(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Ines(KaitaiStream _io, KaitaiStruct _parent, Ines _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_header = this._io.readBytes(16);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        if (header().f6().trainer()) {
            this.trainer = this._io.readBytes(512);
        }
        this.prgRom = this._io.readBytes((header().lenPrgRom() * 16384));
        this.chrRom = this._io.readBytes((header().lenChrRom() * 8192));
        if (header().f7().playchoice10()) {
            this.playchoice10 = new Playchoice10(this._io, this, _root);
        }
        if (!(_io().isEof())) {
            this.title = new String(this._io.readBytesFull(), Charset.forName("ASCII"));
        }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Ines _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Ines _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 78, 69, 83, 26 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 69, 83, 26 }, magic(), _io(), "/types/header/seq/0");
            }
            this.lenPrgRom = this._io.readU1();
            this.lenChrRom = this._io.readU1();
            this._raw_f6 = this._io.readBytes(1);
            KaitaiStream _io__raw_f6 = new ByteBufferKaitaiStream(_raw_f6);
            this.f6 = new F6(_io__raw_f6, this, _root);
            this._raw_f7 = this._io.readBytes(1);
            KaitaiStream _io__raw_f7 = new ByteBufferKaitaiStream(_raw_f7);
            this.f7 = new F7(_io__raw_f7, this, _root);
            this.lenPrgRam = this._io.readU1();
            this._raw_f9 = this._io.readBytes(1);
            KaitaiStream _io__raw_f9 = new ByteBufferKaitaiStream(_raw_f9);
            this.f9 = new F9(_io__raw_f9, this, _root);
            this._raw_f10 = this._io.readBytes(1);
            KaitaiStream _io__raw_f10 = new ByteBufferKaitaiStream(_raw_f10);
            this.f10 = new F10(_io__raw_f10, this, _root);
            this.reserved = this._io.readBytes(5);
            if (!(Arrays.equals(reserved(), new byte[] { 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0 }, reserved(), _io(), "/types/header/seq/8");
            }
        }

        /**
         * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_6">Source</a>
         */
        public static class F6 extends KaitaiStruct {
            public static F6 fromFile(String fileName) throws IOException {
                return new F6(new ByteBufferKaitaiStream(fileName));
            }

            public enum Mirroring {
                HORIZONTAL(0),
                VERTICAL(1);

                private final long id;
                Mirroring(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Mirroring> byId = new HashMap<Long, Mirroring>(2);
                static {
                    for (Mirroring e : Mirroring.values())
                        byId.put(e.id(), e);
                }
                public static Mirroring byId(long id) { return byId.get(id); }
            }

            public F6(KaitaiStream _io) {
                this(_io, null, null);
            }

            public F6(KaitaiStream _io, Ines.Header _parent) {
                this(_io, _parent, null);
            }

            public F6(KaitaiStream _io, Ines.Header _parent, Ines _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.lowerMapper = this._io.readBitsIntBe(4);
                this.fourScreen = this._io.readBitsIntBe(1) != 0;
                this.trainer = this._io.readBitsIntBe(1) != 0;
                this.hasBatteryRam = this._io.readBitsIntBe(1) != 0;
                this.mirroring = Mirroring.byId(this._io.readBitsIntBe(1));
            }
            private long lowerMapper;
            private boolean fourScreen;
            private boolean trainer;
            private boolean hasBatteryRam;
            private Mirroring mirroring;
            private Ines _root;
            private Ines.Header _parent;

            /**
             * Lower nibble of mapper number
             */
            public long lowerMapper() { return lowerMapper; }

            /**
             * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
             */
            public boolean fourScreen() { return fourScreen; }

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
            public Mirroring mirroring() { return mirroring; }
            public Ines _root() { return _root; }
            public Ines.Header _parent() { return _parent; }
        }

        /**
         * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_7">Source</a>
         */
        public static class F7 extends KaitaiStruct {
            public static F7 fromFile(String fileName) throws IOException {
                return new F7(new ByteBufferKaitaiStream(fileName));
            }

            public F7(KaitaiStream _io) {
                this(_io, null, null);
            }

            public F7(KaitaiStream _io, Ines.Header _parent) {
                this(_io, _parent, null);
            }

            public F7(KaitaiStream _io, Ines.Header _parent, Ines _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.upperMapper = this._io.readBitsIntBe(4);
                this.format = this._io.readBitsIntBe(2);
                this.playchoice10 = this._io.readBitsIntBe(1) != 0;
                this.vsUnisystem = this._io.readBitsIntBe(1) != 0;
            }
            private long upperMapper;
            private long format;
            private boolean playchoice10;
            private boolean vsUnisystem;
            private Ines _root;
            private Ines.Header _parent;

            /**
             * Upper nibble of mapper number
             */
            public long upperMapper() { return upperMapper; }

            /**
             * If equal to 2, flags 8-15 are in NES 2.0 format
             */
            public long format() { return format; }

            /**
             * Determines if it made for a Nintendo PlayChoice-10 or not
             */
            public boolean playchoice10() { return playchoice10; }

            /**
             * Determines if it is made for a Nintendo VS Unisystem or not
             */
            public boolean vsUnisystem() { return vsUnisystem; }
            public Ines _root() { return _root; }
            public Ines.Header _parent() { return _parent; }
        }

        /**
         * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_9">Source</a>
         */
        public static class F9 extends KaitaiStruct {
            public static F9 fromFile(String fileName) throws IOException {
                return new F9(new ByteBufferKaitaiStream(fileName));
            }

            public enum TvSystem {
                NTSC(0),
                PAL(1);

                private final long id;
                TvSystem(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TvSystem> byId = new HashMap<Long, TvSystem>(2);
                static {
                    for (TvSystem e : TvSystem.values())
                        byId.put(e.id(), e);
                }
                public static TvSystem byId(long id) { return byId.get(id); }
            }

            public F9(KaitaiStream _io) {
                this(_io, null, null);
            }

            public F9(KaitaiStream _io, Ines.Header _parent) {
                this(_io, _parent, null);
            }

            public F9(KaitaiStream _io, Ines.Header _parent, Ines _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.reserved = this._io.readBitsIntBe(7);
                this.tvSystem = TvSystem.byId(this._io.readBitsIntBe(1));
            }
            private long reserved;
            private TvSystem tvSystem;
            private Ines _root;
            private Ines.Header _parent;
            public long reserved() { return reserved; }

            /**
             * if 0, NTSC. If 1, PAL.
             */
            public TvSystem tvSystem() { return tvSystem; }
            public Ines _root() { return _root; }
            public Ines.Header _parent() { return _parent; }
        }

        /**
         * @see <a href="https://wiki.nesdev.com/w/index.php/INES#Flags_10">Source</a>
         */
        public static class F10 extends KaitaiStruct {
            public static F10 fromFile(String fileName) throws IOException {
                return new F10(new ByteBufferKaitaiStream(fileName));
            }

            public enum TvSystem {
                NTSC(0),
                DUAL1(1),
                PAL(2),
                DUAL2(3);

                private final long id;
                TvSystem(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, TvSystem> byId = new HashMap<Long, TvSystem>(4);
                static {
                    for (TvSystem e : TvSystem.values())
                        byId.put(e.id(), e);
                }
                public static TvSystem byId(long id) { return byId.get(id); }
            }

            public F10(KaitaiStream _io) {
                this(_io, null, null);
            }

            public F10(KaitaiStream _io, Ines.Header _parent) {
                this(_io, _parent, null);
            }

            public F10(KaitaiStream _io, Ines.Header _parent, Ines _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBitsIntBe(2);
                this.busConflict = this._io.readBitsIntBe(1) != 0;
                this.prgRam = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(2);
                this.tvSystem = TvSystem.byId(this._io.readBitsIntBe(2));
            }
            private long reserved1;
            private boolean busConflict;
            private boolean prgRam;
            private long reserved2;
            private TvSystem tvSystem;
            private Ines _root;
            private Ines.Header _parent;
            public long reserved1() { return reserved1; }

            /**
             * If 0, no bus conflicts. If 1, bus conflicts.
             */
            public boolean busConflict() { return busConflict; }

            /**
             * If 0, PRG ram is present. If 1, not present.
             */
            public boolean prgRam() { return prgRam; }
            public long reserved2() { return reserved2; }

            /**
             * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
             */
            public TvSystem tvSystem() { return tvSystem; }
            public Ines _root() { return _root; }
            public Ines.Header _parent() { return _parent; }
        }
        private Integer mapper;

        /**
         * @see <a href="https://wiki.nesdev.com/w/index.php/Mapper">Source</a>
         */
        public Integer mapper() {
            if (this.mapper != null)
                return this.mapper;
            int _tmp = (int) ((f6().lowerMapper() | (f7().upperMapper() << 4)));
            this.mapper = _tmp;
            return this.mapper;
        }
        private byte[] magic;
        private int lenPrgRom;
        private int lenChrRom;
        private F6 f6;
        private F7 f7;
        private int lenPrgRam;
        private F9 f9;
        private F10 f10;
        private byte[] reserved;
        private Ines _root;
        private Ines _parent;
        private byte[] _raw_f6;
        private byte[] _raw_f7;
        private byte[] _raw_f9;
        private byte[] _raw_f10;
        public byte[] magic() { return magic; }

        /**
         * Size of PRG ROM in 16 KB units
         */
        public int lenPrgRom() { return lenPrgRom; }

        /**
         * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
         */
        public int lenChrRom() { return lenChrRom; }
        public F6 f6() { return f6; }
        public F7 f7() { return f7; }

        /**
         * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
         */
        public int lenPrgRam() { return lenPrgRam; }
        public F9 f9() { return f9; }

        /**
         * this one is unofficial
         */
        public F10 f10() { return f10; }
        public byte[] reserved() { return reserved; }
        public Ines _root() { return _root; }
        public Ines _parent() { return _parent; }
        public byte[] _raw_f6() { return _raw_f6; }
        public byte[] _raw_f7() { return _raw_f7; }
        public byte[] _raw_f9() { return _raw_f9; }
        public byte[] _raw_f10() { return _raw_f10; }
    }

    /**
     * @see <a href="http://wiki.nesdev.com/w/index.php/PC10_ROM-Images">Source</a>
     */
    public static class Playchoice10 extends KaitaiStruct {
        public static Playchoice10 fromFile(String fileName) throws IOException {
            return new Playchoice10(new ByteBufferKaitaiStream(fileName));
        }

        public Playchoice10(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Playchoice10(KaitaiStream _io, Ines _parent) {
            this(_io, _parent, null);
        }

        public Playchoice10(KaitaiStream _io, Ines _parent, Ines _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.instRom = this._io.readBytes(8192);
            this.prom = new Prom(this._io, this, _root);
        }
        public static class Prom extends KaitaiStruct {
            public static Prom fromFile(String fileName) throws IOException {
                return new Prom(new ByteBufferKaitaiStream(fileName));
            }

            public Prom(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Prom(KaitaiStream _io, Ines.Playchoice10 _parent) {
                this(_io, _parent, null);
            }

            public Prom(KaitaiStream _io, Ines.Playchoice10 _parent, Ines _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.data = this._io.readBytes(16);
                this.counterOut = this._io.readBytes(16);
            }
            private byte[] data;
            private byte[] counterOut;
            private Ines _root;
            private Ines.Playchoice10 _parent;
            public byte[] data() { return data; }
            public byte[] counterOut() { return counterOut; }
            public Ines _root() { return _root; }
            public Ines.Playchoice10 _parent() { return _parent; }
        }
        private byte[] instRom;
        private Prom prom;
        private Ines _root;
        private Ines _parent;
        public byte[] instRom() { return instRom; }
        public Prom prom() { return prom; }
        public Ines _root() { return _root; }
        public Ines _parent() { return _parent; }
    }
    private Header header;
    private byte[] trainer;
    private byte[] prgRom;
    private byte[] chrRom;
    private Playchoice10 playchoice10;
    private String title;
    private Ines _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header;
    public Header header() { return header; }
    public byte[] trainer() { return trainer; }
    public byte[] prgRom() { return prgRom; }
    public byte[] chrRom() { return chrRom; }
    public Playchoice10 playchoice10() { return playchoice10; }
    public String title() { return title; }
    public Ines _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header() { return _raw_header; }
}
