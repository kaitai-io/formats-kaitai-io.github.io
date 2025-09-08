// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Arrays;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;
import java.util.ArrayList;


/**
 * @see <a href="https://en.wikipedia.org/wiki/Apple_Partition_Map">Source</a>
 */
public class ApmPartitionTable extends KaitaiStruct.ReadWrite {
    public static ApmPartitionTable fromFile(String fileName) throws IOException {
        return new ApmPartitionTable(new ByteBufferKaitaiStream(fileName));
    }
    public ApmPartitionTable() {
        this(null, null, null);
    }

    public ApmPartitionTable(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ApmPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public ApmPartitionTable(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, ApmPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        _dirty = false;
    }

    public void _fetchInstances() {
        partitionEntries();
        if (this.partitionEntries != null) {
            for (int i = 0; i < this.partitionEntries.size(); i++) {
                this.partitionEntries.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        partitionLookup();
        if (this.partitionLookup != null) {
            this.partitionLookup._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePartitionEntries = _enabledPartitionEntries;
        _shouldWritePartitionLookup = _enabledPartitionLookup;
    }

    public void _check() {
        if (_enabledPartitionEntries) {
            if (this.partitionEntries.size() != _root().partitionLookup().numberOfPartitions())
                throw new ConsistencyError("partition_entries", _root().partitionLookup().numberOfPartitions(), this.partitionEntries.size());
            for (int i = 0; i < this.partitionEntries.size(); i++) {
                if (!Objects.equals(this.partitionEntries.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("partition_entries", _root(), this.partitionEntries.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.partitionEntries.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("partition_entries", this, this.partitionEntries.get(((Number) (i)).intValue())._parent());
            }
        }
        if (_enabledPartitionLookup) {
            if (!Objects.equals(this.partitionLookup._root(), _root()))
                throw new ConsistencyError("partition_lookup", _root(), this.partitionLookup._root());
            if (!Objects.equals(this.partitionLookup._parent(), this))
                throw new ConsistencyError("partition_lookup", this, this.partitionLookup._parent());
        }
        _dirty = false;
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

        public PartitionEntry(KaitaiStream _io, ApmPartitionTable _parent) {
            this(_io, _parent, null);
        }

        public PartitionEntry(KaitaiStream _io, ApmPartitionTable _parent, ApmPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 80, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 77 }, this.magic, this._io, "/types/partition_entry/seq/0");
            }
            this.reserved1 = this._io.readBytes(2);
            this.numberOfPartitions = this._io.readU4be();
            this.partitionStart = this._io.readU4be();
            this.partitionSize = this._io.readU4be();
            this.partitionName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.US_ASCII);
            this.partitionType = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), StandardCharsets.US_ASCII);
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
            this.processorType = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), StandardCharsets.US_ASCII);
            _dirty = false;
        }

