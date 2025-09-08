// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
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
public class MbrPartitionTable extends KaitaiStruct {
    public static MbrPartitionTable fromFile(String fileName) throws IOException {
        return new MbrPartitionTable(new ByteBufferKaitaiStream(fileName));
    }

    public MbrPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct _parent, MbrPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.bootstrapCode = this._io.readBytes(446);
        this.partitions = new ArrayList<PartitionEntry>();
        for (int i = 0; i < 4; i++) {
            this.partitions.add(new PartitionEntry(this._io, this, _root));
        }
        this.bootSignature = this._io.readBytes(2);
        if (!(Arrays.equals(this.bootSignature, new byte[] { 85, -86 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 85, -86 }, this.bootSignature, this._io, "/seq/2");
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.partitions.size(); i++) {
            this.partitions.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class Chs extends KaitaiStruct {
        public static Chs fromFile(String fileName) throws IOException {
            return new Chs(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.head = this._io.readU1();
            this.b2 = this._io.readU1();
            this.b3 = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private Integer cylinder;
        public Integer cylinder() {
            if (this.cylinder != null)
                return this.cylinder;
            this.cylinder = ((Number) (b3() + ((b2() & 192) << 2))).intValue();
            return this.cylinder;
        }
        private Integer sector;
        public Integer sector() {
            if (this.sector != null)
                return this.sector;
            this.sector = ((Number) (b2() & 63)).intValue();
            return this.sector;
        }
        private int head;
        private int b2;
        private int b3;
        private MbrPartitionTable _root;
        private MbrPartitionTable.PartitionEntry _parent;
        public int head() { return head; }
        public int b2() { return b2; }
        public int b3() { return b3; }
        public MbrPartitionTable _root() { return _root; }
        public MbrPartitionTable.PartitionEntry _parent() { return _parent; }
    }
    public static class PartitionEntry extends KaitaiStruct {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.status = this._io.readU1();
            this.chsStart = new Chs(this._io, this, _root);
            this.partitionType = this._io.readU1();
            this.chsEnd = new Chs(this._io, this, _root);
            this.lbaStart = this._io.readU4le();
            this.numSectors = this._io.readU4le();
        }

        public void _fetchInstances() {
            this.chsStart._fetchInstances();
            this.chsEnd._fetchInstances();
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
        public Chs chsStart() { return chsStart; }
        public int partitionType() { return partitionType; }
        public Chs chsEnd() { return chsEnd; }
        public long lbaStart() { return lbaStart; }
        public long numSectors() { return numSectors; }
        public MbrPartitionTable _root() { return _root; }
        public MbrPartitionTable _parent() { return _parent; }
    }
    private byte[] bootstrapCode;
    private List<PartitionEntry> partitions;
    private byte[] bootSignature;
    private MbrPartitionTable _root;
    private KaitaiStruct _parent;
    public byte[] bootstrapCode() { return bootstrapCode; }
    public List<PartitionEntry> partitions() { return partitions; }
    public byte[] bootSignature() { return bootSignature; }
    public MbrPartitionTable _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
