// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;


/**
 * You can get a dump for testing by the link: https://github.com/zhovner/mfdread/raw/master/dump.mfd
 * @see <a href="https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 * ">Source</a>
 */
public class MifareClassic extends KaitaiStruct {
    public static MifareClassic fromFile(String fileName) throws IOException {
        return new MifareClassic(new ByteBufferKaitaiStream(fileName));
    }

    public MifareClassic(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MifareClassic(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MifareClassic(KaitaiStream _io, KaitaiStruct _parent, MifareClassic _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_sectors = new ArrayList<byte[]>();
        this.sectors = new ArrayList<Sector>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this._raw_sectors.add(this._io.readBytes((((i >= 32 ? 4 : 1) * 4) * 16)));
                KaitaiStream _io__raw_sectors = new ByteBufferKaitaiStream(_raw_sectors.get(_raw_sectors.size() - 1));
                this.sectors.add(new Sector(_io__raw_sectors, this, _root, i == 0));
                i++;
            }
        }
    }
    public static class Key extends KaitaiStruct {
        public static Key fromFile(String fileName) throws IOException {
            return new Key(new ByteBufferKaitaiStream(fileName));
        }

        public Key(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Key(KaitaiStream _io, MifareClassic.Trailer _parent) {
            this(_io, _parent, null);
        }

        public Key(KaitaiStream _io, MifareClassic.Trailer _parent, MifareClassic _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.key = this._io.readBytes(6);
        }
        private byte[] key;
        private MifareClassic _root;
        private MifareClassic.Trailer _parent;
        public byte[] key() { return key; }
        public MifareClassic _root() { return _root; }
        public MifareClassic.Trailer _parent() { return _parent; }
    }
    public static class Sector extends KaitaiStruct {

        public Sector(KaitaiStream _io, boolean hasManufacturer) {
            this(_io, null, null, hasManufacturer);
        }

        public Sector(KaitaiStream _io, MifareClassic _parent, boolean hasManufacturer) {
            this(_io, _parent, null, hasManufacturer);
        }

        public Sector(KaitaiStream _io, MifareClassic _parent, MifareClassic _root, boolean hasManufacturer) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.hasManufacturer = hasManufacturer;
            _read();
        }
        private void _read() {
            if (hasManufacturer()) {
                this.manufacturer = new Manufacturer(this._io, this, _root);
            }
            this._raw_dataFiller = this._io.readBytes(((_io().size() - _io().pos()) - 16));
            KaitaiStream _io__raw_dataFiller = new ByteBufferKaitaiStream(_raw_dataFiller);
            this.dataFiller = new Filler(_io__raw_dataFiller, this, _root);
            this.trailer = new Trailer(this._io, this, _root);
        }
        public static class Values extends KaitaiStruct {
            public static Values fromFile(String fileName) throws IOException {
                return new Values(new ByteBufferKaitaiStream(fileName));
            }

            public Values(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Values(KaitaiStream _io, MifareClassic.Sector _parent) {
                this(_io, _parent, null);
            }

            public Values(KaitaiStream _io, MifareClassic.Sector _parent, MifareClassic _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.values = new ArrayList<ValueBlock>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        this.values.add(new ValueBlock(this._io, this, _root));
                        i++;
                    }
                }
            }
            public static class ValueBlock extends KaitaiStruct {
                public static ValueBlock fromFile(String fileName) throws IOException {
                    return new ValueBlock(new ByteBufferKaitaiStream(fileName));
                }

