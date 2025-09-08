// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.Charset;
import java.util.Objects;
import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;


/**
 * @see <a href="https://www.nesdev.org/wiki/INES">Source</a>
 */
public class Ines extends KaitaiStruct.ReadWrite {
    public static Ines fromFile(String fileName) throws IOException {
        return new Ines(new ByteBufferKaitaiStream(fileName));
    }
    public Ines() {
        this(null, null, null);
    }

    public Ines(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Ines(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Ines(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Ines _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_header = this._io.readBytes(16);
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        this.header._read();
        if (header().f6().trainer()) {
            this.trainer = this._io.readBytes(512);
        }
        this.prgRom = this._io.readBytes(header().lenPrgRom() * 16384);
        this.chrRom = this._io.readBytes(header().lenChrRom() * 8192);
        if (header().f7().playchoice10()) {
            this.playchoice10 = new Playchoice10(this._io, this, _root);
            this.playchoice10._read();
        }
        if (!(_io().isEof())) {
            this.title = new String(this._io.readBytesFull(), StandardCharsets.US_ASCII);
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        if (header().f6().trainer()) {
        }
        if (header().f7().playchoice10()) {
            this.playchoice10._fetchInstances();
        }
        if (!(_io().isEof())) {
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(16);
        this._io.addChildStream(_io__raw_header);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (16));
            final Ines _this = this;
            _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_header = _io__raw_header.toByteArray();
                    if (_this._raw_header.length != 16)
                        throw new ConsistencyError("raw(header)", 16, _this._raw_header.length);
                    parent.writeBytes(_this._raw_header);
                }
            });
        }
        this.header._write_Seq(_io__raw_header);
        if (header().f6().trainer()) {
            this._io.writeBytes(this.trainer);
        }
        this._io.writeBytes(this.prgRom);
        this._io.writeBytes(this.chrRom);
        if (header().f7().playchoice10()) {
            this.playchoice10._write_Seq(this._io);
        }
        if (!(_io().isEof())) {
            this._io.writeBytes((this.title).getBytes(Charset.forName("ASCII")));
            if (!(this._io.isEof()))
                throw new ConsistencyError("title", 0, this._io.size() - this._io.pos());
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (header().f6().trainer()) {
            if (this.trainer.length != 512)
                throw new ConsistencyError("trainer", 512, this.trainer.length);
        }
        if (this.prgRom.length != header().lenPrgRom() * 16384)
            throw new ConsistencyError("prg_rom", header().lenPrgRom() * 16384, this.prgRom.length);
        if (this.chrRom.length != header().lenChrRom() * 8192)
            throw new ConsistencyError("chr_rom", header().lenChrRom() * 8192, this.chrRom.length);
        if (header().f7().playchoice10()) {
            if (!Objects.equals(this.playchoice10._root(), _root()))
                throw new ConsistencyError("playchoice10", _root(), this.playchoice10._root());
            if (!Objects.equals(this.playchoice10._parent(), this))
                throw new ConsistencyError("playchoice10", this, this.playchoice10._parent());
        }
        _dirty = false;
    }
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 78, 69, 83, 26 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 69, 83, 26 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.lenPrgRom = this._io.readU1();
            this.lenChrRom = this._io.readU1();
            this._raw_f6 = this._io.readBytes(1);
            KaitaiStream _io__raw_f6 = new ByteBufferKaitaiStream(this._raw_f6);
            this.f6 = new F6(_io__raw_f6, this, _root);
            this.f6._read();
            this._raw_f7 = this._io.readBytes(1);
            KaitaiStream _io__raw_f7 = new ByteBufferKaitaiStream(this._raw_f7);
            this.f7 = new F7(_io__raw_f7, this, _root);
            this.f7._read();
            this.lenPrgRam = this._io.readU1();
            this._raw_f9 = this._io.readBytes(1);
            KaitaiStream _io__raw_f9 = new ByteBufferKaitaiStream(this._raw_f9);
            this.f9 = new F9(_io__raw_f9, this, _root);
            this.f9._read();
            this._raw_f10 = this._io.readBytes(1);
            KaitaiStream _io__raw_f10 = new ByteBufferKaitaiStream(this._raw_f10);
            this.f10 = new F10(_io__raw_f10, this, _root);
            this.f10._read();
            this.reserved = this._io.readBytes(5);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0 }, this.reserved, this._io, "/types/header/seq/8");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.f6._fetchInstances();
            this.f7._fetchInstances();
            this.f9._fetchInstances();
            this.f10._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(this.lenPrgRom);
            this._io.writeU1(this.lenChrRom);
            final KaitaiStream _io__raw_f6 = new ByteBufferKaitaiStream(1);
            this._io.addChildStream(_io__raw_f6);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1));
                final Header _this = this;
                _io__raw_f6.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_f6 = _io__raw_f6.toByteArray();
                        if (_this._raw_f6.length != 1)
                            throw new ConsistencyError("raw(f6)", 1, _this._raw_f6.length);
                        parent.writeBytes(_this._raw_f6);
                    }
                });
            }
            this.f6._write_Seq(_io__raw_f6);
            final KaitaiStream _io__raw_f7 = new ByteBufferKaitaiStream(1);
            this._io.addChildStream(_io__raw_f7);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1));
                final Header _this = this;
                _io__raw_f7.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_f7 = _io__raw_f7.toByteArray();
                        if (_this._raw_f7.length != 1)
                            throw new ConsistencyError("raw(f7)", 1, _this._raw_f7.length);
                        parent.writeBytes(_this._raw_f7);
                    }
                });
            }
            this.f7._write_Seq(_io__raw_f7);
            this._io.writeU1(this.lenPrgRam);
            final KaitaiStream _io__raw_f9 = new ByteBufferKaitaiStream(1);
            this._io.addChildStream(_io__raw_f9);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1));
                final Header _this = this;
                _io__raw_f9.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_f9 = _io__raw_f9.toByteArray();
                        if (_this._raw_f9.length != 1)
                            throw new ConsistencyError("raw(f9)", 1, _this._raw_f9.length);
                        parent.writeBytes(_this._raw_f9);
                    }
                });
            }
            this.f9._write_Seq(_io__raw_f9);
            final KaitaiStream _io__raw_f10 = new ByteBufferKaitaiStream(1);
            this._io.addChildStream(_io__raw_f10);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (1));
                final Header _this = this;
                _io__raw_f10.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_f10 = _io__raw_f10.toByteArray();
                        if (_this._raw_f10.length != 1)
                            throw new ConsistencyError("raw(f10)", 1, _this._raw_f10.length);
                        parent.writeBytes(_this._raw_f10);
                    }
                });
            }
            this.f10._write_Seq(_io__raw_f10);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 78, 69, 83, 26 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 69, 83, 26 }, this.magic, null, "/types/header/seq/0");
            }
            if (!Objects.equals(this.f6._root(), _root()))
                throw new ConsistencyError("f6", _root(), this.f6._root());
            if (!Objects.equals(this.f6._parent(), this))
                throw new ConsistencyError("f6", this, this.f6._parent());
            if (!Objects.equals(this.f7._root(), _root()))
                throw new ConsistencyError("f7", _root(), this.f7._root());
            if (!Objects.equals(this.f7._parent(), this))
                throw new ConsistencyError("f7", this, this.f7._parent());
            if (!Objects.equals(this.f9._root(), _root()))
                throw new ConsistencyError("f9", _root(), this.f9._root());
            if (!Objects.equals(this.f9._parent(), this))
                throw new ConsistencyError("f9", this, this.f9._parent());
            if (!Objects.equals(this.f10._root(), _root()))
                throw new ConsistencyError("f10", _root(), this.f10._root());
            if (!Objects.equals(this.f10._parent(), this))
                throw new ConsistencyError("f10", this, this.f10._parent());
            if (this.reserved.length != 5)
                throw new ConsistencyError("reserved", 5, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0 }, this.reserved, null, "/types/header/seq/8");
            }
            _dirty = false;
        }

        /**
         * @see <a href="https://www.nesdev.org/wiki/INES#Flags_10">Source</a>
         */
        public static class F10 extends KaitaiStruct.ReadWrite {
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
            public F10() {
                this(null, null, null);
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
            }
            public void _read() {
                this.reserved1 = this._io.readBitsIntBe(2);
                this.busConflict = this._io.readBitsIntBe(1) != 0;
                this.prgRam = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(2);
                this.tvSystem = TvSystem.byId(this._io.readBitsIntBe(2));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(2, this.reserved1);
                this._io.writeBitsIntBe(1, (this.busConflict ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.prgRam ? 1 : 0));
                this._io.writeBitsIntBe(2, this.reserved2);
                this._io.writeBitsIntBe(2, ((Number) (this.tvSystem.id())).longValue());
            }

            public void _check() {
                _dirty = false;
            }
            private long reserved1;
            private boolean busConflict;
            private boolean prgRam;
            private long reserved2;
            private TvSystem tvSystem;
            private Ines _root;
            private Ines.Header _parent;
            public long reserved1() { return reserved1; }
            public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }

            /**
             * If 0, no bus conflicts. If 1, bus conflicts.
             */
            public boolean busConflict() { return busConflict; }
            public void setBusConflict(boolean _v) { _dirty = true; busConflict = _v; }

            /**
             * If 0, PRG ram is present. If 1, not present.
             */
            public boolean prgRam() { return prgRam; }
            public void setPrgRam(boolean _v) { _dirty = true; prgRam = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }

            /**
             * if 0, NTSC. If 2, PAL. If 1 or 3, dual compatible.
             */
            public TvSystem tvSystem() { return tvSystem; }
            public void setTvSystem(TvSystem _v) { _dirty = true; tvSystem = _v; }
            public Ines _root() { return _root; }
            public void set_root(Ines _v) { _dirty = true; _root = _v; }
            public Ines.Header _parent() { return _parent; }
            public void set_parent(Ines.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://www.nesdev.org/wiki/INES#Flags_6">Source</a>
         */
        public static class F6 extends KaitaiStruct.ReadWrite {
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
            public F6() {
                this(null, null, null);
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
            }
            public void _read() {
                this.lowerMapper = this._io.readBitsIntBe(4);
                this.fourScreen = this._io.readBitsIntBe(1) != 0;
                this.trainer = this._io.readBitsIntBe(1) != 0;
                this.hasBatteryRam = this._io.readBitsIntBe(1) != 0;
                this.mirroring = Mirroring.byId(this._io.readBitsIntBe(1));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(4, this.lowerMapper);
                this._io.writeBitsIntBe(1, (this.fourScreen ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.trainer ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hasBatteryRam ? 1 : 0));
                this._io.writeBitsIntBe(1, ((Number) (this.mirroring.id())).longValue());
            }

            public void _check() {
                _dirty = false;
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
            public void setLowerMapper(long _v) { _dirty = true; lowerMapper = _v; }

            /**
             * Ignore mirroring control or above mirroring bit; instead provide four-screen VRAM
             */
            public boolean fourScreen() { return fourScreen; }
            public void setFourScreen(boolean _v) { _dirty = true; fourScreen = _v; }

            /**
             * 512-byte trainer at $7000-$71FF (stored before PRG data)
             */
            public boolean trainer() { return trainer; }
            public void setTrainer(boolean _v) { _dirty = true; trainer = _v; }

            /**
             * If on the cartridge contains battery-backed PRG RAM ($6000-7FFF) or other persistent memory
             */
            public boolean hasBatteryRam() { return hasBatteryRam; }
            public void setHasBatteryRam(boolean _v) { _dirty = true; hasBatteryRam = _v; }

            /**
             * if 0, horizontal arrangement. if 1, vertical arrangement
             */
            public Mirroring mirroring() { return mirroring; }
            public void setMirroring(Mirroring _v) { _dirty = true; mirroring = _v; }
            public Ines _root() { return _root; }
            public void set_root(Ines _v) { _dirty = true; _root = _v; }
            public Ines.Header _parent() { return _parent; }
            public void set_parent(Ines.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://www.nesdev.org/wiki/INES#Flags_7">Source</a>
         */
        public static class F7 extends KaitaiStruct.ReadWrite {
            public static F7 fromFile(String fileName) throws IOException {
                return new F7(new ByteBufferKaitaiStream(fileName));
            }
            public F7() {
                this(null, null, null);
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
            }
            public void _read() {
                this.upperMapper = this._io.readBitsIntBe(4);
                this.format = this._io.readBitsIntBe(2);
                this.playchoice10 = this._io.readBitsIntBe(1) != 0;
                this.vsUnisystem = this._io.readBitsIntBe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(4, this.upperMapper);
                this._io.writeBitsIntBe(2, this.format);
                this._io.writeBitsIntBe(1, (this.playchoice10 ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.vsUnisystem ? 1 : 0));
            }

            public void _check() {
                _dirty = false;
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
            public void setUpperMapper(long _v) { _dirty = true; upperMapper = _v; }

            /**
             * If equal to 2, flags 8-15 are in NES 2.0 format
             */
            public long format() { return format; }
            public void setFormat(long _v) { _dirty = true; format = _v; }

            /**
             * Determines if it made for a Nintendo PlayChoice-10 or not
             */
            public boolean playchoice10() { return playchoice10; }
            public void setPlaychoice10(boolean _v) { _dirty = true; playchoice10 = _v; }

            /**
             * Determines if it is made for a Nintendo VS Unisystem or not
             */
            public boolean vsUnisystem() { return vsUnisystem; }
            public void setVsUnisystem(boolean _v) { _dirty = true; vsUnisystem = _v; }
            public Ines _root() { return _root; }
            public void set_root(Ines _v) { _dirty = true; _root = _v; }
            public Ines.Header _parent() { return _parent; }
            public void set_parent(Ines.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://www.nesdev.org/wiki/INES#Flags_9">Source</a>
         */
        public static class F9 extends KaitaiStruct.ReadWrite {
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
            public F9() {
                this(null, null, null);
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
            }
            public void _read() {
                this.reserved = this._io.readBitsIntBe(7);
                this.tvSystem = TvSystem.byId(this._io.readBitsIntBe(1));
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(7, this.reserved);
                this._io.writeBitsIntBe(1, ((Number) (this.tvSystem.id())).longValue());
            }

            public void _check() {
                _dirty = false;
            }
            private long reserved;
            private TvSystem tvSystem;
            private Ines _root;
            private Ines.Header _parent;
            public long reserved() { return reserved; }
            public void setReserved(long _v) { _dirty = true; reserved = _v; }

            /**
             * if 0, NTSC. If 1, PAL.
             */
            public TvSystem tvSystem() { return tvSystem; }
            public void setTvSystem(TvSystem _v) { _dirty = true; tvSystem = _v; }
            public Ines _root() { return _root; }
            public void set_root(Ines _v) { _dirty = true; _root = _v; }
            public Ines.Header _parent() { return _parent; }
            public void set_parent(Ines.Header _v) { _dirty = true; _parent = _v; }
        }
        private Integer mapper;

        /**
         * @see <a href="https://www.nesdev.org/wiki/Mapper">Source</a>
         */
        public Integer mapper() {
            if (this.mapper != null)
                return this.mapper;
            this.mapper = ((Number) (f6().lowerMapper() | f7().upperMapper() << 4)).intValue();
            return this.mapper;
        }
        public void _invalidateMapper() { this.mapper = null; }
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * Size of PRG ROM in 16 KB units
         */
        public int lenPrgRom() { return lenPrgRom; }
        public void setLenPrgRom(int _v) { _dirty = true; lenPrgRom = _v; }

        /**
         * Size of CHR ROM in 8 KB units (Value 0 means the board uses CHR RAM)
         */
        public int lenChrRom() { return lenChrRom; }
        public void setLenChrRom(int _v) { _dirty = true; lenChrRom = _v; }
        public F6 f6() { return f6; }
        public void setF6(F6 _v) { _dirty = true; f6 = _v; }
        public F7 f7() { return f7; }
        public void setF7(F7 _v) { _dirty = true; f7 = _v; }

        /**
         * Size of PRG RAM in 8 KB units (Value 0 infers 8 KB for compatibility; see PRG RAM circuit on nesdev.com)
         */
        public int lenPrgRam() { return lenPrgRam; }
        public void setLenPrgRam(int _v) { _dirty = true; lenPrgRam = _v; }
        public F9 f9() { return f9; }
        public void setF9(F9 _v) { _dirty = true; f9 = _v; }

        /**
         * this one is unofficial
         */
        public F10 f10() { return f10; }
        public void setF10(F10 _v) { _dirty = true; f10 = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public Ines _root() { return _root; }
        public void set_root(Ines _v) { _dirty = true; _root = _v; }
        public Ines _parent() { return _parent; }
        public void set_parent(Ines _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_f6() { return _raw_f6; }
        public void set_raw_F6(byte[] _v) { _dirty = true; _raw_f6 = _v; }
        public byte[] _raw_f7() { return _raw_f7; }
        public void set_raw_F7(byte[] _v) { _dirty = true; _raw_f7 = _v; }
        public byte[] _raw_f9() { return _raw_f9; }
        public void set_raw_F9(byte[] _v) { _dirty = true; _raw_f9 = _v; }
        public byte[] _raw_f10() { return _raw_f10; }
        public void set_raw_F10(byte[] _v) { _dirty = true; _raw_f10 = _v; }
    }

    /**
     * @see <a href="https://www.nesdev.org/wiki/PC10_ROM-Images">Source</a>
     */
    public static class Playchoice10 extends KaitaiStruct.ReadWrite {
        public static Playchoice10 fromFile(String fileName) throws IOException {
            return new Playchoice10(new ByteBufferKaitaiStream(fileName));
        }
        public Playchoice10() {
            this(null, null, null);
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
        }
        public void _read() {
            this.instRom = this._io.readBytes(8192);
            this.prom = new Prom(this._io, this, _root);
            this.prom._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.prom._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.instRom);
            this.prom._write_Seq(this._io);
        }

        public void _check() {
            if (this.instRom.length != 8192)
                throw new ConsistencyError("inst_rom", 8192, this.instRom.length);
            if (!Objects.equals(this.prom._root(), _root()))
                throw new ConsistencyError("prom", _root(), this.prom._root());
            if (!Objects.equals(this.prom._parent(), this))
                throw new ConsistencyError("prom", this, this.prom._parent());
            _dirty = false;
        }
        public static class Prom extends KaitaiStruct.ReadWrite {
            public static Prom fromFile(String fileName) throws IOException {
                return new Prom(new ByteBufferKaitaiStream(fileName));
            }
            public Prom() {
                this(null, null, null);
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
            }
            public void _read() {
                this.data = this._io.readBytes(16);
                this.counterOut = this._io.readBytes(16);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBytes(this.data);
                this._io.writeBytes(this.counterOut);
            }

            public void _check() {
                if (this.data.length != 16)
                    throw new ConsistencyError("data", 16, this.data.length);
                if (this.counterOut.length != 16)
                    throw new ConsistencyError("counter_out", 16, this.counterOut.length);
                _dirty = false;
            }
            private byte[] data;
            private byte[] counterOut;
            private Ines _root;
            private Ines.Playchoice10 _parent;
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public byte[] counterOut() { return counterOut; }
            public void setCounterOut(byte[] _v) { _dirty = true; counterOut = _v; }
            public Ines _root() { return _root; }
            public void set_root(Ines _v) { _dirty = true; _root = _v; }
            public Ines.Playchoice10 _parent() { return _parent; }
            public void set_parent(Ines.Playchoice10 _v) { _dirty = true; _parent = _v; }
        }
        private byte[] instRom;
        private Prom prom;
        private Ines _root;
        private Ines _parent;
        public byte[] instRom() { return instRom; }
        public void setInstRom(byte[] _v) { _dirty = true; instRom = _v; }
        public Prom prom() { return prom; }
        public void setProm(Prom _v) { _dirty = true; prom = _v; }
        public Ines _root() { return _root; }
        public void set_root(Ines _v) { _dirty = true; _root = _v; }
        public Ines _parent() { return _parent; }
        public void set_parent(Ines _v) { _dirty = true; _parent = _v; }
    }
    private Header header;
    private byte[] trainer;
    private byte[] prgRom;
    private byte[] chrRom;
    private Playchoice10 playchoice10;
    private String title;
    private Ines _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_header;
    public Header header() { return header; }
    public void setHeader(Header _v) { _dirty = true; header = _v; }
    public byte[] trainer() { return trainer; }
    public void setTrainer(byte[] _v) { _dirty = true; trainer = _v; }
    public byte[] prgRom() { return prgRom; }
    public void setPrgRom(byte[] _v) { _dirty = true; prgRom = _v; }
    public byte[] chrRom() { return chrRom; }
    public void setChrRom(byte[] _v) { _dirty = true; chrRom = _v; }
    public Playchoice10 playchoice10() { return playchoice10; }
    public void setPlaychoice10(Playchoice10 _v) { _dirty = true; playchoice10 = _v; }
    public String title() { return title; }
    public void setTitle(String _v) { _dirty = true; title = _v; }
    public Ines _root() { return _root; }
    public void set_root(Ines _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_header() { return _raw_header; }
    public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
}
