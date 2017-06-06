// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;

public class MbrPartitionTable extends KaitaiStruct {
    public static MbrPartitionTable fromFile(String fileName) throws IOException {
        return new MbrPartitionTable(new KaitaiStream(fileName));
    }

    public MbrPartitionTable(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public MbrPartitionTable(KaitaiStream _io, KaitaiStruct _parent, MbrPartitionTable _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.bootstrapCode = this._io.readBytes(446);
        partitions = new ArrayList<PartitionEntry>((int) (4));
        for (int i = 0; i < 4; i++) {
            this.partitions.add(new PartitionEntry(this._io, this, _root));
        }
        this.bootSignature = this._io.ensureFixedContents(new byte[] { 85, -86 });
    }
    public static class PartitionEntry extends KaitaiStruct {
        public static PartitionEntry fromFile(String fileName) throws IOException {
            return new PartitionEntry(new KaitaiStream(fileName));
        }

        public PartitionEntry(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public PartitionEntry(KaitaiStream _io, MbrPartitionTable _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public PartitionEntry(KaitaiStream _io, MbrPartitionTable _parent, MbrPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
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
    public static class Chs extends KaitaiStruct {
        public static Chs fromFile(String fileName) throws IOException {
            return new Chs(new KaitaiStream(fileName));
        }

        public Chs(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Chs(KaitaiStream _io, MbrPartitionTable.PartitionEntry _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Chs(KaitaiStream _io, MbrPartitionTable.PartitionEntry _parent, MbrPartitionTable _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.head = this._io.readU1();
            this.b2 = this._io.readU1();
            this.b3 = this._io.readU1();
        }
        private Integer sector;
        public Integer sector() {
            if (this.sector != null)
                return this.sector;
            int _tmp = (int) ((b2() & 63));
            this.sector = _tmp;
            return this.sector;
        }
        private Integer cylinder;
        public Integer cylinder() {
            if (this.cylinder != null)
                return this.cylinder;
            int _tmp = (int) ((b3() + ((b2() & 192) << 2)));
            this.cylinder = _tmp;
            return this.cylinder;
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
    private byte[] bootstrapCode;
    private ArrayList<PartitionEntry> partitions;
    private byte[] bootSignature;
    private MbrPartitionTable _root;
    private KaitaiStruct _parent;
    public byte[] bootstrapCode() { return bootstrapCode; }
    public ArrayList<PartitionEntry> partitions() { return partitions; }
    public byte[] bootSignature() { return bootSignature; }
    public MbrPartitionTable _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
