// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * Format of `bootloader-*.img` files found in factory images of certain Android devices from Huawei:
 * 
 * * Nexus 6P "angler": [sample][sample-angler] ([other samples][others-angler]),
 *   [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29)
 * 
 * [sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * All image versions can be found in factory images at
 * <https://developers.google.com/android/images> for the specific device. To
 * avoid having to download an entire ZIP archive when you only need one file
 * from it, install [remotezip](https://github.com/gtsystem/python-remotezip) and
 * use its [command line
 * tool](https://github.com/gtsystem/python-remotezip#command-line-tool) to list
 * members in the archive and then to download only the file you want.
 * @see <a href="https://android.googlesource.com/device/huawei/angler/+/673cfb9/releasetools.py">Source</a>
 */
public class AndroidBootldrHuawei extends KaitaiStruct {
    public static AndroidBootldrHuawei fromFile(String fileName) throws IOException {
        return new AndroidBootldrHuawei(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidBootldrHuawei(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidBootldrHuawei(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidBootldrHuawei(KaitaiStream _io, KaitaiStruct _parent, AndroidBootldrHuawei _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.metaHeader = new MetaHdr(this._io, this, _root);
        this.headerExt = this._io.readBytes((metaHeader().lenMetaHeader() - 76));
        this._raw_imageHeader = this._io.readBytes(metaHeader().lenImageHeader());
        KaitaiStream _io__raw_imageHeader = new ByteBufferKaitaiStream(_raw_imageHeader);
        this.imageHeader = new ImageHdr(_io__raw_imageHeader, this, _root);
    }
    public static class MetaHdr extends KaitaiStruct {
        public static MetaHdr fromFile(String fileName) throws IOException {
            return new MetaHdr(new ByteBufferKaitaiStream(fileName));
        }

        public MetaHdr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MetaHdr(KaitaiStream _io, AndroidBootldrHuawei _parent) {
            this(_io, _parent, null);
        }

        public MetaHdr(KaitaiStream _io, AndroidBootldrHuawei _parent, AndroidBootldrHuawei _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(magic(), new byte[] { 60, -42, 26, -50 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 60, -42, 26, -50 }, magic(), _io(), "/types/meta_hdr/seq/0");
            }
            this.version = new Version(this._io, this, _root);
            this.imageVersion = new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), Charset.forName("ASCII"));
            this.lenMetaHeader = this._io.readU2le();
            this.lenImageHeader = this._io.readU2le();
        }
        private byte[] magic;
        private Version version;
        private String imageVersion;
        private int lenMetaHeader;
        private int lenImageHeader;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei _parent;
        public byte[] magic() { return magic; }
        public Version version() { return version; }
        public String imageVersion() { return imageVersion; }
        public int lenMetaHeader() { return lenMetaHeader; }
        public int lenImageHeader() { return lenImageHeader; }
        public AndroidBootldrHuawei _root() { return _root; }
        public AndroidBootldrHuawei _parent() { return _parent; }
    }
    public static class Version extends KaitaiStruct {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }

        public Version(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Version(KaitaiStream _io, AndroidBootldrHuawei.MetaHdr _parent) {
            this(_io, _parent, null);
        }

        public Version(KaitaiStream _io, AndroidBootldrHuawei.MetaHdr _parent, AndroidBootldrHuawei _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.major = this._io.readU2le();
            this.minor = this._io.readU2le();
        }
        private int major;
        private int minor;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei.MetaHdr _parent;
        public int major() { return major; }
        public int minor() { return minor; }
        public AndroidBootldrHuawei _root() { return _root; }
        public AndroidBootldrHuawei.MetaHdr _parent() { return _parent; }
    }
    public static class ImageHdr extends KaitaiStruct {
        public static ImageHdr fromFile(String fileName) throws IOException {
            return new ImageHdr(new ByteBufferKaitaiStream(fileName));
        }

        public ImageHdr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageHdr(KaitaiStream _io, AndroidBootldrHuawei _parent) {
            this(_io, _parent, null);
        }

        public ImageHdr(KaitaiStream _io, AndroidBootldrHuawei _parent, AndroidBootldrHuawei _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<ImageHdrEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.entries.add(new ImageHdrEntry(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<ImageHdrEntry> entries;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei _parent;
        public ArrayList<ImageHdrEntry> entries() { return entries; }
        public AndroidBootldrHuawei _root() { return _root; }
        public AndroidBootldrHuawei _parent() { return _parent; }
    }
    public static class ImageHdrEntry extends KaitaiStruct {
        public static ImageHdrEntry fromFile(String fileName) throws IOException {
            return new ImageHdrEntry(new ByteBufferKaitaiStream(fileName));
        }

        public ImageHdrEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageHdrEntry(KaitaiStream _io, AndroidBootldrHuawei.ImageHdr _parent) {
            this(_io, _parent, null);
        }

        public ImageHdrEntry(KaitaiStream _io, AndroidBootldrHuawei.ImageHdr _parent, AndroidBootldrHuawei _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(72), (byte) 0, false), Charset.forName("ASCII"));
            this.ofsBody = this._io.readU4le();
            this.lenBody = this._io.readU4le();
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofsBody());
            this.body = io.readBytes(lenBody());
            io.seek(_pos);
            return this.body;
        }
        private String name;
        private long ofsBody;
        private long lenBody;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei.ImageHdr _parent;

        /**
         * partition name
         */
        public String name() { return name; }
        public long ofsBody() { return ofsBody; }
        public long lenBody() { return lenBody; }
        public AndroidBootldrHuawei _root() { return _root; }
        public AndroidBootldrHuawei.ImageHdr _parent() { return _parent; }
    }
    private MetaHdr metaHeader;
    private byte[] headerExt;
    private ImageHdr imageHeader;
    private AndroidBootldrHuawei _root;
    private KaitaiStruct _parent;
    private byte[] _raw_imageHeader;
    public MetaHdr metaHeader() { return metaHeader; }
    public byte[] headerExt() { return headerExt; }
    public ImageHdr imageHeader() { return imageHeader; }
    public AndroidBootldrHuawei _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_imageHeader() { return _raw_imageHeader; }
}
