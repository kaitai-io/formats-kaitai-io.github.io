// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.nio.charset.Charset;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * This is an unnamed and undocumented partition table format implemented by
 * the bootloader and kernel that Amlogic provides for their Linux SoCs (Meson
 * series at least, and probably others). They appear to use this rather than GPT,
 * the industry standard, because their BootROM loads and executes the next stage
 * loader from offset 512 (0x200) on the eMMC, which is exactly where the GPT
 * header would have to start. So instead of changing their BootROM, Amlogic
 * devised this partition table, which lives at an offset of 36MiB (0x240_0000)
 * on the eMMC and so doesn't conflict. This parser expects as input just the
 * partition table from that offset. The maximum number of partitions in a table
 * is 32, which corresponds to a maximum table size of 1304 bytes (0x518).
 * @see <a href="http://aml-code.amlogic.com/kernel/common.git/tree/include/linux/mmc/emmc_partitions.h?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
 * @see <a href="http://aml-code.amlogic.com/kernel/common.git/tree/drivers/amlogic/mmc/emmc_partitions.c?id=18a4a87072ababf76ea08c8539e939b5b8a440ef">Source</a>
 */
public class AmlogicEmmcPartitions extends KaitaiStruct.ReadWrite {
    public static AmlogicEmmcPartitions fromFile(String fileName) throws IOException {
        return new AmlogicEmmcPartitions(new ByteBufferKaitaiStream(fileName));
    }
    public AmlogicEmmcPartitions() {
        this(null, null, null);
    }

