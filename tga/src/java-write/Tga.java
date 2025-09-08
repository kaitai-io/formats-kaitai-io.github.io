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
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Arrays;


/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * @see <a href="https://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf">Source</a>
 */
public class Tga extends KaitaiStruct.ReadWrite {
    public static Tga fromFile(String fileName) throws IOException {
        return new Tga(new ByteBufferKaitaiStream(fileName));
    }

    public enum ColorMapEnum {
        NO_COLOR_MAP(0),
        HAS_COLOR_MAP(1);

        private final long id;
        ColorMapEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ColorMapEnum> byId = new HashMap<Long, ColorMapEnum>(2);
        static {
            for (ColorMapEnum e : ColorMapEnum.values())
                byId.put(e.id(), e);
        }
        public static ColorMapEnum byId(long id) { return byId.get(id); }
    }

    public enum ImageTypeEnum {
        NO_IMAGE_DATA(0),
        UNCOMP_COLOR_MAPPED(1),
        UNCOMP_TRUE_COLOR(2),
        UNCOMP_BW(3),
        RLE_COLOR_MAPPED(9),
        RLE_TRUE_COLOR(10),
        RLE_BW(11);

        private final long id;
        ImageTypeEnum(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ImageTypeEnum> byId = new HashMap<Long, ImageTypeEnum>(7);
        static {
            for (ImageTypeEnum e : ImageTypeEnum.values())
                byId.put(e.id(), e);
        }
        public static ImageTypeEnum byId(long id) { return byId.get(id); }
    }
    public Tga() {
        this(null, null, null);
    }