        public void _fetchInstances() {
            bootCode();
            if (this.bootCode != null) {
            }
            data();
            if (this.data != null) {
            }
            partition();
            if (this.partition != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBootCode = _enabledBootCode;
            _shouldWriteData = _enabledData;
            _shouldWritePartition = _enabledPartition;
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.reserved1);
            this._io.writeU4be(this.numberOfPartitions);
            this._io.writeU4be(this.partitionStart);
            this._io.writeU4be(this.partitionSize);
            this._io.writeBytesLimit((this.partitionName).getBytes(Charset.forName("ASCII")), 32, (byte) 0, (byte) 0);
            this._io.writeBytesLimit((this.partitionType).getBytes(Charset.forName("ASCII")), 32, (byte) 0, (byte) 0);
            this._io.writeU4be(this.dataStart);
            this._io.writeU4be(this.dataSize);
            this._io.writeU4be(this.partitionStatus);
            this._io.writeU4be(this.bootCodeStart);
            this._io.writeU4be(this.bootCodeSize);
            this._io.writeU4be(this.bootLoaderAddress);
            this._io.writeBytes(this.reserved2);
            this._io.writeU4be(this.bootCodeEntry);
            this._io.writeBytes(this.reserved3);
            this._io.writeU4be(this.bootCodeCksum);
            this._io.writeBytesLimit((this.processorType).getBytes(Charset.forName("ASCII")), 16, (byte) 0, (byte) 0);
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 80, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 77 }, this.magic, null, "/types/partition_entry/seq/0");
            }
            if (this.reserved1.length != 2)
                throw new ConsistencyError("reserved_1", 2, this.reserved1.length);
            if ((this.partitionName).getBytes(Charset.forName("ASCII")).length > 32)
                throw new ConsistencyError("partition_name", 32, (this.partitionName).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.partitionName).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("partition_name", -1, KaitaiStream.byteArrayIndexOf((this.partitionName).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if ((this.partitionType).getBytes(Charset.forName("ASCII")).length > 32)
                throw new ConsistencyError("partition_type", 32, (this.partitionType).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.partitionType).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("partition_type", -1, KaitaiStream.byteArrayIndexOf((this.partitionType).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (this.reserved2.length != 4)
                throw new ConsistencyError("reserved_2", 4, this.reserved2.length);
            if (this.reserved3.length != 4)
                throw new ConsistencyError("reserved_3", 4, this.reserved3.length);
            if ((this.processorType).getBytes(Charset.forName("ASCII")).length > 16)
                throw new ConsistencyError("processor_type", 16, (this.processorType).getBytes(Charset.forName("ASCII")).length);
            if (KaitaiStream.byteArrayIndexOf((this.processorType).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                throw new ConsistencyError("processor_type", -1, KaitaiStream.byteArrayIndexOf((this.processorType).getBytes(Charset.forName("ASCII")), ((byte) 0)));
            if (_enabledBootCode) {
                if (this.bootCode.length != bootCodeSize())
                    throw new ConsistencyError("boot_code", bootCodeSize(), this.bootCode.length);
            }
            if (_enabledData) {
                if (this.data.length != dataSize() * _root().sectorSize())
                    throw new ConsistencyError("data", dataSize() * _root().sectorSize(), this.data.length);
            }
            if (_enabledPartition) {
                if ((partitionStatus() & 1) != 0) {
                    if (this.partition.length != partitionSize() * _root().sectorSize())
                        throw new ConsistencyError("partition", partitionSize() * _root().sectorSize(), this.partition.length);
                }
            }
            _dirty = false;
        }
        private byte[] bootCode;
        private boolean _shouldWriteBootCode = false;
        private boolean _enabledBootCode = true;
        public byte[] bootCode() {
            if (_shouldWriteBootCode)
                _writeBootCode();
            if (this.bootCode != null)
                return this.bootCode;
            if (!_enabledBootCode)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(bootCodeStart() * _root().sectorSize());
            this.bootCode = io.readBytes(bootCodeSize());
            io.seek(_pos);
            return this.bootCode;
        }
        public void setBootCode(byte[] _v) { _dirty = true; bootCode = _v; }
        public void setBootCode_Enabled(boolean _v) { _dirty = true; _enabledBootCode = _v; }

        private void _writeBootCode() {
            _shouldWriteBootCode = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(bootCodeStart() * _root().sectorSize());
            io.writeBytes(this.bootCode);
            io.seek(_pos);
        }
        private byte[] data;
        private boolean _shouldWriteData = false;
        private boolean _enabledData = true;
        public byte[] data() {
            if (_shouldWriteData)
                _writeData();
            if (this.data != null)
                return this.data;
            if (!_enabledData)
                return null;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dataStart() * _root().sectorSize());
            this.data = io.readBytes(dataSize() * _root().sectorSize());
            io.seek(_pos);
            return this.data;
        }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(dataStart() * _root().sectorSize());
            io.writeBytes(this.data);
            io.seek(_pos);
        }
        private byte[] partition;
        private boolean _shouldWritePartition = false;
        private boolean _enabledPartition = true;
        public byte[] partition() {
            if (_shouldWritePartition)
                _writePartition();
            if (this.partition != null)
                return this.partition;
            if (!_enabledPartition)
                return null;
            if ((partitionStatus() & 1) != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(partitionStart() * _root().sectorSize());
                this.partition = io.readBytes(partitionSize() * _root().sectorSize());
                io.seek(_pos);
            }
            return this.partition;
        }
        public void setPartition(byte[] _v) { _dirty = true; partition = _v; }
        public void setPartition_Enabled(boolean _v) { _dirty = true; _enabledPartition = _v; }

        private void _writePartition() {
            _shouldWritePartition = false;
            if ((partitionStatus() & 1) != 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek(partitionStart() * _root().sectorSize());
                io.writeBytes(this.partition);
                io.seek(_pos);
            }
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
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] reserved1() { return reserved1; }
        public void setReserved1(byte[] _v) { _dirty = true; reserved1 = _v; }
        public long numberOfPartitions() { return numberOfPartitions; }
        public void setNumberOfPartitions(long _v) { _dirty = true; numberOfPartitions = _v; }

        /**
         * First sector
         */
        public long partitionStart() { return partitionStart; }
        public void setPartitionStart(long _v) { _dirty = true; partitionStart = _v; }

        /**
         * Number of sectors
         */
        public long partitionSize() { return partitionSize; }
        public void setPartitionSize(long _v) { _dirty = true; partitionSize = _v; }
        public String partitionName() { return partitionName; }
        public void setPartitionName(String _v) { _dirty = true; partitionName = _v; }
        public String partitionType() { return partitionType; }
        public void setPartitionType(String _v) { _dirty = true; partitionType = _v; }

        /**
         * First sector
         */
        public long dataStart() { return dataStart; }
        public void setDataStart(long _v) { _dirty = true; dataStart = _v; }

        /**
         * Number of sectors
         */
        public long dataSize() { return dataSize; }
        public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
        public long partitionStatus() { return partitionStatus; }
        public void setPartitionStatus(long _v) { _dirty = true; partitionStatus = _v; }

        /**
         * First sector
         */
        public long bootCodeStart() { return bootCodeStart; }
        public void setBootCodeStart(long _v) { _dirty = true; bootCodeStart = _v; }

        /**
         * Number of bytes
         */
        public long bootCodeSize() { return bootCodeSize; }
        public void setBootCodeSize(long _v) { _dirty = true; bootCodeSize = _v; }

        /**
         * Address of bootloader code
         */
        public long bootLoaderAddress() { return bootLoaderAddress; }
        public void setBootLoaderAddress(long _v) { _dirty = true; bootLoaderAddress = _v; }
        public byte[] reserved2() { return reserved2; }
        public void setReserved2(byte[] _v) { _dirty = true; reserved2 = _v; }

        /**
         * Boot code entry point
         */
        public long bootCodeEntry() { return bootCodeEntry; }
        public void setBootCodeEntry(long _v) { _dirty = true; bootCodeEntry = _v; }
        public byte[] reserved3() { return reserved3; }
        public void setReserved3(byte[] _v) { _dirty = true; reserved3 = _v; }

        /**
         * Boot code checksum
         */
        public long bootCodeCksum() { return bootCodeCksum; }
        public void setBootCodeCksum(long _v) { _dirty = true; bootCodeCksum = _v; }
        public String processorType() { return processorType; }
        public void setProcessorType(String _v) { _dirty = true; processorType = _v; }
        public ApmPartitionTable _root() { return _root; }
        public void set_root(ApmPartitionTable _v) { _dirty = true; _root = _v; }
        public ApmPartitionTable _parent() { return _parent; }
        public void set_parent(ApmPartitionTable _v) { _dirty = true; _parent = _v; }
    }
    private List<PartitionEntry> partitionEntries;
    private boolean _shouldWritePartitionEntries = false;
    private boolean _enabledPartitionEntries = true;
    public List<PartitionEntry> partitionEntries() {
        if (_shouldWritePartitionEntries)
            _writePartitionEntries();
        if (this.partitionEntries != null)
            return this.partitionEntries;
        if (!_enabledPartitionEntries)
            return null;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this._raw_partitionEntries = new ArrayList<byte[]>();
        this.partitionEntries = new ArrayList<PartitionEntry>();
        for (int i = 0; i < _root().partitionLookup().numberOfPartitions(); i++) {
            this._raw_partitionEntries.add(io.readBytes(sectorSize()));
            KaitaiStream _io__raw_partitionEntries = new ByteBufferKaitaiStream(this._raw_partitionEntries.get(i));
            PartitionEntry _t_partitionEntries = new PartitionEntry(_io__raw_partitionEntries, this, _root);
            try {
                _t_partitionEntries._read();
            } finally {
                this.partitionEntries.add(_t_partitionEntries);
            }
        }
        io.seek(_pos);
        return this.partitionEntries;
    }
    public void setPartitionEntries(List<PartitionEntry> _v) { _dirty = true; partitionEntries = _v; }
    public void setPartitionEntries_Enabled(boolean _v) { _dirty = true; _enabledPartitionEntries = _v; }

    private void _writePartitionEntries() {
        _shouldWritePartitionEntries = false;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this._raw_partitionEntries = new ArrayList<byte[]>();
        for (int i = 0; i < this.partitionEntries.size(); i++) {
            final KaitaiStream _io__raw_partitionEntries = new ByteBufferKaitaiStream(sectorSize());
            io.addChildStream(_io__raw_partitionEntries);
            {
                long _pos2 = io.pos();
                io.seek(io.pos() + (sectorSize()));
                final ApmPartitionTable _this = this;
                final int _i = i;
                _io__raw_partitionEntries.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_partitionEntries.add(_io__raw_partitionEntries.toByteArray());
                        if (_this._raw_partitionEntries.get(((Number) (_i)).intValue()).length != sectorSize())
                            throw new ConsistencyError("raw(partition_entries)", sectorSize(), _this._raw_partitionEntries.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_partitionEntries.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.partitionEntries.get(((Number) (i)).intValue())._write_Seq(_io__raw_partitionEntries);
        }
        io.seek(_pos);
    }
    private PartitionEntry partitionLookup;
    private boolean _shouldWritePartitionLookup = false;
    private boolean _enabledPartitionLookup = true;

    /**
     * Every partition entry contains the number of partition entries.
     * We parse the first entry, to know how many to parse, including the first one.
     * No logic is given what to do if other entries have a different number.
     */
    public PartitionEntry partitionLookup() {
        if (_shouldWritePartitionLookup)
            _writePartitionLookup();
        if (this.partitionLookup != null)
            return this.partitionLookup;
        if (!_enabledPartitionLookup)
            return null;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        this._raw_partitionLookup = io.readBytes(sectorSize());
        KaitaiStream _io__raw_partitionLookup = new ByteBufferKaitaiStream(this._raw_partitionLookup);
        this.partitionLookup = new PartitionEntry(_io__raw_partitionLookup, this, _root);
        this.partitionLookup._read();
        io.seek(_pos);
        return this.partitionLookup;
    }
    public void setPartitionLookup(PartitionEntry _v) { _dirty = true; partitionLookup = _v; }
    public void setPartitionLookup_Enabled(boolean _v) { _dirty = true; _enabledPartitionLookup = _v; }

    private void _writePartitionLookup() {
        _shouldWritePartitionLookup = false;
        KaitaiStream io = _root()._io();
        long _pos = io.pos();
        io.seek(_root().sectorSize());
        final KaitaiStream _io__raw_partitionLookup = new ByteBufferKaitaiStream(sectorSize());
        io.addChildStream(_io__raw_partitionLookup);
        {
            long _pos2 = io.pos();
            io.seek(io.pos() + (sectorSize()));
            final ApmPartitionTable _this = this;
            _io__raw_partitionLookup.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_partitionLookup = _io__raw_partitionLookup.toByteArray();
                    if (_this._raw_partitionLookup.length != sectorSize())
                        throw new ConsistencyError("raw(partition_lookup)", sectorSize(), _this._raw_partitionLookup.length);
                    parent.writeBytes(_this._raw_partitionLookup);
                }
            });
        }
        this.partitionLookup._write_Seq(_io__raw_partitionLookup);
        io.seek(_pos);
    }
    private Integer sectorSize;

    /**
     * 0x200 (512) bytes for disks, 0x1000 (4096) bytes is not supported by APM
     * 0x800 (2048) bytes for CDROM
     */
    public Integer sectorSize() {
        if (this.sectorSize != null)
            return this.sectorSize;
        this.sectorSize = ((int) 512);
        return this.sectorSize;
    }
    public void _invalidateSectorSize() { this.sectorSize = null; }
    private ApmPartitionTable _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_partitionEntries;
    private byte[] _raw_partitionLookup;
    public ApmPartitionTable _root() { return _root; }
    public void set_root(ApmPartitionTable _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_partitionEntries() { return _raw_partitionEntries; }
    public void set_raw_PartitionEntries(List<byte[]> _v) { _dirty = true; _raw_partitionEntries = _v; }
    public byte[] _raw_partitionLookup() { return _raw_partitionLookup; }
    public void set_raw_PartitionLookup(byte[] _v) { _dirty = true; _raw_partitionLookup = _v; }
}
