// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * GIF (Graphics Interchange Format) is an image file format, developed
 * in 1987. It became popular in 1990s as one of the main image formats
 * used in World Wide Web.
 * 
 * GIF format allows encoding of palette-based images up to 256 colors
 * (each of the colors can be chosen from a 24-bit RGB
 * colorspace). Image data stream uses LZW (Lempel–Ziv–Welch) lossless
 * compression.
 * 
 * Over the years, several version of the format were published and
 * several extensions to it were made, namely, a popular Netscape
 * extension that allows to store several images in one file, switching
 * between them, which produces crude form of animation.
 * 
 * Structurally, format consists of several mandatory headers and then
 * a stream of blocks follows. Blocks can carry additional
 * metainformation or image data.
 */
public class Gif extends KaitaiStruct {
    public static Gif fromFile(String fileName) throws IOException {
        return new Gif(new KaitaiStream(fileName));
    }

    public enum BlockType {
        EXTENSION(33),
        LOCAL_IMAGE_DESCRIPTOR(44),
        END_OF_FILE(59);

        private final long id;
        BlockType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockType> byId = new HashMap<Long, BlockType>(3);
        static {
            for (BlockType e : BlockType.values())
                byId.put(e.id(), e);
        }
        public static BlockType byId(long id) { return byId.get(id); }
    }

    public enum ExtensionLabel {
        GRAPHIC_CONTROL(249),
        COMMENT(254),
        APPLICATION(255);

        private final long id;
        ExtensionLabel(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, ExtensionLabel> byId = new HashMap<Long, ExtensionLabel>(3);
        static {
            for (ExtensionLabel e : ExtensionLabel.values())
                byId.put(e.id(), e);
        }
        public static ExtensionLabel byId(long id) { return byId.get(id); }
    }

