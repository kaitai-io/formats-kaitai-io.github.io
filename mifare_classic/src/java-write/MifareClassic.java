// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;


/**
 * You can get a dump for testing from this link:
 * <https://github.com/zhovner/mfdread/raw/master/dump.mfd>
 * @see <a href="https://github.com/nfc-tools/libnfc
 * https://www.nxp.com/docs/en/data-sheet/MF1S70YYX_V1.pdf
 * ">Source</a>
 */
public class MifareClassic extends KaitaiStruct.ReadWrite {
    public static MifareClassic fromFile(String fileName) throws IOException {
        return new MifareClassic(new ByteBufferKaitaiStream(fileName));
    }
    public MifareClassic() {
        this(null, null, null);
    }

    public MifareClassic(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MifareClassic(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MifareClassic(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MifareClassic _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_sectors = new ArrayList<byte[]>();
        this.sectors = new ArrayList<Sector>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this._raw_sectors.add(this._io.readBytes(((i >= 32 ? 4 : 1) * 4) * 16));
                KaitaiStream _io__raw_sectors = new ByteBufferKaitaiStream(this._raw_sectors.get(this._raw_sectors.size() - 1));
                Sector _t_sectors = new Sector(_io__raw_sectors, this, _root, i == 0);
                try {
                    _t_sectors._read();
                } finally {
                    this.sectors.add(_t_sectors);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.sectors.size(); i++) {
            this.sectors.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this._raw_sectors = new ArrayList<byte[]>();
        for (int i = 0; i < this.sectors.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("sectors", 0, this._io.size() - this._io.pos());
            final KaitaiStream _io__raw_sectors = new ByteBufferKaitaiStream(((i >= 32 ? 4 : 1) * 4) * 16);
            this._io.addChildStream(_io__raw_sectors);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (((i >= 32 ? 4 : 1) * 4) * 16));
                final MifareClassic _this = this;
                final int _i = i;
                _io__raw_sectors.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_sectors.add(_io__raw_sectors.toByteArray());
                        if (_this._raw_sectors.get(((Number) (_i)).intValue()).length != ((_i >= 32 ? 4 : 1) * 4) * 16)
                            throw new ConsistencyError("raw(sectors)", ((_i >= 32 ? 4 : 1) * 4) * 16, _this._raw_sectors.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_sectors.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.sectors.get(((Number) (i)).intValue())._write_Seq(_io__raw_sectors);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("sectors", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.sectors.size(); i++) {
            if (!Objects.equals(this.sectors.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sectors", _root(), this.sectors.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.sectors.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sectors", this, this.sectors.get(((Number) (i)).intValue())._parent());
            if (this.sectors.get(((Number) (i)).intValue()).hasManufacturer() != (i == 0))
                throw new ConsistencyError("sectors", i == 0, this.sectors.get(((Number) (i)).intValue()).hasManufacturer());
        }
        _dirty = false;
    }
    public static class Key extends KaitaiStruct.ReadWrite {
        public static Key fromFile(String fileName) throws IOException {
            return new Key(new ByteBufferKaitaiStream(fileName));
        }
        public Key() {
            this(null, null, null);
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
        }
        public void _read() {
            this.key = this._io.readBytes(6);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.key);
        }

        public void _check() {
            if (this.key.length != 6)
                throw new ConsistencyError("key", 6, this.key.length);
            _dirty = false;
        }
        private byte[] key;
        private MifareClassic _root;
        private MifareClassic.Trailer _parent;
        public byte[] key() { return key; }
        public void setKey(byte[] _v) { _dirty = true; key = _v; }
        public MifareClassic _root() { return _root; }
        public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
        public MifareClassic.Trailer _parent() { return _parent; }
        public void set_parent(MifareClassic.Trailer _v) { _dirty = true; _parent = _v; }
    }
    public static class Manufacturer extends KaitaiStruct.ReadWrite {
        public static Manufacturer fromFile(String fileName) throws IOException {
            return new Manufacturer(new ByteBufferKaitaiStream(fileName));
        }
        public Manufacturer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.nuid = this._io.readU4le();
            this.bcc = this._io.readU1();
            this.sak = this._io.readU1();
            this.atqa = this._io.readU2le();
            this.manufacturer = this._io.readBytes(8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.nuid);
            this._io.writeU1(this.bcc);
            this._io.writeU1(this.sak);
            this._io.writeU2le(this.atqa);
            this._io.writeBytes(this.manufacturer);
        }

        public void _check() {
            if (this.manufacturer.length != 8)
                throw new ConsistencyError("manufacturer", 8, this.manufacturer.length);
            _dirty = false;
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
        public void setNuid(long _v) { _dirty = true; nuid = _v; }
        public int bcc() { return bcc; }
        public void setBcc(int _v) { _dirty = true; bcc = _v; }
        public int sak() { return sak; }
        public void setSak(int _v) { _dirty = true; sak = _v; }
        public int atqa() { return atqa; }
        public void setAtqa(int _v) { _dirty = true; atqa = _v; }

        /**
         * may contain manufacture date as BCD
         */
        public byte[] manufacturer() { return manufacturer; }
        public void setManufacturer(byte[] _v) { _dirty = true; manufacturer = _v; }
        public MifareClassic _root() { return _root; }
        public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
        public MifareClassic.Sector _parent() { return _parent; }
        public void set_parent(MifareClassic.Sector _v) { _dirty = true; _parent = _v; }
    }
    public static class Sector extends KaitaiStruct.ReadWrite {
        public Sector(boolean hasManufacturer) {
            this(null, null, null, hasManufacturer);
        }

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
        }
        public void _read() {
            if (hasManufacturer()) {
                this.manufacturer = new Manufacturer(this._io, this, _root);
                this.manufacturer._read();
            }
            this._raw_dataFiller = this._io.readBytes((_io().size() - _io().pos()) - 16);
            KaitaiStream _io__raw_dataFiller = new ByteBufferKaitaiStream(this._raw_dataFiller);
            this.dataFiller = new Filler(_io__raw_dataFiller, this, _root);
            this.dataFiller._read();
            this.trailer = new Trailer(this._io, this, _root);
            this.trailer._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (hasManufacturer()) {
                this.manufacturer._fetchInstances();
            }
            this.dataFiller._fetchInstances();
            this.trailer._fetchInstances();
            blocks();
            if (this.blocks != null) {
                for (int i = 0; i < this.blocks.size(); i++) {
                }
            }
            values();
            if (this.values != null) {
                this.values._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBlocks = _enabledBlocks;
            _shouldWriteValues = _enabledValues;
            if (hasManufacturer()) {
                this.manufacturer._write_Seq(this._io);
            }
            final KaitaiStream _io__raw_dataFiller = new ByteBufferKaitaiStream((_io().size() - _io().pos()) - 16);
            this._io.addChildStream(_io__raw_dataFiller);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + ((_io().size() - _io().pos()) - 16));
                final Sector _this = this;
                _io__raw_dataFiller.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_dataFiller = _io__raw_dataFiller.toByteArray();
                        if (_this._raw_dataFiller.length != (_io().size() - _io().pos()) - 16)
                            throw new ConsistencyError("raw(data_filler)", (_io().size() - _io().pos()) - 16, _this._raw_dataFiller.length);
                        parent.writeBytes(_this._raw_dataFiller);
                    }
                });
            }
            this.dataFiller._write_Seq(_io__raw_dataFiller);
            this.trailer._write_Seq(this._io);
        }

