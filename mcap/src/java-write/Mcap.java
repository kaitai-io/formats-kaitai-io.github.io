// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * MCAP is a modular container format and logging library for pub/sub messages with
 * arbitrary message serialization. It is primarily intended for use in robotics
 * applications, and works well under various workloads, resource constraints, and
 * durability requirements.
 * 
 * Time values (`log_time`, `publish_time`, `create_time`) are represented in
 * nanoseconds since a user-understood epoch (i.e. Unix epoch, robot boot time,
 * etc.)
 * @see <a href="https://github.com/foxglove/mcap/tree/c1cc51d/docs/specification#readme">Source</a>
 */
public class Mcap extends KaitaiStruct.ReadWrite {
    public static Mcap fromFile(String fileName) throws IOException {
        return new Mcap(new ByteBufferKaitaiStream(fileName));
    }

    public enum Opcode {
        HEADER(1),
        FOOTER(2),
        SCHEMA(3),
        CHANNEL(4),
        MESSAGE(5),
        CHUNK(6),
        MESSAGE_INDEX(7),
        CHUNK_INDEX(8),
        ATTACHMENT(9),
        ATTACHMENT_INDEX(10),
        STATISTICS(11),
        METADATA(12),
        METADATA_INDEX(13),
        SUMMARY_OFFSET(14),
        DATA_END(15);

        private final long id;
        Opcode(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Opcode> byId = new HashMap<Long, Opcode>(15);
        static {
            for (Opcode e : Opcode.values())
                byId.put(e.id(), e);
        }
        public static Opcode byId(long id) { return byId.get(id); }
    }
    public Mcap() {
        this(null, null, null);
    }