    public Gif(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gif(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Gif(KaitaiStream _io, KaitaiStruct _parent, Gif _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.logicalScreenDescriptor = new LogicalScreenDescriptorStruct(this._io, this, _root);
        if (logicalScreenDescriptor().hasColorTable()) {
            this._raw_globalColorTable = this._io.readBytes((logicalScreenDescriptor().colorTableSize() * 3));
            KaitaiStream _io__raw_globalColorTable = new KaitaiStream(_raw_globalColorTable);
            this.globalColorTable = new ColorTable(_io__raw_globalColorTable, this, _root);
        }
        this.blocks = new ArrayList<Block>();
        while (!this._io.isEof()) {
            this.blocks.add(new Block(this._io, this, _root));
        }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 22</a>
     */
    public static class ImageData extends KaitaiStruct {
        public static ImageData fromFile(String fileName) throws IOException {
            return new ImageData(new KaitaiStream(fileName));
        }

        public ImageData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageData(KaitaiStream _io, Gif.LocalImageDescriptor _parent) {
            this(_io, _parent, null);
        }

        public ImageData(KaitaiStream _io, Gif.LocalImageDescriptor _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lzwMinCodeSize = this._io.readU1();
            this.subblocks = new Subblocks(this._io, this, _root);
        }
        private int lzwMinCodeSize;
        private Subblocks subblocks;
        private Gif _root;
        private Gif.LocalImageDescriptor _parent;
        public int lzwMinCodeSize() { return lzwMinCodeSize; }
        public Subblocks subblocks() { return subblocks; }
        public Gif _root() { return _root; }
        public Gif.LocalImageDescriptor _parent() { return _parent; }
    }
    public static class ColorTableEntry extends KaitaiStruct {
        public static ColorTableEntry fromFile(String fileName) throws IOException {
            return new ColorTableEntry(new KaitaiStream(fileName));
        }

        public ColorTableEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorTableEntry(KaitaiStream _io, Gif.ColorTable _parent) {
            this(_io, _parent, null);
        }

        public ColorTableEntry(KaitaiStream _io, Gif.ColorTable _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.red = this._io.readU1();
            this.green = this._io.readU1();
            this.blue = this._io.readU1();
        }
        private int red;
        private int green;
        private int blue;
        private Gif _root;
        private Gif.ColorTable _parent;
        public int red() { return red; }
        public int green() { return green; }
        public int blue() { return blue; }
        public Gif _root() { return _root; }
        public Gif.ColorTable _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
     */
    public static class LogicalScreenDescriptorStruct extends KaitaiStruct {
        public static LogicalScreenDescriptorStruct fromFile(String fileName) throws IOException {
            return new LogicalScreenDescriptorStruct(new KaitaiStream(fileName));
        }

        public LogicalScreenDescriptorStruct(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LogicalScreenDescriptorStruct(KaitaiStream _io, Gif _parent) {
            this(_io, _parent, null);
        }

        public LogicalScreenDescriptorStruct(KaitaiStream _io, Gif _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.screenWidth = this._io.readU2le();
            this.screenHeight = this._io.readU2le();
            this.flags = this._io.readU1();
            this.bgColorIndex = this._io.readU1();
            this.pixelAspectRatio = this._io.readU1();
        }
        private Boolean hasColorTable;
        public Boolean hasColorTable() {
            if (this.hasColorTable != null)
                return this.hasColorTable;
            boolean _tmp = (boolean) ((flags() & 128) != 0);
            this.hasColorTable = _tmp;
            return this.hasColorTable;
        }
        private Integer colorTableSize;
        public Integer colorTableSize() {
            if (this.colorTableSize != null)
                return this.colorTableSize;
            int _tmp = (int) ((2 << (flags() & 7)));
            this.colorTableSize = _tmp;
            return this.colorTableSize;
        }
        private int screenWidth;
        private int screenHeight;
        private int flags;
        private int bgColorIndex;
        private int pixelAspectRatio;
        private Gif _root;
        private Gif _parent;
        public int screenWidth() { return screenWidth; }
        public int screenHeight() { return screenHeight; }
        public int flags() { return flags; }
        public int bgColorIndex() { return bgColorIndex; }
        public int pixelAspectRatio() { return pixelAspectRatio; }
        public Gif _root() { return _root; }
        public Gif _parent() { return _parent; }
    }
    public static class LocalImageDescriptor extends KaitaiStruct {
        public static LocalImageDescriptor fromFile(String fileName) throws IOException {
            return new LocalImageDescriptor(new KaitaiStream(fileName));
        }

        public LocalImageDescriptor(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LocalImageDescriptor(KaitaiStream _io, Gif.Block _parent) {
            this(_io, _parent, null);
        }

        public LocalImageDescriptor(KaitaiStream _io, Gif.Block _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.left = this._io.readU2le();
            this.top = this._io.readU2le();
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.flags = this._io.readU1();
            if (hasColorTable()) {
                this._raw_localColorTable = this._io.readBytes((colorTableSize() * 3));
                KaitaiStream _io__raw_localColorTable = new KaitaiStream(_raw_localColorTable);
                this.localColorTable = new ColorTable(_io__raw_localColorTable, this, _root);
            }
            this.imageData = new ImageData(this._io, this, _root);
        }
        private Boolean hasColorTable;
        public Boolean hasColorTable() {
            if (this.hasColorTable != null)
                return this.hasColorTable;
            boolean _tmp = (boolean) ((flags() & 128) != 0);
            this.hasColorTable = _tmp;
            return this.hasColorTable;
        }
        private Boolean hasInterlace;
        public Boolean hasInterlace() {
            if (this.hasInterlace != null)
                return this.hasInterlace;
            boolean _tmp = (boolean) ((flags() & 64) != 0);
            this.hasInterlace = _tmp;
            return this.hasInterlace;
        }
        private Boolean hasSortedColorTable;
        public Boolean hasSortedColorTable() {
            if (this.hasSortedColorTable != null)
                return this.hasSortedColorTable;
            boolean _tmp = (boolean) ((flags() & 32) != 0);
            this.hasSortedColorTable = _tmp;
            return this.hasSortedColorTable;
        }
        private Integer colorTableSize;
        public Integer colorTableSize() {
            if (this.colorTableSize != null)
                return this.colorTableSize;
            int _tmp = (int) ((2 << (flags() & 7)));
            this.colorTableSize = _tmp;
            return this.colorTableSize;
        }
        private int left;
        private int top;
        private int width;
        private int height;
        private int flags;
        private ColorTable localColorTable;
        private ImageData imageData;
        private Gif _root;
        private Gif.Block _parent;
        private byte[] _raw_localColorTable;
        public int left() { return left; }
        public int top() { return top; }
        public int width() { return width; }
        public int height() { return height; }
        public int flags() { return flags; }
        public ColorTable localColorTable() { return localColorTable; }
        public ImageData imageData() { return imageData; }
        public Gif _root() { return _root; }
        public Gif.Block _parent() { return _parent; }
        public byte[] _raw_localColorTable() { return _raw_localColorTable; }
    }
    public static class Block extends KaitaiStruct {
        public static Block fromFile(String fileName) throws IOException {
            return new Block(new KaitaiStream(fileName));
        }

        public Block(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Block(KaitaiStream _io, Gif _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Gif _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.blockType = Gif.BlockType.byId(this._io.readU1());
            switch (blockType()) {
            case EXTENSION: {
                this.body = new Extension(this._io, this, _root);
                break;
            }
            case LOCAL_IMAGE_DESCRIPTOR: {
                this.body = new LocalImageDescriptor(this._io, this, _root);
                break;
            }
            }
        }
        private BlockType blockType;
        private KaitaiStruct body;
        private Gif _root;
        private Gif _parent;
        public BlockType blockType() { return blockType; }
        public KaitaiStruct body() { return body; }
        public Gif _root() { return _root; }
        public Gif _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 19</a>
     */
    public static class ColorTable extends KaitaiStruct {
        public static ColorTable fromFile(String fileName) throws IOException {
            return new ColorTable(new KaitaiStream(fileName));
        }

        public ColorTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorTable(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public ColorTable(KaitaiStream _io, KaitaiStruct _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<ColorTableEntry>();
            while (!this._io.isEof()) {
                this.entries.add(new ColorTableEntry(this._io, this, _root));
            }
        }
        private ArrayList<ColorTableEntry> entries;
        private Gif _root;
        private KaitaiStruct _parent;
        public ArrayList<ColorTableEntry> entries() { return entries; }
        public Gif _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 17</a>
     */
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new KaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Gif _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Gif _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.ensureFixedContents(new byte[] { 71, 73, 70 });
            this.version = new String(this._io.readBytes(3), Charset.forName("ASCII"));
        }
        private byte[] magic;
        private String version;
        private Gif _root;
        private Gif _parent;
        public byte[] magic() { return magic; }
        public String version() { return version; }
        public Gif _root() { return _root; }
        public Gif _parent() { return _parent; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 23</a>
     */
    public static class ExtGraphicControl extends KaitaiStruct {
        public static ExtGraphicControl fromFile(String fileName) throws IOException {
            return new ExtGraphicControl(new KaitaiStream(fileName));
        }

        public ExtGraphicControl(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtGraphicControl(KaitaiStream _io, Gif.Extension _parent) {
            this(_io, _parent, null);
        }

        public ExtGraphicControl(KaitaiStream _io, Gif.Extension _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.blockSize = this._io.ensureFixedContents(new byte[] { 4 });
            this.flags = this._io.readU1();
            this.delayTime = this._io.readU2le();
            this.transparentIdx = this._io.readU1();
            this.terminator = this._io.ensureFixedContents(new byte[] { 0 });
        }
        private Boolean transparentColorFlag;
        public Boolean transparentColorFlag() {
            if (this.transparentColorFlag != null)
                return this.transparentColorFlag;
            boolean _tmp = (boolean) ((flags() & 1) != 0);
            this.transparentColorFlag = _tmp;
            return this.transparentColorFlag;
        }
        private Boolean userInputFlag;
        public Boolean userInputFlag() {
            if (this.userInputFlag != null)
                return this.userInputFlag;
            boolean _tmp = (boolean) ((flags() & 2) != 0);
            this.userInputFlag = _tmp;
            return this.userInputFlag;
        }
        private byte[] blockSize;
        private int flags;
        private int delayTime;
        private int transparentIdx;
        private byte[] terminator;
        private Gif _root;
        private Gif.Extension _parent;
        public byte[] blockSize() { return blockSize; }
        public int flags() { return flags; }
        public int delayTime() { return delayTime; }
        public int transparentIdx() { return transparentIdx; }
        public byte[] terminator() { return terminator; }
        public Gif _root() { return _root; }
        public Gif.Extension _parent() { return _parent; }
    }
    public static class Subblock extends KaitaiStruct {
        public static Subblock fromFile(String fileName) throws IOException {
            return new Subblock(new KaitaiStream(fileName));
        }

        public Subblock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subblock(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Subblock(KaitaiStream _io, KaitaiStruct _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.numBytes = this._io.readU1();
            this.bytes = this._io.readBytes(numBytes());
        }
        private int numBytes;
        private byte[] bytes;
        private Gif _root;
        private KaitaiStruct _parent;
        public int numBytes() { return numBytes; }
        public byte[] bytes() { return bytes; }
        public Gif _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class ExtApplication extends KaitaiStruct {
        public static ExtApplication fromFile(String fileName) throws IOException {
            return new ExtApplication(new KaitaiStream(fileName));
        }

        public ExtApplication(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ExtApplication(KaitaiStream _io, Gif.Extension _parent) {
            this(_io, _parent, null);
        }

        public ExtApplication(KaitaiStream _io, Gif.Extension _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.applicationId = new Subblock(this._io, this, _root);
            this.subblocks = new ArrayList<Subblock>();
            {
                Subblock _it;
                do {
                    _it = new Subblock(this._io, this, _root);
                    this.subblocks.add(_it);
                } while (!(_it.numBytes() == 0));
            }
        }
        private Subblock applicationId;
        private ArrayList<Subblock> subblocks;
        private Gif _root;
        private Gif.Extension _parent;
        public Subblock applicationId() { return applicationId; }
        public ArrayList<Subblock> subblocks() { return subblocks; }
        public Gif _root() { return _root; }
        public Gif.Extension _parent() { return _parent; }
    }
    public static class Subblocks extends KaitaiStruct {
        public static Subblocks fromFile(String fileName) throws IOException {
            return new Subblocks(new KaitaiStream(fileName));
        }

        public Subblocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subblocks(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Subblocks(KaitaiStream _io, KaitaiStruct _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.entries = new ArrayList<Subblock>();
            {
                Subblock _it;
                do {
                    _it = new Subblock(this._io, this, _root);
                    this.entries.add(_it);
                } while (!(_it.numBytes() == 0));
            }
        }
        private ArrayList<Subblock> entries;
        private Gif _root;
        private KaitaiStruct _parent;
        public ArrayList<Subblock> entries() { return entries; }
        public Gif _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Extension extends KaitaiStruct {
        public static Extension fromFile(String fileName) throws IOException {
            return new Extension(new KaitaiStream(fileName));
        }

        public Extension(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Extension(KaitaiStream _io, Gif.Block _parent) {
            this(_io, _parent, null);
        }

        public Extension(KaitaiStream _io, Gif.Block _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.label = Gif.ExtensionLabel.byId(this._io.readU1());
            switch (label()) {
            case APPLICATION: {
                this.body = new ExtApplication(this._io, this, _root);
                break;
            }
            case COMMENT: {
                this.body = new Subblocks(this._io, this, _root);
                break;
            }
            case GRAPHIC_CONTROL: {
                this.body = new ExtGraphicControl(this._io, this, _root);
                break;
            }
            default: {
                this.body = new Subblocks(this._io, this, _root);
                break;
            }
            }
        }
        private ExtensionLabel label;
        private KaitaiStruct body;
        private Gif _root;
        private Gif.Block _parent;
        public ExtensionLabel label() { return label; }
        public KaitaiStruct body() { return body; }
        public Gif _root() { return _root; }
        public Gif.Block _parent() { return _parent; }
    }
    private Header hdr;
    private LogicalScreenDescriptorStruct logicalScreenDescriptor;
    private ColorTable globalColorTable;
    private ArrayList<Block> blocks;
    private Gif _root;
    private KaitaiStruct _parent;
    private byte[] _raw_globalColorTable;
    public Header hdr() { return hdr; }
    public LogicalScreenDescriptorStruct logicalScreenDescriptor() { return logicalScreenDescriptor; }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
     */
    public ColorTable globalColorTable() { return globalColorTable; }
    public ArrayList<Block> blocks() { return blocks; }
    public Gif _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_globalColorTable() { return _raw_globalColorTable; }
}
