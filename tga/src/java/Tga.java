// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * TGA (AKA Truevision TGA, AKA TARGA), is a raster image file format created by Truevision. It supports up to 32 bits per pixel (three 8-bit RGB channels + 8-bit alpha channel), color mapping and optional lossless RLE compression.
 * @see <a href="http://www.dca.fee.unicamp.br/~martino/disciplinas/ea978/tgaffs.pdf">Source</a>
 */
public class Tga extends KaitaiStruct {
    public static Tga fromFile(String fileName) throws IOException {
        return new Tga(new KaitaiStream(fileName));
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

    public Tga(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Tga(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Tga(KaitaiStream _io, KaitaiStruct _parent, Tga _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
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
            colorMap = new ArrayList<byte[]>((int) (numColorMap()));
            for (int i = 0; i < numColorMap(); i++) {
                this.colorMap.add(this._io.readBytes(((colorMapDepth() + 7) / 8)));
            }
        }
    }
    public static class TgaFooter extends KaitaiStruct {
        public static TgaFooter fromFile(String fileName) throws IOException {
            return new TgaFooter(new KaitaiStream(fileName));
        }

        public TgaFooter(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public TgaFooter(KaitaiStream _io, Tga _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public TgaFooter(KaitaiStream _io, Tga _parent, Tga _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.extAreaOfs = this._io.readU4le();
            this.devDirOfs = this._io.readU4le();
            this.versionMagic = this._io.readBytes(18);
        }
        private Boolean isValid;
        public Boolean isValid() {
            if (this.isValid != null)
                return this.isValid;
            boolean _tmp = (boolean) (Arrays.equals(versionMagic(), new byte[] { 84, 82, 85, 69, 86, 73, 83, 73, 79, 78, 45, 88, 70, 73, 76, 69, 46, 0 }));
            this.isValid = _tmp;
            return this.isValid;
        }
        private TgaExtArea extArea;
        public TgaExtArea extArea() {
            if (this.extArea != null)
                return this.extArea;
            if (isValid()) {
                long _pos = this._io.pos();
                this._io.seek(extAreaOfs());
                this.extArea = new TgaExtArea(this._io, this, _root);
                this._io.seek(_pos);
            }
            return this.extArea;
        }
        private long extAreaOfs;
        private long devDirOfs;
        private byte[] versionMagic;
        private Tga _root;
        private Tga _parent;

        /**
         * Offset to extension area
         */
        public long extAreaOfs() { return extAreaOfs; }

        /**
         * Offset to developer directory
         */
        public long devDirOfs() { return devDirOfs; }
        public byte[] versionMagic() { return versionMagic; }
        public Tga _root() { return _root; }
        public Tga _parent() { return _parent; }
    }
    public static class TgaExtArea extends KaitaiStruct {
        public static TgaExtArea fromFile(String fileName) throws IOException {
            return new TgaExtArea(new KaitaiStream(fileName));
        }

        public TgaExtArea(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public TgaExtArea(KaitaiStream _io, Tga.TgaFooter _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public TgaExtArea(KaitaiStream _io, Tga.TgaFooter _parent, Tga _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.extAreaSize = this._io.readU2le();
            this.authorName = new String(this._io.readBytes(41), Charset.forName("ASCII"));
            comments = new ArrayList<String>((int) (4));
            for (int i = 0; i < 4; i++) {
                this.comments.add(new String(this._io.readBytes(81), Charset.forName("ASCII")));
            }
            this.timestamp = this._io.readBytes(12);
            this.jobId = new String(this._io.readBytes(41), Charset.forName("ASCII"));
            this.jobTime = new String(this._io.readBytes(6), Charset.forName("ASCII"));
            this.softwareId = new String(this._io.readBytes(41), Charset.forName("ASCII"));
            this.softwareVersion = this._io.readBytes(3);
            this.keyColor = this._io.readU4le();
            this.pixelAspectRatio = this._io.readU4le();
            this.gammaValue = this._io.readU4le();
            this.colorCorrOfs = this._io.readU4le();
            this.postageStampOfs = this._io.readU4le();
            this.scanLineOfs = this._io.readU4le();
            this.attributes = this._io.readU1();
        }
        private int extAreaSize;
        private String authorName;
        private ArrayList<String> comments;
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
        public String authorName() { return authorName; }

        /**
         * Comments, organized as four lines, each consisting of 80 characters plus a NULL
         */
        public ArrayList<String> comments() { return comments; }

        /**
         * Image creation date / time
         */
        public byte[] timestamp() { return timestamp; }

        /**
         * Internal job ID, to be used in image workflow systems
         */
        public String jobId() { return jobId; }

        /**
         * Hours, minutes and seconds spent creating the file (for billing, etc.)
         */
        public String jobTime() { return jobTime; }

        /**
         * The application that created the file.
         */
        public String softwareId() { return softwareId; }
        public byte[] softwareVersion() { return softwareVersion; }
        public long keyColor() { return keyColor; }
        public long pixelAspectRatio() { return pixelAspectRatio; }
        public long gammaValue() { return gammaValue; }

        /**
         * Number of bytes from the beginning of the file to the color correction table if present
         */
        public long colorCorrOfs() { return colorCorrOfs; }

        /**
         * Number of bytes from the beginning of the file to the postage stamp image if present
         */
        public long postageStampOfs() { return postageStampOfs; }

        /**
         * Number of bytes from the beginning of the file to the scan lines table if present
         */
        public long scanLineOfs() { return scanLineOfs; }

        /**
         * Specifies the alpha channel
         */
        public int attributes() { return attributes; }
        public Tga _root() { return _root; }
        public Tga.TgaFooter _parent() { return _parent; }
    }
    private TgaFooter footer;
    public TgaFooter footer() {
        if (this.footer != null)
            return this.footer;
        long _pos = this._io.pos();
        this._io.seek((_io().size() - 26));
        this.footer = new TgaFooter(this._io, this, _root);
        this._io.seek(_pos);
        return this.footer;
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
    private ArrayList<byte[]> colorMap;
    private Tga _root;
    private KaitaiStruct _parent;
    public int imageIdLen() { return imageIdLen; }
    public ColorMapEnum colorMapType() { return colorMapType; }
    public ImageTypeEnum imageType() { return imageType; }
    public int colorMapOfs() { return colorMapOfs; }

    /**
     * Number of entries in a color map
     */
    public int numColorMap() { return numColorMap; }

    /**
     * Number of bits in a each color maps entry
     */
    public int colorMapDepth() { return colorMapDepth; }
    public int xOffset() { return xOffset; }
    public int yOffset() { return yOffset; }

    /**
     * Width of the image, in pixels
     */
    public int width() { return width; }

    /**
     * Height of the image, in pixels
     */
    public int height() { return height; }
    public int imageDepth() { return imageDepth; }
    public int imgDescriptor() { return imgDescriptor; }

    /**
     * Arbitrary application-specific information that is used to
     * identify image. May contain text or some binary data.
     */
    public byte[] imageId() { return imageId; }

    /**
     * Color map
     */
    public ArrayList<byte[]> colorMap() { return colorMap; }
    public Tga _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
