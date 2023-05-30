// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


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
public class AmlogicEmmcPartitions extends KaitaiStruct {
    public static AmlogicEmmcPartitions fromFile(String fileName) throws IOException {
        return new AmlogicEmmcPartitions(new ByteBufferKaitaiStream(fileName));
    }

    public AmlogicEmmcPartitions(KaitaiStream _io) {
        this(_io, null, null);
    }

    public AmlogicEmmcPartitions(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public AmlogicEmmcPartitions(KaitaiStream _io, KaitaiStruct _parent, AmlogicEmmcPartitions _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { 77, 80, 84, 0 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 80, 84, 0 }, magic(), _io(), "/seq/0");
        }
        this.version = new String(KaitaiStream.bytesTerminate(this._io.readBytes(12), (byte) 0, false), Charset.forName("UTF-8"));
        this.numPartitions = this._io.readS4le();
        if (!(numPartitions() >= 1)) {
            throw new KaitaiStream.ValidationLessThanError(1, numPartitions(), _io(), "/seq/2");
        }
        if (!(numPartitions() <= 32)) {
            throw new KaitaiStream.ValidationGreaterThanError(32, numPartitions(), _io(), "/seq/2");
        }
        this.checksum = this._io.readU4le();
        this.partitions = new ArrayList<Partition>();
        for (int i = 0; i < numPartitions(); i++) {
            this.partitions.add(new Partition(this._io, this, _root));
        }
    }
    public static class Partition extends KaitaiStruct {
        public static Partition fromFile(String fileName) throws IOException {
            return new Partition(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(16), (byte) 0, false), Charset.forName("UTF-8"));
            this.size = this._io.readU8le();
            this.offset = this._io.readU8le();
            this._raw_flags = this._io.readBytes(4);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(_raw_flags);
            this.flags = new PartFlags(_io__raw_flags, this, _root);
            this.padding = this._io.readBytes(4);
        }
        public static class PartFlags extends KaitaiStruct {
            public static PartFlags fromFile(String fileName) throws IOException {
                return new PartFlags(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.isCode = this._io.readBitsIntLe(1) != 0;
                this.isCache = this._io.readBitsIntLe(1) != 0;
                this.isData = this._io.readBitsIntLe(1) != 0;
            }
            private boolean isCode;
            private boolean isCache;
            private boolean isData;
            private AmlogicEmmcPartitions _root;
            private AmlogicEmmcPartitions.Partition _parent;
            public boolean isCode() { return isCode; }
            public boolean isCache() { return isCache; }
            public boolean isData() { return isData; }
            public AmlogicEmmcPartitions _root() { return _root; }
            public AmlogicEmmcPartitions.Partition _parent() { return _parent; }
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
        public long size() { return size; }

        /**
         * The start of the partition relative to the start of the eMMC, in bytes
         */
        public long offset() { return offset; }
        public PartFlags flags() { return flags; }
        public byte[] padding() { return padding; }
        public AmlogicEmmcPartitions _root() { return _root; }
        public AmlogicEmmcPartitions _parent() { return _parent; }
        public byte[] _raw_flags() { return _raw_flags; }
    }
    private byte[] magic;
    private String version;
    private int numPartitions;
    private long checksum;
    private ArrayList<Partition> partitions;
    private AmlogicEmmcPartitions _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public String version() { return version; }
    public int numPartitions() { return numPartitions; }

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
    public ArrayList<Partition> partitions() { return partitions; }
    public AmlogicEmmcPartitions _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
