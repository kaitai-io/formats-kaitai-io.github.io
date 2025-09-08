// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.List;
import java.util.Arrays;


/**
 * Format for Android DTB/DTBO partitions. It's kind of archive with
 * dtb/dtbo files. Used only when there is a separate unique partition
 * (dtb, dtbo) on an android device to organize device tree files.
 * The format consists of a header with info about size and number
 * of device tree entries and the entries themselves. This format
 * description could be used to extract device tree entries from a
 * partition images and decompile them with dtc (device tree compiler).
 * @see <a href="https://source.android.com/docs/core/architecture/dto/partitions">Source</a>
 * @see <a href="https://android.googlesource.com/platform/system/libufdt/+/refs/tags/android-10.0.0_r47">Source</a>
 */
public class AndroidDto extends KaitaiStruct.ReadWrite {
    public static AndroidDto fromFile(String fileName) throws IOException {
        return new AndroidDto(new ByteBufferKaitaiStream(fileName));
    }
    public AndroidDto() {
        this(null, null, null);
    }

    public AndroidDto(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidDto(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AndroidDto(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AndroidDto _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new DtTableHeader(this._io, this, _root);
        this.header._read();
        this.entries = new ArrayList<DtTableEntry>();
        for (int i = 0; i < header().dtEntryCount(); i++) {
            DtTableEntry _t_entries = new DtTableEntry(this._io, this, _root);
            try {
                _t_entries._read();
            } finally {
                this.entries.add(_t_entries);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (this.entries.size() != header().dtEntryCount())
            throw new ConsistencyError("entries", header().dtEntryCount(), this.entries.size());
        for (int i = 0; i < this.entries.size(); i++) {
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("entries", _root(), this.entries.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.entries.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("entries", this, this.entries.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class DtTableEntry extends KaitaiStruct.ReadWrite {
        public static DtTableEntry fromFile(String fileName) throws IOException {
            return new DtTableEntry(new ByteBufferKaitaiStream(fileName));
        }
        public DtTableEntry() {
            this(null, null, null);
        }

        public DtTableEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DtTableEntry(KaitaiStream _io, AndroidDto _parent) {
            this(_io, _parent, null);
        }

        public DtTableEntry(KaitaiStream _io, AndroidDto _parent, AndroidDto _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.dtSize = this._io.readU4be();
            this.dtOffset = this._io.readU4be();
            this.id = this._io.readU4be();
            this.rev = this._io.readU4be();
            this.custom = new ArrayList<Long>();
            for (int i = 0; i < 4; i++) {
                this.custom.add(this._io.readU4be());
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.custom.size(); i++) {
            }
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeU4be(this.dtSize);
            this._io.writeU4be(this.dtOffset);
            this._io.writeU4be(this.id);
            this._io.writeU4be(this.rev);
            for (int i = 0; i < this.custom.size(); i++) {
                this._io.writeU4be(this.custom.get(((Number) (i)).intValue()));
            }
        }

        public void _check() {
            if (this.custom.size() != 4)
                throw new ConsistencyError("custom", 4, this.custom.size());
            for (int i = 0; i < this.custom.size(); i++) {
            }
            if (_enabledBody) {
                if (this.body.length != dtSize())
                    throw new ConsistencyError("body", dtSize(), this.body.length);
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;

        /**
         * DTB/DTBO file
         */
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dtOffset());
            this.body = io.readBytes(dtSize());
            io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dtOffset());
            io.writeBytes(this.body);
            io.seek(_pos);
        }
        private long dtSize;
        private long dtOffset;
        private long id;
        private long rev;
        private List<Long> custom;
        private AndroidDto _root;
        private AndroidDto _parent;

        /**
         * size of this entry
         */
        public long dtSize() { return dtSize; }
        public void setDtSize(long _v) { _dirty = true; dtSize = _v; }

        /**
         * offset from head of dt_table_header
         */
        public long dtOffset() { return dtOffset; }
        public void setDtOffset(long _v) { _dirty = true; dtOffset = _v; }

        /**
         * optional, must be zero if unused
         */
        public long id() { return id; }
        public void setId(long _v) { _dirty = true; id = _v; }

        /**
         * optional, must be zero if unused
         */
        public long rev() { return rev; }
        public void setRev(long _v) { _dirty = true; rev = _v; }

        /**
         * optional, must be zero if unused
         */
        public List<Long> custom() { return custom; }
        public void setCustom(List<Long> _v) { _dirty = true; custom = _v; }
        public AndroidDto _root() { return _root; }
        public void set_root(AndroidDto _v) { _dirty = true; _root = _v; }
        public AndroidDto _parent() { return _parent; }
        public void set_parent(AndroidDto _v) { _dirty = true; _parent = _v; }
    }
    public static class DtTableHeader extends KaitaiStruct.ReadWrite {
        public static DtTableHeader fromFile(String fileName) throws IOException {
            return new DtTableHeader(new ByteBufferKaitaiStream(fileName));
        }
        public DtTableHeader() {
            this(null, null, null);
        }

        public DtTableHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DtTableHeader(KaitaiStream _io, AndroidDto _parent) {
            this(_io, _parent, null);
        }

        public DtTableHeader(KaitaiStream _io, AndroidDto _parent, AndroidDto _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(4);
            if (!(Arrays.equals(this.magic, new byte[] { -41, -73, -85, 30 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -41, -73, -85, 30 }, this.magic, this._io, "/types/dt_table_header/seq/0");
            }
            this.totalSize = this._io.readU4be();
            this.headerSize = this._io.readU4be();
            this.dtEntrySize = this._io.readU4be();
            this.dtEntryCount = this._io.readU4be();
            this.dtEntriesOffset = this._io.readU4be();
            this.pageSize = this._io.readU4be();
            this.version = this._io.readU4be();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU4be(this.totalSize);
            this._io.writeU4be(this.headerSize);
            this._io.writeU4be(this.dtEntrySize);
            this._io.writeU4be(this.dtEntryCount);
            this._io.writeU4be(this.dtEntriesOffset);
            this._io.writeU4be(this.pageSize);
            this._io.writeU4be(this.version);
        }

        public void _check() {
            if (this.magic.length != 4)
                throw new ConsistencyError("magic", 4, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { -41, -73, -85, 30 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { -41, -73, -85, 30 }, this.magic, null, "/types/dt_table_header/seq/0");
            }
            _dirty = false;
        }
        private byte[] magic;
        private long totalSize;
        private long headerSize;
        private long dtEntrySize;
        private long dtEntryCount;
        private long dtEntriesOffset;
        private long pageSize;
        private long version;
        private AndroidDto _root;
        private AndroidDto _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }

        /**
         * includes dt_table_header + all dt_table_entry and all dtb/dtbo
         */
        public long totalSize() { return totalSize; }
        public void setTotalSize(long _v) { _dirty = true; totalSize = _v; }

        /**
         * sizeof(dt_table_header)
         */
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }

        /**
         * sizeof(dt_table_entry)
         */
        public long dtEntrySize() { return dtEntrySize; }
        public void setDtEntrySize(long _v) { _dirty = true; dtEntrySize = _v; }

        /**
         * number of dt_table_entry
         */
        public long dtEntryCount() { return dtEntryCount; }
        public void setDtEntryCount(long _v) { _dirty = true; dtEntryCount = _v; }

        /**
         * offset to the first dt_table_entry from head of dt_table_header
         */
        public long dtEntriesOffset() { return dtEntriesOffset; }
        public void setDtEntriesOffset(long _v) { _dirty = true; dtEntriesOffset = _v; }

        /**
         * flash page size
         */
        public long pageSize() { return pageSize; }
        public void setPageSize(long _v) { _dirty = true; pageSize = _v; }

        /**
         * DTBO image version
         */
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }
        public AndroidDto _root() { return _root; }
        public void set_root(AndroidDto _v) { _dirty = true; _root = _v; }
        public AndroidDto _parent() { return _parent; }
        public void set_parent(AndroidDto _v) { _dirty = true; _parent = _v; }
    }
    private DtTableHeader header;
    private List<DtTableEntry> entries;
    private AndroidDto _root;
    private KaitaiStruct.ReadWrite _parent;
    public DtTableHeader header() { return header; }
    public void setHeader(DtTableHeader _v) { _dirty = true; header = _v; }
    public List<DtTableEntry> entries() { return entries; }
    public void setEntries(List<DtTableEntry> _v) { _dirty = true; entries = _v; }
    public AndroidDto _root() { return _root; }
    public void set_root(AndroidDto _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