        public void _check() {
            if (hasManufacturer()) {
                if (!Objects.equals(this.manufacturer._root(), _root()))
                    throw new ConsistencyError("manufacturer", _root(), this.manufacturer._root());
                if (!Objects.equals(this.manufacturer._parent(), this))
                    throw new ConsistencyError("manufacturer", this, this.manufacturer._parent());
            }
            if (!Objects.equals(this.dataFiller._root(), _root()))
                throw new ConsistencyError("data_filler", _root(), this.dataFiller._root());
            if (!Objects.equals(this.dataFiller._parent(), this))
                throw new ConsistencyError("data_filler", this, this.dataFiller._parent());
            if (!Objects.equals(this.trailer._root(), _root()))
                throw new ConsistencyError("trailer", _root(), this.trailer._root());
            if (!Objects.equals(this.trailer._parent(), this))
                throw new ConsistencyError("trailer", this, this.trailer._parent());
            if (_enabledBlocks) {
                for (int i = 0; i < this.blocks.size(); i++) {
                    if (this.blocks.get(((Number) (i)).intValue()).length != blockSize())
                        throw new ConsistencyError("blocks", blockSize(), this.blocks.get(((Number) (i)).intValue()).length);
                }
            }
            if (_enabledValues) {
                if (!Objects.equals(this.values._root(), _root()))
                    throw new ConsistencyError("values", _root(), this.values._root());
                if (!Objects.equals(this.values._parent(), this))
                    throw new ConsistencyError("values", this, this.values._parent());
            }
            _dirty = false;
        }

        /**
         * only to create _io
         */
        public static class Filler extends KaitaiStruct.ReadWrite {
            public static Filler fromFile(String fileName) throws IOException {
                return new Filler(new ByteBufferKaitaiStream(fileName));
            }
            public Filler() {
                this(null, null, null);
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
            }
            public void _read() {
                this.data = this._io.readBytes(_io().size());
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                if (this.data.length != _io().size())
                    throw new ConsistencyError("data", _io().size(), this.data.length);
                this._io.writeBytes(this.data);
            }