    public Tga(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Tga(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Tga(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Tga _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.imageIdLen = this._io.readU1();
        this.colorMapType = ColorMapEnum.byId(this._io.readU1());
        this.imageType = ImageTypeEnum.byId(this._io.readU1());
        this.colorMapOfs = this._io.readU2le();
        this.numColorMap = this._io.readU2le();
        this.colorMapDepth = this._io.readU1();
        this.xOffset = this._io.readU2le();
        this.yOffset = this._io.readU2le();
        this.width = this._io.readU2le();
        this.height = this._io.readU2le();
        this.imageDepth = this._io.readU1();
        this.imgDescriptor = this._io.readU1();
        this.imageId = this._io.readBytes(imageIdLen());
        if (colorMapType() == ColorMapEnum.HAS_COLOR_MAP) {
            this.colorMap = new ArrayList<byte[]>();
            for (int i = 0; i < numColorMap(); i++) {
                this.colorMap.add(this._io.readBytes((colorMapDepth() + 7) / 8));
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        if (colorMapType() == ColorMapEnum.HAS_COLOR_MAP) {
            for (int i = 0; i < this.colorMap.size(); i++) {
            }
        }
        footer();
        if (this.footer != null) {
            this.footer._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFooter = _enabledFooter;
        this._io.writeU1(this.imageIdLen);
        this._io.writeU1(((Number) (this.colorMapType.id())).intValue());
        this._io.writeU1(((Number) (this.imageType.id())).intValue());
        this._io.writeU2le(this.colorMapOfs);
        this._io.writeU2le(this.numColorMap);
        this._io.writeU1(this.colorMapDepth);
        this._io.writeU2le(this.xOffset);
        this._io.writeU2le(this.yOffset);
        this._io.writeU2le(this.width);
        this._io.writeU2le(this.height);
        this._io.writeU1(this.imageDepth);
        this._io.writeU1(this.imgDescriptor);
        this._io.writeBytes(this.imageId);
        if (colorMapType() == ColorMapEnum.HAS_COLOR_MAP) {
            for (int i = 0; i < this.colorMap.size(); i++) {
                this._io.writeBytes(this.colorMap.get(((Number) (i)).intValue()));
            }
        }
    }

    public void _check() {
        if (this.imageId.length != imageIdLen())
            throw new ConsistencyError("image_id", imageIdLen(), this.imageId.length);
        if (colorMapType() == ColorMapEnum.HAS_COLOR_MAP) {
            if (this.colorMap.size() != numColorMap())
                throw new ConsistencyError("color_map", numColorMap(), this.colorMap.size());
            for (int i = 0; i < this.colorMap.size(); i++) {
                if (this.colorMap.get(((Number) (i)).intValue()).length != (colorMapDepth() + 7) / 8)
                    throw new ConsistencyError("color_map", (colorMapDepth() + 7) / 8, this.colorMap.get(((Number) (i)).intValue()).length);
            }
        }
        if (_enabledFooter) {
            if (!Objects.equals(this.footer._root(), _root()))
                throw new ConsistencyError("footer", _root(), this.footer._root());
            if (!Objects.equals(this.footer._parent(), this))
                throw new ConsistencyError("footer", this, this.footer._parent());
        }
        _dirty = false;
    }
    public static class TgaExtArea extends KaitaiStruct.ReadWrite {
        public static TgaExtArea fromFile(String fileName) throws IOException {
            return new TgaExtArea(new ByteBufferKaitaiStream(fileName));
        }
        public TgaExtArea() {
            this(null, null, null);
        }

        public TgaExtArea(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TgaExtArea(KaitaiStream _io, Tga.TgaFooter _parent) {
            this(_io, _parent, null);
        }

        public TgaExtArea(KaitaiStream _io, Tga.TgaFooter _parent, Tga _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.extAreaSize = this._io.readU2le();
            this.authorName = new String(this._io.readBytes(41), StandardCharsets.US_ASCII);
            this.comments = new ArrayList<String>();
            for (int i = 0; i < 4; i++) {
                this.comments.add(new String(this._io.readBytes(81), StandardCharsets.US_ASCII));
            }
            this.timestamp = this._io.readBytes(12);
            this.jobId = new String(this._io.readBytes(41), StandardCharsets.US_ASCII);
            this.jobTime = new String(this._io.readBytes(6), StandardCharsets.US_ASCII);
            this.softwareId = new String(this._io.readBytes(41), StandardCharsets.US_ASCII);
            this.softwareVersion = this._io.readBytes(3);
            this.keyColor = this._io.readU4le();
            this.pixelAspectRatio = this._io.readU4le();
            this.gammaValue = this._io.readU4le();
            this.colorCorrOfs = this._io.readU4le();
            this.postageStampOfs = this._io.readU4le();
            this.scanLineOfs = this._io.readU4le();
            this.attributes = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.comments.size(); i++) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.extAreaSize);
            this._io.writeBytes((this.authorName).getBytes(Charset.forName("ASCII")));
            for (int i = 0; i < this.comments.size(); i++) {
                this._io.writeBytes((this.comments.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")));
            }
            this._io.writeBytes(this.timestamp);
            this._io.writeBytes((this.jobId).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.jobTime).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes((this.softwareId).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes(this.softwareVersion);
            this._io.writeU4le(this.keyColor);
            this._io.writeU4le(this.pixelAspectRatio);
            this._io.writeU4le(this.gammaValue);
            this._io.writeU4le(this.colorCorrOfs);
            this._io.writeU4le(this.postageStampOfs);
            this._io.writeU4le(this.scanLineOfs);
            this._io.writeU1(this.attributes);
        }

        public void _check() {
            if ((this.authorName).getBytes(Charset.forName("ASCII")).length != 41)
                throw new ConsistencyError("author_name", 41, (this.authorName).getBytes(Charset.forName("ASCII")).length);
            if (this.comments.size() != 4)
                throw new ConsistencyError("comments", 4, this.comments.size());
            for (int i = 0; i < this.comments.size(); i++) {
                if ((this.comments.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length != 81)
                    throw new ConsistencyError("comments", 81, (this.comments.get(((Number) (i)).intValue())).getBytes(Charset.forName("ASCII")).length);
            }
            if (this.timestamp.length != 12)
                throw new ConsistencyError("timestamp", 12, this.timestamp.length);
            if ((this.jobId).getBytes(Charset.forName("ASCII")).length != 41)
                throw new ConsistencyError("job_id", 41, (this.jobId).getBytes(Charset.forName("ASCII")).length);
            if ((this.jobTime).getBytes(Charset.forName("ASCII")).length != 6)
                throw new ConsistencyError("job_time", 6, (this.jobTime).getBytes(Charset.forName("ASCII")).length);
            if ((this.softwareId).getBytes(Charset.forName("ASCII")).length != 41)
                throw new ConsistencyError("software_id", 41, (this.softwareId).getBytes(Charset.forName("ASCII")).length);
            if (this.softwareVersion.length != 3)
                throw new ConsistencyError("software_version", 3, this.softwareVersion.length);
            _dirty = false;
        }
        private int extAreaSize;
        private String authorName;
        private List<String> comments;
        private byte[] timestamp;
        private String jobId;
        private String jobTime;
        private String softwareId;
        private byte[] softwareVersion;
        private long keyColor;
        private long pixelAspectRatio;
        private long gammaValue;
        private long colorCorrOfs;
        private long postageStampOfs;
        private long scanLineOfs;
        private int attributes;
        private Tga _root;
        private Tga.TgaFooter _parent;

        /**
         * Extension area size in bytes (always 495)
         */
        public int extAreaSize() { return extAreaSize; }
        public void setExtAreaSize(int _v) { _dirty = true; extAreaSize = _v; }
        public String authorName() { return authorName; }
        public void setAuthorName(String _v) { _dirty = true; authorName = _v; }

        /**
         * Comments, organized as four lines, each consisting of 80 characters plus a NULL
         */
        public List<String> comments() { return comments; }
        public void setComments(List<String> _v) { _dirty = true; comments = _v; }

        /**
         * Image creation date / time
         */
        public byte[] timestamp() { return timestamp; }
        public void setTimestamp(byte[] _v) { _dirty = true; timestamp = _v; }

        /**
         * Internal job ID, to be used in image workflow systems
         */
        public String jobId() { return jobId; }
        public void setJobId(String _v) { _dirty = true; jobId = _v; }

        /**
         * Hours, minutes and seconds spent creating the file (for billing, etc.)
         */
        public String jobTime() { return jobTime; }
        public void setJobTime(String _v) { _dirty = true; jobTime = _v; }

        /**
         * The application that created the file.
         */
        public String softwareId() { return softwareId; }
        public void setSoftwareId(String _v) { _dirty = true; softwareId = _v; }
        public byte[] softwareVersion() { return softwareVersion; }
        public void setSoftwareVersion(byte[] _v) { _dirty = true; softwareVersion = _v; }
        public long keyColor() { return keyColor; }
        public void setKeyColor(long _v) { _dirty = true; keyColor = _v; }
        public long pixelAspectRatio() { return pixelAspectRatio; }
        public void setPixelAspectRatio(long _v) { _dirty = true; pixelAspectRatio = _v; }
        public long gammaValue() { return gammaValue; }
        public void setGammaValue(long _v) { _dirty = true; gammaValue = _v; }

        /**
         * Number of bytes from the beginning of the file to the color correction table if present
         */
        public long colorCorrOfs() { return colorCorrOfs; }
        public void setColorCorrOfs(long _v) { _dirty = true; colorCorrOfs = _v; }

        /**
         * Number of bytes from the beginning of the file to the postage stamp image if present
         */
        public long postageStampOfs() { return postageStampOfs; }
        public void setPostageStampOfs(long _v) { _dirty = true; postageStampOfs = _v; }

        /**
         * Number of bytes from the beginning of the file to the scan lines table if present
         */
        public long scanLineOfs() { return scanLineOfs; }
        public void setScanLineOfs(long _v) { _dirty = true; scanLineOfs = _v; }

        /**
         * Specifies the alpha channel
         */
        public int attributes() { return attributes; }
        public void setAttributes(int _v) { _dirty = true; attributes = _v; }
        public Tga _root() { return _root; }
        public void set_root(Tga _v) { _dirty = true; _root = _v; }
        public Tga.TgaFooter _parent() { return _parent; }
        public void set_parent(Tga.TgaFooter _v) { _dirty = true; _parent = _v; }
    }
    public static class TgaFooter extends KaitaiStruct.ReadWrite {
        public static TgaFooter fromFile(String fileName) throws IOException {
            return new TgaFooter(new ByteBufferKaitaiStream(fileName));
        }
        public TgaFooter() {
            this(null, null, null);
        }

        public TgaFooter(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TgaFooter(KaitaiStream _io, Tga _parent) {
            this(_io, _parent, null);
        }

        public TgaFooter(KaitaiStream _io, Tga _parent, Tga _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.extAreaOfs = this._io.readU4le();
            this.devDirOfs = this._io.readU4le();
            this.versionMagic = this._io.readBytes(18);
            _dirty = false;
        }

        public void _fetchInstances() {
            extArea();
            if (this.extArea != null) {
                this.extArea._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteExtArea = _enabledExtArea;
            this._io.writeU4le(this.extAreaOfs);
            this._io.writeU4le(this.devDirOfs);
            this._io.writeBytes(this.versionMagic);
        }

        public void _check() {
            if (this.versionMagic.length != 18)
                throw new ConsistencyError("version_magic", 18, this.versionMagic.length);
            if (_enabledExtArea) {
                if (isValid()) {
                    if (!Objects.equals(this.extArea._root(), _root()))
                        throw new ConsistencyError("ext_area", _root(), this.extArea._root());
                    if (!Objects.equals(this.extArea._parent(), this))
                        throw new ConsistencyError("ext_area", this, this.extArea._parent());
                }
            }
            _dirty = false;
        }
        private TgaExtArea extArea;
        private boolean _shouldWriteExtArea = false;
        private boolean _enabledExtArea = true;
        public TgaExtArea extArea() {
            if (_shouldWriteExtArea)
                _writeExtArea();
            if (this.extArea != null)
                return this.extArea;
            if (!_enabledExtArea)
                return null;
            if (isValid()) {
                long _pos = this._io.pos();
                this._io.seek(extAreaOfs());
                this.extArea = new TgaExtArea(this._io, this, _root);
                this.extArea._read();
                this._io.seek(_pos);
            }
            return this.extArea;
        }
        public void setExtArea(TgaExtArea _v) { _dirty = true; extArea = _v; }
        public void setExtArea_Enabled(boolean _v) { _dirty = true; _enabledExtArea = _v; }

        private void _writeExtArea() {
            _shouldWriteExtArea = false;
            if (isValid()) {
                long _pos = this._io.pos();
                this._io.seek(extAreaOfs());
                this.extArea._write_Seq(this._io);
                this._io.seek(_pos);
            }
        }
        private Boolean isValid;
        public Boolean isValid() {
            if (this.isValid != null)
                return this.isValid;
            this.isValid = Arrays.equals(versionMagic(), new byte[] { 84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0 });
            return this.isValid;
        }
        public void _invalidateIsValid() { this.isValid = null; }
        private long extAreaOfs;
        private long devDirOfs;
        private byte[] versionMagic;
        private Tga _root;
        private Tga _parent;

        /**
         * Offset to extension area
         */
        public long extAreaOfs() { return extAreaOfs; }
        public void setExtAreaOfs(long _v) { _dirty = true; extAreaOfs = _v; }

        /**
         * Offset to developer directory
         */
        public long devDirOfs() { return devDirOfs; }
        public void setDevDirOfs(long _v) { _dirty = true; devDirOfs = _v; }
        public byte[] versionMagic() { return versionMagic; }
        public void setVersionMagic(byte[] _v) { _dirty = true; versionMagic = _v; }
        public Tga _root() { return _root; }
        public void set_root(Tga _v) { _dirty = true; _root = _v; }
        public Tga _parent() { return _parent; }
        public void set_parent(Tga _v) { _dirty = true; _parent = _v; }
    }
    private TgaFooter footer;
    private boolean _shouldWriteFooter = false;
    private boolean _enabledFooter = true;
    public TgaFooter footer() {
        if (_shouldWriteFooter)
            _writeFooter();
        if (this.footer != null)
            return this.footer;
        if (!_enabledFooter)
            return null;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 26);
        this.footer = new TgaFooter(this._io, this, _root);
        this.footer._read();
        this._io.seek(_pos);
        return this.footer;
    }
    public void setFooter(TgaFooter _v) { _dirty = true; footer = _v; }
    public void setFooter_Enabled(boolean _v) { _dirty = true; _enabledFooter = _v; }

    private void _writeFooter() {
        _shouldWriteFooter = false;
        long _pos = this._io.pos();
        this._io.seek(_io().size() - 26);
        this.footer._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private int imageIdLen;
    private ColorMapEnum colorMapType;
    private ImageTypeEnum imageType;
    private int colorMapOfs;
    private int numColorMap;
    private int colorMapDepth;
    private int xOffset;
    private int yOffset;
    private int width;
    private int height;
    private int imageDepth;
    private int imgDescriptor;
    private byte[] imageId;
    private List<byte[]> colorMap;
    private Tga _root;
    private KaitaiStruct.ReadWrite _parent;
    public int imageIdLen() { return imageIdLen; }
    public void setImageIdLen(int _v) { _dirty = true; imageIdLen = _v; }
    public ColorMapEnum colorMapType() { return colorMapType; }
    public void setColorMapType(ColorMapEnum _v) { _dirty = true; colorMapType = _v; }
    public ImageTypeEnum imageType() { return imageType; }
    public void setImageType(ImageTypeEnum _v) { _dirty = true; imageType = _v; }
    public int colorMapOfs() { return colorMapOfs; }
    public void setColorMapOfs(int _v) { _dirty = true; colorMapOfs = _v; }

    /**
     * Number of entries in a color map
     */
    public int numColorMap() { return numColorMap; }
    public void setNumColorMap(int _v) { _dirty = true; numColorMap = _v; }

    /**
     * Number of bits in a each color maps entry
     */
    public int colorMapDepth() { return colorMapDepth; }
    public void setColorMapDepth(int _v) { _dirty = true; colorMapDepth = _v; }
    public int xOffset() { return xOffset; }
    public void setXOffset(int _v) { _dirty = true; xOffset = _v; }
    public int yOffset() { return yOffset; }
    public void setYOffset(int _v) { _dirty = true; yOffset = _v; }

    /**
     * Width of the image, in pixels
     */
    public int width() { return width; }
    public void setWidth(int _v) { _dirty = true; width = _v; }

    /**
     * Height of the image, in pixels
     */
    public int height() { return height; }
    public void setHeight(int _v) { _dirty = true; height = _v; }
    public int imageDepth() { return imageDepth; }
    public void setImageDepth(int _v) { _dirty = true; imageDepth = _v; }
    public int imgDescriptor() { return imgDescriptor; }
    public void setImgDescriptor(int _v) { _dirty = true; imgDescriptor = _v; }

    /**
     * Arbitrary application-specific information that is used to
     * identify image. May contain text or some binary data.
     */
    public byte[] imageId() { return imageId; }
    public void setImageId(byte[] _v) { _dirty = true; imageId = _v; }

    /**
     * Color map
     */
    public List<byte[]> colorMap() { return colorMap; }
    public void setColorMap(List<byte[]> _v) { _dirty = true; colorMap = _v; }
    public Tga _root() { return _root; }
    public void set_root(Tga _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
