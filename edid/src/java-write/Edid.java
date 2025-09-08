// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.util.List;

public class Edid extends KaitaiStruct.ReadWrite {
    public static Edid fromFile(String fileName) throws IOException {
        return new Edid(new ByteBufferKaitaiStream(fileName));
    }
    public Edid() {
        this(null, null, null);
    }

    public Edid(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Edid(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Edid(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Edid _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }, this.magic, this._io, "/seq/0");
        }
        this.mfgBytes = this._io.readU2be();
        this.productCode = this._io.readU2le();
        this.serial = this._io.readU4le();
        this.mfgWeek = this._io.readU1();
        this.mfgYearMod = this._io.readU1();
        this.edidVersionMajor = this._io.readU1();
        this.edidVersionMinor = this._io.readU1();
        this.inputFlags = this._io.readU1();
        this.screenSizeH = this._io.readU1();
        this.screenSizeV = this._io.readU1();
        this.gammaMod = this._io.readU1();
        this.featuresFlags = this._io.readU1();
        this.chromacity = new ChromacityInfo(this._io, this, _root);
        this.chromacity._read();
        this.estTimings = new EstTimingsInfo(this._io, this, _root);
        this.estTimings._read();
        this._raw_stdTimings = new ArrayList<byte[]>();
        this.stdTimings = new ArrayList<StdTiming>();
        for (int i = 0; i < 8; i++) {
            this._raw_stdTimings.add(this._io.readBytes(2));
            KaitaiStream _io__raw_stdTimings = new ByteBufferKaitaiStream(this._raw_stdTimings.get(i));
            StdTiming _t_stdTimings = new StdTiming(_io__raw_stdTimings, this, _root);
            try {
                _t_stdTimings._read();
            } finally {
                this.stdTimings.add(_t_stdTimings);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.chromacity._fetchInstances();
        this.estTimings._fetchInstances();
        for (int i = 0; i < this.stdTimings.size(); i++) {
            this.stdTimings.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2be(this.mfgBytes);
        this._io.writeU2le(this.productCode);
        this._io.writeU4le(this.serial);
        this._io.writeU1(this.mfgWeek);
        this._io.writeU1(this.mfgYearMod);
        this._io.writeU1(this.edidVersionMajor);
        this._io.writeU1(this.edidVersionMinor);
        this._io.writeU1(this.inputFlags);
        this._io.writeU1(this.screenSizeH);
        this._io.writeU1(this.screenSizeV);
        this._io.writeU1(this.gammaMod);
        this._io.writeU1(this.featuresFlags);
        this.chromacity._write_Seq(this._io);
        this.estTimings._write_Seq(this._io);
        this._raw_stdTimings = new ArrayList<byte[]>();
        for (int i = 0; i < this.stdTimings.size(); i++) {
            final KaitaiStream _io__raw_stdTimings = new ByteBufferKaitaiStream(2);
            this._io.addChildStream(_io__raw_stdTimings);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (2));
                final Edid _this = this;
                final int _i = i;
                _io__raw_stdTimings.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_stdTimings.add(_io__raw_stdTimings.toByteArray());
                        if (_this._raw_stdTimings.get(((Number) (_i)).intValue()).length != 2)
                            throw new ConsistencyError("raw(std_timings)", 2, _this._raw_stdTimings.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_stdTimings.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.stdTimings.get(((Number) (i)).intValue())._write_Seq(_io__raw_stdTimings);
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, -1, -1, -1, -1, -1, -1, 0 }, this.magic, null, "/seq/0");
        }
        if (!Objects.equals(this.chromacity._root(), _root()))
            throw new ConsistencyError("chromacity", _root(), this.chromacity._root());
        if (!Objects.equals(this.chromacity._parent(), this))
            throw new ConsistencyError("chromacity", this, this.chromacity._parent());
        if (!Objects.equals(this.estTimings._root(), _root()))
            throw new ConsistencyError("est_timings", _root(), this.estTimings._root());
        if (!Objects.equals(this.estTimings._parent(), this))
            throw new ConsistencyError("est_timings", this, this.estTimings._parent());
        if (this.stdTimings.size() != 8)
            throw new ConsistencyError("std_timings", 8, this.stdTimings.size());
        for (int i = 0; i < this.stdTimings.size(); i++) {
            if (!Objects.equals(this.stdTimings.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("std_timings", _root(), this.stdTimings.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.stdTimings.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("std_timings", this, this.stdTimings.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Chromaticity information: colorimetry and white point
     * coordinates. All coordinates are stored as fixed precision
     * 10-bit numbers, bits are shuffled for compactness.
     */
    public static class ChromacityInfo extends KaitaiStruct.ReadWrite {
        public static ChromacityInfo fromFile(String fileName) throws IOException {
            return new ChromacityInfo(new ByteBufferKaitaiStream(fileName));
        }
        public ChromacityInfo() {
            this(null, null, null);
        }

        public ChromacityInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChromacityInfo(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public ChromacityInfo(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.redX10 = this._io.readBitsIntBe(2);
            this.redY10 = this._io.readBitsIntBe(2);
            this.greenX10 = this._io.readBitsIntBe(2);
            this.greenY10 = this._io.readBitsIntBe(2);
            this.blueX10 = this._io.readBitsIntBe(2);
            this.blueY10 = this._io.readBitsIntBe(2);
            this.whiteX10 = this._io.readBitsIntBe(2);
            this.whiteY10 = this._io.readBitsIntBe(2);
            this.redX92 = this._io.readU1();
            this.redY92 = this._io.readU1();
            this.greenX92 = this._io.readU1();
            this.greenY92 = this._io.readU1();
            this.blueX92 = this._io.readU1();
            this.blueY92 = this._io.readU1();
            this.whiteX92 = this._io.readU1();
            this.whiteY92 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(2, this.redX10);
            this._io.writeBitsIntBe(2, this.redY10);
            this._io.writeBitsIntBe(2, this.greenX10);
            this._io.writeBitsIntBe(2, this.greenY10);
            this._io.writeBitsIntBe(2, this.blueX10);
            this._io.writeBitsIntBe(2, this.blueY10);
            this._io.writeBitsIntBe(2, this.whiteX10);
            this._io.writeBitsIntBe(2, this.whiteY10);
            this._io.writeU1(this.redX92);
            this._io.writeU1(this.redY92);
            this._io.writeU1(this.greenX92);
            this._io.writeU1(this.greenY92);
            this._io.writeU1(this.blueX92);
            this._io.writeU1(this.blueY92);
            this._io.writeU1(this.whiteX92);
            this._io.writeU1(this.whiteY92);
        }

        public void _check() {
            _dirty = false;
        }
        private Double blueX;

        /**
         * Blue X coordinate
         */
        public Double blueX() {
            if (this.blueX != null)
                return this.blueX;
            this.blueX = ((Number) (blueXInt() / 1024.0)).doubleValue();
            return this.blueX;
        }
        public void _invalidateBlueX() { this.blueX = null; }
        private Integer blueXInt;
        public Integer blueXInt() {
            if (this.blueXInt != null)
                return this.blueXInt;
            this.blueXInt = ((Number) (blueX92() << 2 | blueX10())).intValue();
            return this.blueXInt;
        }
        public void _invalidateBlueXInt() { this.blueXInt = null; }
        private Double blueY;

        /**
         * Blue Y coordinate
         */
        public Double blueY() {
            if (this.blueY != null)
                return this.blueY;
            this.blueY = ((Number) (blueYInt() / 1024.0)).doubleValue();
            return this.blueY;
        }
        public void _invalidateBlueY() { this.blueY = null; }
        private Integer blueYInt;
        public Integer blueYInt() {
            if (this.blueYInt != null)
                return this.blueYInt;
            this.blueYInt = ((Number) (blueY92() << 2 | blueY10())).intValue();
            return this.blueYInt;
        }
        public void _invalidateBlueYInt() { this.blueYInt = null; }
        private Double greenX;

        /**
         * Green X coordinate
         */
        public Double greenX() {
            if (this.greenX != null)
                return this.greenX;
            this.greenX = ((Number) (greenXInt() / 1024.0)).doubleValue();
            return this.greenX;
        }
        public void _invalidateGreenX() { this.greenX = null; }
        private Integer greenXInt;
        public Integer greenXInt() {
            if (this.greenXInt != null)
                return this.greenXInt;
            this.greenXInt = ((Number) (greenX92() << 2 | greenX10())).intValue();
            return this.greenXInt;
        }
        public void _invalidateGreenXInt() { this.greenXInt = null; }
        private Double greenY;

        /**
         * Green Y coordinate
         */
        public Double greenY() {
            if (this.greenY != null)
                return this.greenY;
            this.greenY = ((Number) (greenYInt() / 1024.0)).doubleValue();
            return this.greenY;
        }
        public void _invalidateGreenY() { this.greenY = null; }
        private Integer greenYInt;
        public Integer greenYInt() {
            if (this.greenYInt != null)
                return this.greenYInt;
            this.greenYInt = ((Number) (greenY92() << 2 | greenY10())).intValue();
            return this.greenYInt;
        }
        public void _invalidateGreenYInt() { this.greenYInt = null; }
        private Double redX;

        /**
         * Red X coordinate
         */
        public Double redX() {
            if (this.redX != null)
                return this.redX;
            this.redX = ((Number) (redXInt() / 1024.0)).doubleValue();
            return this.redX;
        }
        public void _invalidateRedX() { this.redX = null; }
        private Integer redXInt;
        public Integer redXInt() {
            if (this.redXInt != null)
                return this.redXInt;
            this.redXInt = ((Number) (redX92() << 2 | redX10())).intValue();
            return this.redXInt;
        }
        public void _invalidateRedXInt() { this.redXInt = null; }
        private Double redY;

        /**
         * Red Y coordinate
         */
        public Double redY() {
            if (this.redY != null)
                return this.redY;
            this.redY = ((Number) (redYInt() / 1024.0)).doubleValue();
            return this.redY;
        }
        public void _invalidateRedY() { this.redY = null; }
        private Integer redYInt;
        public Integer redYInt() {
            if (this.redYInt != null)
                return this.redYInt;
            this.redYInt = ((Number) (redY92() << 2 | redY10())).intValue();
            return this.redYInt;
        }
        public void _invalidateRedYInt() { this.redYInt = null; }
        private Double whiteX;

        /**
         * White X coordinate
         */
        public Double whiteX() {
            if (this.whiteX != null)
                return this.whiteX;
            this.whiteX = ((Number) (whiteXInt() / 1024.0)).doubleValue();
            return this.whiteX;
        }
        public void _invalidateWhiteX() { this.whiteX = null; }
        private Integer whiteXInt;
        public Integer whiteXInt() {
            if (this.whiteXInt != null)
                return this.whiteXInt;
            this.whiteXInt = ((Number) (whiteX92() << 2 | whiteX10())).intValue();
            return this.whiteXInt;
        }
        public void _invalidateWhiteXInt() { this.whiteXInt = null; }
        private Double whiteY;

        /**
         * White Y coordinate
         */
        public Double whiteY() {
            if (this.whiteY != null)
                return this.whiteY;
            this.whiteY = ((Number) (whiteYInt() / 1024.0)).doubleValue();
            return this.whiteY;
        }
        public void _invalidateWhiteY() { this.whiteY = null; }
        private Integer whiteYInt;
        public Integer whiteYInt() {
            if (this.whiteYInt != null)
                return this.whiteYInt;
            this.whiteYInt = ((Number) (whiteY92() << 2 | whiteY10())).intValue();
            return this.whiteYInt;
        }
        public void _invalidateWhiteYInt() { this.whiteYInt = null; }
        private long redX10;
        private long redY10;
        private long greenX10;
        private long greenY10;
        private long blueX10;
        private long blueY10;
        private long whiteX10;
        private long whiteY10;
        private int redX92;
        private int redY92;
        private int greenX92;
        private int greenY92;
        private int blueX92;
        private int blueY92;
        private int whiteX92;
        private int whiteY92;
        private Edid _root;
        private Edid _parent;

        /**
         * Red X, bits 1..0
         */
        public long redX10() { return redX10; }
        public void setRedX10(long _v) { _dirty = true; redX10 = _v; }

        /**
         * Red Y, bits 1..0
         */
        public long redY10() { return redY10; }
        public void setRedY10(long _v) { _dirty = true; redY10 = _v; }

        /**
         * Green X, bits 1..0
         */
        public long greenX10() { return greenX10; }
        public void setGreenX10(long _v) { _dirty = true; greenX10 = _v; }

        /**
         * Green Y, bits 1..0
         */
        public long greenY10() { return greenY10; }
        public void setGreenY10(long _v) { _dirty = true; greenY10 = _v; }

        /**
         * Blue X, bits 1..0
         */
        public long blueX10() { return blueX10; }
        public void setBlueX10(long _v) { _dirty = true; blueX10 = _v; }

        /**
         * Blue Y, bits 1..0
         */
        public long blueY10() { return blueY10; }
        public void setBlueY10(long _v) { _dirty = true; blueY10 = _v; }

        /**
         * White X, bits 1..0
         */
        public long whiteX10() { return whiteX10; }
        public void setWhiteX10(long _v) { _dirty = true; whiteX10 = _v; }

        /**
         * White Y, bits 1..0
         */
        public long whiteY10() { return whiteY10; }
        public void setWhiteY10(long _v) { _dirty = true; whiteY10 = _v; }

        /**
         * Red X, bits 9..2
         */
        public int redX92() { return redX92; }
        public void setRedX92(int _v) { _dirty = true; redX92 = _v; }

        /**
         * Red Y, bits 9..2
         */
        public int redY92() { return redY92; }
        public void setRedY92(int _v) { _dirty = true; redY92 = _v; }

        /**
         * Green X, bits 9..2
         */
        public int greenX92() { return greenX92; }
        public void setGreenX92(int _v) { _dirty = true; greenX92 = _v; }

        /**
         * Green Y, bits 9..2
         */
        public int greenY92() { return greenY92; }
        public void setGreenY92(int _v) { _dirty = true; greenY92 = _v; }

        /**
         * Blue X, bits 9..2
         */
        public int blueX92() { return blueX92; }
        public void setBlueX92(int _v) { _dirty = true; blueX92 = _v; }

        /**
         * Blue Y, bits 9..2
         */
        public int blueY92() { return blueY92; }
        public void setBlueY92(int _v) { _dirty = true; blueY92 = _v; }

        /**
         * White X, bits 9..2
         */
        public int whiteX92() { return whiteX92; }
        public void setWhiteX92(int _v) { _dirty = true; whiteX92 = _v; }

        /**
         * White Y, bits 9..2
         */
        public int whiteY92() { return whiteY92; }
        public void setWhiteY92(int _v) { _dirty = true; whiteY92 = _v; }
        public Edid _root() { return _root; }
        public void set_root(Edid _v) { _dirty = true; _root = _v; }
        public Edid _parent() { return _parent; }
        public void set_parent(Edid _v) { _dirty = true; _parent = _v; }
    }
    public static class EstTimingsInfo extends KaitaiStruct.ReadWrite {
        public static EstTimingsInfo fromFile(String fileName) throws IOException {
            return new EstTimingsInfo(new ByteBufferKaitaiStream(fileName));
        }
        public EstTimingsInfo() {
            this(null, null, null);
        }

        public EstTimingsInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public EstTimingsInfo(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public EstTimingsInfo(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.can720x400px70hz = this._io.readBitsIntBe(1) != 0;
            this.can720x400px88hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px60hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px67hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px72hz = this._io.readBitsIntBe(1) != 0;
            this.can640x480px75hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px56hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px60hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px72hz = this._io.readBitsIntBe(1) != 0;
            this.can800x600px75hz = this._io.readBitsIntBe(1) != 0;
            this.can832x624px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px87hzI = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px60hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px70hz = this._io.readBitsIntBe(1) != 0;
            this.can1024x768px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1280x1024px75hz = this._io.readBitsIntBe(1) != 0;
            this.can1152x870px75hz = this._io.readBitsIntBe(1) != 0;
            this.reserved = this._io.readBitsIntBe(7);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.can720x400px70hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can720x400px88hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can640x480px60hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can640x480px67hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can640x480px72hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can640x480px75hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can800x600px56hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can800x600px60hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can800x600px72hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can800x600px75hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can832x624px75hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1024x768px87hzI ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1024x768px60hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1024x768px70hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1024x768px75hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1280x1024px75hz ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.can1152x870px75hz ? 1 : 0));
            this._io.writeBitsIntBe(7, this.reserved);
        }

        public void _check() {
            _dirty = false;
        }
        private boolean can720x400px70hz;
        private boolean can720x400px88hz;
        private boolean can640x480px60hz;
        private boolean can640x480px67hz;
        private boolean can640x480px72hz;
        private boolean can640x480px75hz;
        private boolean can800x600px56hz;
        private boolean can800x600px60hz;
        private boolean can800x600px72hz;
        private boolean can800x600px75hz;
        private boolean can832x624px75hz;
        private boolean can1024x768px87hzI;
        private boolean can1024x768px60hz;
        private boolean can1024x768px70hz;
        private boolean can1024x768px75hz;
        private boolean can1280x1024px75hz;
        private boolean can1152x870px75hz;
        private long reserved;
        private Edid _root;
        private Edid _parent;

        /**
         * Supports 720 x 400 @ 70Hz
         */
        public boolean can720x400px70hz() { return can720x400px70hz; }
        public void setCan720x400px70hz(boolean _v) { _dirty = true; can720x400px70hz = _v; }

        /**
         * Supports 720 x 400 @ 88Hz
         */
        public boolean can720x400px88hz() { return can720x400px88hz; }
        public void setCan720x400px88hz(boolean _v) { _dirty = true; can720x400px88hz = _v; }

        /**
         * Supports 640 x 480 @ 60Hz
         */
        public boolean can640x480px60hz() { return can640x480px60hz; }
        public void setCan640x480px60hz(boolean _v) { _dirty = true; can640x480px60hz = _v; }

        /**
         * Supports 640 x 480 @ 67Hz
         */
        public boolean can640x480px67hz() { return can640x480px67hz; }
        public void setCan640x480px67hz(boolean _v) { _dirty = true; can640x480px67hz = _v; }

        /**
         * Supports 640 x 480 @ 72Hz
         */
        public boolean can640x480px72hz() { return can640x480px72hz; }
        public void setCan640x480px72hz(boolean _v) { _dirty = true; can640x480px72hz = _v; }

        /**
         * Supports 640 x 480 @ 75Hz
         */
        public boolean can640x480px75hz() { return can640x480px75hz; }
        public void setCan640x480px75hz(boolean _v) { _dirty = true; can640x480px75hz = _v; }

        /**
         * Supports 800 x 600 @ 56Hz
         */
        public boolean can800x600px56hz() { return can800x600px56hz; }
        public void setCan800x600px56hz(boolean _v) { _dirty = true; can800x600px56hz = _v; }

        /**
         * Supports 800 x 600 @ 60Hz
         */
        public boolean can800x600px60hz() { return can800x600px60hz; }
        public void setCan800x600px60hz(boolean _v) { _dirty = true; can800x600px60hz = _v; }

        /**
         * Supports 800 x 600 @ 72Hz
         */
        public boolean can800x600px72hz() { return can800x600px72hz; }
        public void setCan800x600px72hz(boolean _v) { _dirty = true; can800x600px72hz = _v; }

        /**
         * Supports 800 x 600 @ 75Hz
         */
        public boolean can800x600px75hz() { return can800x600px75hz; }
        public void setCan800x600px75hz(boolean _v) { _dirty = true; can800x600px75hz = _v; }

        /**
         * Supports 832 x 624 @ 75Hz
         */
        public boolean can832x624px75hz() { return can832x624px75hz; }
        public void setCan832x624px75hz(boolean _v) { _dirty = true; can832x624px75hz = _v; }

        /**
         * Supports 1024 x 768 @ 87Hz(I)
         */
        public boolean can1024x768px87hzI() { return can1024x768px87hzI; }
        public void setCan1024x768px87hzI(boolean _v) { _dirty = true; can1024x768px87hzI = _v; }

        /**
         * Supports 1024 x 768 @ 60Hz
         */
        public boolean can1024x768px60hz() { return can1024x768px60hz; }
        public void setCan1024x768px60hz(boolean _v) { _dirty = true; can1024x768px60hz = _v; }

        /**
         * Supports 1024 x 768 @ 70Hz
         */
        public boolean can1024x768px70hz() { return can1024x768px70hz; }
        public void setCan1024x768px70hz(boolean _v) { _dirty = true; can1024x768px70hz = _v; }

        /**
         * Supports 1024 x 768 @ 75Hz
         */
        public boolean can1024x768px75hz() { return can1024x768px75hz; }
        public void setCan1024x768px75hz(boolean _v) { _dirty = true; can1024x768px75hz = _v; }

        /**
         * Supports 1280 x 1024 @ 75Hz
         */
        public boolean can1280x1024px75hz() { return can1280x1024px75hz; }
        public void setCan1280x1024px75hz(boolean _v) { _dirty = true; can1280x1024px75hz = _v; }

        /**
         * Supports 1152 x 870 @ 75Hz
         */
        public boolean can1152x870px75hz() { return can1152x870px75hz; }
        public void setCan1152x870px75hz(boolean _v) { _dirty = true; can1152x870px75hz = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public Edid _root() { return _root; }
        public void set_root(Edid _v) { _dirty = true; _root = _v; }
        public Edid _parent() { return _parent; }
        public void set_parent(Edid _v) { _dirty = true; _parent = _v; }
    }
    public static class StdTiming extends KaitaiStruct.ReadWrite {
        public static StdTiming fromFile(String fileName) throws IOException {
            return new StdTiming(new ByteBufferKaitaiStream(fileName));
        }

        public enum AspectRatios {
            RATIO_16_10(0),
            RATIO_4_3(1),
            RATIO_5_4(2),
            RATIO_16_9(3);

            private final long id;
            AspectRatios(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, AspectRatios> byId = new HashMap<Long, AspectRatios>(4);
            static {
                for (AspectRatios e : AspectRatios.values())
                    byId.put(e.id(), e);
            }
            public static AspectRatios byId(long id) { return byId.get(id); }
        }
        public StdTiming() {
            this(null, null, null);
        }

        public StdTiming(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StdTiming(KaitaiStream _io, Edid _parent) {
            this(_io, _parent, null);
        }

        public StdTiming(KaitaiStream _io, Edid _parent, Edid _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.horizActivePixelsMod = this._io.readU1();
            this.aspectRatio = AspectRatios.byId(this._io.readBitsIntBe(2));
            this.refreshRateMod = this._io.readBitsIntBe(6);
            _dirty = false;
        }

        public void _fetchInstances() {
            bytesLookahead();
            if (this.bytesLookahead != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBytesLookahead = _enabledBytesLookahead;
            this._io.writeU1(this.horizActivePixelsMod);
            this._io.writeBitsIntBe(2, ((Number) (this.aspectRatio.id())).longValue());
            this._io.writeBitsIntBe(6, this.refreshRateMod);
        }

        public void _check() {
            if (_enabledBytesLookahead) {
                if (this.bytesLookahead.length != 2)
                    throw new ConsistencyError("bytes_lookahead", 2, this.bytesLookahead.length);
            }
            _dirty = false;
        }
        private byte[] bytesLookahead;
        private boolean _shouldWriteBytesLookahead = false;
        private boolean _enabledBytesLookahead = true;
        public byte[] bytesLookahead() {
            if (_shouldWriteBytesLookahead)
                _writeBytesLookahead();
            if (this.bytesLookahead != null)
                return this.bytesLookahead;
            if (!_enabledBytesLookahead)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.bytesLookahead = this._io.readBytes(2);
            this._io.seek(_pos);
            return this.bytesLookahead;
        }
        public void setBytesLookahead(byte[] _v) { _dirty = true; bytesLookahead = _v; }
        public void setBytesLookahead_Enabled(boolean _v) { _dirty = true; _enabledBytesLookahead = _v; }

        private void _writeBytesLookahead() {
            _shouldWriteBytesLookahead = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this._io.writeBytes(this.bytesLookahead);
            this._io.seek(_pos);
        }
        private Integer horizActivePixels;

        /**
         * Range of horizontal active pixels.
         */
        public Integer horizActivePixels() {
            if (this.horizActivePixels != null)
                return this.horizActivePixels;
            if (isUsed()) {
                this.horizActivePixels = ((Number) ((horizActivePixelsMod() + 31) * 8)).intValue();
            }
            return this.horizActivePixels;
        }
        public void _invalidateHorizActivePixels() { this.horizActivePixels = null; }
        private Boolean isUsed;
        public Boolean isUsed() {
            if (this.isUsed != null)
                return this.isUsed;
            this.isUsed = !Arrays.equals(bytesLookahead(), new byte[] { 1, 1 });
            return this.isUsed;
        }
        public void _invalidateIsUsed() { this.isUsed = null; }
        private Integer refreshRate;

        /**
         * Vertical refresh rate, Hz.
         */
        public Integer refreshRate() {
            if (this.refreshRate != null)
                return this.refreshRate;
            if (isUsed()) {
                this.refreshRate = ((Number) (refreshRateMod() + 60)).intValue();
            }
            return this.refreshRate;
        }
        public void _invalidateRefreshRate() { this.refreshRate = null; }
        private int horizActivePixelsMod;
        private AspectRatios aspectRatio;
        private long refreshRateMod;
        private Edid _root;
        private Edid _parent;

        /**
         * Range of horizontal active pixels, written in modified form:
         * `(horiz_active_pixels / 8) - 31`. This yields an effective
         * range of 256..2288, with steps of 8 pixels.
         */
        public int horizActivePixelsMod() { return horizActivePixelsMod; }
        public void setHorizActivePixelsMod(int _v) { _dirty = true; horizActivePixelsMod = _v; }

        /**
         * Aspect ratio of the image. Can be used to calculate number
         * of vertical pixels.
         */
        public AspectRatios aspectRatio() { return aspectRatio; }
        public void setAspectRatio(AspectRatios _v) { _dirty = true; aspectRatio = _v; }

        /**
         * Refresh rate in Hz, written in modified form: `refresh_rate
         * - 60`. This yields an effective range of 60..123 Hz.
         */
        public long refreshRateMod() { return refreshRateMod; }
        public void setRefreshRateMod(long _v) { _dirty = true; refreshRateMod = _v; }
        public Edid _root() { return _root; }
        public void set_root(Edid _v) { _dirty = true; _root = _v; }
        public Edid _parent() { return _parent; }
        public void set_parent(Edid _v) { _dirty = true; _parent = _v; }
    }
    private Double gamma;
    public Double gamma() {
        if (this.gamma != null)
            return this.gamma;
        if (gammaMod() != 255) {
            this.gamma = ((Number) ((gammaMod() + 100) / 100.0)).doubleValue();
        }
        return this.gamma;
    }
    public void _invalidateGamma() { this.gamma = null; }
    private Integer mfgIdCh1;
    public Integer mfgIdCh1() {
        if (this.mfgIdCh1 != null)
            return this.mfgIdCh1;
        this.mfgIdCh1 = ((Number) ((mfgBytes() & 31744) >> 10)).intValue();
        return this.mfgIdCh1;
    }
    public void _invalidateMfgIdCh1() { this.mfgIdCh1 = null; }
    private Integer mfgIdCh2;
    public Integer mfgIdCh2() {
        if (this.mfgIdCh2 != null)
            return this.mfgIdCh2;
        this.mfgIdCh2 = ((Number) ((mfgBytes() & 992) >> 5)).intValue();
        return this.mfgIdCh2;
    }
    public void _invalidateMfgIdCh2() { this.mfgIdCh2 = null; }
    private Integer mfgIdCh3;
    public Integer mfgIdCh3() {
        if (this.mfgIdCh3 != null)
            return this.mfgIdCh3;
        this.mfgIdCh3 = ((Number) (mfgBytes() & 31)).intValue();
        return this.mfgIdCh3;
    }
    public void _invalidateMfgIdCh3() { this.mfgIdCh3 = null; }
    private String mfgStr;
    public String mfgStr() {
        if (this.mfgStr != null)
            return this.mfgStr;
        this.mfgStr = new String(new byte[] { mfgIdCh1() + 64, mfgIdCh2() + 64, mfgIdCh3() + 64 }, StandardCharsets.US_ASCII);
        return this.mfgStr;
    }
    public void _invalidateMfgStr() { this.mfgStr = null; }
    private Integer mfgYear;
    public Integer mfgYear() {
        if (this.mfgYear != null)
            return this.mfgYear;
        this.mfgYear = ((Number) (mfgYearMod() + 1990)).intValue();
        return this.mfgYear;
    }
    public void _invalidateMfgYear() { this.mfgYear = null; }
    private byte[] magic;
    private int mfgBytes;
    private int productCode;
    private long serial;
    private int mfgWeek;
    private int mfgYearMod;
    private int edidVersionMajor;
    private int edidVersionMinor;
    private int inputFlags;
    private int screenSizeH;
    private int screenSizeV;
    private int gammaMod;
    private int featuresFlags;
    private ChromacityInfo chromacity;
    private EstTimingsInfo estTimings;
    private List<StdTiming> stdTimings;
    private Edid _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_stdTimings;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public int mfgBytes() { return mfgBytes; }
    public void setMfgBytes(int _v) { _dirty = true; mfgBytes = _v; }

    /**
     * Manufacturer product code
     */
    public int productCode() { return productCode; }
    public void setProductCode(int _v) { _dirty = true; productCode = _v; }

    /**
     * Serial number
     */
    public long serial() { return serial; }
    public void setSerial(long _v) { _dirty = true; serial = _v; }

    /**
     * Week of manufacture. Week numbering is not consistent between manufacturers.
     */
    public int mfgWeek() { return mfgWeek; }
    public void setMfgWeek(int _v) { _dirty = true; mfgWeek = _v; }

    /**
     * Year of manufacture, less 1990. (1990-2245). If week=255, it is the model year instead.
     */
    public int mfgYearMod() { return mfgYearMod; }
    public void setMfgYearMod(int _v) { _dirty = true; mfgYearMod = _v; }

    /**
     * EDID version, usually 1 (for 1.3)
     */
    public int edidVersionMajor() { return edidVersionMajor; }
    public void setEdidVersionMajor(int _v) { _dirty = true; edidVersionMajor = _v; }

    /**
     * EDID revision, usually 3 (for 1.3)
     */
    public int edidVersionMinor() { return edidVersionMinor; }
    public void setEdidVersionMinor(int _v) { _dirty = true; edidVersionMinor = _v; }
    public int inputFlags() { return inputFlags; }
    public void setInputFlags(int _v) { _dirty = true; inputFlags = _v; }

    /**
     * Maximum horizontal image size, in centimetres (max 292 cm/115 in at 16:9 aspect ratio)
     */
    public int screenSizeH() { return screenSizeH; }
    public void setScreenSizeH(int _v) { _dirty = true; screenSizeH = _v; }

    /**
     * Maximum vertical image size, in centimetres. If either byte is 0, undefined (e.g. projector)
     */
    public int screenSizeV() { return screenSizeV; }
    public void setScreenSizeV(int _v) { _dirty = true; screenSizeV = _v; }

    /**
     * Display gamma, datavalue = (gamma*100)-100 (range 1.00-3.54)
     */
    public int gammaMod() { return gammaMod; }
    public void setGammaMod(int _v) { _dirty = true; gammaMod = _v; }
    public int featuresFlags() { return featuresFlags; }
    public void setFeaturesFlags(int _v) { _dirty = true; featuresFlags = _v; }

    /**
     * Phosphor or filter chromaticity structure, which provides info on colorimetry and white point
     * @see "Standard, section 3.7"
     */
    public ChromacityInfo chromacity() { return chromacity; }
    public void setChromacity(ChromacityInfo _v) { _dirty = true; chromacity = _v; }

    /**
     * Block of bit flags that indicates support of so called
     * "established timings", which is a commonly used subset of VESA
     * DMT (Discrete Monitor Timings) modes.
     * @see "Standard, section 3.8"
     */
    public EstTimingsInfo estTimings() { return estTimings; }
    public void setEstTimings(EstTimingsInfo _v) { _dirty = true; estTimings = _v; }

    /**
     * Array of descriptions of so called "standard timings", which are
     * used to specify up to 8 additional timings not included in
     * "established timings".
     */
    public List<StdTiming> stdTimings() { return stdTimings; }
    public void setStdTimings(List<StdTiming> _v) { _dirty = true; stdTimings = _v; }
    public Edid _root() { return _root; }
    public void set_root(Edid _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_stdTimings() { return _raw_stdTimings; }
    public void set_raw_StdTimings(List<byte[]> _v) { _dirty = true; _raw_stdTimings = _v; }
}
