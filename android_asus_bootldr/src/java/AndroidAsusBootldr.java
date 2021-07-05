// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * A bootloader image which only seems to have been used on a few ASUS
 * devices. The encoding is ASCII, because the `releasetools.py` script
 * is written using Python 2, where the default encoding is ASCII.
 * 
 * A test file can be found in the firmware files for the "fugu" device,
 * which can be downloaded from <https://developers.google.com/android/images>
 * @see <a href="https://android.googlesource.com/device/asus/fugu/+/android-8.1.0_r5/releasetools.py">Source</a>
 */
public class AndroidAsusBootldr extends KaitaiStruct {
    public static AndroidAsusBootldr fromFile(String fileName) throws IOException {
        return new AndroidAsusBootldr(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidAsusBootldr(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidAsusBootldr(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidAsusBootldr(KaitaiStream _io, KaitaiStruct _parent, AndroidAsusBootldr _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(magic(), new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }, magic(), _io(), "/seq/0");
        }
        this.revision = this._io.readU2le();
        if (!(revision() >= 2)) {
            throw new KaitaiStream.ValidationLessThanError(2, revision(), _io(), "/seq/1");
        }
        this.reserved1 = this._io.readU2le();
        this.reserved2 = this._io.readU4le();
        images = new ArrayList<Image>(((Number) (3)).intValue());
        for (int i = 0; i < 3; i++) {
            this.images.add(new Image(this._io, this, _root));
        }
    }
    public static class Image extends KaitaiStruct {
        public static Image fromFile(String fileName) throws IOException {
            return new Image(new ByteBufferKaitaiStream(fileName));
        }

        public Image(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Image(KaitaiStream _io, AndroidAsusBootldr _parent) {
            this(_io, _parent, null);
        }

        public Image(KaitaiStream _io, AndroidAsusBootldr _parent, AndroidAsusBootldr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.chunkId = new String(this._io.readBytes(8), Charset.forName("ASCII"));
            if (!( ((chunkId().equals("IFWI!!!!")) || (chunkId().equals("DROIDBT!")) || (chunkId().equals("SPLASHS!"))) )) {
                throw new KaitaiStream.ValidationNotAnyOfError(chunkId(), _io(), "/types/image/seq/0");
            }
            this.lenBody = this._io.readU4le();
            this.flags = this._io.readU1();
            {
                int _it = flags();
                if (!((_it & 1) != 0)) {
                    throw new KaitaiStream.ValidationExprError(flags(), _io(), "/types/image/seq/2");
                }
            }
            this.reserved1 = this._io.readU1();
            this.reserved2 = this._io.readU1();
            this.reserved3 = this._io.readU1();
            this.body = this._io.readBytes(lenBody());
        }
        private String fileName;
        public String fileName() {
            if (this.fileName != null)
                return this.fileName;
            this.fileName = (chunkId().equals("IFWI!!!!") ? "ifwi.bin" : (chunkId().equals("DROIDBT!") ? "droidboot.img" : (chunkId().equals("SPLASHS!") ? "splashscreen.img" : "")));
            return this.fileName;
        }
        private String chunkId;
        private long lenBody;
        private int flags;
        private int reserved1;
        private int reserved2;
        private int reserved3;
        private byte[] body;
        private AndroidAsusBootldr _root;
        private AndroidAsusBootldr _parent;
        public String chunkId() { return chunkId; }
        public long lenBody() { return lenBody; }
        public int flags() { return flags; }
        public int reserved1() { return reserved1; }
        public int reserved2() { return reserved2; }
        public int reserved3() { return reserved3; }
        public byte[] body() { return body; }
        public AndroidAsusBootldr _root() { return _root; }
        public AndroidAsusBootldr _parent() { return _parent; }
    }
    private byte[] magic;
    private int revision;
    private int reserved1;
    private long reserved2;
    private ArrayList<Image> images;
    private AndroidAsusBootldr _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public int revision() { return revision; }
    public int reserved1() { return reserved1; }
    public long reserved2() { return reserved2; }

    /**
     * Only three images are included: `ifwi.bin`, `droidboot.img`
     * and `splashscreen.img`
     */
    public ArrayList<Image> images() { return images; }
    public AndroidAsusBootldr _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