                public ValueBlock(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public ValueBlock(KaitaiStream _io, MifareClassic.Sector.Values _parent) {
                    this(_io, _parent, null);
                }

                public ValueBlock(KaitaiStream _io, MifareClassic.Sector.Values _parent, MifareClassic _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.valuez = new ArrayList<Long>();
                    for (int i = 0; i < 3; i++) {
                        this.valuez.add(this._io.readU4le());
                    }
                    this.addrz = new ArrayList<Integer>();
                    for (int i = 0; i < 4; i++) {
                        this.addrz.add(this._io.readU1());
                    }
                }
                private Integer addr;
                public Integer addr() {
                    if (this.addr != null)
                        return this.addr;
                    if (valid()) {
                        int _tmp = (int) (addrz().get((int) 0));
                        this.addr = _tmp;
                    }
                    return this.addr;
                }
                private Boolean addrValid;
                public Boolean addrValid() {
                    if (this.addrValid != null)
                        return this.addrValid;
                    boolean _tmp = (boolean) ( ((addrz().get((int) 0) == ~(addrz().get((int) 1))) && (addrz().get((int) 0) == addrz().get((int) 2)) && (addrz().get((int) 1) == addrz().get((int) 3))) );
                    this.addrValid = _tmp;
                    return this.addrValid;
                }
                private Boolean valid;
                public Boolean valid() {
                    if (this.valid != null)
                        return this.valid;
                    boolean _tmp = (boolean) ( ((valueValid()) && (addrValid())) );
                    this.valid = _tmp;
                    return this.valid;
                }
                private Boolean valueValid;
                public Boolean valueValid() {
                    if (this.valueValid != null)
                        return this.valueValid;
                    boolean _tmp = (boolean) ( ((valuez().get((int) 0) == ~(valuez().get((int) 1))) && (valuez().get((int) 0) == valuez().get((int) 2))) );
                    this.valueValid = _tmp;
                    return this.valueValid;
                }
                private Long value;
                public Long value() {
                    if (this.value != null)
                        return this.value;
                    if (valid()) {
                        long _tmp = (long) (valuez().get((int) 0));
                        this.value = _tmp;
                    }
                    return this.value;
                }
                private ArrayList<Long> valuez;
                private ArrayList<Integer> addrz;
                private MifareClassic _root;
                private MifareClassic.Sector.Values _parent;
                public ArrayList<Long> valuez() { return valuez; }
                public ArrayList<Integer> addrz() { return addrz; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Sector.Values _parent() { return _parent; }
            }
            private ArrayList<ValueBlock> values;
            private MifareClassic _root;
            private MifareClassic.Sector _parent;
            public ArrayList<ValueBlock> values() { return values; }
            public MifareClassic _root() { return _root; }
            public MifareClassic.Sector _parent() { return _parent; }
        }

        /**
         * only to create _io
         */
        public static class Filler extends KaitaiStruct {
            public static Filler fromFile(String fileName) throws IOException {
                return new Filler(new ByteBufferKaitaiStream(fileName));
            }

            public Filler(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Filler(KaitaiStream _io, MifareClassic.Sector _parent) {
                this(_io, _parent, null);
            }

            public Filler(KaitaiStream _io, MifareClassic.Sector _parent, MifareClassic _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.data = this._io.readBytes(_io().size());
            }
            private byte[] data;
            private MifareClassic _root;
            private MifareClassic.Sector _parent;
            public byte[] data() { return data; }
            public MifareClassic _root() { return _root; }
            public MifareClassic.Sector _parent() { return _parent; }
        }
        private Byte blockSize;
        public Byte blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            byte _tmp = (byte) (16);
            this.blockSize = _tmp;
            return this.blockSize;
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            this.data = dataFiller().data();
            return this.data;
        }
        private ArrayList<byte[]> blocks;
        public ArrayList<byte[]> blocks() {
            if (this.blocks != null)
                return this.blocks;
            KaitaiStream io = dataFiller()._io();
            long _pos = io.pos();
            io.seek(0);
            this.blocks = new ArrayList<byte[]>();
            {
                int i = 0;
                while (!io.isEof()) {
                    this.blocks.add(io.readBytes(blockSize()));
                    i++;
                }
            }
            io.seek(_pos);
            return this.blocks;
        }
        private Values values;
        public Values values() {
            if (this.values != null)
                return this.values;
            KaitaiStream io = dataFiller()._io();
            long _pos = io.pos();
            io.seek(0);
            this.values = new Values(io, this, _root);
            io.seek(_pos);
            return this.values;
        }
        private Manufacturer manufacturer;
        private Filler dataFiller;
        private Trailer trailer;
        private boolean hasManufacturer;
        private MifareClassic _root;
        private MifareClassic _parent;
        private byte[] _raw_dataFiller;
        public Manufacturer manufacturer() { return manufacturer; }
        public Filler dataFiller() { return dataFiller; }
        public Trailer trailer() { return trailer; }
        public boolean hasManufacturer() { return hasManufacturer; }
        public MifareClassic _root() { return _root; }
        public MifareClassic _parent() { return _parent; }
        public byte[] _raw_dataFiller() { return _raw_dataFiller; }
    }
    public static class Manufacturer extends KaitaiStruct {
        public static Manufacturer fromFile(String fileName) throws IOException {
            return new Manufacturer(new ByteBufferKaitaiStream(fileName));
        }

