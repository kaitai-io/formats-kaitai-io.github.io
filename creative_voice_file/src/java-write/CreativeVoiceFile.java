// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * Creative Voice File is a container file format for digital audio
 * wave data. Initial revisions were able to support only unsigned
 * 8-bit PCM and ADPCM data, later versions were revised to add support
 * for 16-bit PCM and a-law / u-law formats.
 * 
 * This format was actively used in 1990s, around the advent of
 * Creative's sound cards (Sound Blaster family). It was a popular
 * choice for a digital sound container in lots of games and multimedia
 * software due to simplicity and availability of Creative's recording
 * / editing tools.
 * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice">Source</a>
 */
public class CreativeVoiceFile extends KaitaiStruct.ReadWrite {
    public static CreativeVoiceFile fromFile(String fileName) throws IOException {
        return new CreativeVoiceFile(new ByteBufferKaitaiStream(fileName));
    }

    public enum BlockTypes {
        TERMINATOR(0),
        SOUND_DATA(1),
        SOUND_DATA_CONT(2),
        SILENCE(3),
        MARKER(4),
        TEXT(5),
        REPEAT_START(6),
        REPEAT_END(7),
        EXTRA_INFO(8),
        SOUND_DATA_NEW(9);

        private final long id;
        BlockTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockTypes> byId = new HashMap<Long, BlockTypes>(10);
        static {
            for (BlockTypes e : BlockTypes.values())
                byId.put(e.id(), e);
        }
        public static BlockTypes byId(long id) { return byId.get(id); }
    }

    public enum Codecs {
        PCM_8BIT_UNSIGNED(0),
        ADPCM_4BIT(1),
        ADPCM_2_6BIT(2),
        ADPCM_2_BIT(3),
        PCM_16BIT_SIGNED(4),
        ALAW(6),
        ULAW(7),
        ADPCM_4_TO_16BIT(512);

        private final long id;
        Codecs(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Codecs> byId = new HashMap<Long, Codecs>(8);
        static {
            for (Codecs e : Codecs.values())
                byId.put(e.id(), e);
        }
        public static Codecs byId(long id) { return byId.get(id); }
    }
    public CreativeVoiceFile() {
        this(null, null, null);
    }

