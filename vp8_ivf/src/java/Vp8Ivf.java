// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;


/**
 * IVF is a simple container format for raw VP8 data, which is an open and
 * royalty-free video compression format, currently developed by Google.
 * 
 * Test .ivf files are available at
 * <https://chromium.googlesource.com/webm/vp8-test-vectors>
 * @see <a href="https://wiki.multimedia.cx/index.php/IVF">Source</a>
 */
public class Vp8Ivf extends KaitaiStruct {
    public static Vp8Ivf fromFile(String fileName) throws IOException {
        return new Vp8Ivf(new ByteBufferKaitaiStream(fileName));
    }

    public Vp8Ivf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Vp8Ivf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Vp8Ivf(KaitaiStream _io, KaitaiStruct _parent, Vp8Ivf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic1 = this._io.readBytes(4);
        if (!(Arrays.equals(magic1(), new byte[] { 68, 75, 73, 70 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 75, 73, 70 }, magic1(), _io(), "/seq/0");
        }
        this.version = this._io.readU2le();
        this.lenHeader = this._io.readU2le();
        this.codec = this._io.readBytes(4);
        if (!(Arrays.equals(codec(), new byte[] { 86, 80, 56, 48 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 80, 56, 48 }, codec(), _io(), "/seq/3");
        }
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.framerate = this._io.readU4le();
        this.timescale = this._io.readU4le();
        this.numFrames = this._io.readU4le();
        this.unused = this._io.readU4le();
        this.imageData = new ArrayList<Blocks>();
        for (int i = 0; i < numFrames(); i++) {
            this.imageData.add(new Blocks(this._io, this, _root));
        }
    }
    public static class Blocks extends KaitaiStruct {
        public static Blocks fromFile(String fileName) throws IOException {
            return new Blocks(new ByteBufferKaitaiStream(fileName));
        }

        public Blocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Blocks(KaitaiStream _io, Vp8Ivf _parent) {
            this(_io, _parent, null);
        }

        public Blocks(KaitaiStream _io, Vp8Ivf _parent, Vp8Ivf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new Block(this._io, this, _root);
        }
        private Block entries;
        private Vp8Ivf _root;
        private Vp8Ivf _parent;
        public Block entries() { return entries; }
        public Vp8Ivf _root() { return _root; }
        public Vp8Ivf _parent() { return _parent; }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new ByteBufferKaitaiStream(fileName));
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Vp8Ivf.Blocks _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Vp8Ivf.Blocks _parent, Vp8Ivf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenFrame = this._io.readU4le();
            this.timestamp = this._io.readU8le();
            this.framedata = this._io.readBytes(lenFrame());
        }
        private long lenFrame;
        private long timestamp;
        private byte[] framedata;
        private Vp8Ivf _root;
        private Vp8Ivf.Blocks _parent;

        /**
         * size of the frame data
         */
        public long lenFrame() { return lenFrame; }
        public long timestamp() { return timestamp; }
        public byte[] framedata() { return framedata; }
        public Vp8Ivf _root() { return _root; }
        public Vp8Ivf.Blocks _parent() { return _parent; }
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
    private ArrayList<Blocks> imageData;
    private Vp8Ivf _root;
    private KaitaiStruct _parent;

    /**
     * Magic Number of IVF Files
     */
    public byte[] magic1() { return magic1; }

    /**
     * This should be 0
     */
    public int version() { return version; }

    /**
     * Normally the header length is 32 byte
     */
    public int lenHeader() { return lenHeader; }

    /**
     * Name of the codec e.g. 'VP80' for VP8
     */
    public byte[] codec() { return codec; }

    /**
     * The (initial) width of the video, every keyframe may change the resolution
     */
    public int width() { return width; }

    /**
     * The (initial) height of the video, every keyframe may change the resolution
     */
    public int height() { return height; }

    /**
     * the (framerate * timescale) e.g. for 30 fps -> 30000
     */
    public long framerate() { return framerate; }

    /**
     * the timescale is a divider of the seconds (VPX is integer math only) mostly 1000
     */
    public long timescale() { return timescale; }

    /**
     * the number of frames (if not a camera stream)
     */
    public long numFrames() { return numFrames; }
    public long unused() { return unused; }
    public ArrayList<Blocks> imageData() { return imageData; }
    public Vp8Ivf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
