// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
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
public class AndroidDto extends KaitaiStruct {
    public static AndroidDto fromFile(String fileName) throws IOException {
        return new AndroidDto(new ByteBufferKaitaiStream(fileName));
    }

    public AndroidDto(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AndroidDto(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AndroidDto(KaitaiStream _io, KaitaiStruct _parent, AndroidDto _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new DtTableHeader(this._io, this, _root);
        this.entries = new ArrayList<DtTableEntry>();
        for (int i = 0; i < header().dtEntryCount(); i++) {
            this.entries.add(new DtTableEntry(this._io, this, _root));
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.entries.size(); i++) {
            this.entries.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class DtTableEntry extends KaitaiStruct {
        public static DtTableEntry fromFile(String fileName) throws IOException {
            return new DtTableEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.dtSize = this._io.readU4be();
            this.dtOffset = this._io.readU4be();
            this.id = this._io.readU4be();
            this.rev = this._io.readU4be();
            this.custom = new ArrayList<Long>();
            for (int i = 0; i < 4; i++) {
                this.custom.add(this._io.readU4be());
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.custom.size(); i++) {
            }
            body();
            if (this.body != null) {
            }
        }
        private byte[] body;

        /**
         * DTB/DTBO file
         */
        public byte[] body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dtOffset());
            this.body = io.readBytes(dtSize());
            io.seek(_pos);
            return this.body;
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

        /**
         * offset from head of dt_table_header
         */
        public long dtOffset() { return dtOffset; }

        /**
         * optional, must be zero if unused
         */
        public long id() { return id; }

        /**
         * optional, must be zero if unused
         */
        public long rev() { return rev; }

        /**
         * optional, must be zero if unused
         */
        public List<Long> custom() { return custom; }
        public AndroidDto _root() { return _root; }
        public AndroidDto _parent() { return _parent; }
    }
    public static class DtTableHeader extends KaitaiStruct {
        public static DtTableHeader fromFile(String fileName) throws IOException {
            return new DtTableHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }

        public void _fetchInstances() {
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

        /**
         * includes dt_table_header + all dt_table_entry and all dtb/dtbo
         */
        public long totalSize() { return totalSize; }

        /**
         * sizeof(dt_table_header)
         */
        public long headerSize() { return headerSize; }

        /**
         * sizeof(dt_table_entry)
         */
        public long dtEntrySize() { return dtEntrySize; }

        /**
         * number of dt_table_entry
         */
        public long dtEntryCount() { return dtEntryCount; }

        /**
         * offset to the first dt_table_entry from head of dt_table_header
         */
        public long dtEntriesOffset() { return dtEntriesOffset; }

        /**
         * flash page size
         */
        public long pageSize() { return pageSize; }

        /**
         * DTBO image version
         */
        public long version() { return version; }
        public AndroidDto _root() { return _root; }
        public AndroidDto _parent() { return _parent; }
    }
    private DtTableHeader header;
    private List<DtTableEntry> entries;
    private AndroidDto _root;
    private KaitaiStruct _parent;
    public DtTableHeader header() { return header; }
    public List<DtTableEntry> entries() { return entries; }
    public AndroidDto _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
