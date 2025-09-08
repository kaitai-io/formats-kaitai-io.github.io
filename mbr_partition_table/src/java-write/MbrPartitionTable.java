// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * MBR (Master Boot Record) partition table is a traditional way of
 * MS-DOS to partition larger hard disc drives into distinct
 * partitions.
 * 
 * This table is stored in the end of the boot sector (first sector) of
 * the drive, after the bootstrap code. Original DOS 2.0 specification
 * allowed only 4 partitions per disc, but DOS 3.2 introduced concept
 * of "extended partitions", which work as nested extra "boot records"
 * which are pointed to by original ("primary") partitions in MBR.
 */
public class MbrPartitionTable extends KaitaiStruct.ReadWrite {
    public static MbrPartitionTable fromFile(String fileName) throws IOException {
        return new MbrPartitionTable(new ByteBufferKaitaiStream(fileName));
    }
    public MbrPartitionTable() {
        this(null, null, null);
    }

    public MbrPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MbrPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.bootstrapCode = this._io.readBytes(446);
        this.partitions = new ArrayList<PartitionEntry>();
        for (int i = 0; i < 4; i++) {
            PartitionEntry _t_partitions = new PartitionEntry(this._io, this, _root);
            try {
                _t_partitions._read();
            } finally {
                this.partitions.add(_t_partitions);
            }
        }
        this.bootSignature = this._io.readBytes(2);
        if (!(Arrays.equals(this.bootSignature, new byte[] { 85, -86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 85, -86 }, this.bootSignature, this._io, "/seq/2");
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
        this._io.writeBytes(this.bootstrapCode);
        for (int i = 0; i < this.partitions.size(); i++) {
            this.partitions.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        this._io.writeBytes(this.bootSignature);
    }

    public void _check() {
        if (this.bootstrapCode.length != 446)
            throw new ConsistencyError("bootstrap_code", 446, this.bootstrapCode.length);
        if (this.partitions.size() != 4)
            throw new ConsistencyError("partitions", 4, this.partitions.size());
        for (int i = 0; i < this.partitions.size(); i++) {
            if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("partitions", _root(), this.partitions.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.partitions.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("partitions", this, this.partitions.get(((Number) (i)).intValue())._parent());
        }
        if (this.bootSignature.length != 2)
            throw new ConsistencyError("boot_signature", 2, this.bootSignature.length);
        if (!(Arrays.equals(this.bootSignature, new byte[] { 85, -86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 85, -86 }, this.bootSignature, null, "/seq/2");
        }
        _dirty = false;
    }
    public static class Chs extends KaitaiStruct.ReadWrite {
        public static Chs fromFile(String fileName) throws IOException {
            return new Chs(new ByteBufferKaitaiStream(fileName));
        }
        public Chs() {
            this(null, null, null);
        }

        public Chs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Chs(KaitaiStream _io, MbrPartitionTable.PartitionEntry _parent) {
            this(_io, _parent, null);
        }

        public Chs(KaitaiStream _io, MbrPartitionTable.PartitionEntry _parent, MbrPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.head = this._io.readU1();
            this.b2 = this._io.readU1();
            this.b3 = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.head);
            this._io.writeU1(this.b2);
            this._io.writeU1(this.b3);
        }

        public void _check() {
            _dirty = false;
        }
        private Integer cylinder;
        public Integer cylinder() {
            if (this.cylinder != null)
                return this.cylinder;
            this.cylinder = ((Number) (b3() + ((b2() & 192) << 2))).intValue();
            return this.cylinder;
        }
        public void _invalidateCylinder() { this.cylinder = null; }
        private Integer sector;
        public Integer sector() {
            if (this.sector != null)
                return this.sector;
            this.sector = ((Number) (b2() & 63)).intValue();
            return this.sector;
        }
        public void _invalidateSector() { this.sector = null; }
        private int head;
        private int b2;
        private int b3;
        private MbrPartitionTable _root;
        private MbrPartitionTable.PartitionEntry _parent;
        public int head() { return head; }
        public void setHead(int _v) { _dirty = true; head = _v; }
        public int b2() { return b2; }
        public void setB2(int _v) { _dirty = true; b2 = _v; }
        public int b3() { return b3; }
        public void setB3(int _v) { _dirty = true; b3 = _v; }
        public MbrPartitionTable _root() { return _root; }
        public void set_root(MbrPartitionTable _v) { _dirty = true; _root = _v; }
        public MbrPartitionTable.PartitionEntry _parent() { return _parent; }
        public void set_parent(MbrPartitionTable.PartitionEntry _v) { _dirty = true; _parent = _v; }
    }
    public static class PartitionEntry extends KaitaiStruct.ReadWrite {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new ByteBufferKaitaiStream(fileName));
        }
        public PartitionEntry() {
            this(null, null, null);
        }

        public PartitionEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PartitionEntry(KaitaiStream _io, MbrPartitionTable _parent) {
            this(_io, _parent, null);
        }

        public PartitionEntry(KaitaiStream _io, MbrPartitionTable _parent, MbrPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.status = this._io.readU1();
            this.chsStart = new Chs(this._io, this, _root);
            this.chsStart._read();
            this.partitionType = this._io.readU1();
            this.chsEnd = new Chs(this._io, this, _root);
            this.chsEnd._read();
            this.lbaStart = this._io.readU4le();
            this.numSectors = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.chsStart._fetchInstances();
            this.chsEnd._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.status);
            this.chsStart._write_Seq(this._io);
            this._io.writeU1(this.partitionType);
            this.chsEnd._write_Seq(this._io);
            this._io.writeU4le(this.lbaStart);
            this._io.writeU4le(this.numSectors);
        }

        public void _check() {
            if (!Objects.equals(this.chsStart._root(), _root()))
                throw new ConsistencyError("chs_start", _root(), this.chsStart._root());
            if (!Objects.equals(this.chsStart._parent(), this))
                throw new ConsistencyError("chs_start", this, this.chsStart._parent());
            if (!Objects.equals(this.chsEnd._root(), _root()))
                throw new ConsistencyError("chs_end", _root(), this.chsEnd._root());
            if (!Objects.equals(this.chsEnd._parent(), this))
                throw new ConsistencyError("chs_end", this, this.chsEnd._parent());
            _dirty = false;
        }
        private int status;
        private Chs chsStart;
        private int partitionType;
        private Chs chsEnd;
        private long lbaStart;
        private long numSectors;
        private MbrPartitionTable _root;
        private MbrPartitionTable _parent;
        public int status() { return status; }
        public void setStatus(int _v) { _dirty = true; status = _v; }
        public Chs chsStart() { return chsStart; }
        public void setChsStart(Chs _v) { _dirty = true; chsStart = _v; }
        public int partitionType() { return partitionType; }
        public void setPartitionType(int _v) { _dirty = true; partitionType = _v; }
        public Chs chsEnd() { return chsEnd; }
        public void setChsEnd(Chs _v) { _dirty = true; chsEnd = _v; }
        public long lbaStart() { return lbaStart; }
        public void setLbaStart(long _v) { _dirty = true; lbaStart = _v; }
        public long numSectors() { return numSectors; }
        public void setNumSectors(long _v) { _dirty = true; numSectors = _v; }
        public MbrPartitionTable _root() { return _root; }
        public void set_root(MbrPartitionTable _v) { _dirty = true; _root = _v; }
        public MbrPartitionTable _parent() { return _parent; }
        public void set_parent(MbrPartitionTable _v) { _dirty = true; _parent = _v; }
    }
    private byte[] bootstrapCode;
    private List<PartitionEntry> partitions;
    private byte[] bootSignature;
    private MbrPartitionTable _root;
    private KaitaiStruct.ReadWrite _parent;
    public byte[] bootstrapCode() { return bootstrapCode; }
    public void setBootstrapCode(byte[] _v) { _dirty = true; bootstrapCode = _v; }
    public List<PartitionEntry> partitions() { return partitions; }
    public void setPartitions(List<PartitionEntry> _v) { _dirty = true; partitions = _v; }
    public byte[] bootSignature() { return bootSignature; }
    public void setBootSignature(byte[] _v) { _dirty = true; bootSignature = _v; }
    public MbrPartitionTable _root() { return _root; }
    public void set_root(MbrPartitionTable _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
