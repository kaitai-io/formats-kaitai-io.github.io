// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


/**
 * This spec allows to parse files used by Microsoft Windows family of
 * operating systems to store parts of its "registry". "Registry" is a
 * hierarchical database that is used to store system settings (global
 * configuration, per-user, per-application configuration, etc).
 * 
 * Typically, registry files are stored in:
 * 
 * * System-wide: several files in `%SystemRoot%\System32\Config\`
 * * User-wide:
 *   * `%USERPROFILE%\Ntuser.dat`
 *   * `%USERPROFILE%\Local Settings\Application Data\Microsoft\Windows\Usrclass.dat` (localized, Windows 2000, Server 2003 and Windows XP)
 *   * `%USERPROFILE%\AppData\Local\Microsoft\Windows\Usrclass.dat` (non-localized, Windows Vista and later)
 * 
 * Note that one typically can't access files directly on a mounted
 * filesystem with a running Windows OS.
 * @see <a href="https://github.com/libyal/libregf/blob/main/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc">Source</a>
 */
public class Regf extends KaitaiStruct.ReadWrite {
    public static Regf fromFile(String fileName) throws IOException {
        return new Regf(new ByteBufferKaitaiStream(fileName));
    }
    public Regf() {
        this(null, null, null);
    }

    public Regf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Regf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public Regf(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Regf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.header._read();
        this._raw_hiveBins = new ArrayList<byte[]>();
        this.hiveBins = new ArrayList<HiveBin>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this._raw_hiveBins.add(this._io.readBytes(4096));
                KaitaiStream _io__raw_hiveBins = new ByteBufferKaitaiStream(this._raw_hiveBins.get(this._raw_hiveBins.size() - 1));
                HiveBin _t_hiveBins = new HiveBin(_io__raw_hiveBins, this, _root);
                try {
                    _t_hiveBins._read();
                } finally {
                    this.hiveBins.add(_t_hiveBins);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.hiveBins.size(); i++) {
            this.hiveBins.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        this._raw_hiveBins = new ArrayList<byte[]>();
        for (int i = 0; i < this.hiveBins.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("hive_bins", 0, this._io.size() - this._io.pos());
            final KaitaiStream _io__raw_hiveBins = new ByteBufferKaitaiStream(4096);
            this._io.addChildStream(_io__raw_hiveBins);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4096));
                final Regf _this = this;
                final int _i = i;
                _io__raw_hiveBins.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_hiveBins.add(_io__raw_hiveBins.toByteArray());
                        if (_this._raw_hiveBins.get(((Number) (_i)).intValue()).length != 4096)
                            throw new ConsistencyError("raw(hive_bins)", 4096, _this._raw_hiveBins.get(((Number) (_i)).intValue()).length);
                        parent.writeBytes(_this._raw_hiveBins.get(((Number) (_i)).intValue()));
                    }
                });
            }
            this.hiveBins.get(((Number) (i)).intValue())._write_Seq(_io__raw_hiveBins);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("hive_bins", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        for (int i = 0; i < this.hiveBins.size(); i++) {
            if (!Objects.equals(this.hiveBins.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("hive_bins", _root(), this.hiveBins.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.hiveBins.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("hive_bins", this, this.hiveBins.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public enum FileFormat {
            DIRECT_MEMORY_LOAD(1);

            private final long id;
            FileFormat(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FileFormat> byId = new HashMap<Long, FileFormat>(1);
            static {
                for (FileFormat e : FileFormat.values())
                    byId.put(e.id(), e);
            }
            public static FileFormat byId(long id) { return byId.get(id); }
        }

        public enum FileType {
            NORMAL(0),
            TRANSACTION_LOG(1);

            private final long id;
            FileType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, FileType> byId = new HashMap<Long, FileType>(2);
            static {
                for (FileType e : FileType.values())
                    byId.put(e.id(), e);
            }
            public static FileType byId(long id) { return byId.get(id); }
        }
        public FileHeader() {
            this(null, null, null);
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, Regf _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, Regf _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(this.signature, new byte[] { 114, 101, 103, 102 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 114, 101, 103, 102 }, this.signature, this._io, "/types/file_header/seq/0");
            }
            this.primarySequenceNumber = this._io.readU4le();
            this.secondarySequenceNumber = this._io.readU4le();
            this.lastModificationDateAndTime = new Filetime(this._io, this, _root);
            this.lastModificationDateAndTime._read();
            this.majorVersion = this._io.readU4le();
            this.minorVersion = this._io.readU4le();
            this.type = FileType.byId(this._io.readU4le());
            this.format = FileFormat.byId(this._io.readU4le());
            this.rootKeyOffset = this._io.readU4le();
            this.hiveBinsDataSize = this._io.readU4le();
            this.clusteringFactor = this._io.readU4le();
            this.unknown1 = this._io.readBytes(64);
            this.unknown2 = this._io.readBytes(396);
            this.checksum = this._io.readU4le();
            this.reserved = this._io.readBytes(3576);
            this.bootType = this._io.readU4le();
            this.bootRecover = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.lastModificationDateAndTime._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signature);
            this._io.writeU4le(this.primarySequenceNumber);
            this._io.writeU4le(this.secondarySequenceNumber);
            this.lastModificationDateAndTime._write_Seq(this._io);
            this._io.writeU4le(this.majorVersion);
            this._io.writeU4le(this.minorVersion);
            this._io.writeU4le(((Number) (this.type.id())).longValue());
            this._io.writeU4le(((Number) (this.format.id())).longValue());
            this._io.writeU4le(this.rootKeyOffset);
            this._io.writeU4le(this.hiveBinsDataSize);
            this._io.writeU4le(this.clusteringFactor);
            this._io.writeBytes(this.unknown1);
            this._io.writeBytes(this.unknown2);
            this._io.writeU4le(this.checksum);
            this._io.writeBytes(this.reserved);
            this._io.writeU4le(this.bootType);
            this._io.writeU4le(this.bootRecover);
        }

        public void _check() {
            if (this.signature.length != 4)
                throw new ConsistencyError("signature", 4, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 114, 101, 103, 102 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 114, 101, 103, 102 }, this.signature, null, "/types/file_header/seq/0");
            }
            if (!Objects.equals(this.lastModificationDateAndTime._root(), _root()))
                throw new ConsistencyError("last_modification_date_and_time", _root(), this.lastModificationDateAndTime._root());
            if (!Objects.equals(this.lastModificationDateAndTime._parent(), this))
                throw new ConsistencyError("last_modification_date_and_time", this, this.lastModificationDateAndTime._parent());
            if (this.unknown1.length != 64)
                throw new ConsistencyError("unknown1", 64, this.unknown1.length);
            if (this.unknown2.length != 396)
                throw new ConsistencyError("unknown2", 396, this.unknown2.length);
            if (this.reserved.length != 3576)
                throw new ConsistencyError("reserved", 3576, this.reserved.length);
            _dirty = false;
        }
        private byte[] signature;
        private long primarySequenceNumber;
        private long secondarySequenceNumber;
        private Filetime lastModificationDateAndTime;
        private long majorVersion;
        private long minorVersion;
        private FileType type;
        private FileFormat format;
        private long rootKeyOffset;
        private long hiveBinsDataSize;
        private long clusteringFactor;
        private byte[] unknown1;
        private byte[] unknown2;
        private long checksum;
        private byte[] reserved;
        private long bootType;
        private long bootRecover;
        private Regf _root;
        private Regf _parent;
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }
        public long primarySequenceNumber() { return primarySequenceNumber; }
        public void setPrimarySequenceNumber(long _v) { _dirty = true; primarySequenceNumber = _v; }
        public long secondarySequenceNumber() { return secondarySequenceNumber; }
        public void setSecondarySequenceNumber(long _v) { _dirty = true; secondarySequenceNumber = _v; }
        public Filetime lastModificationDateAndTime() { return lastModificationDateAndTime; }
        public void setLastModificationDateAndTime(Filetime _v) { _dirty = true; lastModificationDateAndTime = _v; }
        public long majorVersion() { return majorVersion; }
        public void setMajorVersion(long _v) { _dirty = true; majorVersion = _v; }
        public long minorVersion() { return minorVersion; }
        public void setMinorVersion(long _v) { _dirty = true; minorVersion = _v; }
        public FileType type() { return type; }
        public void setType(FileType _v) { _dirty = true; type = _v; }
        public FileFormat format() { return format; }
        public void setFormat(FileFormat _v) { _dirty = true; format = _v; }
        public long rootKeyOffset() { return rootKeyOffset; }
        public void setRootKeyOffset(long _v) { _dirty = true; rootKeyOffset = _v; }
        public long hiveBinsDataSize() { return hiveBinsDataSize; }
        public void setHiveBinsDataSize(long _v) { _dirty = true; hiveBinsDataSize = _v; }
        public long clusteringFactor() { return clusteringFactor; }
        public void setClusteringFactor(long _v) { _dirty = true; clusteringFactor = _v; }
        public byte[] unknown1() { return unknown1; }
        public void setUnknown1(byte[] _v) { _dirty = true; unknown1 = _v; }
        public byte[] unknown2() { return unknown2; }
        public void setUnknown2(byte[] _v) { _dirty = true; unknown2 = _v; }
        public long checksum() { return checksum; }
        public void setChecksum(long _v) { _dirty = true; checksum = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public long bootType() { return bootType; }
        public void setBootType(long _v) { _dirty = true; bootType = _v; }
        public long bootRecover() { return bootRecover; }
        public void setBootRecover(long _v) { _dirty = true; bootRecover = _v; }
        public Regf _root() { return _root; }
        public void set_root(Regf _v) { _dirty = true; _root = _v; }
        public Regf _parent() { return _parent; }
        public void set_parent(Regf _v) { _dirty = true; _parent = _v; }
    }
    public static class Filetime extends KaitaiStruct.ReadWrite {
        public static Filetime fromFile(String fileName) throws IOException {
            return new Filetime(new ByteBufferKaitaiStream(fileName));
        }
        public Filetime() {
            this(null, null, null);
        }

        public Filetime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Filetime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
            this(_io, _parent, null);
        }

        public Filetime(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.value = this._io.readU8le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU8le(this.value);
        }

        public void _check() {
            _dirty = false;
        }
        private long value;
        private Regf _root;
        private KaitaiStruct.ReadWrite _parent;
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public Regf _root() { return _root; }
        public void set_root(Regf _v) { _dirty = true; _root = _v; }
        public KaitaiStruct.ReadWrite _parent() { return _parent; }
        public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    }
    public static class HiveBin extends KaitaiStruct.ReadWrite {
        public static HiveBin fromFile(String fileName) throws IOException {
            return new HiveBin(new ByteBufferKaitaiStream(fileName));
        }
        public HiveBin() {
            this(null, null, null);
        }

        public HiveBin(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HiveBin(KaitaiStream _io, Regf _parent) {
            this(_io, _parent, null);
        }

        public HiveBin(KaitaiStream _io, Regf _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.header = new HiveBinHeader(this._io, this, _root);
            this.header._read();
            this.cells = new ArrayList<HiveBinCell>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    HiveBinCell _t_cells = new HiveBinCell(this._io, this, _root);
                    try {
                        _t_cells._read();
                    } finally {
                        this.cells.add(_t_cells);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.header._fetchInstances();
            for (int i = 0; i < this.cells.size(); i++) {
                this.cells.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.header._write_Seq(this._io);
            for (int i = 0; i < this.cells.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("cells", 0, this._io.size() - this._io.pos());
                this.cells.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("cells", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            if (!Objects.equals(this.header._root(), _root()))
                throw new ConsistencyError("header", _root(), this.header._root());
            if (!Objects.equals(this.header._parent(), this))
                throw new ConsistencyError("header", this, this.header._parent());
            for (int i = 0; i < this.cells.size(); i++) {
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("cells", _root(), this.cells.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.cells.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("cells", this, this.cells.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private HiveBinHeader header;
        private List<HiveBinCell> cells;
        private Regf _root;
        private Regf _parent;
        public HiveBinHeader header() { return header; }
        public void setHeader(HiveBinHeader _v) { _dirty = true; header = _v; }
        public List<HiveBinCell> cells() { return cells; }
        public void setCells(List<HiveBinCell> _v) { _dirty = true; cells = _v; }
        public Regf _root() { return _root; }
        public void set_root(Regf _v) { _dirty = true; _root = _v; }
        public Regf _parent() { return _parent; }
        public void set_parent(Regf _v) { _dirty = true; _parent = _v; }
    }
    public static class HiveBinCell extends KaitaiStruct.ReadWrite {
        public static HiveBinCell fromFile(String fileName) throws IOException {
            return new HiveBinCell(new ByteBufferKaitaiStream(fileName));
        }
        public HiveBinCell() {
            this(null, null, null);
        }

        public HiveBinCell(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HiveBinCell(KaitaiStream _io, Regf.HiveBin _parent) {
            this(_io, _parent, null);
        }

        public HiveBinCell(KaitaiStream _io, Regf.HiveBin _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.cellSizeRaw = this._io.readS4le();
            this.identifier = new String(this._io.readBytes(2), StandardCharsets.US_ASCII);
            switch (identifier()) {
            case "lf": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListLhLf(_io__raw_data, this, _root);
                ((SubKeyListLhLf) (this.data))._read();
                break;
            }
            case "lh": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListLhLf(_io__raw_data, this, _root);
                ((SubKeyListLhLf) (this.data))._read();
                break;
            }
            case "li": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListLi(_io__raw_data, this, _root);
                ((SubKeyListLi) (this.data))._read();
                break;
            }
            case "nk": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new NamedKey(_io__raw_data, this, _root);
                ((NamedKey) (this.data))._read();
                break;
            }
            case "ri": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListRi(_io__raw_data, this, _root);
                ((SubKeyListRi) (this.data))._read();
                break;
            }
            case "sk": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListSk(_io__raw_data, this, _root);
                ((SubKeyListSk) (this.data))._read();
                break;
            }
            case "vk": {
                this._raw_data = this._io.readBytes((cellSize() - 2) - 4);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new SubKeyListVk(_io__raw_data, this, _root);
                ((SubKeyListVk) (this.data))._read();
                break;
            }
            default: {
                this.data = this._io.readBytes((cellSize() - 2) - 4);
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (identifier()) {
            case "lf": {
                ((SubKeyListLhLf) (this.data))._fetchInstances();
                break;
            }
            case "lh": {
                ((SubKeyListLhLf) (this.data))._fetchInstances();
                break;
            }
            case "li": {
                ((SubKeyListLi) (this.data))._fetchInstances();
                break;
            }
            case "nk": {
                ((NamedKey) (this.data))._fetchInstances();
                break;
            }
            case "ri": {
                ((SubKeyListRi) (this.data))._fetchInstances();
                break;
            }
            case "sk": {
                ((SubKeyListSk) (this.data))._fetchInstances();
                break;
            }
            case "vk": {
                ((SubKeyListVk) (this.data))._fetchInstances();
                break;
            }
            default: {
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeS4le(this.cellSizeRaw);
            this._io.writeBytes((this.identifier).getBytes(Charset.forName("ASCII")));
            switch (identifier()) {
            case "lf": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListLhLf) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "lh": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListLhLf) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "li": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListLi) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "nk": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((NamedKey) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "ri": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListRi) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "sk": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListSk) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            case "vk": {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream((cellSize() - 2) - 4);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + ((cellSize() - 2) - 4));
                    final HiveBinCell _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (((byte[]) (_this._raw_data)).length != (cellSize() - 2) - 4)
                                throw new ConsistencyError("raw(data)", (cellSize() - 2) - 4, ((byte[]) (_this._raw_data)).length);
                            parent.writeBytes(((byte[]) (((byte[]) (_this._raw_data)))));
                        }
                    });
                }
                ((SubKeyListVk) (this.data))._write_Seq(_io__raw_data);
                break;
            }
            default: {
                this._io.writeBytes(((byte[]) (((byte[]) (this.data)))));
                break;
            }
            }
        }

        public void _check() {
            if ((this.identifier).getBytes(Charset.forName("ASCII")).length != 2)
                throw new ConsistencyError("identifier", 2, (this.identifier).getBytes(Charset.forName("ASCII")).length);
            switch (identifier()) {
            case "lf": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._parent());
                break;
            }
            case "lh": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListLhLf) (this.data))._parent());
                break;
            }
            case "li": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLi) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListLi) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListLi) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListLi) (this.data))._parent());
                break;
            }
            case "nk": {
                if (!Objects.equals(((Regf.HiveBinCell.NamedKey) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.NamedKey) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.NamedKey) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.NamedKey) (this.data))._parent());
                break;
            }
            case "ri": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListRi) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListRi) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListRi) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListRi) (this.data))._parent());
                break;
            }
            case "sk": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListSk) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListSk) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListSk) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListSk) (this.data))._parent());
                break;
            }
            case "vk": {
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListVk) (this.data))._root(), _root()))
                    throw new ConsistencyError("data", _root(), ((Regf.HiveBinCell.SubKeyListVk) (this.data))._root());
                if (!Objects.equals(((Regf.HiveBinCell.SubKeyListVk) (this.data))._parent(), this))
                    throw new ConsistencyError("data", this, ((Regf.HiveBinCell.SubKeyListVk) (this.data))._parent());
                break;
            }
            default: {
                if (((byte[]) (this.data)).length != (cellSize() - 2) - 4)
                    throw new ConsistencyError("data", (cellSize() - 2) - 4, ((byte[]) (this.data)).length);
                break;
            }
            }
            _dirty = false;
        }
        public static class NamedKey extends KaitaiStruct.ReadWrite {
            public static NamedKey fromFile(String fileName) throws IOException {
                return new NamedKey(new ByteBufferKaitaiStream(fileName));
            }

            public enum NkFlags {
                KEY_IS_VOLATILE(1),
                KEY_HIVE_EXIT(2),
                KEY_HIVE_ENTRY(4),
                KEY_NO_DELETE(8),
                KEY_SYM_LINK(16),
                KEY_COMP_NAME(32),
                KEY_PREFEF_HANDLE(64),
                KEY_VIRT_MIRRORED(128),
                KEY_VIRT_TARGET(256),
                KEY_VIRTUAL_STORE(512),
                UNKNOWN1(4096),
                UNKNOWN2(16384);

                private final long id;
                NkFlags(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, NkFlags> byId = new HashMap<Long, NkFlags>(12);
                static {
                    for (NkFlags e : NkFlags.values())
                        byId.put(e.id(), e);
                }
                public static NkFlags byId(long id) { return byId.get(id); }
            }
            public NamedKey() {
                this(null, null, null);
            }

            public NamedKey(KaitaiStream _io) {
                this(_io, null, null);
            }

            public NamedKey(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public NamedKey(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.flags = NkFlags.byId(this._io.readU2le());
                this.lastKeyWrittenDateAndTime = new Filetime(this._io, this, _root);
                this.lastKeyWrittenDateAndTime._read();
                this.unknown1 = this._io.readU4le();
                this.parentKeyOffset = this._io.readU4le();
                this.numberOfSubKeys = this._io.readU4le();
                this.numberOfVolatileSubKeys = this._io.readU4le();
                this.subKeysListOffset = this._io.readU4le();
                this.numberOfValues = this._io.readU4le();
                this.valuesListOffset = this._io.readU4le();
                this.securityKeyOffset = this._io.readU4le();
                this.classNameOffset = this._io.readU4le();
                this.largestSubKeyNameSize = this._io.readU4le();
                this.largestSubKeyClassNameSize = this._io.readU4le();
                this.largestValueNameSize = this._io.readU4le();
                this.largestValueDataSize = this._io.readU4le();
                this.unknown2 = this._io.readU4le();
                this.keyNameSize = this._io.readU2le();
                this.classNameSize = this._io.readU2le();
                this.unknownStringSize = this._io.readU4le();
                this.unknownString = new String(this._io.readBytes(unknownStringSize()), StandardCharsets.US_ASCII);
                _dirty = false;
            }

            public void _fetchInstances() {
                this.lastKeyWrittenDateAndTime._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(((Number) (this.flags.id())).intValue());
                this.lastKeyWrittenDateAndTime._write_Seq(this._io);
                this._io.writeU4le(this.unknown1);
                this._io.writeU4le(this.parentKeyOffset);
                this._io.writeU4le(this.numberOfSubKeys);
                this._io.writeU4le(this.numberOfVolatileSubKeys);
                this._io.writeU4le(this.subKeysListOffset);
                this._io.writeU4le(this.numberOfValues);
                this._io.writeU4le(this.valuesListOffset);
                this._io.writeU4le(this.securityKeyOffset);
                this._io.writeU4le(this.classNameOffset);
                this._io.writeU4le(this.largestSubKeyNameSize);
                this._io.writeU4le(this.largestSubKeyClassNameSize);
                this._io.writeU4le(this.largestValueNameSize);
                this._io.writeU4le(this.largestValueDataSize);
                this._io.writeU4le(this.unknown2);
                this._io.writeU2le(this.keyNameSize);
                this._io.writeU2le(this.classNameSize);
                this._io.writeU4le(this.unknownStringSize);
                this._io.writeBytes((this.unknownString).getBytes(Charset.forName("ASCII")));
            }

            public void _check() {
                if (!Objects.equals(this.lastKeyWrittenDateAndTime._root(), _root()))
                    throw new ConsistencyError("last_key_written_date_and_time", _root(), this.lastKeyWrittenDateAndTime._root());
                if (!Objects.equals(this.lastKeyWrittenDateAndTime._parent(), this))
                    throw new ConsistencyError("last_key_written_date_and_time", this, this.lastKeyWrittenDateAndTime._parent());
                if ((this.unknownString).getBytes(Charset.forName("ASCII")).length != unknownStringSize())
                    throw new ConsistencyError("unknown_string", unknownStringSize(), (this.unknownString).getBytes(Charset.forName("ASCII")).length);
                _dirty = false;
            }
            private NkFlags flags;
            private Filetime lastKeyWrittenDateAndTime;
            private long unknown1;
            private long parentKeyOffset;
            private long numberOfSubKeys;
            private long numberOfVolatileSubKeys;
            private long subKeysListOffset;
            private long numberOfValues;
            private long valuesListOffset;
            private long securityKeyOffset;
            private long classNameOffset;
            private long largestSubKeyNameSize;
            private long largestSubKeyClassNameSize;
            private long largestValueNameSize;
            private long largestValueDataSize;
            private long unknown2;
            private int keyNameSize;
            private int classNameSize;
            private long unknownStringSize;
            private String unknownString;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public NkFlags flags() { return flags; }
            public void setFlags(NkFlags _v) { _dirty = true; flags = _v; }
            public Filetime lastKeyWrittenDateAndTime() { return lastKeyWrittenDateAndTime; }
            public void setLastKeyWrittenDateAndTime(Filetime _v) { _dirty = true; lastKeyWrittenDateAndTime = _v; }
            public long unknown1() { return unknown1; }
            public void setUnknown1(long _v) { _dirty = true; unknown1 = _v; }
            public long parentKeyOffset() { return parentKeyOffset; }
            public void setParentKeyOffset(long _v) { _dirty = true; parentKeyOffset = _v; }
            public long numberOfSubKeys() { return numberOfSubKeys; }
            public void setNumberOfSubKeys(long _v) { _dirty = true; numberOfSubKeys = _v; }
            public long numberOfVolatileSubKeys() { return numberOfVolatileSubKeys; }
            public void setNumberOfVolatileSubKeys(long _v) { _dirty = true; numberOfVolatileSubKeys = _v; }
            public long subKeysListOffset() { return subKeysListOffset; }
            public void setSubKeysListOffset(long _v) { _dirty = true; subKeysListOffset = _v; }
            public long numberOfValues() { return numberOfValues; }
            public void setNumberOfValues(long _v) { _dirty = true; numberOfValues = _v; }
            public long valuesListOffset() { return valuesListOffset; }
            public void setValuesListOffset(long _v) { _dirty = true; valuesListOffset = _v; }
            public long securityKeyOffset() { return securityKeyOffset; }
            public void setSecurityKeyOffset(long _v) { _dirty = true; securityKeyOffset = _v; }
            public long classNameOffset() { return classNameOffset; }
            public void setClassNameOffset(long _v) { _dirty = true; classNameOffset = _v; }
            public long largestSubKeyNameSize() { return largestSubKeyNameSize; }
            public void setLargestSubKeyNameSize(long _v) { _dirty = true; largestSubKeyNameSize = _v; }
            public long largestSubKeyClassNameSize() { return largestSubKeyClassNameSize; }
            public void setLargestSubKeyClassNameSize(long _v) { _dirty = true; largestSubKeyClassNameSize = _v; }
            public long largestValueNameSize() { return largestValueNameSize; }
            public void setLargestValueNameSize(long _v) { _dirty = true; largestValueNameSize = _v; }
            public long largestValueDataSize() { return largestValueDataSize; }
            public void setLargestValueDataSize(long _v) { _dirty = true; largestValueDataSize = _v; }
            public long unknown2() { return unknown2; }
            public void setUnknown2(long _v) { _dirty = true; unknown2 = _v; }
            public int keyNameSize() { return keyNameSize; }
            public void setKeyNameSize(int _v) { _dirty = true; keyNameSize = _v; }
            public int classNameSize() { return classNameSize; }
            public void setClassNameSize(int _v) { _dirty = true; classNameSize = _v; }
            public long unknownStringSize() { return unknownStringSize; }
            public void setUnknownStringSize(long _v) { _dirty = true; unknownStringSize = _v; }
            public String unknownString() { return unknownString; }
            public void setUnknownString(String _v) { _dirty = true; unknownString = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        public static class SubKeyListLhLf extends KaitaiStruct.ReadWrite {
            public static SubKeyListLhLf fromFile(String fileName) throws IOException {
                return new SubKeyListLhLf(new ByteBufferKaitaiStream(fileName));
            }
            public SubKeyListLhLf() {
                this(null, null, null);
            }

            public SubKeyListLhLf(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubKeyListLhLf(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public SubKeyListLhLf(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    Item _t_items = new Item(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.count);
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() != count())
                    throw new ConsistencyError("items", count(), this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Item extends KaitaiStruct.ReadWrite {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
                }
                public Item() {
                    this(null, null, null);
                }

                public Item(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListLhLf _parent) {
                    this(_io, _parent, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListLhLf _parent, Regf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.namedKeyOffset = this._io.readU4le();
                    this.hashValue = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.namedKeyOffset);
                    this._io.writeU4le(this.hashValue);
                }

                public void _check() {
                    _dirty = false;
                }
                private long namedKeyOffset;
                private long hashValue;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListLhLf _parent;
                public long namedKeyOffset() { return namedKeyOffset; }
                public void setNamedKeyOffset(long _v) { _dirty = true; namedKeyOffset = _v; }
                public long hashValue() { return hashValue; }
                public void setHashValue(long _v) { _dirty = true; hashValue = _v; }
                public Regf _root() { return _root; }
                public void set_root(Regf _v) { _dirty = true; _root = _v; }
                public Regf.HiveBinCell.SubKeyListLhLf _parent() { return _parent; }
                public void set_parent(Regf.HiveBinCell.SubKeyListLhLf _v) { _dirty = true; _parent = _v; }
            }
            private int count;
            private List<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public void setCount(int _v) { _dirty = true; count = _v; }
            public List<Item> items() { return items; }
            public void setItems(List<Item> _v) { _dirty = true; items = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        public static class SubKeyListLi extends KaitaiStruct.ReadWrite {
            public static SubKeyListLi fromFile(String fileName) throws IOException {
                return new SubKeyListLi(new ByteBufferKaitaiStream(fileName));
            }
            public SubKeyListLi() {
                this(null, null, null);
            }

            public SubKeyListLi(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubKeyListLi(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public SubKeyListLi(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    Item _t_items = new Item(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.count);
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() != count())
                    throw new ConsistencyError("items", count(), this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Item extends KaitaiStruct.ReadWrite {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
                }
                public Item() {
                    this(null, null, null);
                }

                public Item(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListLi _parent) {
                    this(_io, _parent, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListLi _parent, Regf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.namedKeyOffset = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.namedKeyOffset);
                }

                public void _check() {
                    _dirty = false;
                }
                private long namedKeyOffset;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListLi _parent;
                public long namedKeyOffset() { return namedKeyOffset; }
                public void setNamedKeyOffset(long _v) { _dirty = true; namedKeyOffset = _v; }
                public Regf _root() { return _root; }
                public void set_root(Regf _v) { _dirty = true; _root = _v; }
                public Regf.HiveBinCell.SubKeyListLi _parent() { return _parent; }
                public void set_parent(Regf.HiveBinCell.SubKeyListLi _v) { _dirty = true; _parent = _v; }
            }
            private int count;
            private List<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public void setCount(int _v) { _dirty = true; count = _v; }
            public List<Item> items() { return items; }
            public void setItems(List<Item> _v) { _dirty = true; items = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        public static class SubKeyListRi extends KaitaiStruct.ReadWrite {
            public static SubKeyListRi fromFile(String fileName) throws IOException {
                return new SubKeyListRi(new ByteBufferKaitaiStream(fileName));
            }
            public SubKeyListRi() {
                this(null, null, null);
            }

            public SubKeyListRi(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubKeyListRi(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public SubKeyListRi(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    Item _t_items = new Item(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.count);
                for (int i = 0; i < this.items.size(); i++) {
                    this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
                }
            }

            public void _check() {
                if (this.items.size() != count())
                    throw new ConsistencyError("items", count(), this.items.size());
                for (int i = 0; i < this.items.size(); i++) {
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
                }
                _dirty = false;
            }
            public static class Item extends KaitaiStruct.ReadWrite {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
                }
                public Item() {
                    this(null, null, null);
                }

                public Item(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListRi _parent) {
                    this(_io, _parent, null);
                }

                public Item(KaitaiStream _io, Regf.HiveBinCell.SubKeyListRi _parent, Regf _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                }
                public void _read() {
                    this.subKeyListOffset = this._io.readU4le();
                    _dirty = false;
                }

                public void _fetchInstances() {
                }

                public void _write_Seq() {
                    _assertNotDirty();
                    this._io.writeU4le(this.subKeyListOffset);
                }

                public void _check() {
                    _dirty = false;
                }
                private long subKeyListOffset;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListRi _parent;
                public long subKeyListOffset() { return subKeyListOffset; }
                public void setSubKeyListOffset(long _v) { _dirty = true; subKeyListOffset = _v; }
                public Regf _root() { return _root; }
                public void set_root(Regf _v) { _dirty = true; _root = _v; }
                public Regf.HiveBinCell.SubKeyListRi _parent() { return _parent; }
                public void set_parent(Regf.HiveBinCell.SubKeyListRi _v) { _dirty = true; _parent = _v; }
            }
            private int count;
            private List<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public void setCount(int _v) { _dirty = true; count = _v; }
            public List<Item> items() { return items; }
            public void setItems(List<Item> _v) { _dirty = true; items = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        public static class SubKeyListSk extends KaitaiStruct.ReadWrite {
            public static SubKeyListSk fromFile(String fileName) throws IOException {
                return new SubKeyListSk(new ByteBufferKaitaiStream(fileName));
            }
            public SubKeyListSk() {
                this(null, null, null);
            }

            public SubKeyListSk(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubKeyListSk(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public SubKeyListSk(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.unknown1 = this._io.readU2le();
                this.previousSecurityKeyOffset = this._io.readU4le();
                this.nextSecurityKeyOffset = this._io.readU4le();
                this.referenceCount = this._io.readU4le();
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.unknown1);
                this._io.writeU4le(this.previousSecurityKeyOffset);
                this._io.writeU4le(this.nextSecurityKeyOffset);
                this._io.writeU4le(this.referenceCount);
            }

            public void _check() {
                _dirty = false;
            }
            private int unknown1;
            private long previousSecurityKeyOffset;
            private long nextSecurityKeyOffset;
            private long referenceCount;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int unknown1() { return unknown1; }
            public void setUnknown1(int _v) { _dirty = true; unknown1 = _v; }
            public long previousSecurityKeyOffset() { return previousSecurityKeyOffset; }
            public void setPreviousSecurityKeyOffset(long _v) { _dirty = true; previousSecurityKeyOffset = _v; }
            public long nextSecurityKeyOffset() { return nextSecurityKeyOffset; }
            public void setNextSecurityKeyOffset(long _v) { _dirty = true; nextSecurityKeyOffset = _v; }
            public long referenceCount() { return referenceCount; }
            public void setReferenceCount(long _v) { _dirty = true; referenceCount = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        public static class SubKeyListVk extends KaitaiStruct.ReadWrite {
            public static SubKeyListVk fromFile(String fileName) throws IOException {
                return new SubKeyListVk(new ByteBufferKaitaiStream(fileName));
            }

            public enum DataTypeEnum {
                REG_NONE(0),
                REG_SZ(1),
                REG_EXPAND_SZ(2),
                REG_BINARY(3),
                REG_DWORD(4),
                REG_DWORD_BIG_ENDIAN(5),
                REG_LINK(6),
                REG_MULTI_SZ(7),
                REG_RESOURCE_LIST(8),
                REG_FULL_RESOURCE_DESCRIPTOR(9),
                REG_RESOURCE_REQUIREMENTS_LIST(10),
                REG_QWORD(11);

                private final long id;
                DataTypeEnum(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, DataTypeEnum> byId = new HashMap<Long, DataTypeEnum>(12);
                static {
                    for (DataTypeEnum e : DataTypeEnum.values())
                        byId.put(e.id(), e);
                }
                public static DataTypeEnum byId(long id) { return byId.get(id); }
            }

            public enum VkFlags {
                VALUE_COMP_NAME(1);

                private final long id;
                VkFlags(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, VkFlags> byId = new HashMap<Long, VkFlags>(1);
                static {
                    for (VkFlags e : VkFlags.values())
                        byId.put(e.id(), e);
                }
                public static VkFlags byId(long id) { return byId.get(id); }
            }
            public SubKeyListVk() {
                this(null, null, null);
            }

            public SubKeyListVk(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SubKeyListVk(KaitaiStream _io, Regf.HiveBinCell _parent) {
                this(_io, _parent, null);
            }

            public SubKeyListVk(KaitaiStream _io, Regf.HiveBinCell _parent, Regf _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
            }
            public void _read() {
                this.valueNameSize = this._io.readU2le();
                this.dataSize = this._io.readU4le();
                this.dataOffset = this._io.readU4le();
                this.dataType = DataTypeEnum.byId(this._io.readU4le());
                this.flags = VkFlags.byId(this._io.readU2le());
                this.padding = this._io.readU2le();
                if (flags() == VkFlags.VALUE_COMP_NAME) {
                    this.valueName = new String(this._io.readBytes(valueNameSize()), StandardCharsets.US_ASCII);
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (flags() == VkFlags.VALUE_COMP_NAME) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU2le(this.valueNameSize);
                this._io.writeU4le(this.dataSize);
                this._io.writeU4le(this.dataOffset);
                this._io.writeU4le(((Number) (this.dataType.id())).longValue());
                this._io.writeU2le(((Number) (this.flags.id())).intValue());
                this._io.writeU2le(this.padding);
                if (flags() == VkFlags.VALUE_COMP_NAME) {
                    this._io.writeBytes((this.valueName).getBytes(Charset.forName("ASCII")));
                }
            }

            public void _check() {
                if (flags() == VkFlags.VALUE_COMP_NAME) {
                    if ((this.valueName).getBytes(Charset.forName("ASCII")).length != valueNameSize())
                        throw new ConsistencyError("value_name", valueNameSize(), (this.valueName).getBytes(Charset.forName("ASCII")).length);
                }
                _dirty = false;
            }
            private int valueNameSize;
            private long dataSize;
            private long dataOffset;
            private DataTypeEnum dataType;
            private VkFlags flags;
            private int padding;
            private String valueName;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int valueNameSize() { return valueNameSize; }
            public void setValueNameSize(int _v) { _dirty = true; valueNameSize = _v; }
            public long dataSize() { return dataSize; }
            public void setDataSize(long _v) { _dirty = true; dataSize = _v; }
            public long dataOffset() { return dataOffset; }
            public void setDataOffset(long _v) { _dirty = true; dataOffset = _v; }
            public DataTypeEnum dataType() { return dataType; }
            public void setDataType(DataTypeEnum _v) { _dirty = true; dataType = _v; }
            public VkFlags flags() { return flags; }
            public void setFlags(VkFlags _v) { _dirty = true; flags = _v; }
            public int padding() { return padding; }
            public void setPadding(int _v) { _dirty = true; padding = _v; }
            public String valueName() { return valueName; }
            public void setValueName(String _v) { _dirty = true; valueName = _v; }
            public Regf _root() { return _root; }
            public void set_root(Regf _v) { _dirty = true; _root = _v; }
            public Regf.HiveBinCell _parent() { return _parent; }
            public void set_parent(Regf.HiveBinCell _v) { _dirty = true; _parent = _v; }
        }
        private Integer cellSize;
        public Integer cellSize() {
            if (this.cellSize != null)
                return this.cellSize;
            this.cellSize = ((Number) ((cellSizeRaw() < 0 ? -1 : 1) * cellSizeRaw())).intValue();
            return this.cellSize;
        }
        public void _invalidateCellSize() { this.cellSize = null; }
        private Boolean isAllocated;
        public Boolean isAllocated() {
            if (this.isAllocated != null)
                return this.isAllocated;
            this.isAllocated = cellSizeRaw() < 0;
            return this.isAllocated;
        }
        public void _invalidateIsAllocated() { this.isAllocated = null; }
        private int cellSizeRaw;
        private String identifier;
        private Object data;
        private Regf _root;
        private Regf.HiveBin _parent;
        private byte[] _raw_data;
        public int cellSizeRaw() { return cellSizeRaw; }
        public void setCellSizeRaw(int _v) { _dirty = true; cellSizeRaw = _v; }
        public String identifier() { return identifier; }
        public void setIdentifier(String _v) { _dirty = true; identifier = _v; }
        public Object data() { return data; }
        public void setData(Object _v) { _dirty = true; data = _v; }
        public Regf _root() { return _root; }
        public void set_root(Regf _v) { _dirty = true; _root = _v; }
        public Regf.HiveBin _parent() { return _parent; }
        public void set_parent(Regf.HiveBin _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class HiveBinHeader extends KaitaiStruct.ReadWrite {
        public static HiveBinHeader fromFile(String fileName) throws IOException {
            return new HiveBinHeader(new ByteBufferKaitaiStream(fileName));
        }
        public HiveBinHeader() {
            this(null, null, null);
        }

        public HiveBinHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HiveBinHeader(KaitaiStream _io, Regf.HiveBin _parent) {
            this(_io, _parent, null);
        }

        public HiveBinHeader(KaitaiStream _io, Regf.HiveBin _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(this.signature, new byte[] { 104, 98, 105, 110 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 104, 98, 105, 110 }, this.signature, this._io, "/types/hive_bin_header/seq/0");
            }
            this.offset = this._io.readU4le();
            this.size = this._io.readU4le();
            this.unknown1 = this._io.readU4le();
            this.unknown2 = this._io.readU4le();
            this.timestamp = new Filetime(this._io, this, _root);
            this.timestamp._read();
            this.unknown4 = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.timestamp._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.signature);
            this._io.writeU4le(this.offset);
            this._io.writeU4le(this.size);
            this._io.writeU4le(this.unknown1);
            this._io.writeU4le(this.unknown2);
            this.timestamp._write_Seq(this._io);
            this._io.writeU4le(this.unknown4);
        }

        public void _check() {
            if (this.signature.length != 4)
                throw new ConsistencyError("signature", 4, this.signature.length);
            if (!(Arrays.equals(this.signature, new byte[] { 104, 98, 105, 110 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 104, 98, 105, 110 }, this.signature, null, "/types/hive_bin_header/seq/0");
            }
            if (!Objects.equals(this.timestamp._root(), _root()))
                throw new ConsistencyError("timestamp", _root(), this.timestamp._root());
            if (!Objects.equals(this.timestamp._parent(), this))
                throw new ConsistencyError("timestamp", this, this.timestamp._parent());
            _dirty = false;
        }
        private byte[] signature;
        private long offset;
        private long size;
        private long unknown1;
        private long unknown2;
        private Filetime timestamp;
        private long unknown4;
        private Regf _root;
        private Regf.HiveBin _parent;
        public byte[] signature() { return signature; }
        public void setSignature(byte[] _v) { _dirty = true; signature = _v; }

        /**
         * The offset of the hive bin, Value in bytes and relative from
         * the start of the hive bin data
         */
        public long offset() { return offset; }
        public void setOffset(long _v) { _dirty = true; offset = _v; }

        /**
         * Size of the hive bin
         */
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }

        /**
         * 0 most of the time, can contain remnant data
         */
        public long unknown1() { return unknown1; }
        public void setUnknown1(long _v) { _dirty = true; unknown1 = _v; }

        /**
         * 0 most of the time, can contain remnant data
         */
        public long unknown2() { return unknown2; }
        public void setUnknown2(long _v) { _dirty = true; unknown2 = _v; }

        /**
         * Only the root (first) hive bin seems to contain a valid FILETIME
         */
        public Filetime timestamp() { return timestamp; }
        public void setTimestamp(Filetime _v) { _dirty = true; timestamp = _v; }

        /**
         * Contains number of bytes
         */
        public long unknown4() { return unknown4; }
        public void setUnknown4(long _v) { _dirty = true; unknown4 = _v; }
        public Regf _root() { return _root; }
        public void set_root(Regf _v) { _dirty = true; _root = _v; }
        public Regf.HiveBin _parent() { return _parent; }
        public void set_parent(Regf.HiveBin _v) { _dirty = true; _parent = _v; }
    }
    private FileHeader header;
    private List<HiveBin> hiveBins;
    private Regf _root;
    private KaitaiStruct.ReadWrite _parent;
    private List<byte[]> _raw_hiveBins;
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }
    public List<HiveBin> hiveBins() { return hiveBins; }
    public void setHiveBins(List<HiveBin> _v) { _dirty = true; hiveBins = _v; }
    public Regf _root() { return _root; }
    public void set_root(Regf _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public List<byte[]> _raw_hiveBins() { return _raw_hiveBins; }
    public void set_raw_HiveBins(List<byte[]> _v) { _dirty = true; _raw_hiveBins = _v; }
}
