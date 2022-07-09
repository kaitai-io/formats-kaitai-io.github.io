// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * @see <a href="https://en.wikipedia.org/wiki/Apple_Partition_Map">Source</a>
 */
public class ApmPartitionTable extends KaitaiStruct {
    public static ApmPartitionTable fromFile(String fileName) throws IOException {
        return new ApmPartitionTable(new ByteBufferKaitaiStream(fileName));
    }

    public ApmPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ApmPartitionTable(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ApmPartitionTable(KaitaiStream _io, KaitaiStruct _parent, ApmPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
    }
    public static class PartitionEntry extends KaitaiStruct {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new ByteBufferKaitaiStream(fileName));
        }

        public PartitionEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PartitionEntry(KaitaiStream _io, ApmPartitionTable _parent) {
            this(_io, _parent, null);
        }

        public PartitionEntry(KaitaiStream _io, ApmPartitionTable _parent, ApmPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(magic(), new byte[] { 80, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 77 }, magic(), _io(), "/types/partition_entry/seq/0");
            }
            this.reserved1 = this._io.readBytes(2);
            this.numberOfPartitions = this._io.readU4be();
            this.partitionStart = this._io.readU4be();
            this.partitionSize = this._io.readU4be();
            this.partitionName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), Charset.forName("ascii"));
            this.partitionType = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), Charset.forName("ascii"));
            this.dataStart = this._io.readU4be();
            this.dataSize = this._io.readU4be();
            this.partitionStatus = this._io.readU4be();
            this.bootCodeStart = this._io.readU4be();
            this.bootCodeSize = this._io.readU4be();
            this.bootLoaderAddress = this._io.readU4be();
            this.reserved2 = this._io.readBytes(4);
            this.bootCodeEntry = this._io.readU4be();
            this.reserved3 = this._io.readBytes(4);
            this.bootCodeCksum = this._io.readU4be();
            this.processorType = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), Charset.forName("ascii"));
        }
        private byte[] partition;
        public byte[] partition() {
            if (this.partition != null)
                return this.partition;
            if ((partitionStatus() & 1) != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((partitionStart() * _root().sectorSize()));
                this.partition = io.readBytes((partitionSize() * _root().sectorSize()));
                io.seek(_pos);
            }
            return this.partition;
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek((dataStart() * _root().sectorSize()));
            this.data = io.readBytes((dataSize() * _root().sectorSize()));
            io.seek(_pos);
            return this.data;
        }
        private byte[] bootCode;
        public byte[] bootCode() {
            if (this.bootCode != null)
                return this.bootCode;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek((bootCodeStart() * _root().sectorSize()));
            this.bootCode = io.readBytes(bootCodeSize());
            io.seek(_pos);
            return this.bootCode;
        }
        private byte[] magic;
        private byte[] reserved1;
        private long numberOfPartitions;
        private long partitionStart;
        private long partitionSize;
        private String partitionName;
        private String partitionType;
        private long dataStart;
        private long dataSize;
        private long partitionStatus;
        private long bootCodeStart;
        private long bootCodeSize;
        private long bootLoaderAddress;
        private byte[] reserved2;
        private long bootCodeEntry;
        private byte[] reserved3;
        private long bootCodeCksum;
        private String processorType;
        private ApmPartitionTable _root;
        private ApmPartitionTable _parent;
        public byte[] magic() { return magic; }
        public byte[] reserved1() { return reserved1; }
        public long numberOfPartitions() { return numberOfPartitions; }

        /**
         * First sector
         */
        public long partitionStart() { return partitionStart; }

        /**
         * Number of sectors
         */
        public long partitionSize() { return partitionSize; }
        public String partitionName() { return partitionName; }
        public String partitionType() { return partitionType; }

        /**
         * First sector
         */
        public long dataStart() { return dataStart; }

        /**
         * Number of sectors
         */
        public long dataSize() { return dataSize; }
        public long partitionStatus() { return partitionStatus; }

        /**
         * First sector
         */
        public long bootCodeStart() { return bootCodeStart; }

        /**
         * Number of bytes
         */
        public long bootCodeSize() { return bootCodeSize; }

        /**
         * Address of bootloader code
         */
        public long bootLoaderAddress() { return bootLoaderAddress; }
        public byte[] reserved2() { return reserved2; }

        /**
         * Boot code entry point
         */
        public long bootCodeEntry() { return bootCodeEntry; }
        public byte[] reserved3() { return reserved3; }

        /**
         * Boot code checksum
         */
        public long bootCodeCksum() { return bootCodeCksum; }
        public String processorType() { return processorType; }
        public ApmPartitionTable _root() { return _root; }
        public ApmPartitionTable _parent() { return _parent; }
    }
    private Integer sectorSize;

    /**
     * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
     * 0x800 (2048) bytes for CDROM
     */
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        int _tmp = (int) (512);
        this.sectorSize = _tmp;
        return this.sectorSize;
    }
    private PartitionEntry partitionLookup;

    /**
     * Every partition entry contains the number of partition entries.
     * We parse the first entry, to know how many to parse, including the first one.
     * No logic is given what to do if other entries have a different number.
     */
    public PartitionEntry partitionLookup() {
        if (this.partitionLookup != null)
            return this.partitionLookup;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this._raw_partitionLookup = io.readBytes(sectorSize());
        KaitaiStream _io__raw_partitionLookup = new ByteBufferKaitaiStream(_raw_partitionLookup);
        this.partitionLookup = new PartitionEntry(_io__raw_partitionLookup, this, _root);
        io.seek(_pos);
        return this.partitionLookup;
    }
    private ArrayList<PartitionEntry> partitionEntries;
    public ArrayList<PartitionEntry> partitionEntries() {
        if (this.partitionEntries != null)
            return this.partitionEntries;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this._raw_partitionEntries = new ArrayList<byte[]>();
        this.partitionEntries = new ArrayList<PartitionEntry>();
        for (int i = 0; i < _root().partitionLookup().numberOfPartitions(); i++) {
            this._raw_partitionEntries.add(io.readBytes(sectorSize()));
            KaitaiStream _io__raw_partitionEntries = new ByteBufferKaitaiStream(_raw_partitionEntries.get(_raw_partitionEntries.size() - 1));
            this.partitionEntries.add(new PartitionEntry(_io__raw_partitionEntries, this, _root));
        }
        io.seek(_pos);
        return this.partitionEntries;
    }
    private ApmPartitionTable _root;
    private KaitaiStruct _parent;
    private byte[] _raw_partitionLookup;
    private ArrayList<byte[]> _raw_partitionEntries;
    public ApmPartitionTable _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_partitionLookup() { return _raw_partitionLookup; }
    public ArrayList<byte[]> _raw_partitionEntries() { return _raw_partitionEntries; }
}