    public CreativeVoiceFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public CreativeVoiceFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public CreativeVoiceFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, CreativeVoiceFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(20);
        if (!(Arrays.equals(this.magic, new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 }, this.magic, this._io, "/seq/0");
        }
        this.headerSize = this._io.readU2le();
        this.version = this._io.readU2le();
        this.checksum = this._io.readU2le();
        this.blocks = new ArrayList<Block>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Block _t_blocks = new Block(this._io, this, _root);
                try {
                    _t_blocks._read();
                } finally {
                    this.blocks.add(_t_blocks);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.blocks.size(); i++) {
            this.blocks.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeU2le(this.headerSize);
        this._io.writeU2le(this.version);
        this._io.writeU2le(this.checksum);
        for (int i = 0; i < this.blocks.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
            this.blocks.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("blocks", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (this.magic.length != 20)
            throw new ConsistencyError("magic", 20, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67, 114, 101, 97, 116, 105, 118, 101, 32, 86, 111, 105, 99, 101, 32, 70, 105, 108, 101, 26 }, this.magic, null, "/seq/0");
        }
        for (int i = 0; i < this.blocks.size(); i++) {
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("blocks", _root(), this.blocks.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.blocks.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("blocks", this, this.blocks.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
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

        public Block(KaitaiStream _io, CreativeVoiceFile _parent) {
            this(_io, _parent, null);
        }

        public Block(KaitaiStream _io, CreativeVoiceFile _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.blockType = CreativeVoiceFile.BlockTypes.byId(this._io.readU1());
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this.bodySize1 = this._io.readU2le();
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this.bodySize2 = this._io.readU1();
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                {
                    BlockTypes on = blockType();
                    if (on != null) {
                        switch (blockType()) {
                        case EXTRA_INFO: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockExtraInfo(_io__raw_body, this, _root);
                            ((BlockExtraInfo) (this.body))._read();
                            break;
                        }
                        case MARKER: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockMarker(_io__raw_body, this, _root);
                            ((BlockMarker) (this.body))._read();
                            break;
                        }
                        case REPEAT_START: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockRepeatStart(_io__raw_body, this, _root);
                            ((BlockRepeatStart) (this.body))._read();
                            break;
                        }
                        case SILENCE: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockSilence(_io__raw_body, this, _root);
                            ((BlockSilence) (this.body))._read();
                            break;
                        }
                        case SOUND_DATA: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockSoundData(_io__raw_body, this, _root);
                            ((BlockSoundData) (this.body))._read();
                            break;
                        }
                        case SOUND_DATA_NEW: {
                            this._raw_body = this._io.readBytes(bodySize());
                            KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                            this.body = new BlockSoundDataNew(_io__raw_body, this, _root);
                            ((BlockSoundDataNew) (this.body))._read();
                            break;
                        }
                        default: {
                            this.body = this._io.readBytes(bodySize());
                            break;
                        }
                        }
                    } else {
                        this.body = this._io.readBytes(bodySize());
                    }
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                {
                    BlockTypes on = blockType();
                    if (on != null) {
                        switch (blockType()) {
                        case EXTRA_INFO: {
                            ((BlockExtraInfo) (this.body))._fetchInstances();
                            break;
                        }
                        case MARKER: {
                            ((BlockMarker) (this.body))._fetchInstances();
                            break;
                        }
                        case REPEAT_START: {
                            ((BlockRepeatStart) (this.body))._fetchInstances();
                            break;
                        }
                        case SILENCE: {
                            ((BlockSilence) (this.body))._fetchInstances();
                            break;
                        }
                        case SOUND_DATA: {
                            ((BlockSoundData) (this.body))._fetchInstances();
                            break;
                        }
                        case SOUND_DATA_NEW: {
                            ((BlockSoundDataNew) (this.body))._fetchInstances();
                            break;
                        }
                        default: {
                            break;
                        }
                        }
                    } else {
                    }
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.blockType.id())).intValue());
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this._io.writeU2le(this.bodySize1);
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this._io.writeU1(this.bodySize2);
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                {
                    BlockTypes on = blockType();
                    if (on != null) {
                        switch (blockType()) {
                        case EXTRA_INFO: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockExtraInfo) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        case MARKER: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockMarker) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        case REPEAT_START: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockRepeatStart) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        case SILENCE: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockSilence) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        case SOUND_DATA: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockSoundData) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        case SOUND_DATA_NEW: {
                            final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(bodySize());
                            this._io.addChildStream(_io__raw_body);
                            {
                                long _pos2 = this._io.pos();
                                this._io.seek(this._io.pos() + (bodySize()));
                                final Block _this = this;
                                _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                    @Override
                                    protected void write(KaitaiStream parent) {
                                        _this._raw_body = _io__raw_body.toByteArray();
                                        if (((byte[]) (_this._raw_body)).length != bodySize())
                                            throw new ConsistencyError("raw(body)", bodySize(), ((byte[]) (_this._raw_body)).length);
                                        parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                    }
                                });
                            }
                            ((BlockSoundDataNew) (this.body))._write_Seq(_io__raw_body);
                            break;
                        }
                        default: {
                            this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                            break;
                        }
                        }
                    } else {
                        this._io.writeBytes(((byte[]) (((byte[]) (this.body)))));
                    }
                }
            }
        }

        public void _check() {
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
            }
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                {
                    BlockTypes on = blockType();
                    if (on != null) {
                        switch (blockType()) {
                        case EXTRA_INFO: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockExtraInfo) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockExtraInfo) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockExtraInfo) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockExtraInfo) (this.body))._parent());
                            break;
                        }
                        case MARKER: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockMarker) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockMarker) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockMarker) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockMarker) (this.body))._parent());
                            break;
                        }
                        case REPEAT_START: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockRepeatStart) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockRepeatStart) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockRepeatStart) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockRepeatStart) (this.body))._parent());
                            break;
                        }
                        case SILENCE: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockSilence) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockSilence) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockSilence) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockSilence) (this.body))._parent());
                            break;
                        }
                        case SOUND_DATA: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockSoundData) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockSoundData) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockSoundData) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockSoundData) (this.body))._parent());
                            break;
                        }
                        case SOUND_DATA_NEW: {
                            if (!Objects.equals(((CreativeVoiceFile.BlockSoundDataNew) (this.body))._root(), _root()))
                                throw new ConsistencyError("body", _root(), ((CreativeVoiceFile.BlockSoundDataNew) (this.body))._root());
                            if (!Objects.equals(((CreativeVoiceFile.BlockSoundDataNew) (this.body))._parent(), this))
                                throw new ConsistencyError("body", this, ((CreativeVoiceFile.BlockSoundDataNew) (this.body))._parent());
                            break;
                        }
                        default: {
                            if (((byte[]) (this.body)).length != bodySize())
                                throw new ConsistencyError("body", bodySize(), ((byte[]) (this.body)).length);
                            break;
                        }
                        }
                    } else {
                        if (((byte[]) (this.body)).length != bodySize())
                            throw new ConsistencyError("body", bodySize(), ((byte[]) (this.body)).length);
                    }
                }
            }
            _dirty = false;
        }
        private Integer bodySize;

        /**
         * body_size is a 24-bit little-endian integer, so we're
         * emulating that by adding two standard-sized integers
         * (body_size1 and body_size2).
         */
        public Integer bodySize() {
            if (this.bodySize != null)
                return this.bodySize;
            if (blockType() != CreativeVoiceFile.BlockTypes.TERMINATOR) {
                this.bodySize = ((Number) (bodySize1() + (bodySize2() << 16))).intValue();
            }
            return this.bodySize;
        }
        public void _invalidateBodySize() { this.bodySize = null; }
        private BlockTypes blockType;
        private Integer bodySize1;
        private Integer bodySize2;
        private Object body;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile _parent;
        private byte[] _raw_body;

        /**
         * Byte that determines type of block content
         */
        public BlockTypes blockType() { return blockType; }
        public void setBlockType(BlockTypes _v) { _dirty = true; blockType = _v; }
        public Integer bodySize1() { return bodySize1; }
        public void setBodySize1(Integer _v) { _dirty = true; bodySize1 = _v; }
        public Integer bodySize2() { return bodySize2; }
        public void setBodySize2(Integer _v) { _dirty = true; bodySize2 = _v; }

        /**
         * Block body, type depends on block type byte
         */
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x08:_Extra_info">Source</a>
     */
    public static class BlockExtraInfo extends KaitaiStruct.ReadWrite {
        public static BlockExtraInfo fromFile(String fileName) throws IOException {
            return new BlockExtraInfo(new ByteBufferKaitaiStream(fileName));
        }
        public BlockExtraInfo() {
            this(null, null, null);
        }

        public BlockExtraInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockExtraInfo(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockExtraInfo(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.freqDiv = this._io.readU2le();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU1());
            this.numChannels1 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.freqDiv);
            this._io.writeU1(((Number) (this.codec.id())).intValue());
            this._io.writeU1(this.numChannels1);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer numChannels;

        /**
         * Number of channels (1 = mono, 2 = stereo)
         */
        public Integer numChannels() {
            if (this.numChannels != null)
                return this.numChannels;
            this.numChannels = ((Number) (numChannels1() + 1)).intValue();
            return this.numChannels;
        }
        public void _invalidateNumChannels() { this.numChannels = null; }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            this.sampleRate = ((Number) (256000000.0 / (numChannels() * (65536 - freqDiv())))).doubleValue();
            return this.sampleRate;
        }
        public void _invalidateSampleRate() { this.sampleRate = null; }
        private int freqDiv;
        private Codecs codec;
        private int numChannels1;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Frequency divisor
         */
        public int freqDiv() { return freqDiv; }
        public void setFreqDiv(int _v) { _dirty = true; freqDiv = _v; }
        public Codecs codec() { return codec; }
        public void setCodec(Codecs _v) { _dirty = true; codec = _v; }

        /**
         * Number of channels minus 1 (0 = mono, 1 = stereo)
         */
        public int numChannels1() { return numChannels1; }
        public void setNumChannels1(int _v) { _dirty = true; numChannels1 = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x04:_Marker">Source</a>
     */
    public static class BlockMarker extends KaitaiStruct.ReadWrite {
        public static BlockMarker fromFile(String fileName) throws IOException {
            return new BlockMarker(new ByteBufferKaitaiStream(fileName));
        }
        public BlockMarker() {
            this(null, null, null);
        }

        public BlockMarker(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockMarker(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockMarker(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.markerId = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.markerId);
        }

        public void _check() {
            _dirty = false;
        }
        private int markerId;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Marker ID
         */
        public int markerId() { return markerId; }
        public void setMarkerId(int _v) { _dirty = true; markerId = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x06:_Repeat_start">Source</a>
     */
    public static class BlockRepeatStart extends KaitaiStruct.ReadWrite {
        public static BlockRepeatStart fromFile(String fileName) throws IOException {
            return new BlockRepeatStart(new ByteBufferKaitaiStream(fileName));
        }
        public BlockRepeatStart() {
            this(null, null, null);
        }

        public BlockRepeatStart(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockRepeatStart(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockRepeatStart(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.repeatCount1 = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.repeatCount1);
        }

        public void _check() {
            _dirty = false;
        }
        private int repeatCount1;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Number of repetitions minus 1; 0xffff means infinite repetitions
         */
        public int repeatCount1() { return repeatCount1; }
        public void setRepeatCount1(int _v) { _dirty = true; repeatCount1 = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x03:_Silence">Source</a>
     */
    public static class BlockSilence extends KaitaiStruct.ReadWrite {
        public static BlockSilence fromFile(String fileName) throws IOException {
            return new BlockSilence(new ByteBufferKaitaiStream(fileName));
        }
        public BlockSilence() {
            this(null, null, null);
        }

        public BlockSilence(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSilence(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSilence(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.durationSamples = this._io.readU2le();
            this.freqDiv = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.durationSamples);
            this._io.writeU1(this.freqDiv);
        }

        public void _check() {
            _dirty = false;
        }
        private Double durationSec;

        /**
         * Duration of silence, in seconds
         */
        public Double durationSec() {
            if (this.durationSec != null)
                return this.durationSec;
            this.durationSec = ((Number) (durationSamples() / sampleRate())).doubleValue();
            return this.durationSec;
        }
        public void _invalidateDurationSec() { this.durationSec = null; }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            this.sampleRate = ((Number) (1000000.0 / (256 - freqDiv()))).doubleValue();
            return this.sampleRate;
        }
        public void _invalidateSampleRate() { this.sampleRate = null; }
        private int durationSamples;
        private int freqDiv;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Duration of silence, in samples
         */
        public int durationSamples() { return durationSamples; }
        public void setDurationSamples(int _v) { _dirty = true; durationSamples = _v; }

        /**
         * Frequency divisor, used to determine sample rate
         */
        public int freqDiv() { return freqDiv; }
        public void setFreqDiv(int _v) { _dirty = true; freqDiv = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x01:_Sound_data">Source</a>
     */
    public static class BlockSoundData extends KaitaiStruct.ReadWrite {
        public static BlockSoundData fromFile(String fileName) throws IOException {
            return new BlockSoundData(new ByteBufferKaitaiStream(fileName));
        }
        public BlockSoundData() {
            this(null, null, null);
        }

        public BlockSoundData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSoundData(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSoundData(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.freqDiv = this._io.readU1();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU1());
            this.wave = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.freqDiv);
            this._io.writeU1(((Number) (this.codec.id())).intValue());
            this._io.writeBytes(this.wave);
            if (!(this._io.isEof()))
                throw new ConsistencyError("wave", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private Double sampleRate;
        public Double sampleRate() {
            if (this.sampleRate != null)
                return this.sampleRate;
            this.sampleRate = ((Number) (1000000.0 / (256 - freqDiv()))).doubleValue();
            return this.sampleRate;
        }
        public void _invalidateSampleRate() { this.sampleRate = null; }
        private int freqDiv;
        private Codecs codec;
        private byte[] wave;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;

        /**
         * Frequency divisor, used to determine sample rate
         */
        public int freqDiv() { return freqDiv; }
        public void setFreqDiv(int _v) { _dirty = true; freqDiv = _v; }
        public Codecs codec() { return codec; }
        public void setCodec(Codecs _v) { _dirty = true; codec = _v; }
        public byte[] wave() { return wave; }
        public void setWave(byte[] _v) { _dirty = true; wave = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://wiki.multimedia.cx/index.php?title=Creative_Voice#Block_type_0x09:_Sound_data_.28New_format.29">Source</a>
     */
    public static class BlockSoundDataNew extends KaitaiStruct.ReadWrite {
        public static BlockSoundDataNew fromFile(String fileName) throws IOException {
            return new BlockSoundDataNew(new ByteBufferKaitaiStream(fileName));
        }
        public BlockSoundDataNew() {
            this(null, null, null);
        }

        public BlockSoundDataNew(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BlockSoundDataNew(KaitaiStream _io, CreativeVoiceFile.Block _parent) {
            this(_io, _parent, null);
        }

        public BlockSoundDataNew(KaitaiStream _io, CreativeVoiceFile.Block _parent, CreativeVoiceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sampleRate = this._io.readU4le();
            this.bitsPerSample = this._io.readU1();
            this.numChannels = this._io.readU1();
            this.codec = CreativeVoiceFile.Codecs.byId(this._io.readU2le());
            this.reserved = this._io.readBytes(4);
            this.wave = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.sampleRate);
            this._io.writeU1(this.bitsPerSample);
            this._io.writeU1(this.numChannels);
            this._io.writeU2le(((Number) (this.codec.id())).intValue());
            this._io.writeBytes(this.reserved);
            this._io.writeBytes(this.wave);
            if (!(this._io.isEof()))
                throw new ConsistencyError("wave", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (this.reserved.length != 4)
                throw new ConsistencyError("reserved", 4, this.reserved.length);
            _dirty = false;
        }
        private long sampleRate;
        private int bitsPerSample;
        private int numChannels;
        private Codecs codec;
        private byte[] reserved;
        private byte[] wave;
        private CreativeVoiceFile _root;
        private CreativeVoiceFile.Block _parent;
        public long sampleRate() { return sampleRate; }
        public void setSampleRate(long _v) { _dirty = true; sampleRate = _v; }
        public int bitsPerSample() { return bitsPerSample; }
        public void setBitsPerSample(int _v) { _dirty = true; bitsPerSample = _v; }
        public int numChannels() { return numChannels; }
        public void setNumChannels(int _v) { _dirty = true; numChannels = _v; }
        public Codecs codec() { return codec; }
        public void setCodec(Codecs _v) { _dirty = true; codec = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public byte[] wave() { return wave; }
        public void setWave(byte[] _v) { _dirty = true; wave = _v; }
        public CreativeVoiceFile _root() { return _root; }
        public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
        public CreativeVoiceFile.Block _parent() { return _parent; }
        public void set_parent(CreativeVoiceFile.Block _v) { _dirty = true; _parent = _v; }
    }
    private byte[] magic;
    private int headerSize;
    private int version;
    private int checksum;
    private List<Block> blocks;
    private CreativeVoiceFile _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

    /**
     * Total size of this main header (usually 0x001A)
     */
    public int headerSize() { return headerSize; }
    public void setHeaderSize(int _v) { _dirty = true; headerSize = _v; }
    public int version() { return version; }
    public void setVersion(int _v) { _dirty = true; version = _v; }

    /**
     * Checksum: this must be equal to ~version + 0x1234
     */
    public int checksum() { return checksum; }
    public void setChecksum(int _v) { _dirty = true; checksum = _v; }

    /**
     * Series of blocks that contain the actual audio data
     */
    public List<Block> blocks() { return blocks; }
    public void setBlocks(List<Block> _v) { _dirty = true; blocks = _v; }
    public CreativeVoiceFile _root() { return _root; }
    public void set_root(CreativeVoiceFile _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