            public void _check() {
                _dirty = false;
            }
            private byte[] data;
            private MifareClassic _root;
            private MifareClassic.Sector _parent;
            public byte[] data() { return data; }
            public void setData(byte[] _v) { _dirty = true; data = _v; }
            public MifareClassic _root() { return _root; }
            public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
            public MifareClassic.Sector _parent() { return _parent; }
            public void set_parent(MifareClassic.Sector _v) { _dirty = true; _parent = _v; }
        }
        public static class Values extends KaitaiStruct.ReadWrite {
            public static Values fromFile(String fileName) throws IOException {
                return new Values(new ByteBufferKaitaiStream(fileName));
            }
            public Values() {
                this(null, null, null);
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
            }
            public void _read() {
                this.values = new ArrayList<ValueBlock>();
                {
                    int i = 0;
                    while (!this._io.isEof()) {
                        ValueBlock _t_values = new ValueBlock(this._io, this, _root);
                        try {
                            _t_values._read();
                        } finally {
                            this.values.add(_t_values);
                        }
                        i++;
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.values.size(); i++) {
                    this.values.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                for (int i = 0; i < this.values.size(); i++) {
                    if (this._io.isEof())
                        throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
                    this.values.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                if (!(this._io.isEof()))
                    throw new ConsistencyError("values", 0, this._io.size() - this._io.pos());
            }

            public void _check() {
                for (int i = 0; i < this.values.size(); i++) {
                    if (!Objects.equals(this.values.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("values", _root(), this.values.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.values.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("values", this, this.values.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class ValueBlock extends KaitaiStruct.ReadWrite {
                public static ValueBlock fromFile(String fileName) throws IOException {
                    return new ValueBlock(new ByteBufferKaitaiStream(fileName));
                }
                public ValueBlock() {
                    this(null, null, null);
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
                }
                public void _read() {
                    this.valuez = new ArrayList<Long>();
                    for (int i = 0; i < 3; i++) {
                        this.valuez.add(this._io.readU4le());
                    }
                    this.addrz = new ArrayList<Integer>();
                    for (int i = 0; i < 4; i++) {
                        this.addrz.add(this._io.readU1());
                    }
                    _dirty = false;
                }

                public void _fetchInstances() {
                    for (int i = 0; i < this.valuez.size(); i++) {
                    }
                    for (int i = 0; i < this.addrz.size(); i++) {
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    for (int i = 0; i < this.valuez.size(); i++) {
                        this._io.writeU4le(this.valuez.get(((Number) (i)).intValue()));
                    }
                    for (int i = 0; i < this.addrz.size(); i++) {
                        this._io.writeU1(this.addrz.get(((Number) (i)).intValue()));
                    }
                }

                public void _check() {
                    if (this.valuez.size() != 3)
                        throw new ConsistencyError("valuez", 3, this.valuez.size());
                    for (int i = 0; i < this.valuez.size(); i++) {
                    }
                    if (this.addrz.size() != 4)
                        throw new ConsistencyError("addrz", 4, this.addrz.size());
                    for (int i = 0; i < this.addrz.size(); i++) {
                    }
                    _dirty = false;
                }
                private Integer addr;
                public Integer addr() {
                    if (this.addr != null)
                        return this.addr;
                    if (valid()) {
                        this.addr = ((Number) (addrz().get(((int) 0)))).intValue();
                    }
                    return this.addr;
                }
                public void _invalidateAddr() { this.addr = null; }
                private Boolean addrValid;
                public Boolean addrValid() {
                    if (this.addrValid != null)
                        return this.addrValid;
                    this.addrValid =  ((addrz().get(((int) 0)) == ~(addrz().get(((int) 1)))) && (addrz().get(((int) 0)) == addrz().get(((int) 2))) && (addrz().get(((int) 1)) == addrz().get(((int) 3)))) ;
                    return this.addrValid;
                }
                public void _invalidateAddrValid() { this.addrValid = null; }
                private Boolean valid;
                public Boolean valid() {
                    if (this.valid != null)
                        return this.valid;
                    this.valid =  ((valueValid()) && (addrValid())) ;
                    return this.valid;
                }
                public void _invalidateValid() { this.valid = null; }
                private Long value;
                public Long value() {
                    if (this.value != null)
                        return this.value;
                    if (valid()) {
                        this.value = ((Number) (valuez().get(((int) 0)))).longValue();
                    }
                    return this.value;
                }
                public void _invalidateValue() { this.value = null; }
                private Boolean valueValid;
                public Boolean valueValid() {
                    if (this.valueValid != null)
                        return this.valueValid;
                    this.valueValid =  ((valuez().get(((int) 0)) == ~(valuez().get(((int) 1)))) && (valuez().get(((int) 0)) == valuez().get(((int) 2)))) ;
                    return this.valueValid;
                }
                public void _invalidateValueValid() { this.valueValid = null; }
                private List<Long> valuez;
                private List<Integer> addrz;
                private MifareClassic _root;
                private MifareClassic.Sector.Values _parent;
                public List<Long> valuez() { return valuez; }
                public void setValuez(List<Long> _v) { _dirty = true; valuez = _v; }
                public List<Integer> addrz() { return addrz; }
                public void setAddrz(List<Integer> _v) { _dirty = true; addrz = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Sector.Values _parent() { return _parent; }
                public void set_parent(MifareClassic.Sector.Values _v) { _dirty = true; _parent = _v; }
            }
            private List<ValueBlock> values;
            private MifareClassic _root;
            private MifareClassic.Sector _parent;
            public List<ValueBlock> values() { return values; }
            public void setValues(List<ValueBlock> _v) { _dirty = true; values = _v; }
            public MifareClassic _root() { return _root; }
            public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
            public MifareClassic.Sector _parent() { return _parent; }
            public void set_parent(MifareClassic.Sector _v) { _dirty = true; _parent = _v; }
        }
        private Byte blockSize;
        public Byte blockSize() {
            if (this.blockSize != null)
                return this.blockSize;
            this.blockSize = ((byte) 16);
            return this.blockSize;
        }
        public void _invalidateBlockSize() { this.blockSize = null; }
        private List<byte[]> blocks;
        private boolean _shouldWriteBlocks = false;
        private boolean _enabledBlocks = true;
        public List<byte[]> blocks() {
            if (_shouldWriteBlocks)
                _writeBlocks();
            if (this.blocks != null)
                return this.blocks;
            if (!_enabledBlocks)
                return null;
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
        public void setBlocks(List<byte[]> _v) { _dirty = true; blocks = _v; }
        public void setBlocks_Enabled(boolean _v) { _dirty = true; _enabledBlocks = _v; }

        private void _writeBlocks() {
            _shouldWriteBlocks = false;
            KaitaiStream io = dataFiller()._io();
            long _pos = io.pos();
            io.seek(0);
            for (int i = 0; i < this.blocks.size(); i++) {
                if (io.isEof())
                    throw new ConsistencyError("blocks", 0, io.size() - io.pos());
                io.writeBytes(this.blocks.get(((Number) (i)).intValue()));
            }
            if (!(io.isEof()))
                throw new ConsistencyError("blocks", 0, io.size() - io.pos());
            io.seek(_pos);
        }
        private byte[] data;
        public byte[] data() {
            if (this.data != null)
                return this.data;
            this.data = dataFiller().data();
            return this.data;
        }
        public void _invalidateData() { this.data = null; }
        private Values values;
        private boolean _shouldWriteValues = false;
        private boolean _enabledValues = true;
        public Values values() {
            if (_shouldWriteValues)
                _writeValues();
            if (this.values != null)
                return this.values;
            if (!_enabledValues)
                return null;
            KaitaiStream io = dataFiller()._io();
            long _pos = io.pos();
            io.seek(0);
            this.values = new Values(io, this, _root);
            this.values._read();
            io.seek(_pos);
            return this.values;
        }
        public void setValues(Values _v) { _dirty = true; values = _v; }
        public void setValues_Enabled(boolean _v) { _dirty = true; _enabledValues = _v; }

        private void _writeValues() {
            _shouldWriteValues = false;
            KaitaiStream io = dataFiller()._io();
            long _pos = io.pos();
            io.seek(0);
            this.values._write_Seq(io);
            io.seek(_pos);
        }
        private Manufacturer manufacturer;
        private Filler dataFiller;
        private Trailer trailer;
        private boolean hasManufacturer;
        private MifareClassic _root;
        private MifareClassic _parent;
        private byte[] _raw_dataFiller;
        public Manufacturer manufacturer() { return manufacturer; }
        public void setManufacturer(Manufacturer _v) { _dirty = true; manufacturer = _v; }
        public Filler dataFiller() { return dataFiller; }
        public void setDataFiller(Filler _v) { _dirty = true; dataFiller = _v; }
        public Trailer trailer() { return trailer; }
        public void setTrailer(Trailer _v) { _dirty = true; trailer = _v; }
        public boolean hasManufacturer() { return hasManufacturer; }
        public void setHasManufacturer(boolean _v) { _dirty = true; hasManufacturer = _v; }
        public MifareClassic _root() { return _root; }
        public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
        public MifareClassic _parent() { return _parent; }
        public void set_parent(MifareClassic _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_dataFiller() { return _raw_dataFiller; }
        public void set_raw_DataFiller(byte[] _v) { _dirty = true; _raw_dataFiller = _v; }
    }
    public static class Trailer extends KaitaiStruct.ReadWrite {
        public static Trailer fromFile(String fileName) throws IOException {
            return new Trailer(new ByteBufferKaitaiStream(fileName));
        }
        public Trailer() {
            this(null, null, null);
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
        }
        public void _read() {
            this.keyA = new Key(this._io, this, _root);
            this.keyA._read();
            this._raw_accessBits = this._io.readBytes(3);
            KaitaiStream _io__raw_accessBits = new ByteBufferKaitaiStream(this._raw_accessBits);
            this.accessBits = new AccessConditions(_io__raw_accessBits, this, _root);
            this.accessBits._read();
            this.userByte = this._io.readU1();
            this.keyB = new Key(this._io, this, _root);
            this.keyB._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.keyA._fetchInstances();
            this.accessBits._fetchInstances();
            this.keyB._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.keyA._write_Seq(this._io);
            final KaitaiStream _io__raw_accessBits = new ByteBufferKaitaiStream(3);
            this._io.addChildStream(_io__raw_accessBits);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (3));
                final Trailer _this = this;
                _io__raw_accessBits.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_accessBits = _io__raw_accessBits.toByteArray();
                        if (_this._raw_accessBits.length != 3)
                            throw new ConsistencyError("raw(access_bits)", 3, _this._raw_accessBits.length);
                        parent.writeBytes(_this._raw_accessBits);
                    }
                });
            }
            this.accessBits._write_Seq(_io__raw_accessBits);
            this._io.writeU1(this.userByte);
            this.keyB._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.keyA._root(), _root()))
                throw new ConsistencyError("key_a", _root(), this.keyA._root());
            if (!Objects.equals(this.keyA._parent(), this))
                throw new ConsistencyError("key_a", this, this.keyA._parent());
            if (!Objects.equals(this.accessBits._root(), _root()))
                throw new ConsistencyError("access_bits", _root(), this.accessBits._root());
            if (!Objects.equals(this.accessBits._parent(), this))
                throw new ConsistencyError("access_bits", this, this.accessBits._parent());
            if (!Objects.equals(this.keyB._root(), _root()))
                throw new ConsistencyError("key_b", _root(), this.keyB._root());
            if (!Objects.equals(this.keyB._parent(), this))
                throw new ConsistencyError("key_b", this, this.keyB._parent());
            _dirty = false;
        }
        public static class AccessConditions extends KaitaiStruct.ReadWrite {
            public static AccessConditions fromFile(String fileName) throws IOException {
                return new AccessConditions(new ByteBufferKaitaiStream(fileName));
            }
            public AccessConditions() {
                this(null, null, null);
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
            }
            public void _read() {
                this.rawChunks = new ArrayList<Long>();
                for (int i = 0; i < _parent().acCountOfChunks(); i++) {
                    this.rawChunks.add(this._io.readBitsIntBe(4));
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.rawChunks.size(); i++) {
                }
                acsRaw();
                if (this.acsRaw != null) {
                    for (int i = 0; i < this.acsRaw.size(); i++) {
                        this.acsRaw.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }
                chunks();
                if (this.chunks != null) {
                    for (int i = 0; i < this.chunks.size(); i++) {
                        this.chunks.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }
                dataAcs();
                if (this.dataAcs != null) {
                    for (int i = 0; i < this.dataAcs.size(); i++) {
                        this.dataAcs.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }
                remaps();
                if (this.remaps != null) {
                    for (int i = 0; i < this.remaps.size(); i++) {
                        this.remaps.get(((Number) (i)).intValue())._fetchInstances();
                    }
                }
                trailerAc();
                if (this.trailerAc != null) {
                    this.trailerAc._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteAcsRaw = _enabledAcsRaw;
                _shouldWriteChunks = _enabledChunks;
                _shouldWriteDataAcs = _enabledDataAcs;
                _shouldWriteRemaps = _enabledRemaps;
                _shouldWriteTrailerAc = _enabledTrailerAc;
                for (int i = 0; i < this.rawChunks.size(); i++) {
                    this._io.writeBitsIntBe(4, this.rawChunks.get(((Number) (i)).intValue()));
                }
            }

            public void _check() {
                if (this.rawChunks.size() != _parent().acCountOfChunks())
                    throw new ConsistencyError("raw_chunks", _parent().acCountOfChunks(), this.rawChunks.size());
                for (int i = 0; i < this.rawChunks.size(); i++) {
                }
                if (_enabledAcsRaw) {
                    if (this.acsRaw.size() != _parent().acsInSector())
                        throw new ConsistencyError("acs_raw", _parent().acsInSector(), this.acsRaw.size());
                    for (int i = 0; i < this.acsRaw.size(); i++) {
                        if (!Objects.equals(this.acsRaw.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("acs_raw", _root(), this.acsRaw.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.acsRaw.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("acs_raw", this, this.acsRaw.get(((Number) (i)).intValue())._parent());
                        if (this.acsRaw.get(((Number) (i)).intValue()).index() != i)
                            throw new ConsistencyError("acs_raw", i, this.acsRaw.get(((Number) (i)).intValue()).index());
                    }
                }
                if (_enabledChunks) {
                    if (this.chunks.size() != _parent().acBits())
                        throw new ConsistencyError("chunks", _parent().acBits(), this.chunks.size());
                    for (int i = 0; i < this.chunks.size(); i++) {
                        if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("chunks", _root(), this.chunks.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.chunks.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("chunks", this, this.chunks.get(((Number) (i)).intValue())._parent());
                    }
                }
                if (_enabledDataAcs) {
                    if (this.dataAcs.size() != _parent().acsInSector() - 1)
                        throw new ConsistencyError("data_acs", _parent().acsInSector() - 1, this.dataAcs.size());
                    for (int i = 0; i < this.dataAcs.size(); i++) {
                        if (!Objects.equals(this.dataAcs.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("data_acs", _root(), this.dataAcs.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.dataAcs.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("data_acs", this, this.dataAcs.get(((Number) (i)).intValue())._parent());
                    }
                }
                if (_enabledRemaps) {
                    if (this.remaps.size() != _parent().acBits())
                        throw new ConsistencyError("remaps", _parent().acBits(), this.remaps.size());
                    for (int i = 0; i < this.remaps.size(); i++) {
                        if (!Objects.equals(this.remaps.get(((Number) (i)).intValue())._root(), _root()))
                            throw new ConsistencyError("remaps", _root(), this.remaps.get(((Number) (i)).intValue())._root());
                        if (!Objects.equals(this.remaps.get(((Number) (i)).intValue())._parent(), this))
                            throw new ConsistencyError("remaps", this, this.remaps.get(((Number) (i)).intValue())._parent());
                        if (this.remaps.get(((Number) (i)).intValue()).bitNo() != i)
                            throw new ConsistencyError("remaps", i, this.remaps.get(((Number) (i)).intValue()).bitNo());
                    }
                }
                if (_enabledTrailerAc) {
                    if (!Objects.equals(this.trailerAc._root(), _root()))
                        throw new ConsistencyError("trailer_ac", _root(), this.trailerAc._root());
                    if (!Objects.equals(this.trailerAc._parent(), this))
                        throw new ConsistencyError("trailer_ac", this, this.trailerAc._parent());
                }
                _dirty = false;
            }
            public static class Ac extends KaitaiStruct.ReadWrite {
                public Ac(int index) {
                    this(null, null, null, index);
                }

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
                }
                public void _read() {
                    _dirty = false;
                }

                public void _fetchInstances() {
                    bits();
                    if (this.bits != null) {
                        for (int i = 0; i < this.bits.size(); i++) {
                            this.bits.get(((Number) (i)).intValue())._fetchInstances();
                        }
                    }
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    _shouldWriteBits = _enabledBits;
                }

                public void _check() {
                    if (_enabledBits) {
                        if (this.bits.size() != _parent()._parent().acBits())
                            throw new ConsistencyError("bits", _parent()._parent().acBits(), this.bits.size());
                        for (int i = 0; i < this.bits.size(); i++) {
                            if (!Objects.equals(this.bits.get(((Number) (i)).intValue())._root(), _root()))
                                throw new ConsistencyError("bits", _root(), this.bits.get(((Number) (i)).intValue())._root());
                            if (!Objects.equals(this.bits.get(((Number) (i)).intValue())._parent(), this))
                                throw new ConsistencyError("bits", this, this.bits.get(((Number) (i)).intValue())._parent());
                            if (this.bits.get(((Number) (i)).intValue()).i() != index())
                                throw new ConsistencyError("bits", index(), this.bits.get(((Number) (i)).intValue()).i());
                            if (this.bits.get(((Number) (i)).intValue()).chunk() != _parent().chunks().get(((Number) (i)).intValue()).chunk())
                                throw new ConsistencyError("bits", _parent().chunks().get(((Number) (i)).intValue()).chunk(), this.bits.get(((Number) (i)).intValue()).chunk());
                        }
                    }
                    _dirty = false;
                }
                public static class AcBit extends KaitaiStruct.ReadWrite {
                    public AcBit(int i, int chunk) {
                        this(null, null, null, i, chunk);
                    }

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
                    }
                    public void _read() {
                        _dirty = false;
                    }

                    public void _fetchInstances() {
                    }

                    public void _write_Seq() {
                        _assertNotDirty();
                    }

                    public void _check() {
                        _dirty = false;
                    }
                    private Boolean b;
                    public Boolean b() {
                        if (this.b != null)
                            return this.b;
                        this.b = n() == 1;
                        return this.b;
                    }
                    public void _invalidateB() { this.b = null; }
                    private Integer n;
                    public Integer n() {
                        if (this.n != null)
                            return this.n;
                        this.n = ((Number) (chunk() >> i() & 1)).intValue();
                        return this.n;
                    }
                    public void _invalidateN() { this.n = null; }
                    private int i;
                    private int chunk;
                    private MifareClassic _root;
                    private MifareClassic.Trailer.AccessConditions.Ac _parent;
                    public int i() { return i; }
                    public void setI(int _v) { _dirty = true; i = _v; }
                    public int chunk() { return chunk; }
                    public void setChunk(int _v) { _dirty = true; chunk = _v; }
                    public MifareClassic _root() { return _root; }
                    public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                    public MifareClassic.Trailer.AccessConditions.Ac _parent() { return _parent; }
                    public void set_parent(MifareClassic.Trailer.AccessConditions.Ac _v) { _dirty = true; _parent = _v; }
                }
                private List<AcBit> bits;
                private boolean _shouldWriteBits = false;
                private boolean _enabledBits = true;
                public List<AcBit> bits() {
                    if (_shouldWriteBits)
                        _writeBits();
                    if (this.bits != null)
                        return this.bits;
                    if (!_enabledBits)
                        return null;
                    long _pos = this._io.pos();
                    this._io.seek(0);
                    this.bits = new ArrayList<AcBit>();
                    for (int i = 0; i < _parent()._parent().acBits(); i++) {
                        AcBit _t_bits = new AcBit(this._io, this, _root, index(), _parent().chunks().get(((Number) (i)).intValue()).chunk());
                        try {
                            _t_bits._read();
                        } finally {
                            this.bits.add(_t_bits);
                        }
                    }
                    this._io.seek(_pos);
                    return this.bits;
                }
                public void setBits(List<AcBit> _v) { _dirty = true; bits = _v; }
                public void setBits_Enabled(boolean _v) { _dirty = true; _enabledBits = _v; }

                private void _writeBits() {
                    _shouldWriteBits = false;
                    long _pos = this._io.pos();
                    this._io.seek(0);
                    for (int i = 0; i < this.bits.size(); i++) {
                        this.bits.get(((Number) (i)).intValue())._write_Seq(this._io);
                    }
                    this._io.seek(_pos);
                }
                private Integer invShiftVal;
                public Integer invShiftVal() {
                    if (this.invShiftVal != null)
                        return this.invShiftVal;
                    this.invShiftVal = ((Number) ((bits().get(((int) 0)).n() << 2 | bits().get(((int) 1)).n() << 1) | bits().get(((int) 2)).n())).intValue();
                    return this.invShiftVal;
                }
                public void _invalidateInvShiftVal() { this.invShiftVal = null; }
                private Integer val;

                /**
                 * c3 c2 c1
                 */
                public Integer val() {
                    if (this.val != null)
                        return this.val;
                    this.val = ((Number) ((bits().get(((int) 2)).n() << 2 | bits().get(((int) 1)).n() << 1) | bits().get(((int) 0)).n())).intValue();
                    return this.val;
                }
                public void _invalidateVal() { this.val = null; }
                private int index;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int index() { return index; }
                public void setIndex(int _v) { _dirty = true; index = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
                public void set_parent(MifareClassic.Trailer.AccessConditions _v) { _dirty = true; _parent = _v; }
            }
            public static class ChunkBitRemap extends KaitaiStruct.ReadWrite {
                public ChunkBitRemap(int bitNo) {
                    this(null, null, null, bitNo);
                }

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
                }
                public void _read() {
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                }

                public void _check() {
                    _dirty = false;
                }
                private Integer chunkNo;
                public Integer chunkNo() {
                    if (this.chunkNo != null)
                        return this.chunkNo;
                    this.chunkNo = ((Number) (KaitaiStream.mod((invChunkNo() + shiftValue()) + _parent()._parent().acCountOfChunks(), _parent()._parent().acCountOfChunks()))).intValue();
                    return this.chunkNo;
                }
                public void _invalidateChunkNo() { this.chunkNo = null; }
                private Integer invChunkNo;
                public Integer invChunkNo() {
                    if (this.invChunkNo != null)
                        return this.invChunkNo;
                    this.invChunkNo = ((Number) (bitNo() + shiftValue())).intValue();
                    return this.invChunkNo;
                }
                public void _invalidateInvChunkNo() { this.invChunkNo = null; }
                private Integer shiftValue;
                public Integer shiftValue() {
                    if (this.shiftValue != null)
                        return this.shiftValue;
                    this.shiftValue = ((Number) ((bitNo() == 1 ? -1 : 1))).intValue();
                    return this.shiftValue;
                }
                public void _invalidateShiftValue() { this.shiftValue = null; }
                private int bitNo;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int bitNo() { return bitNo; }
                public void setBitNo(int _v) { _dirty = true; bitNo = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
                public void set_parent(MifareClassic.Trailer.AccessConditions _v) { _dirty = true; _parent = _v; }
            }
            public static class DataAc extends KaitaiStruct.ReadWrite {
                public DataAc(Ac ac) {
                    this(null, null, null, ac);
                }

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
                }
                public void _read() {
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                }

                public void _check() {
                    _dirty = false;
                }
                private Boolean decrementAvailable;
                public Boolean decrementAvailable() {
                    if (this.decrementAvailable != null)
                        return this.decrementAvailable;
                    this.decrementAvailable =  (( ((ac().bits().get(((int) 1)).b()) || (!(ac().bits().get(((int) 0)).b()))) ) && (!(ac().bits().get(((int) 2)).b()))) ;
                    return this.decrementAvailable;
                }
                public void _invalidateDecrementAvailable() { this.decrementAvailable = null; }
                private Boolean incrementAvailable;
                public Boolean incrementAvailable() {
                    if (this.incrementAvailable != null)
                        return this.incrementAvailable;
                    this.incrementAvailable =  (( ((!(ac().bits().get(((int) 0)).b())) && (!(readKeyARequired())) && (!(readKeyBRequired()))) ) || ( ((!(ac().bits().get(((int) 0)).b())) && (readKeyARequired()) && (readKeyBRequired())) )) ;
                    return this.incrementAvailable;
                }
                public void _invalidateIncrementAvailable() { this.incrementAvailable = null; }
                private Boolean readKeyARequired;
                public Boolean readKeyARequired() {
                    if (this.readKeyARequired != null)
                        return this.readKeyARequired;
                    this.readKeyARequired = ac().val() <= 4;
                    return this.readKeyARequired;
                }
                public void _invalidateReadKeyARequired() { this.readKeyARequired = null; }
                private Boolean readKeyBRequired;
                public Boolean readKeyBRequired() {
                    if (this.readKeyBRequired != null)
                        return this.readKeyBRequired;
                    this.readKeyBRequired = ac().val() <= 6;
                    return this.readKeyBRequired;
                }
                public void _invalidateReadKeyBRequired() { this.readKeyBRequired = null; }
                private Boolean writeKeyARequired;
                public Boolean writeKeyARequired() {
                    if (this.writeKeyARequired != null)
                        return this.writeKeyARequired;
                    this.writeKeyARequired = ac().val() == 0;
                    return this.writeKeyARequired;
                }
                public void _invalidateWriteKeyARequired() { this.writeKeyARequired = null; }
                private Boolean writeKeyBRequired;
                public Boolean writeKeyBRequired() {
                    if (this.writeKeyBRequired != null)
                        return this.writeKeyBRequired;
                    this.writeKeyBRequired =  (( ((!(readKeyARequired())) || (readKeyBRequired())) ) && (!(ac().bits().get(((int) 0)).b()))) ;
                    return this.writeKeyBRequired;
                }
                public void _invalidateWriteKeyBRequired() { this.writeKeyBRequired = null; }
                private Ac ac;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public Ac ac() { return ac; }
                public void setAc(Ac _v) { _dirty = true; ac = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
                public void set_parent(MifareClassic.Trailer.AccessConditions _v) { _dirty = true; _parent = _v; }
            }
            public static class TrailerAc extends KaitaiStruct.ReadWrite {
                public TrailerAc(Ac ac) {
                    this(null, null, null, ac);
                }

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
                }
                public void _read() {
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                }

                public void _check() {
                    _dirty = false;
                }
                private Boolean canReadKeyB;

                /**
                 * key A is required
                 */
                public Boolean canReadKeyB() {
                    if (this.canReadKeyB != null)
                        return this.canReadKeyB;
                    this.canReadKeyB = ac().invShiftVal() <= 2;
                    return this.canReadKeyB;
                }
                public void _invalidateCanReadKeyB() { this.canReadKeyB = null; }
                private Boolean canWriteAccessBits;
                public Boolean canWriteAccessBits() {
                    if (this.canWriteAccessBits != null)
                        return this.canWriteAccessBits;
                    this.canWriteAccessBits = ac().bits().get(((int) 2)).b();
                    return this.canWriteAccessBits;
                }
                public void _invalidateCanWriteAccessBits() { this.canWriteAccessBits = null; }
                private Boolean canWriteKeys;
                public Boolean canWriteKeys() {
                    if (this.canWriteKeys != null)
                        return this.canWriteKeys;
                    this.canWriteKeys =  ((KaitaiStream.mod(ac().invShiftVal() + 1, 3) != 0) && (ac().invShiftVal() < 6)) ;
                    return this.canWriteKeys;
                }
                public void _invalidateCanWriteKeys() { this.canWriteKeys = null; }
                private Boolean keyBControlsWrite;
                public Boolean keyBControlsWrite() {
                    if (this.keyBControlsWrite != null)
                        return this.keyBControlsWrite;
                    this.keyBControlsWrite = !(canReadKeyB());
                    return this.keyBControlsWrite;
                }
                public void _invalidateKeyBControlsWrite() { this.keyBControlsWrite = null; }
                private Ac ac;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public Ac ac() { return ac; }
                public void setAc(Ac _v) { _dirty = true; ac = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
                public void set_parent(MifareClassic.Trailer.AccessConditions _v) { _dirty = true; _parent = _v; }
            }
            public static class ValidChunk extends KaitaiStruct.ReadWrite {
                public ValidChunk(int invChunk, int chunk) {
                    this(null, null, null, invChunk, chunk);
                }

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
                }
                public void _read() {
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                }

                public void _check() {
                    _dirty = false;
                }
                private Boolean valid;
                public Boolean valid() {
                    if (this.valid != null)
                        return this.valid;
                    this.valid = (invChunk() ^ chunk()) == 15;
                    return this.valid;
                }
                public void _invalidateValid() { this.valid = null; }
                private int invChunk;
                private int chunk;
                private MifareClassic _root;
                private MifareClassic.Trailer.AccessConditions _parent;
                public int invChunk() { return invChunk; }
                public void setInvChunk(int _v) { _dirty = true; invChunk = _v; }

                /**
                 * c3 c2 c1 c0
                 */
                public int chunk() { return chunk; }
                public void setChunk(int _v) { _dirty = true; chunk = _v; }
                public MifareClassic _root() { return _root; }
                public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
                public MifareClassic.Trailer.AccessConditions _parent() { return _parent; }
                public void set_parent(MifareClassic.Trailer.AccessConditions _v) { _dirty = true; _parent = _v; }
            }
            private List<Ac> acsRaw;
            private boolean _shouldWriteAcsRaw = false;
            private boolean _enabledAcsRaw = true;
            public List<Ac> acsRaw() {
                if (_shouldWriteAcsRaw)
                    _writeAcsRaw();
                if (this.acsRaw != null)
                    return this.acsRaw;
                if (!_enabledAcsRaw)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.acsRaw = new ArrayList<Ac>();
                for (int i = 0; i < _parent().acsInSector(); i++) {
                    Ac _t_acsRaw = new Ac(this._io, this, _root, i);
                    try {
                        _t_acsRaw._read();
                    } finally {
                        this.acsRaw.add(_t_acsRaw);
                    }
                }
                this._io.seek(_pos);
                return this.acsRaw;
            }
            public void setAcsRaw(List<Ac> _v) { _dirty = true; acsRaw = _v; }
            public void setAcsRaw_Enabled(boolean _v) { _dirty = true; _enabledAcsRaw = _v; }

            private void _writeAcsRaw() {
                _shouldWriteAcsRaw = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                for (int i = 0; i < this.acsRaw.size(); i++) {
                    this.acsRaw.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private List<ValidChunk> chunks;
            private boolean _shouldWriteChunks = false;
            private boolean _enabledChunks = true;
            public List<ValidChunk> chunks() {
                if (_shouldWriteChunks)
                    _writeChunks();
                if (this.chunks != null)
                    return this.chunks;
                if (!_enabledChunks)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.chunks = new ArrayList<ValidChunk>();
                for (int i = 0; i < _parent().acBits(); i++) {
                    ValidChunk _t_chunks = new ValidChunk(this._io, this, _root, rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).invChunkNo())).intValue()), rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).chunkNo())).intValue()));
                    try {
                        _t_chunks._read();
                    } finally {
                        this.chunks.add(_t_chunks);
                    }
                }
                this._io.seek(_pos);
                return this.chunks;
            }
            public void setChunks(List<ValidChunk> _v) { _dirty = true; chunks = _v; }
            public void setChunks_Enabled(boolean _v) { _dirty = true; _enabledChunks = _v; }

            private void _writeChunks() {
                _shouldWriteChunks = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                for (int i = 0; i < this.chunks.size(); i++) {
                    if (this.chunks.get(((Number) (i)).intValue()).invChunk() != rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).invChunkNo())).intValue()))
                        throw new ConsistencyError("chunks", rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).invChunkNo())).intValue()), this.chunks.get(((Number) (i)).intValue()).invChunk());
                    if (this.chunks.get(((Number) (i)).intValue()).chunk() != rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).chunkNo())).intValue()))
                        throw new ConsistencyError("chunks", rawChunks().get(((Number) (remaps().get(((Number) (i)).intValue()).chunkNo())).intValue()), this.chunks.get(((Number) (i)).intValue()).chunk());
                    this.chunks.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private List<DataAc> dataAcs;
            private boolean _shouldWriteDataAcs = false;
            private boolean _enabledDataAcs = true;
            public List<DataAc> dataAcs() {
                if (_shouldWriteDataAcs)
                    _writeDataAcs();
                if (this.dataAcs != null)
                    return this.dataAcs;
                if (!_enabledDataAcs)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.dataAcs = new ArrayList<DataAc>();
                for (int i = 0; i < _parent().acsInSector() - 1; i++) {
                    DataAc _t_dataAcs = new DataAc(this._io, this, _root, acsRaw().get(((Number) (i)).intValue()));
                    try {
                        _t_dataAcs._read();
                    } finally {
                        this.dataAcs.add(_t_dataAcs);
                    }
                }
                this._io.seek(_pos);
                return this.dataAcs;
            }
            public void setDataAcs(List<DataAc> _v) { _dirty = true; dataAcs = _v; }
            public void setDataAcs_Enabled(boolean _v) { _dirty = true; _enabledDataAcs = _v; }

