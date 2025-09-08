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
 * GIF (Graphics Interchange Format) is an image file format, developed
 * in 1987. It became popular in 1990s as one of the main image formats
 * used in World Wide Web.
 * 
 * GIF format allows encoding of palette-based images up to 256 colors
 * (each of the colors can be chosen from a 24-bit RGB
 * colorspace). Image data stream uses LZW (Lempel-Ziv-Welch) lossless
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
public class Gif extends KaitaiStruct.ReadWrite {
    public static Gif fromFile(String fileName) throws IOException {
        return new Gif(new ByteBufferKaitaiStream(fileName));
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
    public Gif() {
        this(null, null, null);
    }

    public Gif(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Gif(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Gif(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gif _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.hdr = new Header(this._io, this, _root);
        this.hdr._read();
        this.logicalScreenDescriptor = new LogicalScreenDescriptorStruct(this._io, this, _root);
        this.logicalScreenDescriptor._read();
        if (logicalScreenDescriptor().hasColorTable()) {
            this._raw_globalColorTable = this._io.readBytes(logicalScreenDescriptor().colorTableSize() * 3);
            KaitaiStream _io__raw_globalColorTable = new ByteBufferKaitaiStream(this._raw_globalColorTable);
            this.globalColorTable = new ColorTable(_io__raw_globalColorTable, this, _root);
            this.globalColorTable._read();
        }
        this.blocks = new ArrayList<Block>();
        {
            Block _it;
            int i = 0;
            do {
                Block _t_blocks = new Block(this._io, this, _root);
                try {
                    _t_blocks._read();
                } finally {
                    _it = _t_blocks;
                    this.blocks.add(_it);
                }
                i++;
            } while (!( ((_io().isEof()) || (_it.blockType() == BlockType.END_OF_FILE)) ));
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.hdr._fetchInstances();
        this.logicalScreenDescriptor._fetchInstances();
        if (logicalScreenDescriptor().hasColorTable()) {
            this.globalColorTable._fetchInstances();
        }
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.hdr._write_Seq(this._io);
        this.logicalScreenDescriptor._write_Seq(this._io);
        if (logicalScreenDescriptor().hasColorTable()) {
            final KaitaiStream _io__raw_globalColorTable = new ByteBufferKaitaiStream(logicalScreenDescriptor().colorTableSize() * 3);
            this._io.addChildStream(_io__raw_globalColorTable);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (logicalScreenDescriptor().colorTableSize() * 3));
                final Gif _this = this;
                _io__raw_globalColorTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_globalColorTable = _io__raw_globalColorTable.toByteArray();
                        if (_this._raw_globalColorTable.length != logicalScreenDescriptor().colorTableSize() * 3)
                            throw new ConsistencyError("raw(global_color_table)", logicalScreenDescriptor().colorTableSize() * 3, _this._raw_globalColorTable.length);
                        parent.writeBytes(_this._raw_globalColorTable);
                    }
                });
            }
            this.globalColorTable._write_Seq(_io__raw_globalColorTable);
        }
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
            {
                Block _it = this.blocks.get(((Number) (i)).intValue());
                if ( ((_io().isEof()) || (_it.blockType() == BlockType.END_OF_FILE))  != (i == this.blocks.size() - 1))
                    throw new ConsistencyError("blocks", i == this.blocks.size() - 1,  ((_io().isEof()) || (_it.blockType() == BlockType.END_OF_FILE)) );
            }
        }
    }

    public void _check() {
        if (!Objects.equals(this.hdr._root(), _root()))
            throw new ConsistencyError("hdr", _root(), this.hdr._root());
        if (!Objects.equals(this.hdr._parent(), this))
            throw new ConsistencyError("hdr", this, this.hdr._parent());
        if (!Objects.equals(this.logicalScreenDescriptor._root(), _root()))
            throw new ConsistencyError("logical_screen_descriptor", _root(), this.logicalScreenDescriptor._root());
        if (!Objects.equals(this.logicalScreenDescriptor._parent(), this))
            throw new ConsistencyError("logical_screen_descriptor", this, this.logicalScreenDescriptor._parent());
        if (logicalScreenDescriptor().hasColorTable()) {
            if (!Objects.equals(this.globalColorTable._root(), _root()))
                throw new ConsistencyError("global_color_table", _root(), this.globalColorTable._root());
            if (!Objects.equals(this.globalColorTable._parent(), this))
                throw new ConsistencyError("global_color_table", this, this.globalColorTable._parent());
        }
        if (this.blocks.size() == 0)
            throw new ConsistencyError("blocks", 0, this.blocks.size());
        for (int i = 0; i < this.blocks.size(); i++) {
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class ApplicationId extends KaitaiStruct.ReadWrite {
        public static ApplicationId fromFile(String fileName) throws IOException {
            return new ApplicationId(new ByteBufferKaitaiStream(fileName));
        }
        public ApplicationId() {
            this(null, null, null);
        }

        public ApplicationId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ApplicationId(KaitaiStream _io, Gif.ExtApplication _parent) {
            this(_io, _parent, null);
        }

        public ApplicationId(KaitaiStream _io, Gif.ExtApplication _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenBytes = this._io.readU1();
            if (!(this.lenBytes == 11)) {
                throw new KaitaiStream.ValidationNotEqualError(11, this.lenBytes, this._io, "/types/application_id/seq/0");
            }
            this.applicationIdentifier = new String(this._io.readBytes(8), StandardCharsets.US_ASCII);
            this.applicationAuthCode = this._io.readBytes(3);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.lenBytes);
            this._io.writeBytes((this.applicationIdentifier).getBytes(Charset.forName("ASCII")));
            this._io.writeBytes(this.applicationAuthCode);
        }

        public void _check() {
            if (!(this.lenBytes == 11)) {
                throw new KaitaiStream.ValidationNotEqualError(11, this.lenBytes, null, "/types/application_id/seq/0");
            }
            if ((this.applicationIdentifier).getBytes(Charset.forName("ASCII")).length != 8)
                throw new ConsistencyError("application_identifier", 8, (this.applicationIdentifier).getBytes(Charset.forName("ASCII")).length);
            if (this.applicationAuthCode.length != 3)
                throw new ConsistencyError("application_auth_code", 3, this.applicationAuthCode.length);
            _dirty = false;
        }
        private int lenBytes;
        private String applicationIdentifier;
        private byte[] applicationAuthCode;
        private Gif _root;
        private Gif.ExtApplication _parent;
        public int lenBytes() { return lenBytes; }
        public void setLenBytes(int _v) { _dirty = true; lenBytes = _v; }
        public String applicationIdentifier() { return applicationIdentifier; }
        public void setApplicationIdentifier(String _v) { _dirty = true; applicationIdentifier = _v; }
        public byte[] applicationAuthCode() { return applicationAuthCode; }
        public void setApplicationAuthCode(byte[] _v) { _dirty = true; applicationAuthCode = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.ExtApplication _parent() { return _parent; }
        public void set_parent(Gif.ExtApplication _v) { _dirty = true; _parent = _v; }
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

        public Block(KaitaiStream _io, Gif _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, Gif _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.blockType = Gif.BlockType.byId(this._io.readU1());
            {
                BlockType on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case EXTENSION: {
                        this.body = new Extension(this._io, this, _root);
                        ((Extension) (this.body))._read();
                        break;
                    }
                    case LOCAL_IMAGE_DESCRIPTOR: {
                        this.body = new LocalImageDescriptor(this._io, this, _root);
                        ((LocalImageDescriptor) (this.body))._read();
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                BlockType on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case EXTENSION: {
                        ((Extension) (this.body))._fetchInstances();
                        break;
                    }
                    case LOCAL_IMAGE_DESCRIPTOR: {
                        ((LocalImageDescriptor) (this.body))._fetchInstances();
                        break;
                    }
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.blockType.id())).intValue());
            {
                BlockType on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case EXTENSION: {
                        ((Extension) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case LOCAL_IMAGE_DESCRIPTOR: {
                        ((LocalImageDescriptor) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                }
            }
        }

        public void _check() {
            {
                BlockType on = blockType();
                if (on != null) {
                    switch (blockType()) {
                    case EXTENSION: {
                        if (!Objects.equals(((Gif.Extension) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.Extension) (this.body))._root());
                        if (!Objects.equals(((Gif.Extension) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.Extension) (this.body))._parent());
                        break;
                    }
                    case LOCAL_IMAGE_DESCRIPTOR: {
                        if (!Objects.equals(((Gif.LocalImageDescriptor) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.LocalImageDescriptor) (this.body))._root());
                        if (!Objects.equals(((Gif.LocalImageDescriptor) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.LocalImageDescriptor) (this.body))._parent());
                        break;
                    }
                    }
                }
            }
            _dirty = false;
        }
        private BlockType blockType;
        private KaitaiStruct.ReadWrite body;
        private Gif _root;
        private Gif _parent;
        public BlockType blockType() { return blockType; }
        public void setBlockType(BlockType _v) { _dirty = true; blockType = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif _parent() { return _parent; }
        public void set_parent(Gif _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 19</a>
     */
    public static class ColorTable extends KaitaiStruct.ReadWrite {
        public static ColorTable fromFile(String fileName) throws IOException {
            return new ColorTable(new ByteBufferKaitaiStream(fileName));
        }
        public ColorTable() {
            this(null, null, null);
        }

        public ColorTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ColorTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public ColorTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<ColorTableEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    ColorTableEntry _t_entries = new ColorTableEntry(this._io, this, _root);
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
        private List<ColorTableEntry> entries;
        private Gif _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<ColorTableEntry> entries() { return entries; }
        public void setEntries(List<ColorTableEntry> _v) { _dirty = true; entries = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class ColorTableEntry extends KaitaiStruct.ReadWrite {
        public static ColorTableEntry fromFile(String fileName) throws IOException {
            return new ColorTableEntry(new ByteBufferKaitaiStream(fileName));
        }
        public ColorTableEntry() {
            this(null, null, null);
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
        }
        public void _read() {
            this.red = this._io.readU1();
            this.green = this._io.readU1();
            this.blue = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.red);
            this._io.writeU1(this.green);
            this._io.writeU1(this.blue);
        }

        public void _check() {
            _dirty = false;
        }
        private int red;
        private int green;
        private int blue;
        private Gif _root;
        private Gif.ColorTable _parent;
        public int red() { return red; }
        public void setRed(int _v) { _dirty = true; red = _v; }
        public int green() { return green; }
        public void setGreen(int _v) { _dirty = true; green = _v; }
        public int blue() { return blue; }
        public void setBlue(int _v) { _dirty = true; blue = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.ColorTable _parent() { return _parent; }
        public void set_parent(Gif.ColorTable _v) { _dirty = true; _parent = _v; }
    }
    public static class ExtApplication extends KaitaiStruct.ReadWrite {
        public static ExtApplication fromFile(String fileName) throws IOException {
            return new ExtApplication(new ByteBufferKaitaiStream(fileName));
        }
        public ExtApplication() {
            this(null, null, null);
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
        }
        public void _read() {
            this.applicationId = new ApplicationId(this._io, this, _root);
            this.applicationId._read();
            this.subblocks = new ArrayList<Subblock>();
            {
                Subblock _it;
                int i = 0;
                do {
                    Subblock _t_subblocks = new Subblock(this._io, this, _root);
                    try {
                        _t_subblocks._read();
                    } finally {
                        _it = _t_subblocks;
                        this.subblocks.add(_it);
                    }
                    i++;
                } while (!(_it.lenBytes() == 0));
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.applicationId._fetchInstances();
            for (int i = 0; i < this.subblocks.size(); i++) {
                this.subblocks.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.applicationId._write_Seq(this._io);
            for (int i = 0; i < this.subblocks.size(); i++) {
                this.subblocks.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (!Objects.equals(this.applicationId._root(), _root()))
                throw new ConsistencyError("application_id", _root(), this.applicationId._root());
            if (!Objects.equals(this.applicationId._parent(), this))
                throw new ConsistencyError("application_id", this, this.applicationId._parent());
            if (this.subblocks.size() == 0)
                throw new ConsistencyError("subblocks", 0, this.subblocks.size());
            for (int i = 0; i < this.subblocks.size(); i++) {
                if (!Objects.equals(this.subblocks.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("subblocks", _root(), this.subblocks.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.subblocks.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("subblocks", this, this.subblocks.get(((Number) (i)).intValue())._parent());
                {
                    Subblock _it = this.subblocks.get(((Number) (i)).intValue());
                    if ((_it.lenBytes() == 0) != (i == this.subblocks.size() - 1))
                        throw new ConsistencyError("subblocks", i == this.subblocks.size() - 1, _it.lenBytes() == 0);
                }
            }
            _dirty = false;
        }
        private ApplicationId applicationId;
        private List<Subblock> subblocks;
        private Gif _root;
        private Gif.Extension _parent;
        public ApplicationId applicationId() { return applicationId; }
        public void setApplicationId(ApplicationId _v) { _dirty = true; applicationId = _v; }
        public List<Subblock> subblocks() { return subblocks; }
        public void setSubblocks(List<Subblock> _v) { _dirty = true; subblocks = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.Extension _parent() { return _parent; }
        public void set_parent(Gif.Extension _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 23</a>
     */
    public static class ExtGraphicControl extends KaitaiStruct.ReadWrite {
        public static ExtGraphicControl fromFile(String fileName) throws IOException {
            return new ExtGraphicControl(new ByteBufferKaitaiStream(fileName));
        }
        public ExtGraphicControl() {
            this(null, null, null);
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
        }
        public void _read() {
            this.blockSize = this._io.readBytes(1);
            if (!(Arrays.equals(this.blockSize, new byte[] { 4 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4 }, this.blockSize, this._io, "/types/ext_graphic_control/seq/0");
            }
            this.flags = this._io.readU1();
            this.delayTime = this._io.readU2le();
            this.transparentIdx = this._io.readU1();
            this.terminator = this._io.readBytes(1);
            if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, this._io, "/types/ext_graphic_control/seq/4");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.blockSize);
            this._io.writeU1(this.flags);
            this._io.writeU2le(this.delayTime);
            this._io.writeU1(this.transparentIdx);
            this._io.writeBytes(this.terminator);
        }

        public void _check() {
            if (this.blockSize.length != 1)
                throw new ConsistencyError("block_size", 1, this.blockSize.length);
            if (!(Arrays.equals(this.blockSize, new byte[] { 4 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 4 }, this.blockSize, null, "/types/ext_graphic_control/seq/0");
            }
            if (this.terminator.length != 1)
                throw new ConsistencyError("terminator", 1, this.terminator.length);
            if (!(Arrays.equals(this.terminator, new byte[] { 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0 }, this.terminator, null, "/types/ext_graphic_control/seq/4");
            }
            _dirty = false;
        }
        private Boolean transparentColorFlag;
        public Boolean transparentColorFlag() {
            if (this.transparentColorFlag != null)
                return this.transparentColorFlag;
            this.transparentColorFlag = (flags() & 1) != 0;
            return this.transparentColorFlag;
        }
        public void _invalidateTransparentColorFlag() { this.transparentColorFlag = null; }
        private Boolean userInputFlag;
        public Boolean userInputFlag() {
            if (this.userInputFlag != null)
                return this.userInputFlag;
            this.userInputFlag = (flags() & 2) != 0;
            return this.userInputFlag;
        }
        public void _invalidateUserInputFlag() { this.userInputFlag = null; }
        private byte[] blockSize;
        private int flags;
        private int delayTime;
        private int transparentIdx;
        private byte[] terminator;
        private Gif _root;
        private Gif.Extension _parent;
        public byte[] blockSize() { return blockSize; }
        public void setBlockSize(byte[] _v) { _dirty = true; blockSize = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int delayTime() { return delayTime; }
        public void setDelayTime(int _v) { _dirty = true; delayTime = _v; }
        public int transparentIdx() { return transparentIdx; }
        public void setTransparentIdx(int _v) { _dirty = true; transparentIdx = _v; }
        public byte[] terminator() { return terminator; }
        public void setTerminator(byte[] _v) { _dirty = true; terminator = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.Extension _parent() { return _parent; }
        public void set_parent(Gif.Extension _v) { _dirty = true; _parent = _v; }
    }
    public static class Extension extends KaitaiStruct.ReadWrite {
        public static Extension fromFile(String fileName) throws IOException {
            return new Extension(new ByteBufferKaitaiStream(fileName));
        }
        public Extension() {
            this(null, null, null);
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
        }
        public void _read() {
            this.label = Gif.ExtensionLabel.byId(this._io.readU1());
            {
                ExtensionLabel on = label();
                if (on != null) {
                    switch (label()) {
                    case APPLICATION: {
                        this.body = new ExtApplication(this._io, this, _root);
                        ((ExtApplication) (this.body))._read();
                        break;
                    }
                    case COMMENT: {
                        this.body = new Subblocks(this._io, this, _root);
                        ((Subblocks) (this.body))._read();
                        break;
                    }
                    case GRAPHIC_CONTROL: {
                        this.body = new ExtGraphicControl(this._io, this, _root);
                        ((ExtGraphicControl) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = new Subblocks(this._io, this, _root);
                        ((Subblocks) (this.body))._read();
                        break;
                    }
                    }
                } else {
                    this.body = new Subblocks(this._io, this, _root);
                    ((Subblocks) (this.body))._read();
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                ExtensionLabel on = label();
                if (on != null) {
                    switch (label()) {
                    case APPLICATION: {
                        ((ExtApplication) (this.body))._fetchInstances();
                        break;
                    }
                    case COMMENT: {
                        ((Subblocks) (this.body))._fetchInstances();
                        break;
                    }
                    case GRAPHIC_CONTROL: {
                        ((ExtGraphicControl) (this.body))._fetchInstances();
                        break;
                    }
                    default: {
                        ((Subblocks) (this.body))._fetchInstances();
                        break;
                    }
                    }
                } else {
                    ((Subblocks) (this.body))._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.label.id())).intValue());
            {
                ExtensionLabel on = label();
                if (on != null) {
                    switch (label()) {
                    case APPLICATION: {
                        ((ExtApplication) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case COMMENT: {
                        ((Subblocks) (this.body))._write_Seq(this._io);
                        break;
                    }
                    case GRAPHIC_CONTROL: {
                        ((ExtGraphicControl) (this.body))._write_Seq(this._io);
                        break;
                    }
                    default: {
                        ((Subblocks) (this.body))._write_Seq(this._io);
                        break;
                    }
                    }
                } else {
                    ((Subblocks) (this.body))._write_Seq(this._io);
                }
            }
        }

        public void _check() {
            {
                ExtensionLabel on = label();
                if (on != null) {
                    switch (label()) {
                    case APPLICATION: {
                        if (!Objects.equals(((Gif.ExtApplication) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.ExtApplication) (this.body))._root());
                        if (!Objects.equals(((Gif.ExtApplication) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.ExtApplication) (this.body))._parent());
                        break;
                    }
                    case COMMENT: {
                        if (!Objects.equals(((Gif.Subblocks) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.Subblocks) (this.body))._root());
                        if (!Objects.equals(((Gif.Subblocks) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.Subblocks) (this.body))._parent());
                        break;
                    }
                    case GRAPHIC_CONTROL: {
                        if (!Objects.equals(((Gif.ExtGraphicControl) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.ExtGraphicControl) (this.body))._root());
                        if (!Objects.equals(((Gif.ExtGraphicControl) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.ExtGraphicControl) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (!Objects.equals(((Gif.Subblocks) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Gif.Subblocks) (this.body))._root());
                        if (!Objects.equals(((Gif.Subblocks) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Gif.Subblocks) (this.body))._parent());
                        break;
                    }
                    }
                } else {
                    if (!Objects.equals(((Gif.Subblocks) (this.body))._root(), _root()))
                        throw new ConsistencyError("body", _root(), ((Gif.Subblocks) (this.body))._root());
                    if (!Objects.equals(((Gif.Subblocks) (this.body))._parent(), this))
                        throw new ConsistencyError("body", this, ((Gif.Subblocks) (this.body))._parent());
                }
            }
            _dirty = false;
        }
        private ExtensionLabel label;
        private KaitaiStruct.ReadWrite body;
        private Gif _root;
        private Gif.Block _parent;
        public ExtensionLabel label() { return label; }
        public void setLabel(ExtensionLabel _v) { _dirty = true; label = _v; }
        public KaitaiStruct.ReadWrite body() { return body; }
        public void setBody(KaitaiStruct.ReadWrite _v) { _dirty = true; body = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.Block _parent() { return _parent; }
        public void set_parent(Gif.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 17</a>
     */
    public static class Header extends KaitaiStruct.ReadWrite {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }
        public Header() {
            this(null, null, null);
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
        }
        public void _read() {
            this.magic = this._io.readBytes(3);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 73, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 73, 70 }, this.magic, this._io, "/types/header/seq/0");
            }
            this.version = new String(this._io.readBytes(3), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes((this.version).getBytes(Charset.forName("ASCII")));
        }

        public void _check() {
            if (this.magic.length != 3)
                throw new ConsistencyError("magic", 3, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 71, 73, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 71, 73, 70 }, this.magic, null, "/types/header/seq/0");
            }
            if ((this.version).getBytes(Charset.forName("ASCII")).length != 3)
                throw new ConsistencyError("version", 3, (this.version).getBytes(Charset.forName("ASCII")).length);
            _dirty = false;
        }
        private byte[] magic;
        private String version;
        private Gif _root;
        private Gif _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public String version() { return version; }
        public void setVersion(String _v) { _dirty = true; version = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif _parent() { return _parent; }
        public void set_parent(Gif _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 22</a>
     */
    public static class ImageData extends KaitaiStruct.ReadWrite {
        public static ImageData fromFile(String fileName) throws IOException {
            return new ImageData(new ByteBufferKaitaiStream(fileName));
        }
        public ImageData() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lzwMinCodeSize = this._io.readU1();
            this.subblocks = new Subblocks(this._io, this, _root);
            this.subblocks._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.subblocks._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.lzwMinCodeSize);
            this.subblocks._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.subblocks._root(), _root()))
                throw new ConsistencyError("subblocks", _root(), this.subblocks._root());
            if (!Objects.equals(this.subblocks._parent(), this))
                throw new ConsistencyError("subblocks", this, this.subblocks._parent());
            _dirty = false;
        }
        private int lzwMinCodeSize;
        private Subblocks subblocks;
        private Gif _root;
        private Gif.LocalImageDescriptor _parent;
        public int lzwMinCodeSize() { return lzwMinCodeSize; }
        public void setLzwMinCodeSize(int _v) { _dirty = true; lzwMinCodeSize = _v; }
        public Subblocks subblocks() { return subblocks; }
        public void setSubblocks(Subblocks _v) { _dirty = true; subblocks = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.LocalImageDescriptor _parent() { return _parent; }
        public void set_parent(Gif.LocalImageDescriptor _v) { _dirty = true; _parent = _v; }
    }
    public static class LocalImageDescriptor extends KaitaiStruct.ReadWrite {
        public static LocalImageDescriptor fromFile(String fileName) throws IOException {
            return new LocalImageDescriptor(new ByteBufferKaitaiStream(fileName));
        }
        public LocalImageDescriptor() {
            this(null, null, null);
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
        }
        public void _read() {
            this.left = this._io.readU2le();
            this.top = this._io.readU2le();
            this.width = this._io.readU2le();
            this.height = this._io.readU2le();
            this.flags = this._io.readU1();
            if (hasColorTable()) {
                this._raw_localColorTable = this._io.readBytes(colorTableSize() * 3);
                KaitaiStream _io__raw_localColorTable = new ByteBufferKaitaiStream(this._raw_localColorTable);
                this.localColorTable = new ColorTable(_io__raw_localColorTable, this, _root);
                this.localColorTable._read();
            }
            this.imageData = new ImageData(this._io, this, _root);
            this.imageData._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasColorTable()) {
                this.localColorTable._fetchInstances();
            }
            this.imageData._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.left);
            this._io.writeU2le(this.top);
            this._io.writeU2le(this.width);
            this._io.writeU2le(this.height);
            this._io.writeU1(this.flags);
            if (hasColorTable()) {
                final KaitaiStream _io__raw_localColorTable = new ByteBufferKaitaiStream(colorTableSize() * 3);
                this._io.addChildStream(_io__raw_localColorTable);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (colorTableSize() * 3));
                    final LocalImageDescriptor _this = this;
                    _io__raw_localColorTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_localColorTable = _io__raw_localColorTable.toByteArray();
                            if (_this._raw_localColorTable.length != colorTableSize() * 3)
                                throw new ConsistencyError("raw(local_color_table)", colorTableSize() * 3, _this._raw_localColorTable.length);
                            parent.writeBytes(_this._raw_localColorTable);
                        }
                    });
                }
                this.localColorTable._write_Seq(_io__raw_localColorTable);
            }
            this.imageData._write_Seq(this._io);
        }

        public void _check() {
            if (hasColorTable()) {
                if (!Objects.equals(this.localColorTable._root(), _root()))
                    throw new ConsistencyError("local_color_table", _root(), this.localColorTable._root());
                if (!Objects.equals(this.localColorTable._parent(), this))
                    throw new ConsistencyError("local_color_table", this, this.localColorTable._parent());
            }
            if (!Objects.equals(this.imageData._root(), _root()))
                throw new ConsistencyError("image_data", _root(), this.imageData._root());
            if (!Objects.equals(this.imageData._parent(), this))
                throw new ConsistencyError("image_data", this, this.imageData._parent());
            _dirty = false;
        }
        private Integer colorTableSize;
        public Integer colorTableSize() {
            if (this.colorTableSize != null)
                return this.colorTableSize;
            this.colorTableSize = ((Number) (2 << (flags() & 7))).intValue();
            return this.colorTableSize;
        }
        public void _invalidateColorTableSize() { this.colorTableSize = null; }
        private Boolean hasColorTable;
        public Boolean hasColorTable() {
            if (this.hasColorTable != null)
                return this.hasColorTable;
            this.hasColorTable = (flags() & 128) != 0;
            return this.hasColorTable;
        }
        public void _invalidateHasColorTable() { this.hasColorTable = null; }
        private Boolean hasInterlace;
        public Boolean hasInterlace() {
            if (this.hasInterlace != null)
                return this.hasInterlace;
            this.hasInterlace = (flags() & 64) != 0;
            return this.hasInterlace;
        }
        public void _invalidateHasInterlace() { this.hasInterlace = null; }
        private Boolean hasSortedColorTable;
        public Boolean hasSortedColorTable() {
            if (this.hasSortedColorTable != null)
                return this.hasSortedColorTable;
            this.hasSortedColorTable = (flags() & 32) != 0;
            return this.hasSortedColorTable;
        }
        public void _invalidateHasSortedColorTable() { this.hasSortedColorTable = null; }
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
        public void setLeft(int _v) { _dirty = true; left = _v; }
        public int top() { return top; }
        public void setTop(int _v) { _dirty = true; top = _v; }
        public int width() { return width; }
        public void setWidth(int _v) { _dirty = true; width = _v; }
        public int height() { return height; }
        public void setHeight(int _v) { _dirty = true; height = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public ColorTable localColorTable() { return localColorTable; }
        public void setLocalColorTable(ColorTable _v) { _dirty = true; localColorTable = _v; }
        public ImageData imageData() { return imageData; }
        public void setImageData(ImageData _v) { _dirty = true; imageData = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif.Block _parent() { return _parent; }
        public void set_parent(Gif.Block _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_localColorTable() { return _raw_localColorTable; }
        public void set_raw_LocalColorTable(byte[] _v) { _dirty = true; _raw_localColorTable = _v; }
    }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
     */
    public static class LogicalScreenDescriptorStruct extends KaitaiStruct.ReadWrite {
        public static LogicalScreenDescriptorStruct fromFile(String fileName) throws IOException {
            return new LogicalScreenDescriptorStruct(new ByteBufferKaitaiStream(fileName));
        }
        public LogicalScreenDescriptorStruct() {
            this(null, null, null);
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
        }
        public void _read() {
            this.screenWidth = this._io.readU2le();
            this.screenHeight = this._io.readU2le();
            this.flags = this._io.readU1();
            this.bgColorIndex = this._io.readU1();
            this.pixelAspectRatio = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.screenWidth);
            this._io.writeU2le(this.screenHeight);
            this._io.writeU1(this.flags);
            this._io.writeU1(this.bgColorIndex);
            this._io.writeU1(this.pixelAspectRatio);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer colorTableSize;
        public Integer colorTableSize() {
            if (this.colorTableSize != null)
                return this.colorTableSize;
            this.colorTableSize = ((Number) (2 << (flags() & 7))).intValue();
            return this.colorTableSize;
        }
        public void _invalidateColorTableSize() { this.colorTableSize = null; }
        private Boolean hasColorTable;
        public Boolean hasColorTable() {
            if (this.hasColorTable != null)
                return this.hasColorTable;
            this.hasColorTable = (flags() & 128) != 0;
            return this.hasColorTable;
        }
        public void _invalidateHasColorTable() { this.hasColorTable = null; }
        private int screenWidth;
        private int screenHeight;
        private int flags;
        private int bgColorIndex;
        private int pixelAspectRatio;
        private Gif _root;
        private Gif _parent;
        public int screenWidth() { return screenWidth; }
        public void setScreenWidth(int _v) { _dirty = true; screenWidth = _v; }
        public int screenHeight() { return screenHeight; }
        public void setScreenHeight(int _v) { _dirty = true; screenHeight = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int bgColorIndex() { return bgColorIndex; }
        public void setBgColorIndex(int _v) { _dirty = true; bgColorIndex = _v; }
        public int pixelAspectRatio() { return pixelAspectRatio; }
        public void setPixelAspectRatio(int _v) { _dirty = true; pixelAspectRatio = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public Gif _parent() { return _parent; }
        public void set_parent(Gif _v) { _dirty = true; _parent = _v; }
    }
    public static class Subblock extends KaitaiStruct.ReadWrite {
        public static Subblock fromFile(String fileName) throws IOException {
            return new Subblock(new ByteBufferKaitaiStream(fileName));
        }
        public Subblock() {
            this(null, null, null);
        }

        public Subblock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subblock(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Subblock(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenBytes = this._io.readU1();
            this.bytes = this._io.readBytes(lenBytes());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.lenBytes);
            this._io.writeBytes(this.bytes);
        }

        public void _check() {
            if (this.bytes.length != lenBytes())
                throw new ConsistencyError("bytes", lenBytes(), this.bytes.length);
            _dirty = false;
        }
        private int lenBytes;
        private byte[] bytes;
        private Gif _root;
        private KaitaiStruct.ReadWrite _parent;
        public int lenBytes() { return lenBytes; }
        public void setLenBytes(int _v) { _dirty = true; lenBytes = _v; }
        public byte[] bytes() { return bytes; }
        public void setBytes(byte[] _v) { _dirty = true; bytes = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Subblocks extends KaitaiStruct.ReadWrite {
        public static Subblocks fromFile(String fileName) throws IOException {
            return new Subblocks(new ByteBufferKaitaiStream(fileName));
        }
        public Subblocks() {
            this(null, null, null);
        }

        public Subblocks(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Subblocks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Subblocks(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Gif _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.entries = new ArrayList<Subblock>();
            {
                Subblock _it;
                int i = 0;
                do {
                    Subblock _t_entries = new Subblock(this._io, this, _root);
                    try {
                        _t_entries._read();
                    } finally {
                        _it = _t_entries;
                        this.entries.add(_it);
                    }
                    i++;
                } while (!(_it.lenBytes() == 0));
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
                this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.entries.size() == 0)
                throw new ConsistencyError("entries", 0, this.entries.size());
            for (int i = 0; i < this.entries.size(); i++) {
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
                {
                    Subblock _it = this.entries.get(((Number) (i)).intValue());
                    if ((_it.lenBytes() == 0) != (i == this.entries.size() - 1))
                        throw new ConsistencyError("entries", i == this.entries.size() - 1, _it.lenBytes() == 0);
                }
            }
            _dirty = false;
        }
        private List<Subblock> entries;
        private Gif _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Subblock> entries() { return entries; }
        public void setEntries(List<Subblock> _v) { _dirty = true; entries = _v; }
        public Gif _root() { return _root; }
        public void set_root(Gif _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    private Header hdr;
    private LogicalScreenDescriptorStruct logicalScreenDescriptor;
    private ColorTable globalColorTable;
    private List<Block> blocks;
    private Gif _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_globalColorTable;
    public Header hdr() { return hdr; }
    public void setHdr(Header _v) { _dirty = true; hdr = _v; }
    public LogicalScreenDescriptorStruct logicalScreenDescriptor() { return logicalScreenDescriptor; }
    public void setLogicalScreenDescriptor(LogicalScreenDescriptorStruct _v) { _dirty = true; logicalScreenDescriptor = _v; }

    /**
     * @see <a href="https://www.w3.org/Graphics/GIF/spec-gif89a.txt">- section 18</a>
     */
    public ColorTable globalColorTable() { return globalColorTable; }
    public void setGlobalColorTable(ColorTable _v) { _dirty = true; globalColorTable = _v; }
    public List<Block> blocks() { return blocks; }
    public void setBlocks(List<Block> _v) { _dirty = true; blocks = _v; }
    public Gif _root() { return _root; }
    public void set_root(Gif _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_globalColorTable() { return _raw_globalColorTable; }
    public void set_raw_GlobalColorTable(byte[] _v) { _dirty = true; _raw_globalColorTable = _v; }
}
