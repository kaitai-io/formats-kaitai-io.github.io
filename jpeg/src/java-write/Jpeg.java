// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * JPEG File Interchange Format, or JFIF, or, more colloquially known
 * as just "JPEG" or "JPG", is a popular 2D bitmap image file format,
 * offering lossy compression which works reasonably well with
 * photographic images.
 * 
 * Format is organized as a container format, serving multiple
 * "segments", each starting with a magic and a marker. JFIF standard
 * dictates order and mandatory apperance of segments:
 * 
 * * SOI
 * * APP0 (with JFIF magic)
 * * APP0 (with JFXX magic, optional)
 * * everything else
 * * SOS
 * * JPEG-compressed stream
 * * EOI
 */
public class Jpeg extends KaitaiStruct.ReadWrite {
    public static Jpeg fromFile(String fileName) throws IOException {
        return new Jpeg(new ByteBufferKaitaiStream(fileName));
    }

    public enum ComponentId {
        Y(1),
        CB(2),
        CR(3),
        I(4),
        Q(5);

        private final long id;
        ComponentId(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ComponentId> byId = new HashMap<Long, ComponentId>(5);
        static {
            for (ComponentId e : ComponentId.values())
                byId.put(e.id(), e);
        }
        public static ComponentId byId(long id) { return byId.get(id); }
    }
    public Jpeg() {
        this(null, null, null);
    }