            private void _writeDataAcs() {
                _shouldWriteDataAcs = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                for (int i = 0; i < this.dataAcs.size(); i++) {
                    if (!Objects.equals(this.dataAcs.get(((Number) (i)).intValue()).ac(), acsRaw().get(((Number) (i)).intValue())))
                        throw new ConsistencyError("data_acs", acsRaw().get(((Number) (i)).intValue()), this.dataAcs.get(((Number) (i)).intValue()).ac());
                    this.dataAcs.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private List<ChunkBitRemap> remaps;
            private boolean _shouldWriteRemaps = false;
            private boolean _enabledRemaps = true;
            public List<ChunkBitRemap> remaps() {
                if (_shouldWriteRemaps)
                    _writeRemaps();
                if (this.remaps != null)
                    return this.remaps;
                if (!_enabledRemaps)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.remaps = new ArrayList<ChunkBitRemap>();
                for (int i = 0; i < _parent().acBits(); i++) {
                    ChunkBitRemap _t_remaps = new ChunkBitRemap(this._io, this, _root, i);
                    try {
                        _t_remaps._read();
                    } finally {
                        this.remaps.add(_t_remaps);
                    }
                }
                this._io.seek(_pos);
                return this.remaps;
            }
            public void setRemaps(List<ChunkBitRemap> _v) { _dirty = true; remaps = _v; }
            public void setRemaps_Enabled(boolean _v) { _dirty = true; _enabledRemaps = _v; }

            private void _writeRemaps() {
                _shouldWriteRemaps = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                for (int i = 0; i < this.remaps.size(); i++) {
                    this.remaps.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
                this._io.seek(_pos);
            }
            private TrailerAc trailerAc;
            private boolean _shouldWriteTrailerAc = false;
            private boolean _enabledTrailerAc = true;
            public TrailerAc trailerAc() {
                if (_shouldWriteTrailerAc)
                    _writeTrailerAc();
                if (this.trailerAc != null)
                    return this.trailerAc;
                if (!_enabledTrailerAc)
                    return null;
                long _pos = this._io.pos();
                this._io.seek(0);
                this.trailerAc = new TrailerAc(this._io, this, _root, acsRaw().get(((Number) (_parent().acsInSector() - 1)).intValue()));
                this.trailerAc._read();
                this._io.seek(_pos);
                return this.trailerAc;
            }
            public void setTrailerAc(TrailerAc _v) { _dirty = true; trailerAc = _v; }
            public void setTrailerAc_Enabled(boolean _v) { _dirty = true; _enabledTrailerAc = _v; }

            private void _writeTrailerAc() {
                _shouldWriteTrailerAc = false;
                long _pos = this._io.pos();
                this._io.seek(0);
                if (!Objects.equals(this.trailerAc.ac(), acsRaw().get(((Number) (_parent().acsInSector() - 1)).intValue())))
                    throw new ConsistencyError("trailer_ac", acsRaw().get(((Number) (_parent().acsInSector() - 1)).intValue()), this.trailerAc.ac());
                this.trailerAc._write_Seq(this._io);
                this._io.seek(_pos);
            }
            private List<Long> rawChunks;
            private MifareClassic _root;
            private MifareClassic.Trailer _parent;
            public List<Long> rawChunks() { return rawChunks; }
            public void setRawChunks(List<Long> _v) { _dirty = true; rawChunks = _v; }
            public MifareClassic _root() { return _root; }
            public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
            public MifareClassic.Trailer _parent() { return _parent; }
            public void set_parent(MifareClassic.Trailer _v) { _dirty = true; _parent = _v; }
        }
        private Byte acBits;
        public Byte acBits() {
            if (this.acBits != null)
                return this.acBits;
            this.acBits = ((byte) 3);
            return this.acBits;
        }
        public void _invalidateAcBits() { this.acBits = null; }
        private Integer acCountOfChunks;
        public Integer acCountOfChunks() {
            if (this.acCountOfChunks != null)
                return this.acCountOfChunks;
            this.acCountOfChunks = ((Number) (acBits() * 2)).intValue();
            return this.acCountOfChunks;
        }
        public void _invalidateAcCountOfChunks() { this.acCountOfChunks = null; }
        private Byte acsInSector;
        public Byte acsInSector() {
            if (this.acsInSector != null)
                return this.acsInSector;
            this.acsInSector = ((byte) 4);
            return this.acsInSector;
        }
        public void _invalidateAcsInSector() { this.acsInSector = null; }
        private Key keyA;
        private AccessConditions accessBits;
        private int userByte;
        private Key keyB;
        private MifareClassic _root;
        private MifareClassic.Sector _parent;
        private byte[] _raw_accessBits;
        public Key keyA() { return keyA; }
        public void setKeyA(Key _v) { _dirty = true; keyA = _v; }
        public AccessConditions accessBits() { return accessBits; }
        public void setAccessBits(AccessConditions _v) { _dirty = true; accessBits = _v; }
        public int userByte() { return userByte; }
        public void setUserByte(int _v) { _dirty = true; userByte = _v; }
        public Key keyB() { return keyB; }
        public void setKeyB(Key _v) { _dirty = true; keyB = _v; }
        public MifareClassic _root() { return _root; }
        public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
        public MifareClassic.Sector _parent() { return _parent; }
        public void set_parent(MifareClassic.Sector _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_accessBits() { return _raw_accessBits; }
        public void set_raw_AccessBits(byte[] _v) { _dirty = true; _raw_accessBits = _v; }
    }
    private List<Sector> sectors;
    private MifareClassic _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_sectors;
    public List<Sector> sectors() { return sectors; }
    public void setSectors(List<Sector> _v) { _dirty = true; sectors = _v; }
    public MifareClassic _root() { return _root; }
    public void set_root(MifareClassic _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_sectors() { return _raw_sectors; }
    public void set_raw_Sectors(List<byte[]> _v) { _dirty = true; _raw_sectors = _v; }
}