    public Mcap(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Mcap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Mcap(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Mcap _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.headerMagic = new Magic(this._io, this, _root);
        this.headerMagic._read();
        this.records = new ArrayList<Record>();
        {
            Record _it;
            int i = 0;
            do {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    _it = _t_records;
                    this.records.add(_it);
                }
                i++;
            } while (!(_it.op() == Opcode.FOOTER));
        }
        this.footerMagic = new Magic(this._io, this, _root);
        this.footerMagic._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.headerMagic._fetchInstances();
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
        this.footerMagic._fetchInstances();
        footer();
        if (this.footer != null) {
            this.footer._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWriteFooter = _enabledFooter;
        this.headerMagic._write_Seq(this._io);
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this.footerMagic._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.headerMagic._root(), _root()))
            throw new ConsistencyError("header_magic", _root(), this.headerMagic._root());
        if (!Objects.equals(this.headerMagic._parent(), this))
            throw new ConsistencyError("header_magic", this, this.headerMagic._parent());
        if (this.records.size() == 0)
            throw new ConsistencyError("records", 0, this.records.size());
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
            {
                Record _it = this.records.get(((Number) (i)).intValue());
                if ((_it.op() == Opcode.FOOTER) != (i == this.records.size() - 1))
                    throw new ConsistencyError("records", i == this.records.size() - 1, _it.op() == Opcode.FOOTER);
            }
        }
        if (!Objects.equals(this.footerMagic._root(), _root()))
            throw new ConsistencyError("footer_magic", _root(), this.footerMagic._root());
        if (!Objects.equals(this.footerMagic._parent(), this))
            throw new ConsistencyError("footer_magic", this, this.footerMagic._parent());
        if (_enabledFooter) {
            if (!Objects.equals(this.footer._root(), _root()))
                throw new ConsistencyError("footer", _root(), this.footer._root());
            if (!Objects.equals(this.footer._parent(), this))
                throw new ConsistencyError("footer", this, this.footer._parent());
        }
        _dirty = false;
    }
    public static class Attachment extends KaitaiStruct.ReadWrite {
        public static Attachment fromFile(String fileName) throws IOException {
            return new Attachment(new ByteBufferKaitaiStream(fileName));
        }
        public Attachment() {
            this(null, null, null);
        }

        public Attachment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Attachment(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Attachment(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.logTime = this._io.readU8le();
            this.createTime = this._io.readU8le();
            this.name = new PrefixedStr(this._io, this, _root);
            this.name._read();
            this.contentType = new PrefixedStr(this._io, this, _root);
            this.contentType._read();
            this.lenData = this._io.readU8le();
            this.data = this._io.readBytes(lenData());
            if (crc32InputEnd() >= 0) {
                this.invokeCrc32InputEnd = this._io.readBytes(0);
            }
            this.crc32 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            this.contentType._fetchInstances();
            if (crc32InputEnd() >= 0) {
            }
            crc32Input();
            if (this.crc32Input != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteCrc32Input = _enabledCrc32Input;
            this._io.writeU8le(this.logTime);
            this._io.writeU8le(this.createTime);
            this.name._write_Seq(this._io);
            this.contentType._write_Seq(this._io);
            this._io.writeU8le(this.lenData);
            this._io.writeBytes(this.data);
            if (crc32InputEnd() >= 0) {
                if (this.invokeCrc32InputEnd.length != 0)
                    throw new ConsistencyError("invoke_crc32_input_end", 0, this.invokeCrc32InputEnd.length);
                this._io.writeBytes(this.invokeCrc32InputEnd);
            }
            this._io.writeU4le(this.crc32);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.contentType._root(), _root()))
                throw new ConsistencyError("content_type", _root(), this.contentType._root());
            if (!Objects.equals(this.contentType._parent(), this))
                throw new ConsistencyError("content_type", this, this.contentType._parent());
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            if (_enabledCrc32Input) {
            }
            _dirty = false;
        }
        private byte[] crc32Input;
        private boolean _shouldWriteCrc32Input = false;
        private boolean _enabledCrc32Input = true;
        public byte[] crc32Input() {
            if (_shouldWriteCrc32Input)
                _writeCrc32Input();
            if (this.crc32Input != null)
                return this.crc32Input;
            if (!_enabledCrc32Input)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.crc32Input = this._io.readBytes(crc32InputEnd());
            this._io.seek(_pos);
            return this.crc32Input;
        }
        public void setCrc32Input(byte[] _v) { _dirty = true; crc32Input = _v; }
        public void setCrc32Input_Enabled(boolean _v) { _dirty = true; _enabledCrc32Input = _v; }

        private void _writeCrc32Input() {
            _shouldWriteCrc32Input = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            if (this.crc32Input.length != crc32InputEnd())
                throw new ConsistencyError("crc32_input", crc32InputEnd(), this.crc32Input.length);
            this._io.writeBytes(this.crc32Input);
            this._io.seek(_pos);
        }
        private Integer crc32InputEnd;
        public Integer crc32InputEnd() {
            if (this.crc32InputEnd != null)
                return this.crc32InputEnd;
            this.crc32InputEnd = ((Number) (_io().pos())).intValue();
            return this.crc32InputEnd;
        }
        public void _invalidateCrc32InputEnd() { this.crc32InputEnd = null; }
        private long logTime;
        private long createTime;
        private PrefixedStr name;
        private PrefixedStr contentType;
        private long lenData;
        private byte[] data;
        private byte[] invokeCrc32InputEnd;
        private long crc32;
        private Mcap _root;
        private Mcap.Record _parent;
        public long logTime() { return logTime; }
        public void setLogTime(long _v) { _dirty = true; logTime = _v; }
        public long createTime() { return createTime; }
        public void setCreateTime(long _v) { _dirty = true; createTime = _v; }
        public PrefixedStr name() { return name; }
        public void setName(PrefixedStr _v) { _dirty = true; name = _v; }
        public PrefixedStr contentType() { return contentType; }
        public void setContentType(PrefixedStr _v) { _dirty = true; contentType = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public byte[] invokeCrc32InputEnd() { return invokeCrc32InputEnd; }
        public void setInvokeCrc32InputEnd(byte[] _v) { _dirty = true; invokeCrc32InputEnd = _v; }

        /**
         * CRC-32 checksum of preceding fields in the record. A value of zero indicates that
         * CRC validation should not be performed.
         */
        public long crc32() { return crc32; }
        public void setCrc32(long _v) { _dirty = true; crc32 = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class AttachmentIndex extends KaitaiStruct.ReadWrite {
        public static AttachmentIndex fromFile(String fileName) throws IOException {
            return new AttachmentIndex(new ByteBufferKaitaiStream(fileName));
        }
        public AttachmentIndex() {
            this(null, null, null);
        }

        public AttachmentIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AttachmentIndex(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public AttachmentIndex(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsAttachment = this._io.readU8le();
            this.lenAttachment = this._io.readU8le();
            this.logTime = this._io.readU8le();
            this.createTime = this._io.readU8le();
            this.dataSize = this._io.readU8le();
            this.name = new PrefixedStr(this._io, this, _root);
            this.name._read();
            this.contentType = new PrefixedStr(this._io, this, _root);
            this.contentType._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            this.contentType._fetchInstances();
            attachment();
            if (this.attachment != null) {
                this.attachment._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteAttachment = _enabledAttachment;
            this._io.writeU8le(this.ofsAttachment);
            this._io.writeU8le(this.lenAttachment);
            this._io.writeU8le(this.logTime);
            this._io.writeU8le(this.createTime);
            this._io.writeU8le(this.dataSize);
            this.name._write_Seq(this._io);
            this.contentType._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.contentType._root(), _root()))
                throw new ConsistencyError("content_type", _root(), this.contentType._root());
            if (!Objects.equals(this.contentType._parent(), this))
                throw new ConsistencyError("content_type", this, this.contentType._parent());
            if (_enabledAttachment) {
                if (!Objects.equals(this.attachment._root(), _root()))
                    throw new ConsistencyError("attachment", _root(), this.attachment._root());
                if (!Objects.equals(this.attachment._parent(), this))
                    throw new ConsistencyError("attachment", this, this.attachment._parent());
            }
            _dirty = false;
        }
        private Record attachment;
        private boolean _shouldWriteAttachment = false;
        private boolean _enabledAttachment = true;
        public Record attachment() {
            if (_shouldWriteAttachment)
                _writeAttachment();
            if (this.attachment != null)
                return this.attachment;
            if (!_enabledAttachment)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsAttachment());
            this._raw_attachment = io.readBytes(lenAttachment());
            KaitaiStream _io__raw_attachment = new ByteBufferKaitaiStream(this._raw_attachment);
            this.attachment = new Record(_io__raw_attachment, this, _root);
            this.attachment._read();
            io.seek(_pos);
            return this.attachment;
        }
        public void setAttachment(Record _v) { _dirty = true; attachment = _v; }
        public void setAttachment_Enabled(boolean _v) { _dirty = true; _enabledAttachment = _v; }

        private void _writeAttachment() {
            _shouldWriteAttachment = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsAttachment());
            final KaitaiStream _io__raw_attachment = new ByteBufferKaitaiStream(lenAttachment());
            io.addChildStream(_io__raw_attachment);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (lenAttachment()));
                final AttachmentIndex _this = this;
                _io__raw_attachment.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_attachment = _io__raw_attachment.toByteArray();
                        if (_this._raw_attachment.length != lenAttachment())
                            throw new ConsistencyError("raw(attachment)", lenAttachment(), _this._raw_attachment.length);
                        parent.writeBytes(_this._raw_attachment);
                    }
                });
            }
            this.attachment._write_Seq(_io__raw_attachment);
            io.seek(_pos);
        }
        private long ofsAttachment;
        private long lenAttachment;
        private long logTime;
        private long createTime;
        private long dataSize;
        private PrefixedStr name;
        private PrefixedStr contentType;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_attachment;
        public long ofsAttachment() { return ofsAttachment; }
        public void setOfsAttachment(long _v) { _dirty = true; ofsAttachment = _v; }
        public long lenAttachment() { return lenAttachment; }
        public void setLenAttachment(long _v) { _dirty = true; lenAttachment = _v; }
        public long logTime() { return logTime; }
        public void setLogTime(long _v) { _dirty = true; logTime = _v; }
        public long createTime() { return createTime; }
        public void setCreateTime(long _v) { _dirty = true; createTime = _v; }
        public long dataSize() { return dataSize; }
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
        public PrefixedStr name() { return name; }
        public void setName(PrefixedStr _v) { _dirty = true; name = _v; }
        public PrefixedStr contentType() { return contentType; }
        public void setContentType(PrefixedStr _v) { _dirty = true; contentType = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_attachment() { return _raw_attachment; }
        public void set_raw_Attachment(byte[] _v) { _dirty = true; _raw_attachment = _v; }
    }
    public static class Channel extends KaitaiStruct.ReadWrite {
        public static Channel fromFile(String fileName) throws IOException {
            return new Channel(new ByteBufferKaitaiStream(fileName));
        }
        public Channel() {
            this(null, null, null);
        }

        public Channel(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Channel(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Channel(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.schemaId = this._io.readU2le();
            this.topic = new PrefixedStr(this._io, this, _root);
            this.topic._read();
            this.messageEncoding = new PrefixedStr(this._io, this, _root);
            this.messageEncoding._read();
            this.metadata = new MapStrStr(this._io, this, _root);
            this.metadata._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.topic._fetchInstances();
            this.messageEncoding._fetchInstances();
            this.metadata._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.id);
            this._io.writeU2le(this.schemaId);
            this.topic._write_Seq(this._io);
            this.messageEncoding._write_Seq(this._io);
            this.metadata._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.topic._root(), _root()))
                throw new ConsistencyError("topic", _root(), this.topic._root());
            if (!Objects.equals(this.topic._parent(), this))
                throw new ConsistencyError("topic", this, this.topic._parent());
            if (!Objects.equals(this.messageEncoding._root(), _root()))
                throw new ConsistencyError("message_encoding", _root(), this.messageEncoding._root());
            if (!Objects.equals(this.messageEncoding._parent(), this))
                throw new ConsistencyError("message_encoding", this, this.messageEncoding._parent());
            if (!Objects.equals(this.metadata._root(), _root()))
                throw new ConsistencyError("metadata", _root(), this.metadata._root());
            if (!Objects.equals(this.metadata._parent(), this))
                throw new ConsistencyError("metadata", this, this.metadata._parent());
            _dirty = false;
        }
        private int id;
        private int schemaId;
        private PrefixedStr topic;
        private PrefixedStr messageEncoding;
        private MapStrStr metadata;
        private Mcap _root;
        private Mcap.Record _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public int schemaId() { return schemaId; }
        public void setSchemaId(int _v) { _dirty = true; schemaId = _v; }
        public PrefixedStr topic() { return topic; }
        public void setTopic(PrefixedStr _v) { _dirty = true; topic = _v; }
        public PrefixedStr messageEncoding() { return messageEncoding; }
        public void setMessageEncoding(PrefixedStr _v) { _dirty = true; messageEncoding = _v; }
        public MapStrStr metadata() { return metadata; }
        public void setMetadata(MapStrStr _v) { _dirty = true; metadata = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Chunk extends KaitaiStruct.ReadWrite {
        public static Chunk fromFile(String fileName) throws IOException {
            return new Chunk(new ByteBufferKaitaiStream(fileName));
        }
        public Chunk() {
            this(null, null, null);
        }

        public Chunk(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chunk(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Chunk(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.messageStartTime = this._io.readU8le();
            this.messageEndTime = this._io.readU8le();
            this.uncompressedSize = this._io.readU8le();
            this.uncompressedCrc32 = this._io.readU4le();
            this.compression = new PrefixedStr(this._io, this, _root);
            this.compression._read();
            this.lenRecords = this._io.readU8le();
            switch (compression().str()) {
            case "": {
                this._raw_records = this._io.readBytes(lenRecords());
                KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(this._raw_records);
                this.records = new Records(_io__raw_records, this, _root);
                ((Records) (this.records))._read();
                break;
            }
            default: {
                this.records = this._io.readBytes(lenRecords());
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.compression._fetchInstances();
            switch (compression().str()) {
            case "": {
                ((Records) (this.records))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.messageStartTime);
            this._io.writeU8le(this.messageEndTime);
            this._io.writeU8le(this.uncompressedSize);
            this._io.writeU4le(this.uncompressedCrc32);
            this.compression._write_Seq(this._io);
            this._io.writeU8le(this.lenRecords);
            switch (compression().str()) {
            case "": {
                final KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(lenRecords());
                this._io.addChildStream(_io__raw_records);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenRecords()));
                    final Chunk _this = this;
                    _io__raw_records.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_records = _io__raw_records.toByteArray();
                            if (((byte[]) (_this._raw_records)).length != lenRecords())
                                throw new ConsistencyError("raw(records)", lenRecords(), ((byte[]) (_this._raw_records)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_records)))));
                        }
                    });
                }
                ((Records) (this.records))._write_Seq(_io__raw_records);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.records)))));
                break;
            }
            }
        }

        public void _check() {
            if (!Objects.equals(this.compression._root(), _root()))
                throw new ConsistencyError("compression", _root(), this.compression._root());
            if (!Objects.equals(this.compression._parent(), this))
                throw new ConsistencyError("compression", this, this.compression._parent());
            switch (compression().str()) {
            case "": {
                if (!Objects.equals(((Mcap.Records) (this.records))._root(), _root()))
                    throw new ConsistencyError("records", _root(), ((Mcap.Records) (this.records))._root());
                if (!Objects.equals(((Mcap.Records) (this.records))._parent(), this))
                    throw new ConsistencyError("records", this, ((Mcap.Records) (this.records))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.records)).length != lenRecords())
                    throw new ConsistencyError("records", lenRecords(), ((byte[]) (this.records)).length);
                break;
            }
            }
            _dirty = false;
        }
        private long messageStartTime;
        private long messageEndTime;
        private long uncompressedSize;
        private long uncompressedCrc32;
        private PrefixedStr compression;
        private long lenRecords;
        private Object records;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_records;
        public long messageStartTime() { return messageStartTime; }
        public void setMessageStartTime(long _v) { _dirty = true; messageStartTime = _v; }
        public long messageEndTime() { return messageEndTime; }
        public void setMessageEndTime(long _v) { _dirty = true; messageEndTime = _v; }
        public long uncompressedSize() { return uncompressedSize; }
        public void setUncompressedSize(long _v) { _dirty = true; uncompressedSize = _v; }

        /**
         * CRC-32 checksum of uncompressed `records` field. A value of zero indicates that
         * CRC validation should not be performed.
         */
        public long uncompressedCrc32() { return uncompressedCrc32; }
        public void setUncompressedCrc32(long _v) { _dirty = true; uncompressedCrc32 = _v; }
        public PrefixedStr compression() { return compression; }
        public void setCompression(PrefixedStr _v) { _dirty = true; compression = _v; }
        public long lenRecords() { return lenRecords; }
        public void setLenRecords(long _v) { _dirty = true; lenRecords = _v; }
        public Object records() { return records; }
        public void setRecords(Object _v) { _dirty = true; records = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_records() { return _raw_records; }
        public void set_raw_Records(byte[] _v) { _dirty = true; _raw_records = _v; }
    }
    public static class ChunkIndex extends KaitaiStruct.ReadWrite {
        public static ChunkIndex fromFile(String fileName) throws IOException {
            return new ChunkIndex(new ByteBufferKaitaiStream(fileName));
        }
        public ChunkIndex() {
            this(null, null, null);
        }

        public ChunkIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ChunkIndex(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public ChunkIndex(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.messageStartTime = this._io.readU8le();
            this.messageEndTime = this._io.readU8le();
            this.ofsChunk = this._io.readU8le();
            this.lenChunk = this._io.readU8le();
            this.lenMessageIndexOffsets = this._io.readU4le();
            this._raw_messageIndexOffsets = this._io.readBytes(lenMessageIndexOffsets());
            KaitaiStream _io__raw_messageIndexOffsets = new ByteBufferKaitaiStream(this._raw_messageIndexOffsets);
            this.messageIndexOffsets = new MessageIndexOffsets(_io__raw_messageIndexOffsets, this, _root);
            this.messageIndexOffsets._read();
            this.messageIndexLength = this._io.readU8le();
            this.compression = new PrefixedStr(this._io, this, _root);
            this.compression._read();
            this.compressedSize = this._io.readU8le();
            this.uncompressedSize = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.messageIndexOffsets._fetchInstances();
            this.compression._fetchInstances();
            chunk();
            if (this.chunk != null) {
                this.chunk._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteChunk = _enabledChunk;
            this._io.writeU8le(this.messageStartTime);
            this._io.writeU8le(this.messageEndTime);
            this._io.writeU8le(this.ofsChunk);
            this._io.writeU8le(this.lenChunk);
            this._io.writeU4le(this.lenMessageIndexOffsets);
            final KaitaiStream _io__raw_messageIndexOffsets = new ByteBufferKaitaiStream(lenMessageIndexOffsets());
            this._io.addChildStream(_io__raw_messageIndexOffsets);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenMessageIndexOffsets()));
                final ChunkIndex _this = this;
                _io__raw_messageIndexOffsets.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_messageIndexOffsets = _io__raw_messageIndexOffsets.toByteArray();
                        if (_this._raw_messageIndexOffsets.length != lenMessageIndexOffsets())
                            throw new ConsistencyError("raw(message_index_offsets)", lenMessageIndexOffsets(), _this._raw_messageIndexOffsets.length);
                        parent.writeBytes(_this._raw_messageIndexOffsets);
                    }
                });
            }
            this.messageIndexOffsets._write_Seq(_io__raw_messageIndexOffsets);
            this._io.writeU8le(this.messageIndexLength);
            this.compression._write_Seq(this._io);
            this._io.writeU8le(this.compressedSize);
            this._io.writeU8le(this.uncompressedSize);
        }

        public void _check() {
            if (!Objects.equals(this.messageIndexOffsets._root(), _root()))
                throw new ConsistencyError("message_index_offsets", _root(), this.messageIndexOffsets._root());
            if (!Objects.equals(this.messageIndexOffsets._parent(), this))
                throw new ConsistencyError("message_index_offsets", this, this.messageIndexOffsets._parent());
            if (!Objects.equals(this.compression._root(), _root()))
                throw new ConsistencyError("compression", _root(), this.compression._root());
            if (!Objects.equals(this.compression._parent(), this))
                throw new ConsistencyError("compression", this, this.compression._parent());
            if (_enabledChunk) {
                if (!Objects.equals(this.chunk._root(), _root()))
                    throw new ConsistencyError("chunk", _root(), this.chunk._root());
                if (!Objects.equals(this.chunk._parent(), this))
                    throw new ConsistencyError("chunk", this, this.chunk._parent());
            }
            _dirty = false;
        }
        public static class MessageIndexOffset extends KaitaiStruct.ReadWrite {
            public static MessageIndexOffset fromFile(String fileName) throws IOException {
                return new MessageIndexOffset(new ByteBufferKaitaiStream(fileName));
            }
            public MessageIndexOffset() {
                this(null, null, null);
            }

            public MessageIndexOffset(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MessageIndexOffset(KaitaiStream _io, Mcap.ChunkIndex.MessageIndexOffsets _parent) {
                this(_io, _parent, null);
            }

            public MessageIndexOffset(KaitaiStream _io, Mcap.ChunkIndex.MessageIndexOffsets _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.channelId = this._io.readU2le();
                this.offset = this._io.readU8le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.channelId);
                this._io.writeU8le(this.offset);
            }

            public void _check() {
                _dirty = false;
            }
            private int channelId;
            private long offset;
            private Mcap _root;
            private Mcap.ChunkIndex.MessageIndexOffsets _parent;
            public int channelId() { return channelId; }
            public void setChannelId(int _v) { _dirty = true; channelId = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.ChunkIndex.MessageIndexOffsets _parent() { return _parent; }
            public void set_parent(Mcap.ChunkIndex.MessageIndexOffsets _v) { _dirty = true; _parent = _v; }
        }
        public static class MessageIndexOffsets extends KaitaiStruct.ReadWrite {
            public static MessageIndexOffsets fromFile(String fileName) throws IOException {
                return new MessageIndexOffsets(new ByteBufferKaitaiStream(fileName));
            }
            public MessageIndexOffsets() {
                this(null, null, null);
            }

            public MessageIndexOffsets(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MessageIndexOffsets(KaitaiStream _io, Mcap.ChunkIndex _parent) {
                this(_io, _parent, null);
            }

            public MessageIndexOffsets(KaitaiStream _io, Mcap.ChunkIndex _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.entries = new ArrayList<MessageIndexOffset>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        MessageIndexOffset _t_entries = new MessageIndexOffset(this._io, this, _root);
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
            private List<MessageIndexOffset> entries;
            private Mcap _root;
            private Mcap.ChunkIndex _parent;
            public List<MessageIndexOffset> entries() { return entries; }
            public void setEntries(List<MessageIndexOffset> _v) { _dirty = true; entries = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.ChunkIndex _parent() { return _parent; }
            public void set_parent(Mcap.ChunkIndex _v) { _dirty = true; _parent = _v; }
        }
        private Record chunk;
        private boolean _shouldWriteChunk = false;
        private boolean _enabledChunk = true;
        public Record chunk() {
            if (_shouldWriteChunk)
                _writeChunk();
            if (this.chunk != null)
                return this.chunk;
            if (!_enabledChunk)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsChunk());
            this._raw_chunk = io.readBytes(lenChunk());
            KaitaiStream _io__raw_chunk = new ByteBufferKaitaiStream(this._raw_chunk);
            this.chunk = new Record(_io__raw_chunk, this, _root);
            this.chunk._read();
            io.seek(_pos);
            return this.chunk;
        }
        public void setChunk(Record _v) { _dirty = true; chunk = _v; }
        public void setChunk_Enabled(boolean _v) { _dirty = true; _enabledChunk = _v; }

        private void _writeChunk() {
            _shouldWriteChunk = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsChunk());
            final KaitaiStream _io__raw_chunk = new ByteBufferKaitaiStream(lenChunk());
            io.addChildStream(_io__raw_chunk);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (lenChunk()));
                final ChunkIndex _this = this;
                _io__raw_chunk.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_chunk = _io__raw_chunk.toByteArray();
                        if (_this._raw_chunk.length != lenChunk())
                            throw new ConsistencyError("raw(chunk)", lenChunk(), _this._raw_chunk.length);
                        parent.writeBytes(_this._raw_chunk);
                    }
                });
            }
            this.chunk._write_Seq(_io__raw_chunk);
            io.seek(_pos);
        }
        private long messageStartTime;
        private long messageEndTime;
        private long ofsChunk;
        private long lenChunk;
        private long lenMessageIndexOffsets;
        private MessageIndexOffsets messageIndexOffsets;
        private long messageIndexLength;
        private PrefixedStr compression;
        private long compressedSize;
        private long uncompressedSize;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_messageIndexOffsets;
        private byte[] _raw_chunk;
        public long messageStartTime() { return messageStartTime; }
        public void setMessageStartTime(long _v) { _dirty = true; messageStartTime = _v; }
        public long messageEndTime() { return messageEndTime; }
        public void setMessageEndTime(long _v) { _dirty = true; messageEndTime = _v; }
        public long ofsChunk() { return ofsChunk; }
        public void setOfsChunk(long _v) { _dirty = true; ofsChunk = _v; }
        public long lenChunk() { return lenChunk; }
        public void setLenChunk(long _v) { _dirty = true; lenChunk = _v; }
        public long lenMessageIndexOffsets() { return lenMessageIndexOffsets; }
        public void setLenMessageIndexOffsets(long _v) { _dirty = true; lenMessageIndexOffsets = _v; }
        public MessageIndexOffsets messageIndexOffsets() { return messageIndexOffsets; }
        public void setMessageIndexOffsets(MessageIndexOffsets _v) { _dirty = true; messageIndexOffsets = _v; }
        public long messageIndexLength() { return messageIndexLength; }
        public void setMessageIndexLength(long _v) { _dirty = true; messageIndexLength = _v; }
        public PrefixedStr compression() { return compression; }
        public void setCompression(PrefixedStr _v) { _dirty = true; compression = _v; }
        public long compressedSize() { return compressedSize; }
        public void setCompressedSize(long _v) { _dirty = true; compressedSize = _v; }
        public long uncompressedSize() { return uncompressedSize; }
        public void setUncompressedSize(long _v) { _dirty = true; uncompressedSize = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_messageIndexOffsets() { return _raw_messageIndexOffsets; }
        public void set_raw_MessageIndexOffsets(byte[] _v) { _dirty = true; _raw_messageIndexOffsets = _v; }
        public byte[] _raw_chunk() { return _raw_chunk; }
        public void set_raw_Chunk(byte[] _v) { _dirty = true; _raw_chunk = _v; }
    }
    public static class DataEnd extends KaitaiStruct.ReadWrite {
        public static DataEnd fromFile(String fileName) throws IOException {
            return new DataEnd(new ByteBufferKaitaiStream(fileName));
        }
        public DataEnd() {
            this(null, null, null);
        }

        public DataEnd(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataEnd(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public DataEnd(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.dataSectionCrc32 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.dataSectionCrc32);
        }

        public void _check() {
            _dirty = false;
        }
        private long dataSectionCrc32;
        private Mcap _root;
        private Mcap.Record _parent;

        /**
         * CRC-32 of all bytes in the data section. A value of 0 indicates the CRC-32 is not
         * available.
         */
        public long dataSectionCrc32() { return dataSectionCrc32; }
        public void setDataSectionCrc32(long _v) { _dirty = true; dataSectionCrc32 = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Footer extends KaitaiStruct.ReadWrite {
        public static Footer fromFile(String fileName) throws IOException {
            return new Footer(new ByteBufferKaitaiStream(fileName));
        }
        public Footer() {
            this(null, null, null);
        }

        public Footer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Footer(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Footer(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsSummarySection = this._io.readU8le();
            this.ofsSummaryOffsetSection = this._io.readU8le();
            this.summaryCrc32 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            summaryCrc32Input();
            if (this.summaryCrc32Input != null) {
            }
            summaryOffsetSection();
            if (this.summaryOffsetSection != null) {
                this.summaryOffsetSection._fetchInstances();
            }
            summarySection();
            if (this.summarySection != null) {
                this.summarySection._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteSummaryCrc32Input = _enabledSummaryCrc32Input;
            _shouldWriteSummaryOffsetSection = _enabledSummaryOffsetSection;
            _shouldWriteSummarySection = _enabledSummarySection;
            this._io.writeU8le(this.ofsSummarySection);
            this._io.writeU8le(this.ofsSummaryOffsetSection);
            this._io.writeU4le(this.summaryCrc32);
        }

        public void _check() {
            if (_enabledSummaryCrc32Input) {
            }
            if (_enabledSummaryOffsetSection) {
                if (ofsSummaryOffsetSection() != 0) {
                    if (!Objects.equals(this.summaryOffsetSection._root(), _root()))
                        throw new ConsistencyError("summary_offset_section", _root(), this.summaryOffsetSection._root());
                    if (!Objects.equals(this.summaryOffsetSection._parent(), this))
                        throw new ConsistencyError("summary_offset_section", this, this.summaryOffsetSection._parent());
                }
            }
            if (_enabledSummarySection) {
                if (ofsSummarySection() != 0) {
                    if (!Objects.equals(this.summarySection._root(), _root()))
                        throw new ConsistencyError("summary_section", _root(), this.summarySection._root());
                    if (!Objects.equals(this.summarySection._parent(), this))
                        throw new ConsistencyError("summary_section", this, this.summarySection._parent());
                }
            }
            _dirty = false;
        }
        private Integer ofsSummaryCrc32Input;
        public Integer ofsSummaryCrc32Input() {
            if (this.ofsSummaryCrc32Input != null)
                return this.ofsSummaryCrc32Input;
            this.ofsSummaryCrc32Input = ((Number) ((ofsSummarySection() != 0 ? ofsSummarySection() : _root().ofsFooter()))).intValue();
            return this.ofsSummaryCrc32Input;
        }
        public void _invalidateOfsSummaryCrc32Input() { this.ofsSummaryCrc32Input = null; }
        private byte[] summaryCrc32Input;
        private boolean _shouldWriteSummaryCrc32Input = false;
        private boolean _enabledSummaryCrc32Input = true;
        public byte[] summaryCrc32Input() {
            if (_shouldWriteSummaryCrc32Input)
                _writeSummaryCrc32Input();
            if (this.summaryCrc32Input != null)
                return this.summaryCrc32Input;
            if (!_enabledSummaryCrc32Input)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsSummaryCrc32Input());
            this.summaryCrc32Input = io.readBytes(((_root()._io().size() - ofsSummaryCrc32Input()) - 8) - 4);
            io.seek(_pos);
            return this.summaryCrc32Input;
        }
        public void setSummaryCrc32Input(byte[] _v) { _dirty = true; summaryCrc32Input = _v; }
        public void setSummaryCrc32Input_Enabled(boolean _v) { _dirty = true; _enabledSummaryCrc32Input = _v; }

        private void _writeSummaryCrc32Input() {
            _shouldWriteSummaryCrc32Input = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsSummaryCrc32Input());
            if (this.summaryCrc32Input.length != ((_root()._io().size() - ofsSummaryCrc32Input()) - 8) - 4)
                throw new ConsistencyError("summary_crc32_input", ((_root()._io().size() - ofsSummaryCrc32Input()) - 8) - 4, this.summaryCrc32Input.length);
            io.writeBytes(this.summaryCrc32Input);
            io.seek(_pos);
        }
        private Records summaryOffsetSection;
        private boolean _shouldWriteSummaryOffsetSection = false;
        private boolean _enabledSummaryOffsetSection = true;
        public Records summaryOffsetSection() {
            if (_shouldWriteSummaryOffsetSection)
                _writeSummaryOffsetSection();
            if (this.summaryOffsetSection != null)
                return this.summaryOffsetSection;
            if (!_enabledSummaryOffsetSection)
                return null;
            if (ofsSummaryOffsetSection() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsSummaryOffsetSection());
                this._raw_summaryOffsetSection = io.readBytes(_root().ofsFooter() - ofsSummaryOffsetSection());
                KaitaiStream _io__raw_summaryOffsetSection = new ByteBufferKaitaiStream(this._raw_summaryOffsetSection);
                this.summaryOffsetSection = new Records(_io__raw_summaryOffsetSection, this, _root);
                this.summaryOffsetSection._read();
                io.seek(_pos);
            }
            return this.summaryOffsetSection;
        }
        public void setSummaryOffsetSection(Records _v) { _dirty = true; summaryOffsetSection = _v; }
        public void setSummaryOffsetSection_Enabled(boolean _v) { _dirty = true; _enabledSummaryOffsetSection = _v; }

        private void _writeSummaryOffsetSection() {
            _shouldWriteSummaryOffsetSection = false;
            if (ofsSummaryOffsetSection() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsSummaryOffsetSection());
                final KaitaiStream _io__raw_summaryOffsetSection = new ByteBufferKaitaiStream(_root().ofsFooter() - ofsSummaryOffsetSection());
                io.addChildStream(_io__raw_summaryOffsetSection);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + (_root().ofsFooter() - ofsSummaryOffsetSection()));
                    final Footer _this = this;
                    _io__raw_summaryOffsetSection.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_summaryOffsetSection = _io__raw_summaryOffsetSection.toByteArray();
                            if (_this._raw_summaryOffsetSection.length != _root().ofsFooter() - ofsSummaryOffsetSection())
                                throw new ConsistencyError("raw(summary_offset_section)", _root().ofsFooter() - ofsSummaryOffsetSection(), _this._raw_summaryOffsetSection.length);
                            parent.writeBytes(_this._raw_summaryOffsetSection);
                        }
                    });
                }
                this.summaryOffsetSection._write_Seq(_io__raw_summaryOffsetSection);
                io.seek(_pos);
            }
        }
        private Records summarySection;
        private boolean _shouldWriteSummarySection = false;
        private boolean _enabledSummarySection = true;
        public Records summarySection() {
            if (_shouldWriteSummarySection)
                _writeSummarySection();
            if (this.summarySection != null)
                return this.summarySection;
            if (!_enabledSummarySection)
                return null;
            if (ofsSummarySection() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsSummarySection());
                this._raw_summarySection = io.readBytes((ofsSummaryOffsetSection() != 0 ? ofsSummaryOffsetSection() : _root().ofsFooter()) - ofsSummarySection());
                KaitaiStream _io__raw_summarySection = new ByteBufferKaitaiStream(this._raw_summarySection);
                this.summarySection = new Records(_io__raw_summarySection, this, _root);
                this.summarySection._read();
                io.seek(_pos);
            }
            return this.summarySection;
        }
        public void setSummarySection(Records _v) { _dirty = true; summarySection = _v; }
        public void setSummarySection_Enabled(boolean _v) { _dirty = true; _enabledSummarySection = _v; }

        private void _writeSummarySection() {
            _shouldWriteSummarySection = false;
            if (ofsSummarySection() != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(ofsSummarySection());
                final KaitaiStream _io__raw_summarySection = new ByteBufferKaitaiStream((ofsSummaryOffsetSection() != 0 ? ofsSummaryOffsetSection() : _root().ofsFooter()) - ofsSummarySection());
                io.addChildStream(_io__raw_summarySection);
                {
                    long _pos2 = io.pos();
                    io.seek(io.pos() + ((ofsSummaryOffsetSection() != 0 ? ofsSummaryOffsetSection() : _root().ofsFooter()) - ofsSummarySection()));
                    final Footer _this = this;
                    _io__raw_summarySection.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_summarySection = _io__raw_summarySection.toByteArray();
                            if (_this._raw_summarySection.length != (ofsSummaryOffsetSection() != 0 ? ofsSummaryOffsetSection() : _root().ofsFooter()) - ofsSummarySection())
                                throw new ConsistencyError("raw(summary_section)", (ofsSummaryOffsetSection() != 0 ? ofsSummaryOffsetSection() : _root().ofsFooter()) - ofsSummarySection(), _this._raw_summarySection.length);
                            parent.writeBytes(_this._raw_summarySection);
                        }
                    });
                }
                this.summarySection._write_Seq(_io__raw_summarySection);
                io.seek(_pos);
            }
        }
        private long ofsSummarySection;
        private long ofsSummaryOffsetSection;
        private long summaryCrc32;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_summaryOffsetSection;
        private byte[] _raw_summarySection;
        public long ofsSummarySection() { return ofsSummarySection; }
        public void setOfsSummarySection(long _v) { _dirty = true; ofsSummarySection = _v; }
        public long ofsSummaryOffsetSection() { return ofsSummaryOffsetSection; }
        public void setOfsSummaryOffsetSection(long _v) { _dirty = true; ofsSummaryOffsetSection = _v; }

        /**
         * A CRC-32 of all bytes from the start of the Summary section up through and
         * including the end of the previous field (summary_offset_start) in the footer
         * record. A value of 0 indicates the CRC-32 is not available.
         */
        public long summaryCrc32() { return summaryCrc32; }
        public void setSummaryCrc32(long _v) { _dirty = true; summaryCrc32 = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_summaryOffsetSection() { return _raw_summaryOffsetSection; }
        public void set_raw_SummaryOffsetSection(byte[] _v) { _dirty = true; _raw_summaryOffsetSection = _v; }
        public byte[] _raw_summarySection() { return _raw_summarySection; }
        public void set_raw_SummarySection(byte[] _v) { _dirty = true; _raw_summarySection = _v; }
    }
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

        public Header(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.profile = new PrefixedStr(this._io, this, _root);
            this.profile._read();
            this.library = new PrefixedStr(this._io, this, _root);
            this.library._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.profile._fetchInstances();
            this.library._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.profile._write_Seq(this._io);
            this.library._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.profile._root(), _root()))
                throw new ConsistencyError("profile", _root(), this.profile._root());
            if (!Objects.equals(this.profile._parent(), this))
                throw new ConsistencyError("profile", this, this.profile._parent());
            if (!Objects.equals(this.library._root(), _root()))
                throw new ConsistencyError("library", _root(), this.library._root());
            if (!Objects.equals(this.library._parent(), this))
                throw new ConsistencyError("library", this, this.library._parent());
            _dirty = false;
        }
        private PrefixedStr profile;
        private PrefixedStr library;
        private Mcap _root;
        private Mcap.Record _parent;
        public PrefixedStr profile() { return profile; }
        public void setProfile(PrefixedStr _v) { _dirty = true; profile = _v; }
        public PrefixedStr library() { return library; }
        public void setLibrary(PrefixedStr _v) { _dirty = true; library = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Magic extends KaitaiStruct.ReadWrite {
        public static Magic fromFile(String fileName) throws IOException {
            return new Magic(new ByteBufferKaitaiStream(fileName));
        }
        public Magic() {
            this(null, null, null);
        }

        public Magic(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Magic(KaitaiStream _io, Mcap _parent) {
            this(_io, _parent, null);
        }

        public Magic(KaitaiStream _io, Mcap _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(8);
            if (!(Arrays.equals(this.magic, new byte[] { -119, 77, 67, 65, 80, 48, 13, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 77, 67, 65, 80, 48, 13, 10 }, this.magic, this._io, "/types/magic/seq/0");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
        }

        public void _check() {
            if (this.magic.length != 8)
                throw new ConsistencyError("magic", 8, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -119, 77, 67, 65, 80, 48, 13, 10 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -119, 77, 67, 65, 80, 48, 13, 10 }, this.magic, null, "/types/magic/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private Mcap _root;
        private Mcap _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap _parent() { return _parent; }
        public void set_parent(Mcap _v) { _dirty = true; _parent = _v; }
    }
    public static class MapStrStr extends KaitaiStruct.ReadWrite {
        public static MapStrStr fromFile(String fileName) throws IOException {
            return new MapStrStr(new ByteBufferKaitaiStream(fileName));
        }
        public MapStrStr() {
            this(null, null, null);
        }

        public MapStrStr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MapStrStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public MapStrStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenEntries = this._io.readU4le();
            this._raw_entries = this._io.readBytes(lenEntries());
            KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(this._raw_entries);
            this.entries = new Entries(_io__raw_entries, this, _root);
            this.entries._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.entries._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenEntries);
            final KaitaiStream _io__raw_entries = new ByteBufferKaitaiStream(lenEntries());
            this._io.addChildStream(_io__raw_entries);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenEntries()));
                final MapStrStr _this = this;
                _io__raw_entries.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_entries = _io__raw_entries.toByteArray();
                        if (_this._raw_entries.length != lenEntries())
                            throw new ConsistencyError("raw(entries)", lenEntries(), _this._raw_entries.length);
                        parent.writeBytes(_this._raw_entries);
                    }
                });
            }
            this.entries._write_Seq(_io__raw_entries);
        }

        public void _check() {
            if (!Objects.equals(this.entries._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries._root());
            if (!Objects.equals(this.entries._parent(), this))
                throw new ConsistencyError("entries", this, this.entries._parent());
            _dirty = false;
        }
        public static class Entries extends KaitaiStruct.ReadWrite {
            public static Entries fromFile(String fileName) throws IOException {
                return new Entries(new ByteBufferKaitaiStream(fileName));
            }
            public Entries() {
                this(null, null, null);
            }

            public Entries(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Entries(KaitaiStream _io, Mcap.MapStrStr _parent) {
                this(_io, _parent, null);
            }

            public Entries(KaitaiStream _io, Mcap.MapStrStr _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.entries = new ArrayList<TupleStrStr>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        TupleStrStr _t_entries = new TupleStrStr(this._io, this, _root);
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
            private List<TupleStrStr> entries;
            private Mcap _root;
            private Mcap.MapStrStr _parent;
            public List<TupleStrStr> entries() { return entries; }
            public void setEntries(List<TupleStrStr> _v) { _dirty = true; entries = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.MapStrStr _parent() { return _parent; }
            public void set_parent(Mcap.MapStrStr _v) { _dirty = true; _parent = _v; }
        }
        private long lenEntries;
        private Entries entries;
        private Mcap _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_entries;
        public long lenEntries() { return lenEntries; }
        public void setLenEntries(long _v) { _dirty = true; lenEntries = _v; }
        public Entries entries() { return entries; }
        public void setEntries(Entries _v) { _dirty = true; entries = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_entries() { return _raw_entries; }
        public void set_raw_Entries(byte[] _v) { _dirty = true; _raw_entries = _v; }
    }
    public static class Message extends KaitaiStruct.ReadWrite {
        public static Message fromFile(String fileName) throws IOException {
            return new Message(new ByteBufferKaitaiStream(fileName));
        }
        public Message() {
            this(null, null, null);
        }

        public Message(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Message(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Message(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.channelId = this._io.readU2le();
            this.sequence = this._io.readU4le();
            this.logTime = this._io.readU8le();
            this.publishTime = this._io.readU8le();
            this.data = this._io.readBytesFull();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.channelId);
            this._io.writeU4le(this.sequence);
            this._io.writeU8le(this.logTime);
            this._io.writeU8le(this.publishTime);
            this._io.writeBytes(this.data);
            if (!(this._io.isEof()))
                throw new ConsistencyError("data", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            _dirty = false;
        }
        private int channelId;
        private long sequence;
        private long logTime;
        private long publishTime;
        private byte[] data;
        private Mcap _root;
        private Mcap.Record _parent;
        public int channelId() { return channelId; }
        public void setChannelId(int _v) { _dirty = true; channelId = _v; }
        public long sequence() { return sequence; }
        public void setSequence(long _v) { _dirty = true; sequence = _v; }
        public long logTime() { return logTime; }
        public void setLogTime(long _v) { _dirty = true; logTime = _v; }
        public long publishTime() { return publishTime; }
        public void setPublishTime(long _v) { _dirty = true; publishTime = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class MessageIndex extends KaitaiStruct.ReadWrite {
        public static MessageIndex fromFile(String fileName) throws IOException {
            return new MessageIndex(new ByteBufferKaitaiStream(fileName));
        }
        public MessageIndex() {
            this(null, null, null);
        }

        public MessageIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MessageIndex(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public MessageIndex(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.channelId = this._io.readU2le();
            this.lenRecords = this._io.readU4le();
            this._raw_records = this._io.readBytes(lenRecords());
            KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(this._raw_records);
            this.records = new MessageIndexEntries(_io__raw_records, this, _root);
            this.records._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.records._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.channelId);
            this._io.writeU4le(this.lenRecords);
            final KaitaiStream _io__raw_records = new ByteBufferKaitaiStream(lenRecords());
            this._io.addChildStream(_io__raw_records);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenRecords()));
                final MessageIndex _this = this;
                _io__raw_records.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_records = _io__raw_records.toByteArray();
                        if (_this._raw_records.length != lenRecords())
                            throw new ConsistencyError("raw(records)", lenRecords(), _this._raw_records.length);
                        parent.writeBytes(_this._raw_records);
                    }
                });
            }
            this.records._write_Seq(_io__raw_records);
        }

        public void _check() {
            if (!Objects.equals(this.records._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records._root());
            if (!Objects.equals(this.records._parent(), this))
                throw new ConsistencyError("records", this, this.records._parent());
            _dirty = false;
        }
        public static class MessageIndexEntries extends KaitaiStruct.ReadWrite {
            public static MessageIndexEntries fromFile(String fileName) throws IOException {
                return new MessageIndexEntries(new ByteBufferKaitaiStream(fileName));
            }
            public MessageIndexEntries() {
                this(null, null, null);
            }

            public MessageIndexEntries(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MessageIndexEntries(KaitaiStream _io, Mcap.MessageIndex _parent) {
                this(_io, _parent, null);
            }

            public MessageIndexEntries(KaitaiStream _io, Mcap.MessageIndex _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.entries = new ArrayList<MessageIndexEntry>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        MessageIndexEntry _t_entries = new MessageIndexEntry(this._io, this, _root);
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
            private List<MessageIndexEntry> entries;
            private Mcap _root;
            private Mcap.MessageIndex _parent;
            public List<MessageIndexEntry> entries() { return entries; }
            public void setEntries(List<MessageIndexEntry> _v) { _dirty = true; entries = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.MessageIndex _parent() { return _parent; }
            public void set_parent(Mcap.MessageIndex _v) { _dirty = true; _parent = _v; }
        }
        public static class MessageIndexEntry extends KaitaiStruct.ReadWrite {
            public static MessageIndexEntry fromFile(String fileName) throws IOException {
                return new MessageIndexEntry(new ByteBufferKaitaiStream(fileName));
            }
            public MessageIndexEntry() {
                this(null, null, null);
            }

            public MessageIndexEntry(KaitaiStream _io) {
                this(_io, null, null);
            }

            public MessageIndexEntry(KaitaiStream _io, Mcap.MessageIndex.MessageIndexEntries _parent) {
                this(_io, _parent, null);
            }

            public MessageIndexEntry(KaitaiStream _io, Mcap.MessageIndex.MessageIndexEntries _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.logTime = this._io.readU8le();
                this.offset = this._io.readU8le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU8le(this.logTime);
                this._io.writeU8le(this.offset);
            }

            public void _check() {
                _dirty = false;
            }
            private long logTime;
            private long offset;
            private Mcap _root;
            private Mcap.MessageIndex.MessageIndexEntries _parent;
            public long logTime() { return logTime; }
            public void setLogTime(long _v) { _dirty = true; logTime = _v; }
            public long offset() { return offset; }
            public void setOffset(long _v) { _dirty = true; offset = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.MessageIndex.MessageIndexEntries _parent() { return _parent; }
            public void set_parent(Mcap.MessageIndex.MessageIndexEntries _v) { _dirty = true; _parent = _v; }
        }
        private int channelId;
        private long lenRecords;
        private MessageIndexEntries records;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_records;
        public int channelId() { return channelId; }
        public void setChannelId(int _v) { _dirty = true; channelId = _v; }
        public long lenRecords() { return lenRecords; }
        public void setLenRecords(long _v) { _dirty = true; lenRecords = _v; }
        public MessageIndexEntries records() { return records; }
        public void setRecords(MessageIndexEntries _v) { _dirty = true; records = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_records() { return _raw_records; }
        public void set_raw_Records(byte[] _v) { _dirty = true; _raw_records = _v; }
    }
    public static class Metadata extends KaitaiStruct.ReadWrite {
        public static Metadata fromFile(String fileName) throws IOException {
            return new Metadata(new ByteBufferKaitaiStream(fileName));
        }
        public Metadata() {
            this(null, null, null);
        }

        public Metadata(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Metadata(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Metadata(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new PrefixedStr(this._io, this, _root);
            this.name._read();
            this.metadata = new MapStrStr(this._io, this, _root);
            this.metadata._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            this.metadata._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.name._write_Seq(this._io);
            this.metadata._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.metadata._root(), _root()))
                throw new ConsistencyError("metadata", _root(), this.metadata._root());
            if (!Objects.equals(this.metadata._parent(), this))
                throw new ConsistencyError("metadata", this, this.metadata._parent());
            _dirty = false;
        }
        private PrefixedStr name;
        private MapStrStr metadata;
        private Mcap _root;
        private Mcap.Record _parent;
        public PrefixedStr name() { return name; }
        public void setName(PrefixedStr _v) { _dirty = true; name = _v; }
        public MapStrStr metadata() { return metadata; }
        public void setMetadata(MapStrStr _v) { _dirty = true; metadata = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class MetadataIndex extends KaitaiStruct.ReadWrite {
        public static MetadataIndex fromFile(String fileName) throws IOException {
            return new MetadataIndex(new ByteBufferKaitaiStream(fileName));
        }
        public MetadataIndex() {
            this(null, null, null);
        }

        public MetadataIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MetadataIndex(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public MetadataIndex(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.ofsMetadata = this._io.readU8le();
            this.lenMetadata = this._io.readU8le();
            this.name = new PrefixedStr(this._io, this, _root);
            this.name._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            metadata();
            if (this.metadata != null) {
                this.metadata._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteMetadata = _enabledMetadata;
            this._io.writeU8le(this.ofsMetadata);
            this._io.writeU8le(this.lenMetadata);
            this.name._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (_enabledMetadata) {
                if (!Objects.equals(this.metadata._root(), _root()))
                    throw new ConsistencyError("metadata", _root(), this.metadata._root());
                if (!Objects.equals(this.metadata._parent(), this))
                    throw new ConsistencyError("metadata", this, this.metadata._parent());
            }
            _dirty = false;
        }
        private Record metadata;
        private boolean _shouldWriteMetadata = false;
        private boolean _enabledMetadata = true;
        public Record metadata() {
            if (_shouldWriteMetadata)
                _writeMetadata();
            if (this.metadata != null)
                return this.metadata;
            if (!_enabledMetadata)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsMetadata());
            this._raw_metadata = io.readBytes(lenMetadata());
            KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(this._raw_metadata);
            this.metadata = new Record(_io__raw_metadata, this, _root);
            this.metadata._read();
            io.seek(_pos);
            return this.metadata;
        }
        public void setMetadata(Record _v) { _dirty = true; metadata = _v; }
        public void setMetadata_Enabled(boolean _v) { _dirty = true; _enabledMetadata = _v; }

        private void _writeMetadata() {
            _shouldWriteMetadata = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsMetadata());
            final KaitaiStream _io__raw_metadata = new ByteBufferKaitaiStream(lenMetadata());
            io.addChildStream(_io__raw_metadata);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (lenMetadata()));
                final MetadataIndex _this = this;
                _io__raw_metadata.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_metadata = _io__raw_metadata.toByteArray();
                        if (_this._raw_metadata.length != lenMetadata())
                            throw new ConsistencyError("raw(metadata)", lenMetadata(), _this._raw_metadata.length);
                        parent.writeBytes(_this._raw_metadata);
                    }
                });
            }
            this.metadata._write_Seq(_io__raw_metadata);
            io.seek(_pos);
        }
        private long ofsMetadata;
        private long lenMetadata;
        private PrefixedStr name;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_metadata;
        public long ofsMetadata() { return ofsMetadata; }
        public void setOfsMetadata(long _v) { _dirty = true; ofsMetadata = _v; }
        public long lenMetadata() { return lenMetadata; }
        public void setLenMetadata(long _v) { _dirty = true; lenMetadata = _v; }
        public PrefixedStr name() { return name; }
        public void setName(PrefixedStr _v) { _dirty = true; name = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_metadata() { return _raw_metadata; }
        public void set_raw_Metadata(byte[] _v) { _dirty = true; _raw_metadata = _v; }
    }
    public static class PrefixedStr extends KaitaiStruct.ReadWrite {
        public static PrefixedStr fromFile(String fileName) throws IOException {
            return new PrefixedStr(new ByteBufferKaitaiStream(fileName));
        }
        public PrefixedStr() {
            this(null, null, null);
        }

        public PrefixedStr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PrefixedStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public PrefixedStr(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenStr = this._io.readU4le();
            this.str = new String(this._io.readBytes(lenStr()), StandardCharsets.UTF_8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenStr);
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-8")));
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("UTF-8")).length != lenStr())
                throw new ConsistencyError("str", lenStr(), (this.str).getBytes(Charset.forName("UTF-8")).length);
            _dirty = false;
        }
        private long lenStr;
        private String str;
        private Mcap _root;
        private KaitaiStruct.ReadWrite _parent;
        public long lenStr() { return lenStr; }
        public void setLenStr(long _v) { _dirty = true; lenStr = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.op = Mcap.Opcode.byId(this._io.readU1());
            this.lenBody = this._io.readU8le();
            {
                Opcode on = op();
                if (on != null) {
                    switch (op()) {
                    case ATTACHMENT: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Attachment(_io__raw_body, this, _root);
                        ((Attachment) (this.body))._read();
                        break;
                    }
                    case ATTACHMENT_INDEX: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new AttachmentIndex(_io__raw_body, this, _root);
                        ((AttachmentIndex) (this.body))._read();
                        break;
                    }
                    case CHANNEL: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Channel(_io__raw_body, this, _root);
                        ((Channel) (this.body))._read();
                        break;
                    }
                    case CHUNK: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Chunk(_io__raw_body, this, _root);
                        ((Chunk) (this.body))._read();
                        break;
                    }
                    case CHUNK_INDEX: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new ChunkIndex(_io__raw_body, this, _root);
                        ((ChunkIndex) (this.body))._read();
                        break;
                    }
                    case DATA_END: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new DataEnd(_io__raw_body, this, _root);
                        ((DataEnd) (this.body))._read();
                        break;
                    }
                    case FOOTER: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Footer(_io__raw_body, this, _root);
                        ((Footer) (this.body))._read();
                        break;
                    }
                    case HEADER: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Header(_io__raw_body, this, _root);
                        ((Header) (this.body))._read();
                        break;
                    }
                    case MESSAGE: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Message(_io__raw_body, this, _root);
                        ((Message) (this.body))._read();
                        break;
                    }
                    case MESSAGE_INDEX: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new MessageIndex(_io__raw_body, this, _root);
                        ((MessageIndex) (this.body))._read();
                        break;
                    }
                    case METADATA: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Metadata(_io__raw_body, this, _root);
                        ((Metadata) (this.body))._read();
                        break;
                    }
                    case METADATA_INDEX: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new MetadataIndex(_io__raw_body, this, _root);
                        ((MetadataIndex) (this.body))._read();
                        break;
                    }
                    case SCHEMA: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Schema(_io__raw_body, this, _root);
                        ((Schema) (this.body))._read();
                        break;
                    }
                    case STATISTICS: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new Statistics(_io__raw_body, this, _root);
                        ((Statistics) (this.body))._read();
                        break;
                    }
                    case SUMMARY_OFFSET: {
                        this._raw_body = this._io.readBytes(lenBody());
                        KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                        this.body = new SummaryOffset(_io__raw_body, this, _root);
                        ((SummaryOffset) (this.body))._read();
                        break;
                    }
                    default: {
                        this.body = this._io.readBytes(lenBody());
                        break;
                    }
                    }
                } else {
                    this.body = this._io.readBytes(lenBody());
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            {
                Opcode on = op();
                if (on != null) {
                    switch (op()) {
                    case ATTACHMENT: {
                        ((Attachment) (this.body))._fetchInstances();
                        break;
                    }
                    case ATTACHMENT_INDEX: {
                        ((AttachmentIndex) (this.body))._fetchInstances();
                        break;
                    }
                    case CHANNEL: {
                        ((Channel) (this.body))._fetchInstances();
                        break;
                    }
                    case CHUNK: {
                        ((Chunk) (this.body))._fetchInstances();
                        break;
                    }
                    case CHUNK_INDEX: {
                        ((ChunkIndex) (this.body))._fetchInstances();
                        break;
                    }
                    case DATA_END: {
                        ((DataEnd) (this.body))._fetchInstances();
                        break;
                    }
                    case FOOTER: {
                        ((Footer) (this.body))._fetchInstances();
                        break;
                    }
                    case HEADER: {
                        ((Header) (this.body))._fetchInstances();
                        break;
                    }
                    case MESSAGE: {
                        ((Message) (this.body))._fetchInstances();
                        break;
                    }
                    case MESSAGE_INDEX: {
                        ((MessageIndex) (this.body))._fetchInstances();
                        break;
                    }
                    case METADATA: {
                        ((Metadata) (this.body))._fetchInstances();
                        break;
                    }
                    case METADATA_INDEX: {
                        ((MetadataIndex) (this.body))._fetchInstances();
                        break;
                    }
                    case SCHEMA: {
                        ((Schema) (this.body))._fetchInstances();
                        break;
                    }
                    case STATISTICS: {
                        ((Statistics) (this.body))._fetchInstances();
                        break;
                    }
                    case SUMMARY_OFFSET: {
                        ((SummaryOffset) (this.body))._fetchInstances();
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

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(((Number) (this.op.id())).intValue());
            this._io.writeU8le(this.lenBody);
            {
                Opcode on = op();
                if (on != null) {
                    switch (op()) {
                    case ATTACHMENT: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Attachment) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case ATTACHMENT_INDEX: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((AttachmentIndex) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case CHANNEL: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Channel) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case CHUNK: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Chunk) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case CHUNK_INDEX: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((ChunkIndex) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case DATA_END: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((DataEnd) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case FOOTER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Footer) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case HEADER: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Header) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case MESSAGE: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Message) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case MESSAGE_INDEX: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((MessageIndex) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case METADATA: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Metadata) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case METADATA_INDEX: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((MetadataIndex) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SCHEMA: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Schema) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case STATISTICS: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((Statistics) (this.body))._write_Seq(_io__raw_body);
                        break;
                    }
                    case SUMMARY_OFFSET: {
                        final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenBody());
                        this._io.addChildStream(_io__raw_body);
                        {
                            long _pos2 = this._io.pos();
                            this._io.seek(this._io.pos() + (lenBody()));
                            final Record _this = this;
                            _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                                @Override
                                protected void write(KaitaiStream parent) {
                                    _this._raw_body = _io__raw_body.toByteArray();
                                    if (((byte[]) (_this._raw_body)).length != lenBody())
                                        throw new ConsistencyError("raw(body)", lenBody(), ((byte[]) (_this._raw_body)).length);
                                    parent.writeBytes(((byte[]) (((byte[]) (_this._raw_body)))));
                                }
                            });
                        }
                        ((SummaryOffset) (this.body))._write_Seq(_io__raw_body);
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

        public void _check() {
            {
                Opcode on = op();
                if (on != null) {
                    switch (op()) {
                    case ATTACHMENT: {
                        if (!Objects.equals(((Mcap.Attachment) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Attachment) (this.body))._root());
                        if (!Objects.equals(((Mcap.Attachment) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Attachment) (this.body))._parent());
                        break;
                    }
                    case ATTACHMENT_INDEX: {
                        if (!Objects.equals(((Mcap.AttachmentIndex) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.AttachmentIndex) (this.body))._root());
                        if (!Objects.equals(((Mcap.AttachmentIndex) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.AttachmentIndex) (this.body))._parent());
                        break;
                    }
                    case CHANNEL: {
                        if (!Objects.equals(((Mcap.Channel) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Channel) (this.body))._root());
                        if (!Objects.equals(((Mcap.Channel) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Channel) (this.body))._parent());
                        break;
                    }
                    case CHUNK: {
                        if (!Objects.equals(((Mcap.Chunk) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Chunk) (this.body))._root());
                        if (!Objects.equals(((Mcap.Chunk) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Chunk) (this.body))._parent());
                        break;
                    }
                    case CHUNK_INDEX: {
                        if (!Objects.equals(((Mcap.ChunkIndex) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.ChunkIndex) (this.body))._root());
                        if (!Objects.equals(((Mcap.ChunkIndex) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.ChunkIndex) (this.body))._parent());
                        break;
                    }
                    case DATA_END: {
                        if (!Objects.equals(((Mcap.DataEnd) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.DataEnd) (this.body))._root());
                        if (!Objects.equals(((Mcap.DataEnd) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.DataEnd) (this.body))._parent());
                        break;
                    }
                    case FOOTER: {
                        if (!Objects.equals(((Mcap.Footer) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Footer) (this.body))._root());
                        if (!Objects.equals(((Mcap.Footer) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Footer) (this.body))._parent());
                        break;
                    }
                    case HEADER: {
                        if (!Objects.equals(((Mcap.Header) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Header) (this.body))._root());
                        if (!Objects.equals(((Mcap.Header) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Header) (this.body))._parent());
                        break;
                    }
                    case MESSAGE: {
                        if (!Objects.equals(((Mcap.Message) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Message) (this.body))._root());
                        if (!Objects.equals(((Mcap.Message) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Message) (this.body))._parent());
                        break;
                    }
                    case MESSAGE_INDEX: {
                        if (!Objects.equals(((Mcap.MessageIndex) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.MessageIndex) (this.body))._root());
                        if (!Objects.equals(((Mcap.MessageIndex) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.MessageIndex) (this.body))._parent());
                        break;
                    }
                    case METADATA: {
                        if (!Objects.equals(((Mcap.Metadata) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Metadata) (this.body))._root());
                        if (!Objects.equals(((Mcap.Metadata) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Metadata) (this.body))._parent());
                        break;
                    }
                    case METADATA_INDEX: {
                        if (!Objects.equals(((Mcap.MetadataIndex) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.MetadataIndex) (this.body))._root());
                        if (!Objects.equals(((Mcap.MetadataIndex) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.MetadataIndex) (this.body))._parent());
                        break;
                    }
                    case SCHEMA: {
                        if (!Objects.equals(((Mcap.Schema) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Schema) (this.body))._root());
                        if (!Objects.equals(((Mcap.Schema) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Schema) (this.body))._parent());
                        break;
                    }
                    case STATISTICS: {
                        if (!Objects.equals(((Mcap.Statistics) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.Statistics) (this.body))._root());
                        if (!Objects.equals(((Mcap.Statistics) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.Statistics) (this.body))._parent());
                        break;
                    }
                    case SUMMARY_OFFSET: {
                        if (!Objects.equals(((Mcap.SummaryOffset) (this.body))._root(), _root()))
                            throw new ConsistencyError("body", _root(), ((Mcap.SummaryOffset) (this.body))._root());
                        if (!Objects.equals(((Mcap.SummaryOffset) (this.body))._parent(), this))
                            throw new ConsistencyError("body", this, ((Mcap.SummaryOffset) (this.body))._parent());
                        break;
                    }
                    default: {
                        if (((byte[]) (this.body)).length != lenBody())
                            throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                        break;
                    }
                    }
                } else {
                    if (((byte[]) (this.body)).length != lenBody())
                        throw new ConsistencyError("body", lenBody(), ((byte[]) (this.body)).length);
                }
            }
            _dirty = false;
        }
        private Opcode op;
        private long lenBody;
        private Object body;
        private Mcap _root;
        private KaitaiStruct.ReadWrite _parent;
        private byte[] _raw_body;
        public Opcode op() { return op; }
        public void setOp(Opcode _v) { _dirty = true; op = _v; }
        public long lenBody() { return lenBody; }
        public void setLenBody(long _v) { _dirty = true; lenBody = _v; }
        public Object body() { return body; }
        public void setBody(Object _v) { _dirty = true; body = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_body() { return _raw_body; }
        public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
    }
    public static class Records extends KaitaiStruct.ReadWrite {
        public static Records fromFile(String fileName) throws IOException {
            return new Records(new ByteBufferKaitaiStream(fileName));
        }
        public Records() {
            this(null, null, null);
        }

        public Records(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Records(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Records(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.records = new ArrayList<Record>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    Record _t_records = new Record(this._io, this, _root);
                    try {
                        _t_records._read();
                    } finally {
                        this.records.add(_t_records);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.records.size(); i++) {
                this.records.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.records.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
                this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.records.size(); i++) {
                if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<Record> records;
        private Mcap _root;
        private KaitaiStruct.ReadWrite _parent;
        public List<Record> records() { return records; }
        public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class Schema extends KaitaiStruct.ReadWrite {
        public static Schema fromFile(String fileName) throws IOException {
            return new Schema(new ByteBufferKaitaiStream(fileName));
        }
        public Schema() {
            this(null, null, null);
        }

        public Schema(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Schema(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Schema(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.id = this._io.readU2le();
            this.name = new PrefixedStr(this._io, this, _root);
            this.name._read();
            this.encoding = new PrefixedStr(this._io, this, _root);
            this.encoding._read();
            this.lenData = this._io.readU4le();
            this.data = this._io.readBytes(lenData());
            _dirty = false;
        }

        public void _fetchInstances() {
            this.name._fetchInstances();
            this.encoding._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.id);
            this.name._write_Seq(this._io);
            this.encoding._write_Seq(this._io);
            this._io.writeU4le(this.lenData);
            this._io.writeBytes(this.data);
        }

        public void _check() {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (!Objects.equals(this.encoding._root(), _root()))
                throw new ConsistencyError("encoding", _root(), this.encoding._root());
            if (!Objects.equals(this.encoding._parent(), this))
                throw new ConsistencyError("encoding", this, this.encoding._parent());
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            _dirty = false;
        }
        private int id;
        private PrefixedStr name;
        private PrefixedStr encoding;
        private long lenData;
        private byte[] data;
        private Mcap _root;
        private Mcap.Record _parent;
        public int id() { return id; }
        public void setId(int _v) { _dirty = true; id = _v; }
        public PrefixedStr name() { return name; }
        public void setName(PrefixedStr _v) { _dirty = true; name = _v; }
        public PrefixedStr encoding() { return encoding; }
        public void setEncoding(PrefixedStr _v) { _dirty = true; encoding = _v; }
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
    }
    public static class Statistics extends KaitaiStruct.ReadWrite {
        public static Statistics fromFile(String fileName) throws IOException {
            return new Statistics(new ByteBufferKaitaiStream(fileName));
        }
        public Statistics() {
            this(null, null, null);
        }

        public Statistics(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Statistics(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public Statistics(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.messageCount = this._io.readU8le();
            this.schemaCount = this._io.readU2le();
            this.channelCount = this._io.readU4le();
            this.attachmentCount = this._io.readU4le();
            this.metadataCount = this._io.readU4le();
            this.chunkCount = this._io.readU4le();
            this.messageStartTime = this._io.readU8le();
            this.messageEndTime = this._io.readU8le();
            this.lenChannelMessageCounts = this._io.readU4le();
            this._raw_channelMessageCounts = this._io.readBytes(lenChannelMessageCounts());
            KaitaiStream _io__raw_channelMessageCounts = new ByteBufferKaitaiStream(this._raw_channelMessageCounts);
            this.channelMessageCounts = new ChannelMessageCounts(_io__raw_channelMessageCounts, this, _root);
            this.channelMessageCounts._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.channelMessageCounts._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.messageCount);
            this._io.writeU2le(this.schemaCount);
            this._io.writeU4le(this.channelCount);
            this._io.writeU4le(this.attachmentCount);
            this._io.writeU4le(this.metadataCount);
            this._io.writeU4le(this.chunkCount);
            this._io.writeU8le(this.messageStartTime);
            this._io.writeU8le(this.messageEndTime);
            this._io.writeU4le(this.lenChannelMessageCounts);
            final KaitaiStream _io__raw_channelMessageCounts = new ByteBufferKaitaiStream(lenChannelMessageCounts());
            this._io.addChildStream(_io__raw_channelMessageCounts);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenChannelMessageCounts()));
                final Statistics _this = this;
                _io__raw_channelMessageCounts.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_channelMessageCounts = _io__raw_channelMessageCounts.toByteArray();
                        if (_this._raw_channelMessageCounts.length != lenChannelMessageCounts())
                            throw new ConsistencyError("raw(channel_message_counts)", lenChannelMessageCounts(), _this._raw_channelMessageCounts.length);
                        parent.writeBytes(_this._raw_channelMessageCounts);
                    }
                });
            }
            this.channelMessageCounts._write_Seq(_io__raw_channelMessageCounts);
        }

        public void _check() {
            if (!Objects.equals(this.channelMessageCounts._root(), _root()))
                throw new ConsistencyError("channel_message_counts", _root(), this.channelMessageCounts._root());
            if (!Objects.equals(this.channelMessageCounts._parent(), this))
                throw new ConsistencyError("channel_message_counts", this, this.channelMessageCounts._parent());
            _dirty = false;
        }
        public static class ChannelMessageCount extends KaitaiStruct.ReadWrite {
            public static ChannelMessageCount fromFile(String fileName) throws IOException {
                return new ChannelMessageCount(new ByteBufferKaitaiStream(fileName));
            }
            public ChannelMessageCount() {
                this(null, null, null);
            }

            public ChannelMessageCount(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ChannelMessageCount(KaitaiStream _io, Mcap.Statistics.ChannelMessageCounts _parent) {
                this(_io, _parent, null);
            }

            public ChannelMessageCount(KaitaiStream _io, Mcap.Statistics.ChannelMessageCounts _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.channelId = this._io.readU2le();
                this.messageCount = this._io.readU8le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.channelId);
                this._io.writeU8le(this.messageCount);
            }

            public void _check() {
                _dirty = false;
            }
            private int channelId;
            private long messageCount;
            private Mcap _root;
            private Mcap.Statistics.ChannelMessageCounts _parent;
            public int channelId() { return channelId; }
            public void setChannelId(int _v) { _dirty = true; channelId = _v; }
            public long messageCount() { return messageCount; }
            public void setMessageCount(long _v) { _dirty = true; messageCount = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.Statistics.ChannelMessageCounts _parent() { return _parent; }
            public void set_parent(Mcap.Statistics.ChannelMessageCounts _v) { _dirty = true; _parent = _v; }
        }
        public static class ChannelMessageCounts extends KaitaiStruct.ReadWrite {
            public static ChannelMessageCounts fromFile(String fileName) throws IOException {
                return new ChannelMessageCounts(new ByteBufferKaitaiStream(fileName));
            }
            public ChannelMessageCounts() {
                this(null, null, null);
            }

            public ChannelMessageCounts(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ChannelMessageCounts(KaitaiStream _io, Mcap.Statistics _parent) {
                this(_io, _parent, null);
            }

            public ChannelMessageCounts(KaitaiStream _io, Mcap.Statistics _parent, Mcap _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.entries = new ArrayList<ChannelMessageCount>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        ChannelMessageCount _t_entries = new ChannelMessageCount(this._io, this, _root);
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
            private List<ChannelMessageCount> entries;
            private Mcap _root;
            private Mcap.Statistics _parent;
            public List<ChannelMessageCount> entries() { return entries; }
            public void setEntries(List<ChannelMessageCount> _v) { _dirty = true; entries = _v; }
            public Mcap _root() { return _root; }
            public void set_root(Mcap _v) { _dirty = true; _root = _v; }
            public Mcap.Statistics _parent() { return _parent; }
            public void set_parent(Mcap.Statistics _v) { _dirty = true; _parent = _v; }
        }
        private long messageCount;
        private int schemaCount;
        private long channelCount;
        private long attachmentCount;
        private long metadataCount;
        private long chunkCount;
        private long messageStartTime;
        private long messageEndTime;
        private long lenChannelMessageCounts;
        private ChannelMessageCounts channelMessageCounts;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_channelMessageCounts;
        public long messageCount() { return messageCount; }
        public void setMessageCount(long _v) { _dirty = true; messageCount = _v; }
        public int schemaCount() { return schemaCount; }
        public void setSchemaCount(int _v) { _dirty = true; schemaCount = _v; }
        public long channelCount() { return channelCount; }
        public void setChannelCount(long _v) { _dirty = true; channelCount = _v; }
        public long attachmentCount() { return attachmentCount; }
        public void setAttachmentCount(long _v) { _dirty = true; attachmentCount = _v; }
        public long metadataCount() { return metadataCount; }
        public void setMetadataCount(long _v) { _dirty = true; metadataCount = _v; }
        public long chunkCount() { return chunkCount; }
        public void setChunkCount(long _v) { _dirty = true; chunkCount = _v; }
        public long messageStartTime() { return messageStartTime; }
        public void setMessageStartTime(long _v) { _dirty = true; messageStartTime = _v; }
        public long messageEndTime() { return messageEndTime; }
        public void setMessageEndTime(long _v) { _dirty = true; messageEndTime = _v; }
        public long lenChannelMessageCounts() { return lenChannelMessageCounts; }
        public void setLenChannelMessageCounts(long _v) { _dirty = true; lenChannelMessageCounts = _v; }
        public ChannelMessageCounts channelMessageCounts() { return channelMessageCounts; }
        public void setChannelMessageCounts(ChannelMessageCounts _v) { _dirty = true; channelMessageCounts = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_channelMessageCounts() { return _raw_channelMessageCounts; }
        public void set_raw_ChannelMessageCounts(byte[] _v) { _dirty = true; _raw_channelMessageCounts = _v; }
    }
    public static class SummaryOffset extends KaitaiStruct.ReadWrite {
        public static SummaryOffset fromFile(String fileName) throws IOException {
            return new SummaryOffset(new ByteBufferKaitaiStream(fileName));
        }
        public SummaryOffset() {
            this(null, null, null);
        }

        public SummaryOffset(KaitaiStream _io) {
            this(_io, null, null);
        }

        public SummaryOffset(KaitaiStream _io, Mcap.Record _parent) {
            this(_io, _parent, null);
        }

        public SummaryOffset(KaitaiStream _io, Mcap.Record _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.groupOpcode = Mcap.Opcode.byId(this._io.readU1());
            this.ofsGroup = this._io.readU8le();
            this.lenGroup = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
            group();
            if (this.group != null) {
                this.group._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteGroup = _enabledGroup;
            this._io.writeU1(((Number) (this.groupOpcode.id())).intValue());
            this._io.writeU8le(this.ofsGroup);
            this._io.writeU8le(this.lenGroup);
        }

        public void _check() {
            if (_enabledGroup) {
                if (!Objects.equals(this.group._root(), _root()))
                    throw new ConsistencyError("group", _root(), this.group._root());
                if (!Objects.equals(this.group._parent(), this))
                    throw new ConsistencyError("group", this, this.group._parent());
            }
            _dirty = false;
        }
        private Records group;
        private boolean _shouldWriteGroup = false;
        private boolean _enabledGroup = true;
        public Records group() {
            if (_shouldWriteGroup)
                _writeGroup();
            if (this.group != null)
                return this.group;
            if (!_enabledGroup)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsGroup());
            this._raw_group = io.readBytes(lenGroup());
            KaitaiStream _io__raw_group = new ByteBufferKaitaiStream(this._raw_group);
            this.group = new Records(_io__raw_group, this, _root);
            this.group._read();
            io.seek(_pos);
            return this.group;
        }
        public void setGroup(Records _v) { _dirty = true; group = _v; }
        public void setGroup_Enabled(boolean _v) { _dirty = true; _enabledGroup = _v; }

        private void _writeGroup() {
            _shouldWriteGroup = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsGroup());
            final KaitaiStream _io__raw_group = new ByteBufferKaitaiStream(lenGroup());
            io.addChildStream(_io__raw_group);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (lenGroup()));
                final SummaryOffset _this = this;
                _io__raw_group.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_group = _io__raw_group.toByteArray();
                        if (_this._raw_group.length != lenGroup())
                            throw new ConsistencyError("raw(group)", lenGroup(), _this._raw_group.length);
                        parent.writeBytes(_this._raw_group);
                    }
                });
            }
            this.group._write_Seq(_io__raw_group);
            io.seek(_pos);
        }
        private Opcode groupOpcode;
        private long ofsGroup;
        private long lenGroup;
        private Mcap _root;
        private Mcap.Record _parent;
        private byte[] _raw_group;
        public Opcode groupOpcode() { return groupOpcode; }
        public void setGroupOpcode(Opcode _v) { _dirty = true; groupOpcode = _v; }
        public long ofsGroup() { return ofsGroup; }
        public void setOfsGroup(long _v) { _dirty = true; ofsGroup = _v; }
        public long lenGroup() { return lenGroup; }
        public void setLenGroup(long _v) { _dirty = true; lenGroup = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.Record _parent() { return _parent; }
        public void set_parent(Mcap.Record _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_group() { return _raw_group; }
        public void set_raw_Group(byte[] _v) { _dirty = true; _raw_group = _v; }
    }
    public static class TupleStrStr extends KaitaiStruct.ReadWrite {
        public static TupleStrStr fromFile(String fileName) throws IOException {
            return new TupleStrStr(new ByteBufferKaitaiStream(fileName));
        }
        public TupleStrStr() {
            this(null, null, null);
        }

        public TupleStrStr(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TupleStrStr(KaitaiStream _io, Mcap.MapStrStr.Entries _parent) {
            this(_io, _parent, null);
        }

        public TupleStrStr(KaitaiStream _io, Mcap.MapStrStr.Entries _parent, Mcap _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.key = new PrefixedStr(this._io, this, _root);
            this.key._read();
            this.value = new PrefixedStr(this._io, this, _root);
            this.value._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.key._fetchInstances();
            this.value._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.key._write_Seq(this._io);
            this.value._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.key._root(), _root()))
                throw new ConsistencyError("key", _root(), this.key._root());
            if (!Objects.equals(this.key._parent(), this))
                throw new ConsistencyError("key", this, this.key._parent());
            if (!Objects.equals(this.value._root(), _root()))
                throw new ConsistencyError("value", _root(), this.value._root());
            if (!Objects.equals(this.value._parent(), this))
                throw new ConsistencyError("value", this, this.value._parent());
            _dirty = false;
        }
        private PrefixedStr key;
        private PrefixedStr value;
        private Mcap _root;
        private Mcap.MapStrStr.Entries _parent;
        public PrefixedStr key() { return key; }
        public void setKey(PrefixedStr _v) { _dirty = true; key = _v; }
        public PrefixedStr value() { return value; }
        public void setValue(PrefixedStr _v) { _dirty = true; value = _v; }
        public Mcap _root() { return _root; }
        public void set_root(Mcap _v) { _dirty = true; _root = _v; }
        public Mcap.MapStrStr.Entries _parent() { return _parent; }
        public void set_parent(Mcap.MapStrStr.Entries _v) { _dirty = true; _parent = _v; }
    }
    private Record footer;
    private boolean _shouldWriteFooter = false;
    private boolean _enabledFooter = true;
    public Record footer() {
        if (_shouldWriteFooter)
            _writeFooter();
        if (this.footer != null)
            return this.footer;
        if (!_enabledFooter)
            return null;
        long _pos = this._io.pos();
        this._io.seek(ofsFooter());
        this._raw_footer = this._io.readBytesFull();
        KaitaiStream _io__raw_footer = new ByteBufferKaitaiStream(this._raw_footer);
        this.footer = new Record(_io__raw_footer, this, _root);
        this.footer._read();
        this._io.seek(_pos);
        return this.footer;
    }
    public void setFooter(Record _v) { _dirty = true; footer = _v; }
    public void setFooter_Enabled(boolean _v) { _dirty = true; _enabledFooter = _v; }

    private void _writeFooter() {
        _shouldWriteFooter = false;
        long _pos = this._io.pos();
        this._io.seek(ofsFooter());
        final KaitaiStream _io__raw_footer = new ByteBufferKaitaiStream(this._io.size() - this._io.pos());
        this._io.addChildStream(_io__raw_footer);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (this._io.size() - this._io.pos()));
            final Mcap _this = this;
            _io__raw_footer.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_footer = _io__raw_footer.toByteArray();
                    parent.writeBytes(_this._raw_footer);
                    if (!(parent.isEof()))
                        throw new ConsistencyError("raw(footer)", 0, parent.size() - parent.pos());
                }
            });
        }
        this.footer._write_Seq(_io__raw_footer);
        this._io.seek(_pos);
    }
    private Integer ofsFooter;
    public Integer ofsFooter() {
        if (this.ofsFooter != null)
            return this.ofsFooter;
        this.ofsFooter = ((Number) ((((_io().size() - 1) - 8) - 20) - 8)).intValue();
        return this.ofsFooter;
    }
    public void _invalidateOfsFooter() { this.ofsFooter = null; }
    private Magic headerMagic;
    private List<Record> records;
    private Magic footerMagic;
    private Mcap _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_footer;
    public Magic headerMagic() { return headerMagic; }
    public void setHeaderMagic(Magic _v) { _dirty = true; headerMagic = _v; }
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public Magic footerMagic() { return footerMagic; }
    public void setFooterMagic(Magic _v) { _dirty = true; footerMagic = _v; }
    public Mcap _root() { return _root; }
    public void set_root(Mcap _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_footer() { return _raw_footer; }
    public void set_raw_Footer(byte[] _v) { _dirty = true; _raw_footer = _v; }
}