    public Jpeg(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Jpeg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Jpeg(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Jpeg _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.segments = new ArrayList<Segment>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Segment _t_segments = new Segment(this._io, this, _root);
                try {
                    _t_segments._read();
                } finally {
                    this.segments.add(_t_segments);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.segments.size(); i++) {
            this.segments.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.segments.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("segments", 0, this._io.size() - this._io.pos());
            this.segments.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("segments", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.segments.size(); i++) {
            if (!Objects.equals(this.segments.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("segments", _root(), this.segments.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.segments.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("segments", this, this.segments.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class ExifInJpeg extends KaitaiStruct.ReadWrite {
        public static ExifInJpeg fromFile(String fileName) throws IOException {
            return new ExifInJpeg(new ByteBufferKaitaiStream(fileName));
        }
        public ExifInJpeg() {
            this(null, null, null);
        }

        public ExifInJpeg(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExifInJpeg(KaitaiStream _io, Jpeg.SegmentApp1 _parent) {
            this(_io, _parent, null);
        }

        public ExifInJpeg(KaitaiStream _io, Jpeg.SegmentApp1 _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.extraZero = this._io.readBytes(1);
            if (!(Arrays.equals(this.extraZero, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.extraZero, this._io, "/types/exif_in_jpeg/seq/0");
            }
            this._raw_data = this._io.readBytesFull();
            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
            this.data = new Exif(_io__raw_data);
            this.data._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.data._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.extraZero);
            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
            this._io.addChildStream(_io__raw_data);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
                final ExifInJpeg _this = this;
                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_data = _io__raw_data.toByteArray();
                        parent.writeBytes(_this._raw_data);
                        if (!(parent.isEof()))
                            throw new ConsistencyError("raw(data)", 0, parent.size() - parent.pos());
                    }
                });
            }
            this.data._write_Seq(_io__raw_data);
        }

        public void _check() {
            if (this.extraZero.length != 1)
                throw new ConsistencyError("extra_zero", 1, this.extraZero.length);
            if (!(Arrays.equals(this.extraZero, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.extraZero, null, "/types/exif_in_jpeg/seq/0");
            }
            _dirty = false;
        }
        private byte[] extraZero;
        private Exif data;
        private Jpeg _root;
        private Jpeg.SegmentApp1 _parent;
        private byte[] _raw_data;
        public byte[] extraZero() { return extraZero; }
        public void setExtraZero(byte[] _v) { _dirty = true; extraZero = _v; }
        public Exif data() { return data; }
        public void setData(Exif _v) { _dirty = true; data = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg.SegmentApp1 _parent() { return _parent; }
        public void set_parent(Jpeg.SegmentApp1 _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class Segment extends KaitaiStruct.ReadWrite {
        public static Segment fromFile(String fileName) throws IOException {
            return new Segment(new ByteBufferKaitaiStream(fileName));
        }

        public enum MarkerEnum {
            TEM(1),
            SOF0(192),
            SOF1(193),
            SOF2(194),
            SOF3(195),
            DHT(196),
            SOF5(197),
            SOF6(198),
            SOF7(199),
            SOI(216),
            EOI(217),
            SOS(218),
            DQT(219),
            DNL(220),
            DRI(221),
            DHP(222),
            APP0(224),
            APP1(225),
            APP2(226),
            APP3(227),
            APP4(228),
            APP5(229),
            APP6(230),
            APP7(231),
            APP8(232),
            APP9(233),
            APP10(234),
            APP11(235),
            APP12(236),
            APP13(237),
            APP14(238),
            APP15(239),
            COM(254);

            private final long id;
            MarkerEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MarkerEnum> byId = new HashMap<Long, MarkerEnum>(33);
            static {
                for (MarkerEnum e : MarkerEnum.values())
                    byId.put(e.id(), e);
            }
            public static MarkerEnum byId(long id) { return byId.get(id); }
        }
        public Segment() {
            this(null, null, null);
        }

        public Segment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Segment(KaitaiStream _io, Jpeg _parent) {
            this(_io, _parent, null);
        }

        public Segment(KaitaiStream _io, Jpeg _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(1);
            if (!(Arrays.equals(this.magic, new byte[] { -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1 }, this.magic, this._io, "/types/segment/seq/0");
            }
            this.marker = MarkerEnum.byId(this._io.readU1());
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                this.length = this._io.readU2be();
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                {
                    MarkerEnum on = marker();
                    if (on != null) {
                        switch (marker()) {
                        case APP0: {
                            this._raw_data = this._io.readBytes(length() - 2);
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                            this.data = new SegmentApp0(_io__raw_data, this, _root);
                            ((SegmentApp0) (this.data))._read();
                            break;
                        }
                        case APP1: {
                            this._raw_data = this._io.readBytes(length() - 2);
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                            this.data = new SegmentApp1(_io__raw_data, this, _root);
                            ((SegmentApp1) (this.data))._read();
                            break;
                        }
                        case SOF0: {
                            this._raw_data = this._io.readBytes(length() - 2);
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                            this.data = new SegmentSof0(_io__raw_data, this, _root);
                            ((SegmentSof0) (this.data))._read();
                            break;
                        }
                        case SOS: {
                            this._raw_data = this._io.readBytes(length() - 2);
                            KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                            this.data = new SegmentSos(_io__raw_data, this, _root);
                            ((SegmentSos) (this.data))._read();
                            break;
                        }
                        default: {
                            this.data = this._io.readBytes(length() - 2);
                            break;
                        }
                        }
                    } else {
                        this.data = this._io.readBytes(length() - 2);
                    }
                }
            }
            if (marker() == MarkerEnum.SOS) {
                this.imageData = this._io.readBytesFull();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                {
                    MarkerEnum on = marker();
                    if (on != null) {
                        switch (marker()) {
                        case APP0: {
                            ((SegmentApp0) (this.data))._fetchInstances();
                            break;
                        }
                        case APP1: {
                            ((SegmentApp1) (this.data))._fetchInstances();
                            break;
                        }
                        case SOF0: {
                            ((SegmentSof0) (this.data))._fetchInstances();
                            break;
                        }
                        case SOS: {
                            ((SegmentSos) (this.data))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
            }
            if (marker() == MarkerEnum.SOS) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU1(((Number) (this.marker.id())).intValue());
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                this._io.writeU2be(this.length);
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                {
                    MarkerEnum on = marker();
                    if (on != null) {
                        switch (marker()) {
                        case APP0: {
                            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(length() - 2);
                            this._io.addChildStream(_io__raw_data);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 2));
                                final Segment _this = this;
                                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_data = _io__raw_data.toByteArray();
                                        if (((byte[]) (_this._raw_data)).length != length() - 2)
                                            throw new ConsistencyError("raw(data)", length() - 2, ((byte[]) (_this._raw_data)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                    }
                                });
                            }
                            ((SegmentApp0) (this.data))._write_Seq(_io__raw_data);
                            break;
                        }
                        case APP1: {
                            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(length() - 2);
                            this._io.addChildStream(_io__raw_data);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 2));
                                final Segment _this = this;
                                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_data = _io__raw_data.toByteArray();
                                        if (((byte[]) (_this._raw_data)).length != length() - 2)
                                            throw new ConsistencyError("raw(data)", length() - 2, ((byte[]) (_this._raw_data)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                    }
                                });
                            }
                            ((SegmentApp1) (this.data))._write_Seq(_io__raw_data);
                            break;
                        }
                        case SOF0: {
                            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(length() - 2);
                            this._io.addChildStream(_io__raw_data);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 2));
                                final Segment _this = this;
                                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_data = _io__raw_data.toByteArray();
                                        if (((byte[]) (_this._raw_data)).length != length() - 2)
                                            throw new ConsistencyError("raw(data)", length() - 2, ((byte[]) (_this._raw_data)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                    }
                                });
                            }
                            ((SegmentSof0) (this.data))._write_Seq(_io__raw_data);
                            break;
                        }
                        case SOS: {
                            final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(length() - 2);
                            this._io.addChildStream(_io__raw_data);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (length() - 2));
                                final Segment _this = this;
                                _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_data = _io__raw_data.toByteArray();
                                        if (((byte[]) (_this._raw_data)).length != length() - 2)
                                            throw new ConsistencyError("raw(data)", length() - 2, ((byte[]) (_this._raw_data)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                                    }
                                });
                            }
                            ((SegmentSos) (this.data))._write_Seq(_io__raw_data);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                    }
                }
            }
            if (marker() == MarkerEnum.SOS) {
                this._io.writeBytes(this.imageData);
                if (!(this._io.isEof()))
                    throw new ConsistencyError("image_data", 0, this._io.size() - this._io.pos());
            }
        }

