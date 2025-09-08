// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Arrays;


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
 * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_format.h?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
 * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85">Source</a>
 */
public class AndroidBootldrHuawei extends KaitaiStruct.ReadWrite {
    public static AndroidBootldrHuawei fromFile(String fileName) throws IOException {
        return new AndroidBootldrHuawei(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidBootldrHuawei() {
        this(null, null, null);
    }

    public AndroidBootldrHuawei(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidBootldrHuawei(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidBootldrHuawei(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidBootldrHuawei _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.metaHeader = new MetaHdr(this._io, this, _root);
        this.metaHeader._read();
        this.headerExt = this._io.readBytes(metaHeader().lenMetaHeader() - 76);
        this._raw_imageHeader = this._io.readBytes(metaHeader().lenImageHeader());
        KaitaiStream _io__raw_imageHeader = new ByteBufferKaitaiStream(this._raw_imageHeader);
        this.imageHeader = new ImageHdr(_io__raw_imageHeader, this, _root);
        this.imageHeader._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.metaHeader._fetchInstances();
        this.imageHeader._fetchInstances();
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.metaHeader._write_Seq(this._io);
        this._io.writeBytes(this.headerExt);
        final KaitaiStream _io__raw_imageHeader = new ByteBufferKaitaiStream(metaHeader().lenImageHeader());
        this._io.addChildStream(_io__raw_imageHeader);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (metaHeader().lenImageHeader()));
            final AndroidBootldrHuawei _this = this;
            _io__raw_imageHeader.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_imageHeader = _io__raw_imageHeader.toByteArray();
                    if (_this._raw_imageHeader.length != metaHeader().lenImageHeader())
                        throw new ConsistencyError("raw(image_header)", metaHeader().lenImageHeader(), _this._raw_imageHeader.length);
                    parent.writeBytes(_this._raw_imageHeader);
                }
            });
        }
        this.imageHeader._write_Seq(_io__raw_imageHeader);
    }

    public void _check() {
        if (!Objects.equals(this.metaHeader._root(), _root()))
            throw new ConsistencyError("meta_header", _root(), this.metaHeader._root());
        if (!Objects.equals(this.metaHeader._parent(), this))
            throw new ConsistencyError("meta_header", this, this.metaHeader._parent());
        if (this.headerExt.length != metaHeader().lenMetaHeader() - 76)
            throw new ConsistencyError("header_ext", metaHeader().lenMetaHeader() - 76, this.headerExt.length);
        if (!Objects.equals(this.imageHeader._root(), _root()))
            throw new ConsistencyError("image_header", _root(), this.imageHeader._root());
        if (!Objects.equals(this.imageHeader._parent(), this))
            throw new ConsistencyError("image_header", this, this.imageHeader._parent());
        _dirty = false;
    }
    public static class ImageHdr extends KaitaiStruct.ReadWrite {
        public static ImageHdr fromFile(String fileName) throws IOException {
            return new ImageHdr(new ByteBufferKaitaiStream(fileName));
        }
        public ImageHdr() {
            this(null, null, null);
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
        }
        public void _read() {
            this.entries = new ArrayList<ImageHdrEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    ImageHdrEntry _t_entries = new ImageHdrEntry(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        this.entries.add(_t_entries);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.entries.size(); i++) {
                this.entries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.entries.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("entries", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<ImageHdrEntry> entries;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei _parent;

        /**
         * The C generator program defines `img_header` as a [fixed size
         * array](https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&id=a68d284aee85#n42)
         * of `img_header_entry_t` structs with length `MAX_IMAGES` (which is
         * defined as `16`).
         * 
         * This means that technically there will always be 16 `image_hdr`
         * entries, the first *n* entries being used (filled with real values)
         * and the rest left unused with all bytes zero.
         * 
         * To check if an entry is used, use the `is_used` attribute.
         */
        public List<ImageHdrEntry> entries() { return entries; }
        public void setEntries(List<ImageHdrEntry> _v) { _dirty = true; entries = _v; }
        public AndroidBootldrHuawei _root() { return _root; }
        public void set_root(AndroidBootldrHuawei _v) { _dirty = true; _root = _v; }
        public AndroidBootldrHuawei _parent() { return _parent; }
        public void set_parent(AndroidBootldrHuawei _v) { _dirty = true; _parent = _v; }
    }
    public static class ImageHdrEntry extends KaitaiStruct.ReadWrite {
        public static ImageHdrEntry fromFile(String fileName) throws IOException {
            return new ImageHdrEntry(new ByteBufferKaitaiStream(fileName));
        }
        public ImageHdrEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(72), (byte) 0, false), StandardCharsets.US_ASCII);
            this.ofsBody = this._io.readU4le();
            this.lenBody = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 72, (byte) 0, (byte) 0);
            this._io.writeU4le(this.ofsBody);
            this._io.writeU4le(this.lenBody);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 72)
                throw new ConsistencyError("name", 72, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (_enabledBody) {
                if (isUsed()) {
                    if (this.body.length != lenBody())
                        throw new ConsistencyError("body", lenBody(), this.body.length);
                }
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            if (isUsed()) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsBody());
                this.body = io.readBytes(lenBody());
                io.seek(_pos);
            }
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            if (isUsed()) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsBody());
                io.writeBytes(this.body);
                io.seek(_pos);
            }
        }
        private Boolean isUsed;

        /**
         * @see <a href="https://source.codeaurora.org/quic/la/device/qcom/common/tree/meta_image/meta_image.c?h=LA.UM.6.1.1&amp;id=a68d284aee85#n119">Source</a>
         */
        public Boolean isUsed() {
            if (this.isUsed != null)
                return this.isUsed;
            this.isUsed =  ((ofsBody() != 0) && (lenBody() != 0)) ;
            return this.isUsed;
        }
        public void _invalidateIsUsed() { this.isUsed = null; }
        private String name;
        private long ofsBody;
        private long lenBody;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei.ImageHdr _parent;

        /**
         * partition name
         */
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long ofsBody() { return ofsBody; }
        public void setOfsBody(long _v) { _dirty = true; ofsBody = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public AndroidBootldrHuawei _root() { return _root; }
        public void set_root(AndroidBootldrHuawei _v) { _dirty = true; _root = _v; }
        public AndroidBootldrHuawei.ImageHdr _parent() { return _parent; }
        public void set_parent(AndroidBootldrHuawei.ImageHdr _v) { _dirty = true; _parent = _v; }
    }
    public static class MetaHdr extends KaitaiStruct.ReadWrite {
        public static MetaHdr fromFile(String fileName) throws IOException {
            return new MetaHdr(new ByteBufferKaitaiStream(fileName));
        }
        public MetaHdr() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { 60, -42, 26, -50 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 60, -42, 26, -50 }, this.magic, this._io, "/types/meta_hdr/seq/0");
            }
            this.version = new Version(this._io, this, _root);
            this.version._read();
            this.imageVersion = new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), StandardCharsets.US_ASCII);
            this.lenMetaHeader = this._io.readU2le();
            this.lenImageHeader = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.version._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this.version._write_Seq(this._io);
            this._io.writeBytesLimit((this.imageVersion).getBytes(Charset.forName("ASCII")), 64, (byte) 0, (byte) 0);
            this._io.writeU2le(this.lenMetaHeader);
            this._io.writeU2le(this.lenImageHeader);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 60, -42, 26, -50 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 60, -42, 26, -50 }, this.magic, null, "/types/meta_hdr/seq/0");
            }
            if (!Objects.equals(this.version._root(), _root()))
                throw new ConsistencyError("version", _root(), this.version._root());
            if (!Objects.equals(this.version._parent(), this))
                throw new ConsistencyError("version", this, this.version._parent());
            if ((this.imageVersion).getBytes(Charset.forName("ASCII")).length > 64)
                throw new ConsistencyError("image_version", 64, (this.imageVersion).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.imageVersion).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("image_version", -1, KaitaiStream.byteArrayIndexOf((this.imageVersion).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private byte[] magic;
        private Version version;
        private String imageVersion;
        private int lenMetaHeader;
        private int lenImageHeader;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public Version version() { return version; }
        public void setVersion(Version _v) { _dirty = true; version = _v; }
        public String imageVersion() { return imageVersion; }
        public void setImageVersion(String _v) { _dirty = true; imageVersion = _v; }
        public int lenMetaHeader() { return lenMetaHeader; }
        public void setLenMetaHeader(int _v) { _dirty = true; lenMetaHeader = _v; }
        public int lenImageHeader() { return lenImageHeader; }
        public void setLenImageHeader(int _v) { _dirty = true; lenImageHeader = _v; }
        public AndroidBootldrHuawei _root() { return _root; }
        public void set_root(AndroidBootldrHuawei _v) { _dirty = true; _root = _v; }
        public AndroidBootldrHuawei _parent() { return _parent; }
        public void set_parent(AndroidBootldrHuawei _v) { _dirty = true; _parent = _v; }
    }
    public static class Version extends KaitaiStruct.ReadWrite {
        public static Version fromFile(String fileName) throws IOException {
            return new Version(new ByteBufferKaitaiStream(fileName));
        }
        public Version() {
            this(null, null, null);
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
        }
        public void _read() {
            this.major = this._io.readU2le();
            this.minor = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.major);
            this._io.writeU2le(this.minor);
        }

        public void _check() {
            _dirty = false;
        }
        private int major;
        private int minor;
        private AndroidBootldrHuawei _root;
        private AndroidBootldrHuawei.MetaHdr _parent;
        public int major() { return major; }
        public void setMajor(int _v) { _dirty = true; major = _v; }
        public int minor() { return minor; }
        public void setMinor(int _v) { _dirty = true; minor = _v; }
        public AndroidBootldrHuawei _root() { return _root; }
        public void set_root(AndroidBootldrHuawei _v) { _dirty = true; _root = _v; }
        public AndroidBootldrHuawei.MetaHdr _parent() { return _parent; }
        public void set_parent(AndroidBootldrHuawei.MetaHdr _v) { _dirty = true; _parent = _v; }
    }
    private MetaHdr metaHeader;
    private byte[] headerExt;
    private ImageHdr imageHeader;
    private AndroidBootldrHuawei _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_imageHeader;
    public MetaHdr metaHeader() { return metaHeader; }
    public void setMetaHeader(MetaHdr _v) { _dirty = true; metaHeader = _v; }
    public byte[] headerExt() { return headerExt; }
    public void setHeaderExt(byte[] _v) { _dirty = true; headerExt = _v; }
    public ImageHdr imageHeader() { return imageHeader; }
    public void setImageHeader(ImageHdr _v) { _dirty = true; imageHeader = _v; }
    public AndroidBootldrHuawei _root() { return _root; }
    public void set_root(AndroidBootldrHuawei _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_imageHeader() { return _raw_imageHeader; }
    public void set_raw_ImageHeader(byte[] _v) { _dirty = true; _raw_imageHeader = _v; }
}