        public Manufacturer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Manufacturer(KaitaiStream _io, MifareClassic.Sector _parent) {
            this(_io, _parent, null);
        }

        public Manufacturer(KaitaiStream _io, MifareClassic.Sector _parent, MifareClassic _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.nuid = this._io.readU4le();
            this.bcc = this._io.readU1();
            this.sak = this._io.readU1();
            this.atqa = this._io.readU2le();
            this.manufacturer = this._io.readBytes(8);
        }
        private long nuid;
        private int bcc;
        private int sak;
        private int atqa;
        private byte[] manufacturer;
        private MifareClassic _root;
        private MifareClassic.Sector _parent;

        /**
         * beware for 7bytes UID it goes over next fields
         */
        public long nuid() { return nuid; }
        public int bcc() { return bcc; }
        public int sak() { return sak; }
        public int atqa() { return atqa; }

        /**
         * may contain manufacture date as BCD
         */
        public byte[] manufacturer() { return manufacturer; }
        public MifareClassic _root() { return _root; }
        public MifareClassic.Sector _parent() { return _parent; }
    }
    public static class Trailer extends KaitaiStruct {
        public static Trailer fromFile(String fileName) throws IOException {
            return new Trailer(new ByteBufferKaitaiStream(fileName));
        }

        public Trailer(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Trailer(KaitaiStream _io, MifareClassic.Sector _parent) {
            this(_io, _parent, null);
        }

        public Trailer(KaitaiStream _io, MifareClassic.Sector _parent, MifareClassic _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.keyA = new Key(this._io, this, _root);
            this._raw_accessBits = this._io.readBytes(3);
            KaitaiStream _io__raw_accessBits = new ByteBufferKaitaiStream(_raw_accessBits);
            this.accessBits = new AccessConditions(_io__raw_accessBits, this, _root);
            this.userByte = this._io.readU1();
            this.keyB = new Key(this._io, this, _root);
        }
        public static class AccessConditions extends KaitaiStruct {
            public static AccessConditions fromFile(String fileName) throws IOException {
                return new AccessConditions(new ByteBufferKaitaiStream(fileName));
            }

            public AccessConditions(KaitaiStream _io) {
                this(_io, null, null);
            }

            public AccessConditions(KaitaiStream _io, MifareClassic.Trailer _parent) {
                this(_io, _parent, null);
            }

            public AccessConditions(KaitaiStream _io, MifareClassic.Trailer _parent, MifareClassic _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.rawChunks = new ArrayList<Long>();
                for (int i = 0; i < _parent().acCountOfChunks(); i++) {
                    this.rawChunks.add(this._io.readBitsIntBe(4));
                }
            }
            public static class TrailerAc extends KaitaiStruct {

                public TrailerAc(KaitaiStream _io, Ac ac) {
                    this(_io, null, null, ac);
                }

                public TrailerAc(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, Ac ac) {
                    this(_io, _parent, null, ac);
                }

                public TrailerAc(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, MifareClassic _root, Ac ac) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.ac = ac;
                    _read();
                }
                private void _read() {
                }
                private Boolean canReadKeyB;

                /**
                 * key A is required
                 */
                public Boolean canReadKeyB() {
                    if (this.canReadKeyB != null)
                        return this.canReadKeyB;
                    boolean _tmp = (boolean) (ac().invShiftVal() <= 2);
                    this.canReadKeyB = _tmp;
                    return this.canReadKeyB;
                }
                private Boolean canWriteKeys;
                public Boolean canWriteKeys() {
                    if (this.canWriteKeys != null)
                        return this.canWriteKeys;
                    boolean _tmp = (boolean) ( ((KaitaiStream.mod((ac().invShiftVal() + 1), 3) != 0) && (ac().invShiftVal() < 6)) );
                    this.canWriteKeys = _tmp;
                    return this.canWriteKeys;
                }
                private Boolean canWriteAccessBits;
                public Boolean canWriteAccessBits() {
                    if (this.canWriteAccessBits != null)
                        return this.canWriteAccessBits;
                    boolean _tmp = (boolean) (ac().bits().get((int) 2).b());
                    this.canWriteAccessBits = _tmp;
                    return this.canWriteAccessBits;
                }
                private Boolean keyBControlsWrite;
                public Boolean keyBControlsWrite() {
                    if (this.keyBControlsWrite != null)
                        return this.keyBControlsWrite;
                    boolean _tmp = (boolean) (!(canReadKeyB()));
                    this.keyBControlsWrite = _tmp;
                    return this.keyBControlsWrite;
                }
                private Ac ac;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public Ac ac() { return ac; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
            }
            public static class ChunkBitRemap extends KaitaiStruct {

                public ChunkBitRemap(KaitaiStream _io, int bitNo) {
                    this(_io, null, null, bitNo);
                }

                public ChunkBitRemap(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, int bitNo) {
                    this(_io, _parent, null, bitNo);
                }

                public ChunkBitRemap(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, MifareClassic _root, int bitNo) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.bitNo = bitNo;
                    _read();
                }
                private void _read() {
                }
                private Integer shiftValue;
                public Integer shiftValue() {
                    if (this.shiftValue != null)
                        return this.shiftValue;
                    int _tmp = (int) ((bitNo() == 1 ? -1 : 1));
                    this.shiftValue = _tmp;
                    return this.shiftValue;
                }
                private Integer chunkNo;
                public Integer chunkNo() {
                    if (this.chunkNo != null)
                        return this.chunkNo;
                    int _tmp = (int) (KaitaiStream.mod(((invChunkNo() + shiftValue()) + _parent()._parent().acCountOfChunks()), _parent()._parent().acCountOfChunks()));
                    this.chunkNo = _tmp;
                    return this.chunkNo;
                }
                private Integer invChunkNo;
                public Integer invChunkNo() {
                    if (this.invChunkNo != null)
                        return this.invChunkNo;
                    int _tmp = (int) ((bitNo() + shiftValue()));
                    this.invChunkNo = _tmp;
                    return this.invChunkNo;
                }
                private int bitNo;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int bitNo() { return bitNo; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
            }
            public static class DataAc extends KaitaiStruct {

                public DataAc(KaitaiStream _io, Ac ac) {
                    this(_io, null, null, ac);
                }

                public DataAc(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, Ac ac) {
                    this(_io, _parent, null, ac);
                }

                public DataAc(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, MifareClassic _root, Ac ac) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.ac = ac;
                    _read();
                }
                private void _read() {
                }
                private Boolean readKeyARequired;
                public Boolean readKeyARequired() {
                    if (this.readKeyARequired != null)
                        return this.readKeyARequired;
                    boolean _tmp = (boolean) (ac().val() <= 4);
                    this.readKeyARequired = _tmp;
                    return this.readKeyARequired;
                }
                private Boolean writeKeyBRequired;
                public Boolean writeKeyBRequired() {
                    if (this.writeKeyBRequired != null)
                        return this.writeKeyBRequired;
                    boolean _tmp = (boolean) ( (( ((!(readKeyARequired())) || (readKeyBRequired())) ) && (!(ac().bits().get((int) 0).b()))) );
                    this.writeKeyBRequired = _tmp;
                    return this.writeKeyBRequired;
                }
                private Boolean writeKeyARequired;
                public Boolean writeKeyARequired() {
                    if (this.writeKeyARequired != null)
                        return this.writeKeyARequired;
                    boolean _tmp = (boolean) (ac().val() == 0);
                    this.writeKeyARequired = _tmp;
                    return this.writeKeyARequired;
                }
                private Boolean readKeyBRequired;
                public Boolean readKeyBRequired() {
                    if (this.readKeyBRequired != null)
                        return this.readKeyBRequired;
                    boolean _tmp = (boolean) (ac().val() <= 6);
                    this.readKeyBRequired = _tmp;
                    return this.readKeyBRequired;
                }
                private Boolean decrementAvailable;
                public Boolean decrementAvailable() {
                    if (this.decrementAvailable != null)
                        return this.decrementAvailable;
                    boolean _tmp = (boolean) ( (( ((ac().bits().get((int) 1).b()) || (!(ac().bits().get((int) 0).b()))) ) && (!(ac().bits().get((int) 2).b()))) );
                    this.decrementAvailable = _tmp;
                    return this.decrementAvailable;
                }
                private Boolean incrementAvailable;
                public Boolean incrementAvailable() {
                    if (this.incrementAvailable != null)
                        return this.incrementAvailable;
                    boolean _tmp = (boolean) ( (( ((!(ac().bits().get((int) 0).b())) && (!(readKeyARequired())) && (!(readKeyBRequired()))) ) || ( ((!(ac().bits().get((int) 0).b())) && (readKeyARequired()) && (readKeyBRequired())) )) );
                    this.incrementAvailable = _tmp;
                    return this.incrementAvailable;
                }
                private Ac ac;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public Ac ac() { return ac; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
            }
            public static class Ac extends KaitaiStruct {

                public Ac(KaitaiStream _io, int index) {
                    this(_io, null, null, index);
                }

                public Ac(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, int index) {
                    this(_io, _parent, null, index);
                }

                public Ac(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, MifareClassic _root, int index) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.index = index;
                    _read();
                }
                private void _read() {
                }
                public static class AcBit extends KaitaiStruct {

                    public AcBit(KaitaiStream _io, int i, int chunk) {
                        this(_io, null, null, i, chunk);
                    }

                    public AcBit(KaitaiStream _io, MifareClassic.Trailer.AccessConditions.Ac _parent, int i, int chunk) {
                        this(_io, _parent, null, i, chunk);
                    }

                    public AcBit(KaitaiStream _io, MifareClassic.Trailer.AccessConditions.Ac _parent, MifareClassic _root, int i, int chunk) {
                        super(_io);
                        this._parent = _parent;
                        this._root = _root;
                        this.i = i;
                        this.chunk = chunk;
                        _read();
                    }
                    private void _read() {
                    }
                    private Integer n;
                    public Integer n() {
                        if (this.n != null)
                            return this.n;
                        int _tmp = (int) (((chunk() >> i()) & 1));
                        this.n = _tmp;
                        return this.n;
                    }
                    private Boolean b;
                    public Boolean b() {
                        if (this.b != null)
                            return this.b;
                        boolean _tmp = (boolean) (n() == 1);
                        this.b = _tmp;
                        return this.b;
                    }
                    private int i;
                    private int chunk;
                    private MifareClassic _root;
                    private MifareClassic.Trailer.AccessConditions.Ac _parent;
                    public int i() { return i; }
                    public int chunk() { return chunk; }
                    public MifareClassic _root() { return _root; }
                    public MifareClassic.Trailer.AccessConditions.Ac _parent() { return _parent; }
                }
                private ArrayList<AcBit> bits;
                public ArrayList<AcBit> bits() {
                    if (this.bits != null)
                        return this.bits;
                    long _pos = this._io.pos();
                    this._io.seek(0);
                    this.bits = new ArrayList<AcBit>();
                    for (int i = 0; i < _parent()._parent().acBits(); i++) {
                        this.bits.add(new AcBit(this._io, this, _root, index(), _parent().chunks().get((int) i).chunk()));
                    }
                    this._io.seek(_pos);
                    return this.bits;
                }
                private Integer val;

                /**
                 * c3 c2 c1
                 */
                public Integer val() {
                    if (this.val != null)
                        return this.val;
                    int _tmp = (int) ((((bits().get((int) 2).n() << 2) | (bits().get((int) 1).n() << 1)) | bits().get((int) 0).n()));
                    this.val = _tmp;
                    return this.val;
                }
                private Integer invShiftVal;
                public Integer invShiftVal() {
                    if (this.invShiftVal != null)
                        return this.invShiftVal;
                    int _tmp = (int) ((((bits().get((int) 0).n() << 2) | (bits().get((int) 1).n() << 1)) | bits().get((int) 2).n()));
                    this.invShiftVal = _tmp;
                    return this.invShiftVal;
                }
                private int index;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int index() { return index; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
            }
            public static class ValidChunk extends KaitaiStruct {

                public ValidChunk(KaitaiStream _io, int invChunk, int chunk) {
                    this(_io, null, null, invChunk, chunk);
                }

                public ValidChunk(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, int invChunk, int chunk) {
                    this(_io, _parent, null, invChunk, chunk);
                }

                public ValidChunk(KaitaiStream _io, MifareClassic.Trailer.AccessConditions _parent, MifareClassic _root, int invChunk, int chunk) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    this.invChunk = invChunk;
                    this.chunk = chunk;
                    _read();
                }
                private void _read() {
                }
                private Boolean valid;
                public Boolean valid() {
                    if (this.valid != null)
                        return this.valid;
                    boolean _tmp = (boolean) ((invChunk() ^ chunk()) == 15);
                    this.valid = _tmp;
                    return this.valid;
                }
                private int invChunk;
                private int chunk;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int invChunk() { return invChunk; }

                /**
                 * c3 c2 c1 c0
                 */
                public int chunk() { return chunk; }
                public MifareClassic _root() { return _root; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
            }
            private ArrayList<DataAc> dataAcs;
            public ArrayList<DataAc> dataAcs() {
                if (this.dataAcs != null)
                    return this.dataAcs;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.dataAcs = new ArrayList<DataAc>();
                for (int i = 0; i < (_parent().acsInSector() - 1); i++) {
                    this.dataAcs.add(new DataAc(this._io, this, _root, acsRaw().get((int) i)));
                }
                this._io.seek(_pos);
                return this.dataAcs;
            }
            private ArrayList<ChunkBitRemap> remaps;
            public ArrayList<ChunkBitRemap> remaps() {
                if (this.remaps != null)
                    return this.remaps;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.remaps = new ArrayList<ChunkBitRemap>();
                for (int i = 0; i < _parent().acBits(); i++) {
                    this.remaps.add(new ChunkBitRemap(this._io, this, _root, i));
                }
                this._io.seek(_pos);
                return this.remaps;
            }
            private ArrayList<Ac> acsRaw;
            public ArrayList<Ac> acsRaw() {
                if (this.acsRaw != null)
                    return this.acsRaw;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.acsRaw = new ArrayList<Ac>();
                for (int i = 0; i < _parent().acsInSector(); i++) {
                    this.acsRaw.add(new Ac(this._io, this, _root, i));
                }
                this._io.seek(_pos);
                return this.acsRaw;
            }
            private TrailerAc trailerAc;
            public TrailerAc trailerAc() {
                if (this.trailerAc != null)
                    return this.trailerAc;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.trailerAc = new TrailerAc(this._io, this, _root, acsRaw().get((int) (_parent().acsInSector() - 1)));
                this._io.seek(_pos);
                return this.trailerAc;
            }
            private ArrayList<ValidChunk> chunks;
            public ArrayList<ValidChunk> chunks() {
                if (this.chunks != null)
                    return this.chunks;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.chunks = new ArrayList<ValidChunk>();
                for (int i = 0; i < _parent().acBits(); i++) {
                    this.chunks.add(new ValidChunk(this._io, this, _root, rawChunks().get((int) remaps().get((int) i).invChunkNo()), rawChunks().get((int) remaps().get((int) i).chunkNo())));
                }
                this._io.seek(_pos);
                return this.chunks;
            }
            private ArrayList<Long> rawChunks;
            private MifareClassic _root;
            private MifareClassic.Trailer _parent;
            public ArrayList<Long> rawChunks() { return rawChunks; }
            public MifareClassic _root() { return _root; }
            public MifareClassic.Trailer _parent() { return _parent; }
        }
        private Byte acBits;
        public Byte acBits() {
            if (this.acBits != null)
                return this.acBits;
            byte _tmp = (byte) (3);
            this.acBits = _tmp;
            return this.acBits;
        }
        private Byte acsInSector;
        public Byte acsInSector() {
            if (this.acsInSector != null)
                return this.acsInSector;
            byte _tmp = (byte) (4);
            this.acsInSector = _tmp;
            return this.acsInSector;
        }
        private Integer acCountOfChunks;
        public Integer acCountOfChunks() {
            if (this.acCountOfChunks != null)
                return this.acCountOfChunks;
            int _tmp = (int) ((acBits() * 2));
            this.acCountOfChunks = _tmp;
            return this.acCountOfChunks;
        }
        private Key keyA;
        private AccessConditions accessBits;
        private int userByte;
        private Key keyB;
        private MifareClassic _root;
        private MifareClassic.Sector _parent;
        private byte[] _raw_accessBits;
        public Key keyA() { return keyA; }
        public AccessConditions accessBits() { return accessBits; }
        public int userByte() { return userByte; }
        public Key keyB() { return keyB; }
        public MifareClassic _root() { return _root; }
        public MifareClassic.Sector _parent() { return _parent; }
        public byte[] _raw_accessBits() { return _raw_accessBits; }
    }
    private ArrayList<Sector> sectors;
    private MifareClassic _root;
    private KaitaiStruct _parent;
    private ArrayList<byte[]> _raw_sectors;
    public ArrayList<Sector> sectors() { return sectors; }
    public MifareClassic _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public ArrayList<byte[]> _raw_sectors() { return _raw_sectors; }
}
