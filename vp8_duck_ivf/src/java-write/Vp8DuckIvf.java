// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * Duck IVF is a simple container format for raw VP8 data, which is an open and
 * royalty-free video compression format, currently developed by Google.
 * 
 * Test .ivf files are available at
 * <https://chromium.googlesource.com/webm/vp8-test-vectors>
 * @see <a href="https://wiki.multimedia.cx/index.php/Duck_IVF">Source</a>
 */
public class Vp8DuckIvf extends KaitaiStruct.ReadWrite {
    public static Vp8DuckIvf fromFile(String fileName) throws IOException {
        return new Vp8DuckIvf(new ByteBufferKaitaiStream(fileName));
    }
    public Vp8DuckIvf() {
        this(null, null, null);
    }

    public Vp8DuckIvf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vp8DuckIvf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Vp8DuckIvf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Vp8DuckIvf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic1 = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic1, new byte[] { 68, 75, 73, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 75, 73, 70 }, this.magic1, this._io, "/seq/0");
        }
        this.version = this._io.readU2le();
        this.lenHeader = this._io.readU2le();
        this.codec = this._io.readBytes(4);
        if (!(Arrays.equals(this.codec, new byte[] { 86, 80, 56, 48 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 80, 56, 48 }, this.codec, this._io, "/seq/3");
        }
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.framerate = this._io.readU4le();
        this.timescale = this._io.readU4le();
        this.numFrames = this._io.readU4le();
        this.unused = this._io.readU4le();
        this.imageData = new ArrayList<Blocks>();
        for (int i = 0; i < numFrames(); i++) {
            Blocks _t_imageData = new Blocks(this._io, this, _root);
            try {
                _t_imageData._read();
            } finally {
                this.imageData.add(_t_imageData);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.imageData.size(); i++) {
            this.imageData.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic1);
        this._io.writeU2le(this.version);
        this._io.writeU2le(this.lenHeader);
        this._io.writeBytes(this.codec);
        this._io.writeU2le(this.width);
        this._io.writeU2le(this.height);
        this._io.writeU4le(this.framerate);
        this._io.writeU4le(this.timescale);
        this._io.writeU4le(this.numFrames);
        this._io.writeU4le(this.unused);
        for (int i = 0; i < this.imageData.size(); i++) {
            this.imageData.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic1.length != 4)
            throw new ConsistencyError("magic1", 4, this.magic1.length);
        if (!(Arrays.equals(this.magic1, new byte[] { 68, 75, 73, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 75, 73, 70 }, this.magic1, null, "/seq/0");
        }
        if (this.codec.length != 4)
            throw new ConsistencyError("codec", 4, this.codec.length);
        if (!(Arrays.equals(this.codec, new byte[] { 86, 80, 56, 48 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 80, 56, 48 }, this.codec, null, "/seq/3");
        }
        if (this.imageData.size() != numFrames())
            throw new ConsistencyError("image_data", numFrames(), this.imageData.size());
        for (int i = 0; i < this.imageData.size(); i++) {
            if (!Objects.equals(this.imageData.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("image_data", _root(), this.imageData.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.imageData.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("image_data", this, this.imageData.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Block extends KaitaiStruct.ReadWrite {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }
        public Block() {
            this(null, null, null);
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Vp8DuckIvf.Blocks _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Vp8DuckIvf.Blocks _parent, Vp8DuckIvf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenFrame = this._io.readU4le();
            this.timestamp = this._io.readU8le();
            this.framedata = this._io.readBytes(lenFrame());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenFrame);
            this._io.writeU8le(this.timestamp);
            this._io.writeBytes(this.framedata);
        }

        public void _check() {
            if (this.framedata.length != lenFrame())
                throw new ConsistencyError("framedata", lenFrame(), this.framedata.length);
            _dirty = false;
        }
        private long lenFrame;
        private long timestamp;
        private byte[] framedata;
        private Vp8DuckIvf _root;
        private Vp8DuckIvf.Blocks _parent;

        /**
         * size of the frame data
         */
        public long lenFrame() { return lenFrame; }
        public void setLenFrame(long _v) { _dirty = true; lenFrame = _v; }
        public long timestamp() { return timestamp; }
        public void setTimestamp(long _v) { _dirty = true; timestamp = _v; }
        public byte[] framedata() { return framedata; }
        public void setFramedata(byte[] _v) { _dirty = true; framedata = _v; }
        public Vp8DuckIvf _root() { return _root; }
        public void set_root(Vp8DuckIvf _v) { _dirty = true; _root = _v; }
        public Vp8DuckIvf.Blocks _parent() { return _parent; }
        public void set_parent(Vp8DuckIvf.Blocks _v) { _dirty = true; _parent = _v; }
    }
    public static class Blocks extends KaitaiStruct.ReadWrite {
        public static Blocks fromFile(String fileName) throws IOException {
            return new Blocks(new ByteBufferKaitaiStream(fileName));
        }
        public Blocks() {
            this(null, null, null);
        }

        public Blocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blocks(KaitaiStream _io, Vp8DuckIvf _parent) {
            this(_io, _parent, null);
        }

        public Blocks(KaitaiStream _io, Vp8DuckIvf _parent, Vp8DuckIvf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new Block(this._io, this, _root);
            this.entries._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.entries._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.entries._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.entries._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries._root());
            if (!Objects.equals(this.entries._parent(), this))
                throw new ConsistencyError("entries", this, this.entries._parent());
            _dirty = false;
        }
        private Block entries;
        private Vp8DuckIvf _root;
        private Vp8DuckIvf _parent;
        public Block entries() { return entries; }
        public void setEntries(Block _v) { _dirty = true; entries = _v; }
        public Vp8DuckIvf _root() { return _root; }
        public void set_root(Vp8DuckIvf _v) { _dirty = true; _root = _v; }
        public Vp8DuckIvf _parent() { return _parent; }
        public void set_parent(Vp8DuckIvf _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic1;
    private int version;
    private int lenHeader;
    private byte[] codec;
    private int width;
    private int height;
    private long framerate;
    private long timescale;
    private long numFrames;
    private long unused;
    private List<Blocks> imageData;
    private Vp8DuckIvf _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * Magic Number of IVF Files
     */
    public byte[] magic1() { return magic1; }
    public void setMagic1(byte[] _v) { _dirty = true; magic1 = _v; }

    /**
     * This should be 0
     */
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }

    /**
     * Normally the header length is 32 byte
     */
    public int lenHeader() { return lenHeader; }
    public void setLenHeader(int _v) { _dirty = true; lenHeader = _v; }

    /**
     * Name of the codec e.g. 'VP80' for VP8
     */
    public byte[] codec() { return codec; }
    public void setCodec(byte[] _v) { _dirty = true; codec = _v; }

    /**
     * The (initial) width of the video, every keyframe may change the resolution
     */
    public int width() { return width; }
    public void setWidth(int _v) { _dirty = true; width = _v; }

    /**
     * The (initial) height of the video, every keyframe may change the resolution
     */
    public int height() { return height; }
    public void setHeight(int _v) { _dirty = true; height = _v; }

    /**
     * the (framerate * timescale) e.g. for 30 fps -> 30000
     */
    public long framerate() { return framerate; }
    public void setFramerate(long _v) { _dirty = true; framerate = _v; }

    /**
     * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
     */
    public long timescale() { return timescale; }
    public void setTimescale(long _v) { _dirty = true; timescale = _v; }

    /**
     * the number of frames (if not a camera stream)
     */
    public long numFrames() { return numFrames; }
    public void setNumFrames(long _v) { _dirty = true; numFrames = _v; }
    public long unused() { return unused; }
    public void setUnused(long _v) { _dirty = true; unused = _v; }
    public List<Blocks> imageData() { return imageData; }
    public void setImageData(List<Blocks> _v) { _dirty = true; imageData = _v; }
    public Vp8DuckIvf _root() { return _root; }
    public void set_root(Vp8DuckIvf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