        public void _check() {
            if (this.magic.length != 1)
                throw new ConsistencyError("magic", 1, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -1 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -1 }, this.magic, null, "/types/segment/seq/0");
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
            }
            if ( ((marker() != MarkerEnum.SOI) && (marker() != MarkerEnum.EOI)) ) {
                {
                    MarkerEnum on = marker();
                    if (on != null) {
                        switch (marker()) {
                        case APP0: {
                            if (!Objects.equals(((Jpeg.SegmentApp0) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((Jpeg.SegmentApp0) (this.data))._root());
                            if (!Objects.equals(((Jpeg.SegmentApp0) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((Jpeg.SegmentApp0) (this.data))._parent());
                            break;
                        }
                        case APP1: {
                            if (!Objects.equals(((Jpeg.SegmentApp1) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((Jpeg.SegmentApp1) (this.data))._root());
                            if (!Objects.equals(((Jpeg.SegmentApp1) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((Jpeg.SegmentApp1) (this.data))._parent());
                            break;
                        }
                        case SOF0: {
                            if (!Objects.equals(((Jpeg.SegmentSof0) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((Jpeg.SegmentSof0) (this.data))._root());
                            if (!Objects.equals(((Jpeg.SegmentSof0) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((Jpeg.SegmentSof0) (this.data))._parent());
                            break;
                        }
                        case SOS: {
                            if (!Objects.equals(((Jpeg.SegmentSos) (this.data))._root(), _root()))
                                throw new ConsistencyError("data", _root(), ((Jpeg.SegmentSos) (this.data))._root());
                            if (!Objects.equals(((Jpeg.SegmentSos) (this.data))._parent(), this))
                                throw new ConsistencyError("data", this, ((Jpeg.SegmentSos) (this.data))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.data)).length != length() - 2)
                                throw new ConsistencyError("data", length() - 2, ((byte[]) (this.data)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.data)).length != length() - 2)
                            throw new ConsistencyError("data", length() - 2, ((byte[]) (this.data)).length);
                    }
                }
            }
            if (marker() == MarkerEnum.SOS) {
            }
            _dirty = false;
        }
        private byte[] magic;
        private MarkerEnum marker;
        private Integer length;
        private Object data;
        private byte[] imageData;
        private Jpeg _root;
        private Jpeg _parent;
        private byte[] _raw_data;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public MarkerEnum marker() { return marker; }
        public void setMarker(MarkerEnum _v) { _dirty = true; marker = _v; }
        public Integer length() { return length; }
        public void setLength(Integer _v) { _dirty = true; length = _v; }
        public Object data() { return data; }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public byte[] imageData() { return imageData; }
        public void setImageData(byte[] _v) { _dirty = true; imageData = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg _parent() { return _parent; }
        public void set_parent(Jpeg _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class SegmentApp0 extends KaitaiStruct.ReadWrite {
        public static SegmentApp0 fromFile(String fileName) throws IOException {
            return new SegmentApp0(new ByteBufferKaitaiStream(fileName));
        }

        public enum DensityUnit {
            NO_UNITS(0),
            PIXELS_PER_INCH(1),
            PIXELS_PER_CM(2);

            private final long id;
            DensityUnit(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, DensityUnit> byId = new HashMap<Long, DensityUnit>(3);
            static {
                for (DensityUnit e : DensityUnit.values())
                    byId.put(e.id(), e);
            }
            public static DensityUnit byId(long id) { return byId.get(id); }
        }
        public SegmentApp0() {
            this(null, null, null);
        }

        public SegmentApp0(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentApp0(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentApp0(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = new String(this._io.readBytes(5), StandardCharsets.US_ASCII);
            this.versionMajor = this._io.readU1();
            this.versionMinor = this._io.readU1();
            this.densityUnits = DensityUnit.byId(this._io.readU1());
            this.densityX = this._io.readU2be();
            this.densityY = this._io.readU2be();
            this.thumbnailX = this._io.readU1();
            this.thumbnailY = this._io.readU1();
            this.thumbnail = this._io.readBytes((thumbnailX() * thumbnailY()) * 3);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.magic).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(this.versionMajor);
            this._io.writeU1(this.versionMinor);
            this._io.writeU1(((Number) (this.densityUnits.id())).intValue());
            this._io.writeU2be(this.densityX);
            this._io.writeU2be(this.densityY);
            this._io.writeU1(this.thumbnailX);
            this._io.writeU1(this.thumbnailY);
            this._io.writeBytes(this.thumbnail);
        }

        public void _check() {
            if ((this.magic).getBytes(Charset.forName("ASCII")).length != 5)
                throw new ConsistencyError("magic", 5, (this.magic).getBytes(Charset.forName("ASCII")).length);
            if (this.thumbnail.length != (thumbnailX() * thumbnailY()) * 3)
                throw new ConsistencyError("thumbnail", (thumbnailX() * thumbnailY()) * 3, this.thumbnail.length);
            _dirty = false;
        }
        private String magic;
        private int versionMajor;
        private int versionMinor;
        private DensityUnit densityUnits;
        private int densityX;
        private int densityY;
        private int thumbnailX;
        private int thumbnailY;
        private byte[] thumbnail;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public String magic() { return magic; }
        public void setMagic(String _v) { _dirty = true; magic = _v; }
        public int versionMajor() { return versionMajor; }
        public void setVersionMajor(int _v) { _dirty = true; versionMajor = _v; }
        public int versionMinor() { return versionMinor; }
        public void setVersionMinor(int _v) { _dirty = true; versionMinor = _v; }
        public DensityUnit densityUnits() { return densityUnits; }
        public void setDensityUnits(DensityUnit _v) { _dirty = true; densityUnits = _v; }

        /**
         * Horizontal pixel density. Must not be zero.
         */
        public int densityX() { return densityX; }
        public void setDensityX(int _v) { _dirty = true; densityX = _v; }

        /**
         * Vertical pixel density. Must not be zero.
         */
        public int densityY() { return densityY; }
        public void setDensityY(int _v) { _dirty = true; densityY = _v; }

        /**
         * Horizontal pixel count of the following embedded RGB thumbnail. May be zero.
         */
        public int thumbnailX() { return thumbnailX; }
        public void setThumbnailX(int _v) { _dirty = true; thumbnailX = _v; }

        /**
         * Vertical pixel count of the following embedded RGB thumbnail. May be zero.
         */
        public int thumbnailY() { return thumbnailY; }
        public void setThumbnailY(int _v) { _dirty = true; thumbnailY = _v; }

        /**
         * Uncompressed 24 bit RGB (8 bits per color channel) raster thumbnail data in the order R0, G0, B0, ... Rn, Gn, Bn
         */
        public byte[] thumbnail() { return thumbnail; }
        public void setThumbnail(byte[] _v) { _dirty = true; thumbnail = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg.Segment _parent() { return _parent; }
        public void set_parent(Jpeg.Segment _v) { _dirty = true; _parent = _v; }
    }
    public static class SegmentApp1 extends KaitaiStruct.ReadWrite {
        public static SegmentApp1 fromFile(String fileName) throws IOException {
            return new SegmentApp1(new ByteBufferKaitaiStream(fileName));
        }
        public SegmentApp1() {
            this(null, null, null);
        }

        public SegmentApp1(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentApp1(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentApp1(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = new String(this._io.readBytesTerm((byte) 0, false, true, true), StandardCharsets.US_ASCII);
            switch (magic()) {
            case "Exif": {
                this.body = new ExifInJpeg(this._io, this, _root);
                this.body._read();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (magic()) {
            case "Exif": {
                this.body._fetchInstances();
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.magic).getBytes(Charset.forName("ASCII")));
            this._io.writeU1(0);
            switch (magic()) {
            case "Exif": {
                this.body._write_Seq(this._io);
                break;
            }
            }
        }

        public void _check() {
            if (KaitaiStream.byteArrayIndexOf((this.magic).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("magic", -1, KaitaiStream.byteArrayIndexOf((this.magic).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            switch (magic()) {
            case "Exif": {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
                break;
            }
            }
            _dirty = false;
        }
        private String magic;
        private ExifInJpeg body;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public String magic() { return magic; }
        public void setMagic(String _v) { _dirty = true; magic = _v; }
        public ExifInJpeg body() { return body; }
        public void setBody(ExifInJpeg _v) { _dirty = true; body = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg.Segment _parent() { return _parent; }
        public void set_parent(Jpeg.Segment _v) { _dirty = true; _parent = _v; }
    }
    public static class SegmentSof0 extends KaitaiStruct.ReadWrite {
        public static SegmentSof0 fromFile(String fileName) throws IOException {
            return new SegmentSof0(new ByteBufferKaitaiStream(fileName));
        }
        public SegmentSof0() {
            this(null, null, null);
        }

        public SegmentSof0(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentSof0(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentSof0(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.bitsPerSample = this._io.readU1();
            this.imageHeight = this._io.readU2be();
            this.imageWidth = this._io.readU2be();
            this.numComponents = this._io.readU1();
            this.components = new ArrayList<Component>();
            for (int i = 0; i < numComponents(); i++) {
                Component _t_components = new Component(this._io, this, _root);
                try {
                    _t_components._read();
                } finally {
                    this.components.add(_t_components);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.components.size(); i++) {
                this.components.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.bitsPerSample);
            this._io.writeU2be(this.imageHeight);
            this._io.writeU2be(this.imageWidth);
            this._io.writeU1(this.numComponents);
            for (int i = 0; i < this.components.size(); i++) {
                this.components.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.components.size() != numComponents())
                throw new ConsistencyError("components", numComponents(), this.components.size());
            for (int i = 0; i < this.components.size(); i++) {
                if (!Objects.equals(this.components.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("components", _root(), this.components.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.components.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("components", this, this.components.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Component extends KaitaiStruct.ReadWrite {
            public static Component fromFile(String fileName) throws IOException {
                return new Component(new ByteBufferKaitaiStream(fileName));
            }
            public Component() {
                this(null, null, null);
            }

            public Component(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSof0 _parent) {
                this(_io, _parent, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSof0 _parent, Jpeg _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.id = Jpeg.ComponentId.byId(this._io.readU1());
                this.samplingFactors = this._io.readU1();
                this.quantizationTableId = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(((Number) (this.id.id())).intValue());
                this._io.writeU1(this.samplingFactors);
                this._io.writeU1(this.quantizationTableId);
            }

            public void _check() {
                _dirty = false;
            }
            private Integer samplingX;
            public Integer samplingX() {
                if (this.samplingX != null)
                    return this.samplingX;
                this.samplingX = ((Number) ((samplingFactors() & 240) >> 4)).intValue();
                return this.samplingX;
            }
            public void _invalidateSamplingX() { this.samplingX = null; }
            private Integer samplingY;
            public Integer samplingY() {
                if (this.samplingY != null)
                    return this.samplingY;
                this.samplingY = ((Number) (samplingFactors() & 15)).intValue();
                return this.samplingY;
            }
            public void _invalidateSamplingY() { this.samplingY = null; }
            private ComponentId id;
            private int samplingFactors;
            private int quantizationTableId;
            private Jpeg _root;
            private Jpeg.SegmentSof0 _parent;

            /**
             * Component selector
             */
            public ComponentId id() { return id; }
            public void setId(ComponentId _v) { _dirty = true; id = _v; }
            public int samplingFactors() { return samplingFactors; }
            public void setSamplingFactors(int _v) { _dirty = true; samplingFactors = _v; }
            public int quantizationTableId() { return quantizationTableId; }
            public void setQuantizationTableId(int _v) { _dirty = true; quantizationTableId = _v; }
            public Jpeg _root() { return _root; }
            public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
            public Jpeg.SegmentSof0 _parent() { return _parent; }
            public void set_parent(Jpeg.SegmentSof0 _v) { _dirty = true; _parent = _v; }
        }
        private int bitsPerSample;
        private int imageHeight;
        private int imageWidth;
        private int numComponents;
        private List<Component> components;
        private Jpeg _root;
        private Jpeg.Segment _parent;
        public int bitsPerSample() { return bitsPerSample; }
        public void setBitsPerSample(int _v) { _dirty = true; bitsPerSample = _v; }
        public int imageHeight() { return imageHeight; }
        public void setImageHeight(int _v) { _dirty = true; imageHeight = _v; }
        public int imageWidth() { return imageWidth; }
        public void setImageWidth(int _v) { _dirty = true; imageWidth = _v; }
        public int numComponents() { return numComponents; }
        public void setNumComponents(int _v) { _dirty = true; numComponents = _v; }
        public List<Component> components() { return components; }
        public void setComponents(List<Component> _v) { _dirty = true; components = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg.Segment _parent() { return _parent; }
        public void set_parent(Jpeg.Segment _v) { _dirty = true; _parent = _v; }
    }
    public static class SegmentSos extends KaitaiStruct.ReadWrite {
        public static SegmentSos fromFile(String fileName) throws IOException {
            return new SegmentSos(new ByteBufferKaitaiStream(fileName));
        }
        public SegmentSos() {
            this(null, null, null);
        }

        public SegmentSos(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SegmentSos(KaitaiStream _io, Jpeg.Segment _parent) {
            this(_io, _parent, null);
        }

        public SegmentSos(KaitaiStream _io, Jpeg.Segment _parent, Jpeg _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.numComponents = this._io.readU1();
            this.components = new ArrayList<Component>();
            for (int i = 0; i < numComponents(); i++) {
                Component _t_components = new Component(this._io, this, _root);
                try {
                    _t_components._read();
                } finally {
                    this.components.add(_t_components);
                }
            }
            this.startSpectralSelection = this._io.readU1();
            this.endSpectral = this._io.readU1();
            this.apprBitPos = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.components.size(); i++) {
                this.components.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.numComponents);
            for (int i = 0; i < this.components.size(); i++) {
                this.components.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.writeU1(this.startSpectralSelection);
            this._io.writeU1(this.endSpectral);
            this._io.writeU1(this.apprBitPos);
        }

        public void _check() {
            if (this.components.size() != numComponents())
                throw new ConsistencyError("components", numComponents(), this.components.size());
            for (int i = 0; i < this.components.size(); i++) {
                if (!Objects.equals(this.components.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("components", _root(), this.components.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.components.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("components", this, this.components.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        public static class Component extends KaitaiStruct.ReadWrite {
            public static Component fromFile(String fileName) throws IOException {
                return new Component(new ByteBufferKaitaiStream(fileName));
            }
            public Component() {
                this(null, null, null);
            }

            public Component(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSos _parent) {
                this(_io, _parent, null);
            }

            public Component(KaitaiStream _io, Jpeg.SegmentSos _parent, Jpeg _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.id = Jpeg.ComponentId.byId(this._io.readU1());
                this.huffmanTable = this._io.readU1();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU1(((Number) (this.id.id())).intValue());
                this._io.writeU1(this.huffmanTable);
            }

            public void _check() {
                _dirty = false;
            }
            private ComponentId id;
            private int huffmanTable;
            private Jpeg _root;
            private Jpeg.SegmentSos _parent;

            /**
             * Scan component selector
             */
            public ComponentId id() { return id; }
            public void setId(ComponentId _v) { _dirty = true; id = _v; }
            public int huffmanTable() { return huffmanTable; }
            public void setHuffmanTable(int _v) { _dirty = true; huffmanTable = _v; }
            public Jpeg _root() { return _root; }
            public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
            public Jpeg.SegmentSos _parent() { return _parent; }
            public void set_parent(Jpeg.SegmentSos _v) { _dirty = true; _parent = _v; }
        }
        private int numComponents;
        private List<Component> components;
        private int startSpectralSelection;
        private int endSpectral;
        private int apprBitPos;
        private Jpeg _root;
        private Jpeg.Segment _parent;

        /**
         * Number of components in scan
         */
        public int numComponents() { return numComponents; }
        public void setNumComponents(int _v) { _dirty = true; numComponents = _v; }

        /**
         * Scan components specification
         */
        public List<Component> components() { return components; }
        public void setComponents(List<Component> _v) { _dirty = true; components = _v; }

        /**
         * Start of spectral selection or predictor selection
         */
        public int startSpectralSelection() { return startSpectralSelection; }
        public void setStartSpectralSelection(int _v) { _dirty = true; startSpectralSelection = _v; }

        /**
         * End of spectral selection
         */
        public int endSpectral() { return endSpectral; }
        public void setEndSpectral(int _v) { _dirty = true; endSpectral = _v; }

        /**
         * Successive approximation bit position high + Successive approximation bit position low or point transform
         */
        public int apprBitPos() { return apprBitPos; }
        public void setApprBitPos(int _v) { _dirty = true; apprBitPos = _v; }
        public Jpeg _root() { return _root; }
        public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
        public Jpeg.Segment _parent() { return _parent; }
        public void set_parent(Jpeg.Segment _v) { _dirty = true; _parent = _v; }
    }
    private List<Segment> segments;
    private Jpeg _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Segment> segments() { return segments; }
    public void setSegments(List<Segment> _v) { _dirty = true; segments = _v; }
    public Jpeg _root() { return _root; }
    public void set_root(Jpeg _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
