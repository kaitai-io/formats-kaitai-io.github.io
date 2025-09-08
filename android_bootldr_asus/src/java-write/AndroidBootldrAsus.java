// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * @see <a href="https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py">Source</a>
 */
public class AndroidBootldrAsus extends KaitaiStruct.ReadWrite {
    public static AndroidBootldrAsus fromFile(String fileName) throws IOException {
        return new AndroidBootldrAsus(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidBootldrAsus() {
        this(null, null, null);
    }

    public AndroidBootldrAsus(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidBootldrAsus(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidBootldrAsus(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidBootldrAsus _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }, this.magic, this._io, "/seq/0");
        }
        this.revision = this._io.readU2le();
        if (!(this.revision >= 2)) {
            throw new KaitaiStream.ValidationLessThanError(2, this.revision, this._io, "/seq/1");
        }
        this.reserved1 = this._io.readU2le();
        this.reserved2 = this._io.readU4le();
        this.images = new ArrayList<Image>();
        for (int i = 0; i < 3; i++) {
            Image _t_images = new Image(this._io, this, _root);
            try {
                _t_images._read();
            } finally {
                this.images.add(_t_images);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.images.size(); i++) {
            this.images.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2le(this.revision);
        this._io.writeU2le(this.reserved1);
        this._io.writeU4le(this.reserved2);
        for (int i = 0; i < this.images.size(); i++) {
            this.images.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }, this.magic, null, "/seq/0");
        }
        if (!(this.revision >= 2)) {
            throw new KaitaiStream.ValidationLessThanError(2, this.revision, null, "/seq/1");
        }
        if (this.images.size() != 3)
            throw new ConsistencyError("images", 3, this.images.size());
        for (int i = 0; i < this.images.size(); i++) {
            if (!Objects.equals(this.images.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("images", _root(), this.images.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.images.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("images", this, this.images.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Image extends KaitaiStruct.ReadWrite {
        public static Image fromFile(String fileName) throws IOException {
            return new Image(new ByteBufferKaitaiStream(fileName));
        }
        public Image() {
            this(null, null, null);
        }

        public Image(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Image(KaitaiStream _io, AndroidBootldrAsus _parent) {
            this(_io, _parent, null);
        }

        public Image(KaitaiStream _io, AndroidBootldrAsus _parent, AndroidBootldrAsus _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.chunkId = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            if (!( ((this.chunkId.equals("IFWI!!!!")) || (this.chunkId.equals("DROIDBT!")) || (this.chunkId.equals("SPLASHS!"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.chunkId, this._io, "/types/image/seq/0");
            }
            this.lenBody = this._io.readU4le();
            this.flags = this._io.readU1();
            {
                int _it = this.flags;
                if (!((_it & 1) != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.flags, this._io, "/types/image/seq/2");
                }
            }
            this.reserved1 = this._io.readU1();
            this.reserved2 = this._io.readU1();
            this.reserved3 = this._io.readU1();
            this.body = this._io.readBytes(lenBody());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes((this.chunkId).getBytes(Charset.forName("ASCII")));
            this._io.writeU4le(this.lenBody);
            this._io.writeU1(this.flags);
            this._io.writeU1(this.reserved1);
            this._io.writeU1(this.reserved2);
            this._io.writeU1(this.reserved3);
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if ((this.chunkId).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("chunk_id", 8, (this.chunkId).getBytes(Charset.forName("ASCII")).length);
            if (!( ((this.chunkId.equals("IFWI!!!!")) || (this.chunkId.equals("DROIDBT!")) || (this.chunkId.equals("SPLASHS!"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(this.chunkId, null, "/types/image/seq/0");
            }
            {
                int _it = this.flags;
                if (!((_it & 1) != 0)) {
                    throw new KaitaiStream.ValidationExprError(this.flags, null, "/types/image/seq/2");
                }
            }
            if (this.body.length != lenBody())
                throw new ConsistencyError("body", lenBody(), this.body.length);
            _dirty = false;
        }
        private String fileName;
        public String fileName() {
            if (this.fileName != null)
                return this.fileName;
            this.fileName = (chunkId().equals("IFWI!!!!") ? "ifwi.bin" : (chunkId().equals("DROIDBT!") ? "droidboot.img" : (chunkId().equals("SPLASHS!") ? "splashscreen.img" : "")));
            return this.fileName;
        }
        public void _invalidateFileName() { this.fileName = null; }
        private String chunkId;
        private long lenBody;
        private int flags;
        private int reserved1;
        private int reserved2;
        private int reserved3;
        private byte[] body;
        private AndroidBootldrAsus _root;
        private AndroidBootldrAsus _parent;
        public String chunkId() { return chunkId; }
        public void setChunkId(String _v) { _dirty = true; chunkId = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int reserved1() { return reserved1; }
        public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }
        public int reserved2() { return reserved2; }
        public void setReserved2(int _v) { _dirty = true; reserved2 = _v; }
        public int reserved3() { return reserved3; }
        public void setReserved3(int _v) { _dirty = true; reserved3 = _v; }
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public AndroidBootldrAsus _root() { return _root; }
        public void set_root(AndroidBootldrAsus _v) { _dirty = true; _root = _v; }
        public AndroidBootldrAsus _parent() { return _parent; }
        public void set_parent(AndroidBootldrAsus _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private int revision;
    private int reserved1;
    private long reserved2;
    private List<Image> images;
    private AndroidBootldrAsus _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public int revision() { return revision; }
    public void setRevision(int _v) { _dirty = true; revision = _v; }
    public int reserved1() { return reserved1; }
    public void setReserved1(int _v) { _dirty = true; reserved1 = _v; }
    public long reserved2() { return reserved2; }
    public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }

    /**
     * Only three images are included: `ifwi.bin`, `droidboot.img`
     * and `splashscreen.img`
     */
    public List<Image> images() { return images; }
    public void setImages(List<Image> _v) { _dirty = true; images = _v; }
    public AndroidBootldrAsus _root() { return _root; }
    public void set_root(AndroidBootldrAsus _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
