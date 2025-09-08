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
 * A bootloader for Android used on various devices powered by Qualcomm
 * Snapdragon chips:
 * 
 * <https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors>
 * 
 * Although not all of the Snapdragon based Android devices use this particular
 * bootloader format, it is known that devices with the following chips have used
 * it (example devices are given for each chip):
 * 
 * * APQ8064 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_S4_Pro))
 *   - Nexus 4 "mako": [sample][sample-mako] ([other samples][others-mako]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/mako/+/33f0114/releasetools.py#98)
 * 
 * * MSM8974AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
 *   - Nexus 5 "hammerhead": [sample][sample-hammerhead] ([other samples][others-hammerhead]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#116)
 * 
 * * MSM8992 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
 *   - Nexus 5X "bullhead": [sample][sample-bullhead] ([other samples][others-bullhead]),
 *     [releasetools.py](https://android.googlesource.com/device/lge/bullhead/+/2994b6b/releasetools.py#126)
 * 
 * * APQ8064-1AA ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_600_(2013)))
 *   - Nexus 7 \[2013] (Mobile) "deb" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-deb] ([other samples][others-deb]),
 *     [releasetools.py](https://android.googlesource.com/device/asus/deb/+/14c1638/releasetools.py#105)
 *   - Nexus 7 \[2013] (Wi-Fi) "flo" <a href="#doc-note-data-after-img-bodies">(\**)</a>: [sample][sample-flo] ([other samples][others-flo]),
 *     [releasetools.py](https://android.googlesource.com/device/asus/flo/+/9d9fee9/releasetools.py#130)
 * 
 * * MSM8996 Pro-AB ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_820_and_821_(2016)))
 *   - Pixel "sailfish" <a href="#doc-note-bootloader-size">(\*)</a>:
 *     [sample][sample-sailfish] ([other samples][others-sailfish])
 *   - Pixel XL "marlin" <a href="#doc-note-bootloader-size">(\*)</a>:
 *     [sample][sample-marlin] ([other samples][others-marlin])
 * 
 * * MSM8998 ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_835_(2017)))
 *   - Pixel 2 "walleye" <a href="#doc-note-bootloader-size">(\*)</a>: [sample][sample-walleye] ([other samples][others-walleye])
 *   - Pixel 2 XL "taimen": [sample][sample-taimen] ([other samples][others-taimen])
 * 
 * <small id="doc-note-bootloader-size">(\*)
 * `bootloader_size` is equal to the size of the whole file (not just `img_bodies` as usual).
 * </small>
 * 
 * <small id="doc-note-data-after-img-bodies">(\**)
 * There are some data after the end of `img_bodies`.
 * </small>
 * 
 * ---
 * 
 * On the other hand, devices with these chips **do not** use this format:
 * 
 * * <del>APQ8084</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_800,_801_and_805_(2013/14)))
 *   - Nexus 6 "shamu": [sample][foreign-sample-shamu] ([other samples][foreign-others-shamu]),
 *     [releasetools.py](https://android.googlesource.com/device/moto/shamu/+/df9354d/releasetools.py#12) -
 *     uses "Motoboot packed image format" instead
 * 
 * * <del>MSM8994</del> ([devices](https://en.wikipedia.org/wiki/Devices_using_Qualcomm_Snapdragon_processors#Snapdragon_808_and_810_(2015)))
 *   - Nexus 6P "angler": [sample][foreign-sample-angler] ([other samples][foreign-others-angler]),
 *     [releasetools.py](https://android.googlesource.com/device/huawei/angler/+/cf92cd8/releasetools.py#29) -
 *     uses "Huawei Bootloader packed image format" instead
 * 
 * [sample-mako]: https://androidfilehost.com/?fid=96039337900113996 "bootloader-mako-makoz30f.img"
 * [others-mako]: https://androidfilehost.com/?w=search&s=bootloader-mako&type=files
 * 
 * [sample-hammerhead]: https://androidfilehost.com/?fid=385035244224410247 "bootloader-hammerhead-hhz20h.img"
 * [others-hammerhead]: https://androidfilehost.com/?w=search&s=bootloader-hammerhead&type=files
 * 
 * [sample-bullhead]: https://androidfilehost.com/?fid=11410963190603870177 "bootloader-bullhead-bhz32c.img"
 * [others-bullhead]: https://androidfilehost.com/?w=search&s=bootloader-bullhead&type=files
 * 
 * [sample-deb]: https://androidfilehost.com/?fid=23501681358552487 "bootloader-deb-flo-04.02.img"
 * [others-deb]: https://androidfilehost.com/?w=search&s=bootloader-deb-flo&type=files
 * 
 * [sample-flo]: https://androidfilehost.com/?fid=23991606952593542 "bootloader-flo-flo-04.05.img"
 * [others-flo]: https://androidfilehost.com/?w=search&s=bootloader-flo-flo&type=files
 * 
 * [sample-sailfish]: https://androidfilehost.com/?fid=6006931924117907154 "bootloader-sailfish-8996-012001-1904111134.img"
 * [others-sailfish]: https://androidfilehost.com/?w=search&s=bootloader-sailfish&type=files
 * 
 * [sample-marlin]: https://androidfilehost.com/?fid=6006931924117907131 "bootloader-marlin-8996-012001-1904111134.img"
 * [others-marlin]: https://androidfilehost.com/?w=search&s=bootloader-marlin&type=files
 * 
 * [sample-walleye]: https://androidfilehost.com/?fid=14943124697586348540 "bootloader-walleye-mw8998-003.0085.00.img"
 * [others-walleye]: https://androidfilehost.com/?w=search&s=bootloader-walleye&type=files
 * 
 * [sample-taimen]: https://androidfilehost.com/?fid=14943124697586348536 "bootloader-taimen-tmz30m.img"
 * [others-taimen]: https://androidfilehost.com/?w=search&s=bootloader-taimen&type=files
 * 
 * [foreign-sample-shamu]: https://androidfilehost.com/?fid=745849072291678307 "bootloader-shamu-moto-apq8084-72.04.img"
 * [foreign-others-shamu]: https://androidfilehost.com/?w=search&s=bootloader-shamu&type=files
 * 
 * [foreign-sample-angler]: https://androidfilehost.com/?fid=11410963190603870158 "bootloader-angler-angler-03.84.img"
 * [foreign-others-angler]: https://androidfilehost.com/?w=search&s=bootloader-angler&type=files
 * 
 * ---
 * 
 * The `bootloader-*.img` samples referenced above originally come from factory
 * images packed in ZIP archives that can be found on the page [Factory Images
 * for Nexus and Pixel Devices](https://developers.google.com/android/images) on
 * the Google Developers site. Note that the codenames on that page may be
 * different than the ones that are written in the list above. That's because the
 * Google page indicates **ROM codenames** in headings (e.g. "occam" for Nexus 4)
 * but the above list uses **model codenames** (e.g. "mako" for Nexus 4) because
 * that is how the original `bootloader-*.img` files are identified. For most
 * devices, however, these code names are the same.
 * @see <a href="https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py">Source</a>
 */
public class AndroidBootldrQcom extends KaitaiStruct.ReadWrite {
    public static AndroidBootldrQcom fromFile(String fileName) throws IOException {
        return new AndroidBootldrQcom(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidBootldrQcom() {
        this(null, null, null);
    }

    public AndroidBootldrQcom(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidBootldrQcom(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidBootldrQcom(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidBootldrQcom _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(8);
        if (!(Arrays.equals(this.magic, new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }, this.magic, this._io, "/seq/0");
        }
        this.numImages = this._io.readU4le();
        this.ofsImgBodies = this._io.readU4le();
        this.bootloaderSize = this._io.readU4le();
        this.imgHeaders = new ArrayList<ImgHeader>();
        for (int i = 0; i < numImages(); i++) {
            ImgHeader _t_imgHeaders = new ImgHeader(this._io, this, _root);
            try {
                _t_imgHeaders._read();
            } finally {
                this.imgHeaders.add(_t_imgHeaders);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.imgHeaders.size(); i++) {
            this.imgHeaders.get(((Number) (i)).intValue())._fetchInstances();
        }
        imgBodies();
        if (this.imgBodies != null) {
            for (int i = 0; i < this.imgBodies.size(); i++) {
                this.imgBodies.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteImgBodies = _enabledImgBodies;
        this._io.writeBytes(this.magic);
        this._io.writeU4le(this.numImages);
        this._io.writeU4le(this.ofsImgBodies);
        this._io.writeU4le(this.bootloaderSize);
        for (int i = 0; i < this.imgHeaders.size(); i++) {
            this.imgHeaders.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 8)
            throw new ConsistencyError("magic", 8, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 79, 79, 84, 76, 68, 82, 33 }, this.magic, null, "/seq/0");
        }
        if (this.imgHeaders.size() != numImages())
            throw new ConsistencyError("img_headers", numImages(), this.imgHeaders.size());
        for (int i = 0; i < this.imgHeaders.size(); i++) {
            if (!Objects.equals(this.imgHeaders.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("img_headers", _root(), this.imgHeaders.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.imgHeaders.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("img_headers", this, this.imgHeaders.get(((Number) (i)).intValue())._parent());
        }
        if (_enabledImgBodies) {
            if (this.imgBodies.size() != numImages())
                throw new ConsistencyError("img_bodies", numImages(), this.imgBodies.size());
            for (int i = 0; i < this.imgBodies.size(); i++) {
                if (!Objects.equals(this.imgBodies.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("img_bodies", _root(), this.imgBodies.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.imgBodies.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("img_bodies", this, this.imgBodies.get(((Number) (i)).intValue())._parent());
                if (this.imgBodies.get(((Number) (i)).intValue()).idx() != i)
                    throw new ConsistencyError("img_bodies", i, this.imgBodies.get(((Number) (i)).intValue()).idx());
            }
        }
        _dirty = false;
    }
    public static class ImgBody extends KaitaiStruct.ReadWrite {
        public ImgBody(int idx) {
            this(null, null, null, idx);
        }

        public ImgBody(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public ImgBody(KaitaiStream _io, AndroidBootldrQcom _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public ImgBody(KaitaiStream _io, AndroidBootldrQcom _parent, AndroidBootldrQcom _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
        }
        public void _read() {
            this.body = this._io.readBytes(imgHeader().lenBody());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.body);
        }

        public void _check() {
            if (this.body.length != imgHeader().lenBody())
                throw new ConsistencyError("body", imgHeader().lenBody(), this.body.length);
            _dirty = false;
        }
        private ImgHeader imgHeader;
        public ImgHeader imgHeader() {
            if (this.imgHeader != null)
                return this.imgHeader;
            this.imgHeader = _root().imgHeaders().get(((Number) (idx())).intValue());
            return this.imgHeader;
        }
        public void _invalidateImgHeader() { this.imgHeader = null; }
        private byte[] body;
        private int idx;
        private AndroidBootldrQcom _root;
        private AndroidBootldrQcom _parent;
        public byte[] body() { return body; }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public int idx() { return idx; }
        public void setIdx(int _v) { _dirty = true; idx = _v; }
        public AndroidBootldrQcom _root() { return _root; }
        public void set_root(AndroidBootldrQcom _v) { _dirty = true; _root = _v; }
        public AndroidBootldrQcom _parent() { return _parent; }
        public void set_parent(AndroidBootldrQcom _v) { _dirty = true; _parent = _v; }
    }
    public static class ImgHeader extends KaitaiStruct.ReadWrite {
        public static ImgHeader fromFile(String fileName) throws IOException {
            return new ImgHeader(new ByteBufferKaitaiStream(fileName));
        }
        public ImgHeader() {
            this(null, null, null);
        }

        public ImgHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImgHeader(KaitaiStream _io, AndroidBootldrQcom _parent) {
            this(_io, _parent, null);
        }

        public ImgHeader(KaitaiStream _io, AndroidBootldrQcom _parent, AndroidBootldrQcom _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), StandardCharsets.US_ASCII);
            this.lenBody = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("ASCII")), 64, (byte) 0, (byte) 0);
            this._io.writeU4le(this.lenBody);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("ASCII")).length > 64)
                throw new ConsistencyError("name", 64, (this.name).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            _dirty = false;
        }
        private String name;
        private long lenBody;
        private AndroidBootldrQcom _root;
        private AndroidBootldrQcom _parent;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public AndroidBootldrQcom _root() { return _root; }
        public void set_root(AndroidBootldrQcom _v) { _dirty = true; _root = _v; }
        public AndroidBootldrQcom _parent() { return _parent; }
        public void set_parent(AndroidBootldrQcom _v) { _dirty = true; _parent = _v; }
    }
    private List<ImgBody> imgBodies;
    private boolean _shouldWriteImgBodies = false;
    private boolean _enabledImgBodies = true;
    public List<ImgBody> imgBodies() {
        if (_shouldWriteImgBodies)
            _writeImgBodies();
        if (this.imgBodies != null)
            return this.imgBodies;
        if (!_enabledImgBodies)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsImgBodies());
        this.imgBodies = new ArrayList<ImgBody>();
        for (int i = 0; i < numImages(); i++) {
            ImgBody _t_imgBodies = new ImgBody(this._io, this, _root, i);
            try {
                _t_imgBodies._read();
            } finally {
                this.imgBodies.add(_t_imgBodies);
            }
        }
        this._io.seek(_pos);
        return this.imgBodies;
    }
    public void setImgBodies(List<ImgBody> _v) { _dirty = true; imgBodies = _v; }
    public void setImgBodies_Enabled(boolean _v) { _dirty = true; _enabledImgBodies = _v; }

    private void _writeImgBodies() {
        _shouldWriteImgBodies = false;
        long _pos = this._io.pos();
        this._io.seek(ofsImgBodies());
        for (int i = 0; i < this.imgBodies.size(); i++) {
            this.imgBodies.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.seek(_pos);
    }
    private byte[] magic;
    private long numImages;
    private long ofsImgBodies;
    private long bootloaderSize;
    private List<ImgHeader> imgHeaders;
    private AndroidBootldrQcom _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public long numImages() { return numImages; }
    public void setNumImages(long _v) { _dirty = true; numImages = _v; }
    public long ofsImgBodies() { return ofsImgBodies; }
    public void setOfsImgBodies(long _v) { _dirty = true; ofsImgBodies = _v; }

    /**
     * According to all available `releasetools.py` versions from AOSP (links are
     * in the top-level `/doc`), this should determine only the size of
     * `img_bodies` - there is [an assertion](
     * https://android.googlesource.com/device/lge/hammerhead/+/7618a7d/releasetools.py#167)
     * for it.
     * 
     * However, files for certain Pixel devices (see `/doc`) apparently declare
     * the entire file size here (i.e. including also fields from `magic` to
     * `img_headers`). So if you interpreted `bootloader_size` as the size of
     * `img_bodies` substream in these files, you would exceed the end of file.
     * Although you could check that it fits in the file before attempting to
     * create a substream of that size, you wouldn't know if it's meant to
     * specify the size of just `img_bodies` or the size of the entire bootloader
     * payload (whereas there may be additional data after the end of payload)
     * until parsing `img_bodies` (or at least summing sizes from `img_headers`,
     * but that's stupid).
     * 
     * So this field isn't reliable enough to be used as the size of any
     * substream. If you want to check if it has a reasonable value, do so in
     * your application code.
     */
    public long bootloaderSize() { return bootloaderSize; }
    public void setBootloaderSize(long _v) { _dirty = true; bootloaderSize = _v; }
    public List<ImgHeader> imgHeaders() { return imgHeaders; }
    public void setImgHeaders(List<ImgHeader> _v) { _dirty = true; imgHeaders = _v; }
    public AndroidBootldrQcom _root() { return _root; }
    public void set_root(AndroidBootldrQcom _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