    public AmlogicEmmcPartitions(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AmlogicEmmcPartitions(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public AmlogicEmmcPartitions(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, AmlogicEmmcPartitions _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(this.magic, new byte[] { 77, 80, 84, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 80, 84, 0 }, this.magic, this._io, "/seq/0");
        }
        this.version = new String(KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false), StandardCharsets.UTF_8);
        this.numPartitions = this._io.readS4le();
        if (!(this.numPartitions >= 1)) {
            throw new KaitaiStream.ValidationLessThanError(1, this.numPartitions, this._io, "/seq/2");
        }
        if (!(this.numPartitions <= 32)) {
            throw new KaitaiStream.ValidationGreaterThanError(32, this.numPartitions, this._io, "/seq/2");
        }
        this.checksum = this._io.readU4le();
        this.partitions = new ArrayList<Partition>();
        for (int i = 0; i < numPartitions(); i++) {
            Partition _t_partitions = new Partition(this._io, this, _root);
            try {
                _t_partitions._read();
            } finally {
                this.partitions.add(_t_partitions);
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.partitions.size(); i++) {
            this.partitions.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._io.writeBytes(this.magic);
        this._io.writeBytesLimit((this.version).getBytes(Charset.forName("UTF-8")), 12, (byte) 0, (byte) 0);
        this._io.writeS4le(this.numPartitions);
        this._io.writeU4le(this.checksum);
        for (int i = 0; i < this.partitions.size(); i++) {
            this.partitions.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.magic.length != 4)
            throw new ConsistencyError("magic", 4, this.magic.length);
        if (!(Arrays.equals(this.magic, new byte[] { 77, 80, 84, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 80, 84, 0 }, this.magic, null, "/seq/0");
        }
        if ((this.version).getBytes(Charset.forName("UTF-8")).length > 12)
            throw new ConsistencyError("version", 12, (this.version).getBytes(Charset.forName("UTF-8")).length);
        if (KaitaiStream.byteArrayIndexOf((this.version).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
            throw new ConsistencyError("version", -1, KaitaiStream.byteArrayIndexOf((this.version).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
        if (!(this.numPartitions >= 1)) {
            throw new KaitaiStream.ValidationLessThanError(1, this.numPartitions, null, "/seq/2");
        }
        if (!(this.numPartitions <= 32)) {
            throw new KaitaiStream.ValidationGreaterThanError(32, this.numPartitions, null, "/seq/2");
        }
        if (this.partitions.size() != numPartitions())
            throw new ConsistencyError("partitions", numPartitions(), this.partitions.size());
        for (int i = 0; i < this.partitions.size(); i++) {
            if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("partitions", _root(), this.partitions.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("partitions", this, this.partitions.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class Partition extends KaitaiStruct.ReadWrite {
        public static Partition fromFile(String fileName) throws IOException {
            return new Partition(new ByteBufferKaitaiStream(fileName));
        }
        public Partition() {
            this(null, null, null);
        }

        public Partition(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Partition(KaitaiStream _io, AmlogicEmmcPartitions _parent) {
            this(_io, _parent, null);
        }

        public Partition(KaitaiStream _io, AmlogicEmmcPartitions _parent, AmlogicEmmcPartitions _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.UTF_8);
            this.size = this._io.readU8le();
            this.offset = this._io.readU8le();
            this._raw_flags = this._io.readBytes(4);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(this._raw_flags);
            this.flags = new PartFlags(_io__raw_flags, this, _root);
            this.flags._read();
            this.padding = this._io.readBytes(4);
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 16, (byte) 0, (byte) 0);
            this._io.writeU8le(this.size);
            this._io.writeU8le(this.offset);
            final KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_flags);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final Partition _this = this;
                _io__raw_flags.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_flags = _io__raw_flags.toByteArray();
                        if (_this._raw_flags.length != 4)
                            throw new ConsistencyError("raw(flags)", 4, _this._raw_flags.length);
                        parent.writeBytes(_this._raw_flags);
                    }
                });
            }
            this.flags._write_Seq(_io__raw_flags);
            this._io.writeBytes(this.padding);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-8")).length > 16)
                throw new ConsistencyError("name", 16, (this.name).getBytes(Charset.forName("UTF-8")).length);
            if (KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)) != -1)
                throw new ConsistencyError("name", -1, KaitaiStream.byteArrayIndexOf((this.name).getBytes(Charset.forName("UTF-8")), ((byte) 0)));
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.padding.length != 4)
                throw new ConsistencyError("padding", 4, this.padding.length);
            _dirty = false;
        }
        public static class PartFlags extends KaitaiStruct.ReadWrite {
            public static PartFlags fromFile(String fileName) throws IOException {
                return new PartFlags(new ByteBufferKaitaiStream(fileName));
            }
            public PartFlags() {
                this(null, null, null);
            }

            public PartFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public PartFlags(KaitaiStream _io, AmlogicEmmcPartitions.Partition _parent) {
                this(_io, _parent, null);
            }

            public PartFlags(KaitaiStream _io, AmlogicEmmcPartitions.Partition _parent, AmlogicEmmcPartitions _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.isCode = this._io.readBitsIntLe(1) != 0;
                this.isCache = this._io.readBitsIntLe(1) != 0;
                this.isData = this._io.readBitsIntLe(1) != 0;
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntLe(1, (this.isCode ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.isCache ? 1 : 0));
                this._io.writeBitsIntLe(1, (this.isData ? 1 : 0));
            }

            public void _check() {
                _dirty = false;
            }
            private boolean isCode;
            private boolean isCache;
            private boolean isData;
            private AmlogicEmmcPartitions _root;
            private AmlogicEmmcPartitions.Partition _parent;
            public boolean isCode() { return isCode; }
            public void setIsCode(boolean _v) { _dirty = true; isCode = _v; }
            public boolean isCache() { return isCache; }
            public void setIsCache(boolean _v) { _dirty = true; isCache = _v; }
            public boolean isData() { return isData; }
            public void setIsData(boolean _v) { _dirty = true; isData = _v; }
            public AmlogicEmmcPartitions _root() { return _root; }
            public void set_root(AmlogicEmmcPartitions _v) { _dirty = true; _root = _v; }
            public AmlogicEmmcPartitions.Partition _parent() { return _parent; }
            public void set_parent(AmlogicEmmcPartitions.Partition _v) { _dirty = true; _parent = _v; }
        }
        private String name;
        private long size;
        private long offset;
        private PartFlags flags;
        private byte[] padding;
        private AmlogicEmmcPartitions _root;
        private AmlogicEmmcPartitions _parent;
        private byte[] _raw_flags;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }

        /**
         * The start of the partition relative to the start of the eMMC, in bytes
         */
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }
        public PartFlags flags() { return flags; }
        public void setFlags(PartFlags _v) { _dirty = true; flags = _v; }
        public byte[] padding() { return padding; }
        public void setPadding(byte[] _v) { _dirty = true; padding = _v; }
        public AmlogicEmmcPartitions _root() { return _root; }
        public void set_root(AmlogicEmmcPartitions _v) { _dirty = true; _root = _v; }
        public AmlogicEmmcPartitions _parent() { return _parent; }
        public void set_parent(AmlogicEmmcPartitions _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_flags() { return _raw_flags; }
        public void set_raw_Flags(byte[] _v) { _dirty = true; _raw_flags = _v; }
    }
    private byte[] magic;
    private String version;
    private int numPartitions;
    private long checksum;
    private List<Partition> partitions;
    private AmlogicEmmcPartitions _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] magic() { return magic; }
    public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
    public String version() { return version; }
    public void setVersion(String _v) { _dirty = true; version = _v; }
    public int numPartitions() { return numPartitions; }
    public void setNumPartitions(int _v) { _dirty = true; numPartitions = _v; }

    /**
     * To calculate this, treat the first (and only the first) partition
     * descriptor in the table below as an array of unsigned little-endian
     * 32-bit integers. Sum all those integers mod 2^32, then multiply the
     * result by the total number of partitions, also mod 2^32. Amlogic
     * likely meant to include all the partition descriptors in the sum,
     * but their code as written instead repeatedly loops over the first
     * one, once for each partition in the table.
     */
    public long checksum() { return checksum; }
    public void setChecksum(long _v) { _dirty = true; checksum = _v; }
    public List<Partition> partitions() { return partitions; }
    public void setPartitions(List<Partition> _v) { _dirty = true; partitions = _v; }
    public AmlogicEmmcPartitions _root() { return _root; }
    public void set_root(AmlogicEmmcPartitions _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
