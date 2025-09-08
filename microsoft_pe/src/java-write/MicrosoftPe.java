// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;


/**
 * @see <a href="https://learn.microsoft.com/en-us/windows/win32/debug/pe-format">Source</a>
 */
public class MicrosoftPe extends KaitaiStruct.ReadWrite {
    public static MicrosoftPe fromFile(String fileName) throws IOException {
        return new MicrosoftPe(new ByteBufferKaitaiStream(fileName));
    }

    public enum PeFormat {
        ROM_IMAGE(263),
        PE32(267),
        PE32_PLUS(523);

        private final long id;
        PeFormat(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, PeFormat> byId = new HashMap<Long, PeFormat>(3);
        static {
            for (PeFormat e : PeFormat.values())
                byId.put(e.id(), e);
        }
        public static PeFormat byId(long id) { return byId.get(id); }
    }
    public MicrosoftPe() {
        this(null, null, null);
    }

    public MicrosoftPe(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MicrosoftPe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public MicrosoftPe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, MicrosoftPe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.mz = new MzPlaceholder(this._io, this, _root);
        this.mz._read();
        _dirty = false;
    }

    public void _fetchInstances() {
        this.mz._fetchInstances();
        pe();
        if (this.pe != null) {
            this.pe._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        _shouldWritePe = _enabledPe;
        this.mz._write_Seq(this._io);
    }

    public void _check() {
        if (!Objects.equals(this.mz._root(), _root()))
            throw new ConsistencyError("mz", _root(), this.mz._root());
        if (!Objects.equals(this.mz._parent(), this))
            throw new ConsistencyError("mz", this, this.mz._parent());
        if (_enabledPe) {
            if (!Objects.equals(this.pe._root(), _root()))
                throw new ConsistencyError("pe", _root(), this.pe._root());
            if (!Objects.equals(this.pe._parent(), this))
                throw new ConsistencyError("pe", this, this.pe._parent());
        }
        _dirty = false;
    }
    public static class Annoyingstring extends KaitaiStruct.ReadWrite {
        public static Annoyingstring fromFile(String fileName) throws IOException {
            return new Annoyingstring(new ByteBufferKaitaiStream(fileName));
        }
        public Annoyingstring() {
            this(null, null, null);
        }

        public Annoyingstring(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Annoyingstring(KaitaiStream _io, MicrosoftPe.CoffSymbol _parent) {
            this(_io, _parent, null);
        }

        public Annoyingstring(KaitaiStream _io, MicrosoftPe.CoffSymbol _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            _dirty = false;
        }

        public void _fetchInstances() {
            nameFromOffset();
            if (this.nameFromOffset != null) {
            }
            nameFromShort();
            if (this.nameFromShort != null) {
            }
            nameOffset();
            if (this.nameOffset != null) {
            }
            nameZeroes();
            if (this.nameZeroes != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteNameFromOffset = _enabledNameFromOffset;
            _shouldWriteNameFromShort = _enabledNameFromShort;
            _shouldWriteNameOffset = _enabledNameOffset;
            _shouldWriteNameZeroes = _enabledNameZeroes;
        }

        public void _check() {
            if (_enabledNameFromOffset) {
            }
            if (_enabledNameFromShort) {
            }
            if (_enabledNameOffset) {
            }
            if (_enabledNameZeroes) {
            }
            _dirty = false;
        }
        private String name;
        public String name() {
            if (this.name != null)
                return this.name;
            this.name = (nameZeroes() == 0 ? nameFromOffset() : nameFromShort());
            return this.name;
        }
        public void _invalidateName() { this.name = null; }
        private String nameFromOffset;
        private boolean _shouldWriteNameFromOffset = false;
        private boolean _enabledNameFromOffset = true;
        public String nameFromOffset() {
            if (_shouldWriteNameFromOffset)
                _writeNameFromOffset();
            if (this.nameFromOffset != null)
                return this.nameFromOffset;
            if (!_enabledNameFromOffset)
                return null;
            if (nameZeroes() == 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((nameZeroes() == 0 ? _parent()._parent().symbolNameTableOffset() + nameOffset() : 0));
                this.nameFromOffset = new String(io.readBytesTerm((byte) 0, false, true, false), StandardCharsets.US_ASCII);
                io.seek(_pos);
            }
            return this.nameFromOffset;
        }
        public void setNameFromOffset(String _v) { _dirty = true; nameFromOffset = _v; }
        public void setNameFromOffset_Enabled(boolean _v) { _dirty = true; _enabledNameFromOffset = _v; }

        private void _writeNameFromOffset() {
            _shouldWriteNameFromOffset = false;
            if (nameZeroes() == 0) {
                KaitaiStream io = _root()._io();
                long _pos = io.pos();
                io.seek((nameZeroes() == 0 ? _parent()._parent().symbolNameTableOffset() + nameOffset() : 0));
                if (KaitaiStream.byteArrayIndexOf((this.nameFromOffset).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name_from_offset", -1, KaitaiStream.byteArrayIndexOf((this.nameFromOffset).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                io.writeBytes((this.nameFromOffset).getBytes(Charset.forName("ASCII")));
                if (!(io.isEof())) {
                    io.writeU1(0);
                }
                io.seek(_pos);
            }
        }
        private String nameFromShort;
        private boolean _shouldWriteNameFromShort = false;
        private boolean _enabledNameFromShort = true;
        public String nameFromShort() {
            if (_shouldWriteNameFromShort)
                _writeNameFromShort();
            if (this.nameFromShort != null)
                return this.nameFromShort;
            if (!_enabledNameFromShort)
                return null;
            if (nameZeroes() != 0) {
                long _pos = this._io.pos();
                this._io.seek(0);
                this.nameFromShort = new String(this._io.readBytesTerm((byte) 0, false, true, false), StandardCharsets.US_ASCII);
                this._io.seek(_pos);
            }
            return this.nameFromShort;
        }
        public void setNameFromShort(String _v) { _dirty = true; nameFromShort = _v; }
        public void setNameFromShort_Enabled(boolean _v) { _dirty = true; _enabledNameFromShort = _v; }

        private void _writeNameFromShort() {
            _shouldWriteNameFromShort = false;
            if (nameZeroes() != 0) {
                long _pos = this._io.pos();
                this._io.seek(0);
                if (KaitaiStream.byteArrayIndexOf((this.nameFromShort).getBytes(Charset.forName("ASCII")), ((byte) 0)) != -1)
                    throw new ConsistencyError("name_from_short", -1, KaitaiStream.byteArrayIndexOf((this.nameFromShort).getBytes(Charset.forName("ASCII")), ((byte) 0)));
                this._io.writeBytes((this.nameFromShort).getBytes(Charset.forName("ASCII")));
                if (!(this._io.isEof())) {
                    this._io.writeU1(0);
                }
                this._io.seek(_pos);
            }
        }
        private Long nameOffset;
        private boolean _shouldWriteNameOffset = false;
        private boolean _enabledNameOffset = true;
        public Long nameOffset() {
            if (_shouldWriteNameOffset)
                _writeNameOffset();
            if (this.nameOffset != null)
                return this.nameOffset;
            if (!_enabledNameOffset)
                return null;
            long _pos = this._io.pos();
            this._io.seek(4);
            this.nameOffset = this._io.readU4le();
            this._io.seek(_pos);
            return this.nameOffset;
        }
        public void setNameOffset(long _v) { _dirty = true; nameOffset = _v; }
        public void setNameOffset_Enabled(boolean _v) { _dirty = true; _enabledNameOffset = _v; }

        private void _writeNameOffset() {
            _shouldWriteNameOffset = false;
            long _pos = this._io.pos();
            this._io.seek(4);
            this._io.writeU4le(this.nameOffset);
            this._io.seek(_pos);
        }
        private Long nameZeroes;
        private boolean _shouldWriteNameZeroes = false;
        private boolean _enabledNameZeroes = true;
        public Long nameZeroes() {
            if (_shouldWriteNameZeroes)
                _writeNameZeroes();
            if (this.nameZeroes != null)
                return this.nameZeroes;
            if (!_enabledNameZeroes)
                return null;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.nameZeroes = this._io.readU4le();
            this._io.seek(_pos);
            return this.nameZeroes;
        }
        public void setNameZeroes(long _v) { _dirty = true; nameZeroes = _v; }
        public void setNameZeroes_Enabled(boolean _v) { _dirty = true; _enabledNameZeroes = _v; }

        private void _writeNameZeroes() {
            _shouldWriteNameZeroes = false;
            long _pos = this._io.pos();
            this._io.seek(0);
            this._io.writeU4le(this.nameZeroes);
            this._io.seek(_pos);
        }
        private MicrosoftPe _root;
        private MicrosoftPe.CoffSymbol _parent;
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.CoffSymbol _parent() { return _parent; }
        public void set_parent(MicrosoftPe.CoffSymbol _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/debug/pe-format#the-attribute-certificate-table-image-only">Source</a>
     */
    public static class CertificateEntry extends KaitaiStruct.ReadWrite {
        public static CertificateEntry fromFile(String fileName) throws IOException {
            return new CertificateEntry(new ByteBufferKaitaiStream(fileName));
        }

        public enum CertificateRevision {
            REVISION_1_0(256),
            REVISION_2_0(512);

            private final long id;
            CertificateRevision(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CertificateRevision> byId = new HashMap<Long, CertificateRevision>(2);
            static {
                for (CertificateRevision e : CertificateRevision.values())
                    byId.put(e.id(), e);
            }
            public static CertificateRevision byId(long id) { return byId.get(id); }
        }

        public enum CertificateTypeEnum {
            X509(1),
            PKCS_SIGNED_DATA(2),
            RESERVED_1(3),
            TS_STACK_SIGNED(4);

            private final long id;
            CertificateTypeEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, CertificateTypeEnum> byId = new HashMap<Long, CertificateTypeEnum>(4);
            static {
                for (CertificateTypeEnum e : CertificateTypeEnum.values())
                    byId.put(e.id(), e);
            }
            public static CertificateTypeEnum byId(long id) { return byId.get(id); }
        }
        public CertificateEntry() {
            this(null, null, null);
        }

        public CertificateEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CertificateEntry(KaitaiStream _io, MicrosoftPe.CertificateTable _parent) {
            this(_io, _parent, null);
        }

        public CertificateEntry(KaitaiStream _io, MicrosoftPe.CertificateTable _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.length = this._io.readU4le();
            this.revision = CertificateRevision.byId(this._io.readU2le());
            this.certificateType = CertificateTypeEnum.byId(this._io.readU2le());
            this.certificateBytes = this._io.readBytes(length() - 8);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.length);
            this._io.writeU2le(((Number) (this.revision.id())).intValue());
            this._io.writeU2le(((Number) (this.certificateType.id())).intValue());
            this._io.writeBytes(this.certificateBytes);
        }

        public void _check() {
            if (this.certificateBytes.length != length() - 8)
                throw new ConsistencyError("certificate_bytes", length() - 8, this.certificateBytes.length);
            _dirty = false;
        }
        private long length;
        private CertificateRevision revision;
        private CertificateTypeEnum certificateType;
        private byte[] certificateBytes;
        private MicrosoftPe _root;
        private MicrosoftPe.CertificateTable _parent;

        /**
         * Specifies the length of the attribute certificate entry.
         */
        public long length() { return length; }
        public void setLength(long _v) { _dirty = true; length = _v; }

        /**
         * Contains the certificate version number.
         */
        public CertificateRevision revision() { return revision; }
        public void setRevision(CertificateRevision _v) { _dirty = true; revision = _v; }

        /**
         * Specifies the type of content in bCertificate
         */
        public CertificateTypeEnum certificateType() { return certificateType; }
        public void setCertificateType(CertificateTypeEnum _v) { _dirty = true; certificateType = _v; }

        /**
         * Contains a certificate, such as an Authenticode signature.
         */
        public byte[] certificateBytes() { return certificateBytes; }
        public void setCertificateBytes(byte[] _v) { _dirty = true; certificateBytes = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.CertificateTable _parent() { return _parent; }
        public void set_parent(MicrosoftPe.CertificateTable _v) { _dirty = true; _parent = _v; }
    }
    public static class CertificateTable extends KaitaiStruct.ReadWrite {
        public static CertificateTable fromFile(String fileName) throws IOException {
            return new CertificateTable(new ByteBufferKaitaiStream(fileName));
        }
        public CertificateTable() {
            this(null, null, null);
        }

        public CertificateTable(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CertificateTable(KaitaiStream _io, MicrosoftPe.PeHeader _parent) {
            this(_io, _parent, null);
        }

        public CertificateTable(KaitaiStream _io, MicrosoftPe.PeHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.items = new ArrayList<CertificateEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    CertificateEntry _t_items = new CertificateEntry(this._io, this, _root);
                    try {
                        _t_items._read();
                    } finally {
                        this.items.add(_t_items);
                    }
                    i++;
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
            for (int i = 0; i < this.items.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
                this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("items", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.items.size(); i++) {
                if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<CertificateEntry> items;
        private MicrosoftPe _root;
        private MicrosoftPe.PeHeader _parent;
        public List<CertificateEntry> items() { return items; }
        public void setItems(List<CertificateEntry> _v) { _dirty = true; items = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.PeHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.PeHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see "3.3. COFF File Header (Object and Image)"
     */
    public static class CoffHeader extends KaitaiStruct.ReadWrite {
        public static CoffHeader fromFile(String fileName) throws IOException {
            return new CoffHeader(new ByteBufferKaitaiStream(fileName));
        }

        public enum MachineType {
            UNKNOWN(0),
            I386(332),
            R4000(358),
            WCE_MIPS_V2(361),
            ALPHA(388),
            SH3(418),
            SH3_DSP(419),
            SH4(422),
            SH5(424),
            ARM(448),
            THUMB(450),
            ARM_NT(452),
            AM33(467),
            POWERPC(496),
            POWERPC_FP(497),
            IA64(512),
            MIPS16(614),
            ALPHA64_OR_AXP64(644),
            MIPS_FPU(870),
            MIPS16_FPU(1126),
            EBC(3772),
            RISCV32(20530),
            RISCV64(20580),
            RISCV128(20776),
            LOONGARCH32(25138),
            LOONGARCH64(25188),
            AMD64(34404),
            M32R(36929),
            ARM64(43620);

            private final long id;
            MachineType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MachineType> byId = new HashMap<Long, MachineType>(29);
            static {
                for (MachineType e : MachineType.values())
                    byId.put(e.id(), e);
            }
            public static MachineType byId(long id) { return byId.get(id); }
        }
        public CoffHeader() {
            this(null, null, null);
        }

        public CoffHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CoffHeader(KaitaiStream _io, MicrosoftPe.PeHeader _parent) {
            this(_io, _parent, null);
        }

        public CoffHeader(KaitaiStream _io, MicrosoftPe.PeHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.machine = MachineType.byId(this._io.readU2le());
            this.numberOfSections = this._io.readU2le();
            this.timeDateStamp = this._io.readU4le();
            this.pointerToSymbolTable = this._io.readU4le();
            this.numberOfSymbols = this._io.readU4le();
            this.sizeOfOptionalHeader = this._io.readU2le();
            this.characteristics = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
            symbolNameTableSize();
            if (this.symbolNameTableSize != null) {
            }
            symbolTable();
            if (this.symbolTable != null) {
                for (int i = 0; i < this.symbolTable.size(); i++) {
                    this.symbolTable.get(((Number) (i)).intValue())._fetchInstances();
                }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteSymbolNameTableSize = _enabledSymbolNameTableSize;
            _shouldWriteSymbolTable = _enabledSymbolTable;
            this._io.writeU2le(((Number) (this.machine.id())).intValue());
            this._io.writeU2le(this.numberOfSections);
            this._io.writeU4le(this.timeDateStamp);
            this._io.writeU4le(this.pointerToSymbolTable);
            this._io.writeU4le(this.numberOfSymbols);
            this._io.writeU2le(this.sizeOfOptionalHeader);
            this._io.writeU2le(this.characteristics);
        }

        public void _check() {
            if (_enabledSymbolNameTableSize) {
            }
            if (_enabledSymbolTable) {
                if (this.symbolTable.size() != numberOfSymbols())
                    throw new ConsistencyError("symbol_table", numberOfSymbols(), this.symbolTable.size());
                for (int i = 0; i < this.symbolTable.size(); i++) {
                    if (!Objects.equals(this.symbolTable.get(((Number) (i)).intValue())._root(), _root()))
                        throw new ConsistencyError("symbol_table", _root(), this.symbolTable.get(((Number) (i)).intValue())._root());
                    if (!Objects.equals(this.symbolTable.get(((Number) (i)).intValue())._parent(), this))
                        throw new ConsistencyError("symbol_table", this, this.symbolTable.get(((Number) (i)).intValue())._parent());
                }
            }
            _dirty = false;
        }
        private Integer symbolNameTableOffset;
        public Integer symbolNameTableOffset() {
            if (this.symbolNameTableOffset != null)
                return this.symbolNameTableOffset;
            this.symbolNameTableOffset = ((Number) (pointerToSymbolTable() + symbolTableSize())).intValue();
            return this.symbolNameTableOffset;
        }
        public void _invalidateSymbolNameTableOffset() { this.symbolNameTableOffset = null; }
        private Long symbolNameTableSize;
        private boolean _shouldWriteSymbolNameTableSize = false;
        private boolean _enabledSymbolNameTableSize = true;
        public Long symbolNameTableSize() {
            if (_shouldWriteSymbolNameTableSize)
                _writeSymbolNameTableSize();
            if (this.symbolNameTableSize != null)
                return this.symbolNameTableSize;
            if (!_enabledSymbolNameTableSize)
                return null;
            long _pos = this._io.pos();
            this._io.seek(symbolNameTableOffset());
            this.symbolNameTableSize = this._io.readU4le();
            this._io.seek(_pos);
            return this.symbolNameTableSize;
        }
        public void setSymbolNameTableSize(long _v) { _dirty = true; symbolNameTableSize = _v; }
        public void setSymbolNameTableSize_Enabled(boolean _v) { _dirty = true; _enabledSymbolNameTableSize = _v; }

        private void _writeSymbolNameTableSize() {
            _shouldWriteSymbolNameTableSize = false;
            long _pos = this._io.pos();
            this._io.seek(symbolNameTableOffset());
            this._io.writeU4le(this.symbolNameTableSize);
            this._io.seek(_pos);
        }
        private List<CoffSymbol> symbolTable;
        private boolean _shouldWriteSymbolTable = false;
        private boolean _enabledSymbolTable = true;
        public List<CoffSymbol> symbolTable() {
            if (_shouldWriteSymbolTable)
                _writeSymbolTable();
            if (this.symbolTable != null)
                return this.symbolTable;
            if (!_enabledSymbolTable)
                return null;
            long _pos = this._io.pos();
            this._io.seek(pointerToSymbolTable());
            this.symbolTable = new ArrayList<CoffSymbol>();
            for (int i = 0; i < numberOfSymbols(); i++) {
                CoffSymbol _t_symbolTable = new CoffSymbol(this._io, this, _root);
                try {
                    _t_symbolTable._read();
                } finally {
                    this.symbolTable.add(_t_symbolTable);
                }
            }
            this._io.seek(_pos);
            return this.symbolTable;
        }
        public void setSymbolTable(List<CoffSymbol> _v) { _dirty = true; symbolTable = _v; }
        public void setSymbolTable_Enabled(boolean _v) { _dirty = true; _enabledSymbolTable = _v; }

        private void _writeSymbolTable() {
            _shouldWriteSymbolTable = false;
            long _pos = this._io.pos();
            this._io.seek(pointerToSymbolTable());
            for (int i = 0; i < this.symbolTable.size(); i++) {
                this.symbolTable.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            this._io.seek(_pos);
        }
        private Integer symbolTableSize;
        public Integer symbolTableSize() {
            if (this.symbolTableSize != null)
                return this.symbolTableSize;
            this.symbolTableSize = ((Number) (numberOfSymbols() * 18)).intValue();
            return this.symbolTableSize;
        }
        public void _invalidateSymbolTableSize() { this.symbolTableSize = null; }
        private MachineType machine;
        private int numberOfSections;
        private long timeDateStamp;
        private long pointerToSymbolTable;
        private long numberOfSymbols;
        private int sizeOfOptionalHeader;
        private int characteristics;
        private MicrosoftPe _root;
        private MicrosoftPe.PeHeader _parent;
        public MachineType machine() { return machine; }
        public void setMachine(MachineType _v) { _dirty = true; machine = _v; }
        public int numberOfSections() { return numberOfSections; }
        public void setNumberOfSections(int _v) { _dirty = true; numberOfSections = _v; }
        public long timeDateStamp() { return timeDateStamp; }
        public void setTimeDateStamp(long _v) { _dirty = true; timeDateStamp = _v; }
        public long pointerToSymbolTable() { return pointerToSymbolTable; }
        public void setPointerToSymbolTable(long _v) { _dirty = true; pointerToSymbolTable = _v; }
        public long numberOfSymbols() { return numberOfSymbols; }
        public void setNumberOfSymbols(long _v) { _dirty = true; numberOfSymbols = _v; }
        public int sizeOfOptionalHeader() { return sizeOfOptionalHeader; }
        public void setSizeOfOptionalHeader(int _v) { _dirty = true; sizeOfOptionalHeader = _v; }
        public int characteristics() { return characteristics; }
        public void setCharacteristics(int _v) { _dirty = true; characteristics = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.PeHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.PeHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class CoffSymbol extends KaitaiStruct.ReadWrite {
        public static CoffSymbol fromFile(String fileName) throws IOException {
            return new CoffSymbol(new ByteBufferKaitaiStream(fileName));
        }
        public CoffSymbol() {
            this(null, null, null);
        }

        public CoffSymbol(KaitaiStream _io) {
            this(_io, null, null);
        }

        public CoffSymbol(KaitaiStream _io, MicrosoftPe.CoffHeader _parent) {
            this(_io, _parent, null);
        }

        public CoffSymbol(KaitaiStream _io, MicrosoftPe.CoffHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._raw_nameAnnoying = this._io.readBytes(8);
            KaitaiStream _io__raw_nameAnnoying = new ByteBufferKaitaiStream(this._raw_nameAnnoying);
            this.nameAnnoying = new Annoyingstring(_io__raw_nameAnnoying, this, _root);
            this.nameAnnoying._read();
            this.value = this._io.readU4le();
            this.sectionNumber = this._io.readU2le();
            this.type = this._io.readU2le();
            this.storageClass = this._io.readU1();
            this.numberOfAuxSymbols = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.nameAnnoying._fetchInstances();
            data();
            if (this.data != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteData = _enabledData;
            final KaitaiStream _io__raw_nameAnnoying = new ByteBufferKaitaiStream(8);
            this._io.addChildStream(_io__raw_nameAnnoying);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (8));
                final CoffSymbol _this = this;
                _io__raw_nameAnnoying.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_nameAnnoying = _io__raw_nameAnnoying.toByteArray();
                        if (_this._raw_nameAnnoying.length != 8)
                            throw new ConsistencyError("raw(name_annoying)", 8, _this._raw_nameAnnoying.length);
                        parent.writeBytes(_this._raw_nameAnnoying);
                    }
                });
            }
            this.nameAnnoying._write_Seq(_io__raw_nameAnnoying);
            this._io.writeU4le(this.value);
            this._io.writeU2le(this.sectionNumber);
            this._io.writeU2le(this.type);
            this._io.writeU1(this.storageClass);
            this._io.writeU1(this.numberOfAuxSymbols);
        }

        public void _check() {
            if (!Objects.equals(this.nameAnnoying._root(), _root()))
                throw new ConsistencyError("name_annoying", _root(), this.nameAnnoying._root());
            if (!Objects.equals(this.nameAnnoying._parent(), this))
                throw new ConsistencyError("name_annoying", this, this.nameAnnoying._parent());
            if (_enabledData) {
                if (this.data.length != 1)
                    throw new ConsistencyError("data", 1, this.data.length);
            }
            _dirty = false;
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
            long _pos = this._io.pos();
            this._io.seek(section().pointerToRawData() + value());
            this.data = this._io.readBytes(1);
            this._io.seek(_pos);
            return this.data;
        }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public void setData_Enabled(boolean _v) { _dirty = true; _enabledData = _v; }

        private void _writeData() {
            _shouldWriteData = false;
            long _pos = this._io.pos();
            this._io.seek(section().pointerToRawData() + value());
            this._io.writeBytes(this.data);
            this._io.seek(_pos);
        }
        private Section section;
        public Section section() {
            if (this.section != null)
                return this.section;
            this.section = _root().pe().sections().get(((Number) (sectionNumber() - 1)).intValue());
            return this.section;
        }
        public void _invalidateSection() { this.section = null; }
        private Annoyingstring nameAnnoying;
        private long value;
        private int sectionNumber;
        private int type;
        private int storageClass;
        private int numberOfAuxSymbols;
        private MicrosoftPe _root;
        private MicrosoftPe.CoffHeader _parent;
        private byte[] _raw_nameAnnoying;
        public Annoyingstring nameAnnoying() { return nameAnnoying; }
        public void setNameAnnoying(Annoyingstring _v) { _dirty = true; nameAnnoying = _v; }
        public long value() { return value; }
        public void setValue(long _v) { _dirty = true; value = _v; }
        public int sectionNumber() { return sectionNumber; }
        public void setSectionNumber(int _v) { _dirty = true; sectionNumber = _v; }
        public int type() { return type; }
        public void setType(int _v) { _dirty = true; type = _v; }
        public int storageClass() { return storageClass; }
        public void setStorageClass(int _v) { _dirty = true; storageClass = _v; }
        public int numberOfAuxSymbols() { return numberOfAuxSymbols; }
        public void setNumberOfAuxSymbols(int _v) { _dirty = true; numberOfAuxSymbols = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.CoffHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.CoffHeader _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_nameAnnoying() { return _raw_nameAnnoying; }
        public void set_raw_NameAnnoying(byte[] _v) { _dirty = true; _raw_nameAnnoying = _v; }
    }
    public static class DataDir extends KaitaiStruct.ReadWrite {
        public static DataDir fromFile(String fileName) throws IOException {
            return new DataDir(new ByteBufferKaitaiStream(fileName));
        }
        public DataDir() {
            this(null, null, null);
        }

        public DataDir(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataDir(KaitaiStream _io, MicrosoftPe.OptionalHeaderDataDirs _parent) {
            this(_io, _parent, null);
        }

        public DataDir(KaitaiStream _io, MicrosoftPe.OptionalHeaderDataDirs _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.virtualAddress = this._io.readU4le();
            this.size = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.virtualAddress);
            this._io.writeU4le(this.size);
        }

        public void _check() {
            _dirty = false;
        }
        private long virtualAddress;
        private long size;
        private MicrosoftPe _root;
        private MicrosoftPe.OptionalHeaderDataDirs _parent;
        public long virtualAddress() { return virtualAddress; }
        public void setVirtualAddress(long _v) { _dirty = true; virtualAddress = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.OptionalHeaderDataDirs _parent() { return _parent; }
        public void set_parent(MicrosoftPe.OptionalHeaderDataDirs _v) { _dirty = true; _parent = _v; }
    }
    public static class MzPlaceholder extends KaitaiStruct.ReadWrite {
        public static MzPlaceholder fromFile(String fileName) throws IOException {
            return new MzPlaceholder(new ByteBufferKaitaiStream(fileName));
        }
        public MzPlaceholder() {
            this(null, null, null);
        }

        public MzPlaceholder(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MzPlaceholder(KaitaiStream _io, MicrosoftPe _parent) {
            this(_io, _parent, null);
        }

        public MzPlaceholder(KaitaiStream _io, MicrosoftPe _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 90 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 90 }, this.magic, this._io, "/types/mz_placeholder/seq/0");
            }
            this.data1 = this._io.readBytes(58);
            this.ofsPe = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeBytes(this.data1);
            this._io.writeU4le(this.ofsPe);
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 77, 90 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 90 }, this.magic, null, "/types/mz_placeholder/seq/0");
            }
            if (this.data1.length != 58)
                throw new ConsistencyError("data1", 58, this.data1.length);
            _dirty = false;
        }
        private byte[] magic;
        private byte[] data1;
        private long ofsPe;
        private MicrosoftPe _root;
        private MicrosoftPe _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public byte[] data1() { return data1; }
        public void setData1(byte[] _v) { _dirty = true; data1 = _v; }

        /**
         * In PE file, an offset to PE header
         */
        public long ofsPe() { return ofsPe; }
        public void setOfsPe(long _v) { _dirty = true; ofsPe = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe _parent() { return _parent; }
        public void set_parent(MicrosoftPe _v) { _dirty = true; _parent = _v; }
    }
    public static class OptionalHeader extends KaitaiStruct.ReadWrite {
        public static OptionalHeader fromFile(String fileName) throws IOException {
            return new OptionalHeader(new ByteBufferKaitaiStream(fileName));
        }
        public OptionalHeader() {
            this(null, null, null);
        }

        public OptionalHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionalHeader(KaitaiStream _io, MicrosoftPe.PeHeader _parent) {
            this(_io, _parent, null);
        }

        public OptionalHeader(KaitaiStream _io, MicrosoftPe.PeHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.std = new OptionalHeaderStd(this._io, this, _root);
            this.std._read();
            this.windows = new OptionalHeaderWindows(this._io, this, _root);
            this.windows._read();
            this.dataDirs = new OptionalHeaderDataDirs(this._io, this, _root);
            this.dataDirs._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.std._fetchInstances();
            this.windows._fetchInstances();
            this.dataDirs._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.std._write_Seq(this._io);
            this.windows._write_Seq(this._io);
            this.dataDirs._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.std._root(), _root()))
                throw new ConsistencyError("std", _root(), this.std._root());
            if (!Objects.equals(this.std._parent(), this))
                throw new ConsistencyError("std", this, this.std._parent());
            if (!Objects.equals(this.windows._root(), _root()))
                throw new ConsistencyError("windows", _root(), this.windows._root());
            if (!Objects.equals(this.windows._parent(), this))
                throw new ConsistencyError("windows", this, this.windows._parent());
            if (!Objects.equals(this.dataDirs._root(), _root()))
                throw new ConsistencyError("data_dirs", _root(), this.dataDirs._root());
            if (!Objects.equals(this.dataDirs._parent(), this))
                throw new ConsistencyError("data_dirs", this, this.dataDirs._parent());
            _dirty = false;
        }
        private OptionalHeaderStd std;
        private OptionalHeaderWindows windows;
        private OptionalHeaderDataDirs dataDirs;
        private MicrosoftPe _root;
        private MicrosoftPe.PeHeader _parent;
        public OptionalHeaderStd std() { return std; }
        public void setStd(OptionalHeaderStd _v) { _dirty = true; std = _v; }
        public OptionalHeaderWindows windows() { return windows; }
        public void setWindows(OptionalHeaderWindows _v) { _dirty = true; windows = _v; }
        public OptionalHeaderDataDirs dataDirs() { return dataDirs; }
        public void setDataDirs(OptionalHeaderDataDirs _v) { _dirty = true; dataDirs = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.PeHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.PeHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class OptionalHeaderDataDirs extends KaitaiStruct.ReadWrite {
        public static OptionalHeaderDataDirs fromFile(String fileName) throws IOException {
            return new OptionalHeaderDataDirs(new ByteBufferKaitaiStream(fileName));
        }
        public OptionalHeaderDataDirs() {
            this(null, null, null);
        }

        public OptionalHeaderDataDirs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionalHeaderDataDirs(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent) {
            this(_io, _parent, null);
        }

        public OptionalHeaderDataDirs(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.exportTable = new DataDir(this._io, this, _root);
            this.exportTable._read();
            this.importTable = new DataDir(this._io, this, _root);
            this.importTable._read();
            this.resourceTable = new DataDir(this._io, this, _root);
            this.resourceTable._read();
            this.exceptionTable = new DataDir(this._io, this, _root);
            this.exceptionTable._read();
            this.certificateTable = new DataDir(this._io, this, _root);
            this.certificateTable._read();
            this.baseRelocationTable = new DataDir(this._io, this, _root);
            this.baseRelocationTable._read();
            this.debug = new DataDir(this._io, this, _root);
            this.debug._read();
            this.architecture = new DataDir(this._io, this, _root);
            this.architecture._read();
            this.globalPtr = new DataDir(this._io, this, _root);
            this.globalPtr._read();
            this.tlsTable = new DataDir(this._io, this, _root);
            this.tlsTable._read();
            this.loadConfigTable = new DataDir(this._io, this, _root);
            this.loadConfigTable._read();
            this.boundImport = new DataDir(this._io, this, _root);
            this.boundImport._read();
            this.iat = new DataDir(this._io, this, _root);
            this.iat._read();
            this.delayImportDescriptor = new DataDir(this._io, this, _root);
            this.delayImportDescriptor._read();
            this.clrRuntimeHeader = new DataDir(this._io, this, _root);
            this.clrRuntimeHeader._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.exportTable._fetchInstances();
            this.importTable._fetchInstances();
            this.resourceTable._fetchInstances();
            this.exceptionTable._fetchInstances();
            this.certificateTable._fetchInstances();
            this.baseRelocationTable._fetchInstances();
            this.debug._fetchInstances();
            this.architecture._fetchInstances();
            this.globalPtr._fetchInstances();
            this.tlsTable._fetchInstances();
            this.loadConfigTable._fetchInstances();
            this.boundImport._fetchInstances();
            this.iat._fetchInstances();
            this.delayImportDescriptor._fetchInstances();
            this.clrRuntimeHeader._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.exportTable._write_Seq(this._io);
            this.importTable._write_Seq(this._io);
            this.resourceTable._write_Seq(this._io);
            this.exceptionTable._write_Seq(this._io);
            this.certificateTable._write_Seq(this._io);
            this.baseRelocationTable._write_Seq(this._io);
            this.debug._write_Seq(this._io);
            this.architecture._write_Seq(this._io);
            this.globalPtr._write_Seq(this._io);
            this.tlsTable._write_Seq(this._io);
            this.loadConfigTable._write_Seq(this._io);
            this.boundImport._write_Seq(this._io);
            this.iat._write_Seq(this._io);
            this.delayImportDescriptor._write_Seq(this._io);
            this.clrRuntimeHeader._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.exportTable._root(), _root()))
                throw new ConsistencyError("export_table", _root(), this.exportTable._root());
            if (!Objects.equals(this.exportTable._parent(), this))
                throw new ConsistencyError("export_table", this, this.exportTable._parent());
            if (!Objects.equals(this.importTable._root(), _root()))
                throw new ConsistencyError("import_table", _root(), this.importTable._root());
            if (!Objects.equals(this.importTable._parent(), this))
                throw new ConsistencyError("import_table", this, this.importTable._parent());
            if (!Objects.equals(this.resourceTable._root(), _root()))
                throw new ConsistencyError("resource_table", _root(), this.resourceTable._root());
            if (!Objects.equals(this.resourceTable._parent(), this))
                throw new ConsistencyError("resource_table", this, this.resourceTable._parent());
            if (!Objects.equals(this.exceptionTable._root(), _root()))
                throw new ConsistencyError("exception_table", _root(), this.exceptionTable._root());
            if (!Objects.equals(this.exceptionTable._parent(), this))
                throw new ConsistencyError("exception_table", this, this.exceptionTable._parent());
            if (!Objects.equals(this.certificateTable._root(), _root()))
                throw new ConsistencyError("certificate_table", _root(), this.certificateTable._root());
            if (!Objects.equals(this.certificateTable._parent(), this))
                throw new ConsistencyError("certificate_table", this, this.certificateTable._parent());
            if (!Objects.equals(this.baseRelocationTable._root(), _root()))
                throw new ConsistencyError("base_relocation_table", _root(), this.baseRelocationTable._root());
            if (!Objects.equals(this.baseRelocationTable._parent(), this))
                throw new ConsistencyError("base_relocation_table", this, this.baseRelocationTable._parent());
            if (!Objects.equals(this.debug._root(), _root()))
                throw new ConsistencyError("debug", _root(), this.debug._root());
            if (!Objects.equals(this.debug._parent(), this))
                throw new ConsistencyError("debug", this, this.debug._parent());
            if (!Objects.equals(this.architecture._root(), _root()))
                throw new ConsistencyError("architecture", _root(), this.architecture._root());
            if (!Objects.equals(this.architecture._parent(), this))
                throw new ConsistencyError("architecture", this, this.architecture._parent());
            if (!Objects.equals(this.globalPtr._root(), _root()))
                throw new ConsistencyError("global_ptr", _root(), this.globalPtr._root());
            if (!Objects.equals(this.globalPtr._parent(), this))
                throw new ConsistencyError("global_ptr", this, this.globalPtr._parent());
            if (!Objects.equals(this.tlsTable._root(), _root()))
                throw new ConsistencyError("tls_table", _root(), this.tlsTable._root());
            if (!Objects.equals(this.tlsTable._parent(), this))
                throw new ConsistencyError("tls_table", this, this.tlsTable._parent());
            if (!Objects.equals(this.loadConfigTable._root(), _root()))
                throw new ConsistencyError("load_config_table", _root(), this.loadConfigTable._root());
            if (!Objects.equals(this.loadConfigTable._parent(), this))
                throw new ConsistencyError("load_config_table", this, this.loadConfigTable._parent());
            if (!Objects.equals(this.boundImport._root(), _root()))
                throw new ConsistencyError("bound_import", _root(), this.boundImport._root());
            if (!Objects.equals(this.boundImport._parent(), this))
                throw new ConsistencyError("bound_import", this, this.boundImport._parent());
            if (!Objects.equals(this.iat._root(), _root()))
                throw new ConsistencyError("iat", _root(), this.iat._root());
            if (!Objects.equals(this.iat._parent(), this))
                throw new ConsistencyError("iat", this, this.iat._parent());
            if (!Objects.equals(this.delayImportDescriptor._root(), _root()))
                throw new ConsistencyError("delay_import_descriptor", _root(), this.delayImportDescriptor._root());
            if (!Objects.equals(this.delayImportDescriptor._parent(), this))
                throw new ConsistencyError("delay_import_descriptor", this, this.delayImportDescriptor._parent());
            if (!Objects.equals(this.clrRuntimeHeader._root(), _root()))
                throw new ConsistencyError("clr_runtime_header", _root(), this.clrRuntimeHeader._root());
            if (!Objects.equals(this.clrRuntimeHeader._parent(), this))
                throw new ConsistencyError("clr_runtime_header", this, this.clrRuntimeHeader._parent());
            _dirty = false;
        }
        private DataDir exportTable;
        private DataDir importTable;
        private DataDir resourceTable;
        private DataDir exceptionTable;
        private DataDir certificateTable;
        private DataDir baseRelocationTable;
        private DataDir debug;
        private DataDir architecture;
        private DataDir globalPtr;
        private DataDir tlsTable;
        private DataDir loadConfigTable;
        private DataDir boundImport;
        private DataDir iat;
        private DataDir delayImportDescriptor;
        private DataDir clrRuntimeHeader;
        private MicrosoftPe _root;
        private MicrosoftPe.OptionalHeader _parent;
        public DataDir exportTable() { return exportTable; }
        public void setExportTable(DataDir _v) { _dirty = true; exportTable = _v; }
        public DataDir importTable() { return importTable; }
        public void setImportTable(DataDir _v) { _dirty = true; importTable = _v; }
        public DataDir resourceTable() { return resourceTable; }
        public void setResourceTable(DataDir _v) { _dirty = true; resourceTable = _v; }
        public DataDir exceptionTable() { return exceptionTable; }
        public void setExceptionTable(DataDir _v) { _dirty = true; exceptionTable = _v; }
        public DataDir certificateTable() { return certificateTable; }
        public void setCertificateTable(DataDir _v) { _dirty = true; certificateTable = _v; }
        public DataDir baseRelocationTable() { return baseRelocationTable; }
        public void setBaseRelocationTable(DataDir _v) { _dirty = true; baseRelocationTable = _v; }
        public DataDir debug() { return debug; }
        public void setDebug(DataDir _v) { _dirty = true; debug = _v; }
        public DataDir architecture() { return architecture; }
        public void setArchitecture(DataDir _v) { _dirty = true; architecture = _v; }
        public DataDir globalPtr() { return globalPtr; }
        public void setGlobalPtr(DataDir _v) { _dirty = true; globalPtr = _v; }
        public DataDir tlsTable() { return tlsTable; }
        public void setTlsTable(DataDir _v) { _dirty = true; tlsTable = _v; }
        public DataDir loadConfigTable() { return loadConfigTable; }
        public void setLoadConfigTable(DataDir _v) { _dirty = true; loadConfigTable = _v; }
        public DataDir boundImport() { return boundImport; }
        public void setBoundImport(DataDir _v) { _dirty = true; boundImport = _v; }
        public DataDir iat() { return iat; }
        public void setIat(DataDir _v) { _dirty = true; iat = _v; }
        public DataDir delayImportDescriptor() { return delayImportDescriptor; }
        public void setDelayImportDescriptor(DataDir _v) { _dirty = true; delayImportDescriptor = _v; }
        public DataDir clrRuntimeHeader() { return clrRuntimeHeader; }
        public void setClrRuntimeHeader(DataDir _v) { _dirty = true; clrRuntimeHeader = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.OptionalHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.OptionalHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class OptionalHeaderStd extends KaitaiStruct.ReadWrite {
        public static OptionalHeaderStd fromFile(String fileName) throws IOException {
            return new OptionalHeaderStd(new ByteBufferKaitaiStream(fileName));
        }
        public OptionalHeaderStd() {
            this(null, null, null);
        }

        public OptionalHeaderStd(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionalHeaderStd(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent) {
            this(_io, _parent, null);
        }

        public OptionalHeaderStd(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.format = MicrosoftPe.PeFormat.byId(this._io.readU2le());
            this.majorLinkerVersion = this._io.readU1();
            this.minorLinkerVersion = this._io.readU1();
            this.sizeOfCode = this._io.readU4le();
            this.sizeOfInitializedData = this._io.readU4le();
            this.sizeOfUninitializedData = this._io.readU4le();
            this.addressOfEntryPoint = this._io.readU4le();
            this.baseOfCode = this._io.readU4le();
            if (format() == MicrosoftPe.PeFormat.PE32) {
                this.baseOfData = this._io.readU4le();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (format() == MicrosoftPe.PeFormat.PE32) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(((Number) (this.format.id())).intValue());
            this._io.writeU1(this.majorLinkerVersion);
            this._io.writeU1(this.minorLinkerVersion);
            this._io.writeU4le(this.sizeOfCode);
            this._io.writeU4le(this.sizeOfInitializedData);
            this._io.writeU4le(this.sizeOfUninitializedData);
            this._io.writeU4le(this.addressOfEntryPoint);
            this._io.writeU4le(this.baseOfCode);
            if (format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.baseOfData);
            }
        }

        public void _check() {
            if (format() == MicrosoftPe.PeFormat.PE32) {
            }
            _dirty = false;
        }
        private PeFormat format;
        private int majorLinkerVersion;
        private int minorLinkerVersion;
        private long sizeOfCode;
        private long sizeOfInitializedData;
        private long sizeOfUninitializedData;
        private long addressOfEntryPoint;
        private long baseOfCode;
        private Long baseOfData;
        private MicrosoftPe _root;
        private MicrosoftPe.OptionalHeader _parent;
        public PeFormat format() { return format; }
        public void setFormat(PeFormat _v) { _dirty = true; format = _v; }
        public int majorLinkerVersion() { return majorLinkerVersion; }
        public void setMajorLinkerVersion(int _v) { _dirty = true; majorLinkerVersion = _v; }
        public int minorLinkerVersion() { return minorLinkerVersion; }
        public void setMinorLinkerVersion(int _v) { _dirty = true; minorLinkerVersion = _v; }
        public long sizeOfCode() { return sizeOfCode; }
        public void setSizeOfCode(long _v) { _dirty = true; sizeOfCode = _v; }
        public long sizeOfInitializedData() { return sizeOfInitializedData; }
        public void setSizeOfInitializedData(long _v) { _dirty = true; sizeOfInitializedData = _v; }
        public long sizeOfUninitializedData() { return sizeOfUninitializedData; }
        public void setSizeOfUninitializedData(long _v) { _dirty = true; sizeOfUninitializedData = _v; }
        public long addressOfEntryPoint() { return addressOfEntryPoint; }
        public void setAddressOfEntryPoint(long _v) { _dirty = true; addressOfEntryPoint = _v; }
        public long baseOfCode() { return baseOfCode; }
        public void setBaseOfCode(long _v) { _dirty = true; baseOfCode = _v; }
        public Long baseOfData() { return baseOfData; }
        public void setBaseOfData(Long _v) { _dirty = true; baseOfData = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.OptionalHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.OptionalHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class OptionalHeaderWindows extends KaitaiStruct.ReadWrite {
        public static OptionalHeaderWindows fromFile(String fileName) throws IOException {
            return new OptionalHeaderWindows(new ByteBufferKaitaiStream(fileName));
        }

        public enum SubsystemEnum {
            UNKNOWN(0),
            NATIVE(1),
            WINDOWS_GUI(2),
            WINDOWS_CUI(3),
            POSIX_CUI(7),
            WINDOWS_CE_GUI(9),
            EFI_APPLICATION(10),
            EFI_BOOT_SERVICE_DRIVER(11),
            EFI_RUNTIME_DRIVER(12),
            EFI_ROM(13),
            XBOX(14),
            WINDOWS_BOOT_APPLICATION(16);

            private final long id;
            SubsystemEnum(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, SubsystemEnum> byId = new HashMap<Long, SubsystemEnum>(12);
            static {
                for (SubsystemEnum e : SubsystemEnum.values())
                    byId.put(e.id(), e);
            }
            public static SubsystemEnum byId(long id) { return byId.get(id); }
        }
        public OptionalHeaderWindows() {
            this(null, null, null);
        }

        public OptionalHeaderWindows(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionalHeaderWindows(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent) {
            this(_io, _parent, null);
        }

        public OptionalHeaderWindows(KaitaiStream _io, MicrosoftPe.OptionalHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this.imageBase32 = this._io.readU4le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this.imageBase64 = this._io.readU8le();
            }
            this.sectionAlignment = this._io.readU4le();
            this.fileAlignment = this._io.readU4le();
            this.majorOperatingSystemVersion = this._io.readU2le();
            this.minorOperatingSystemVersion = this._io.readU2le();
            this.majorImageVersion = this._io.readU2le();
            this.minorImageVersion = this._io.readU2le();
            this.majorSubsystemVersion = this._io.readU2le();
            this.minorSubsystemVersion = this._io.readU2le();
            this.win32VersionValue = this._io.readU4le();
            this.sizeOfImage = this._io.readU4le();
            this.sizeOfHeaders = this._io.readU4le();
            this.checkSum = this._io.readU4le();
            this.subsystem = SubsystemEnum.byId(this._io.readU2le());
            this.dllCharacteristics = this._io.readU2le();
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this.sizeOfStackReserve32 = this._io.readU4le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this.sizeOfStackReserve64 = this._io.readU8le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this.sizeOfStackCommit32 = this._io.readU4le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this.sizeOfStackCommit64 = this._io.readU8le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this.sizeOfHeapReserve32 = this._io.readU4le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this.sizeOfHeapReserve64 = this._io.readU8le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this.sizeOfHeapCommit32 = this._io.readU4le();
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this.sizeOfHeapCommit64 = this._io.readU8le();
            }
            this.loaderFlags = this._io.readU4le();
            this.numberOfRvaAndSizes = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.imageBase32);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this._io.writeU8le(this.imageBase64);
            }
            this._io.writeU4le(this.sectionAlignment);
            this._io.writeU4le(this.fileAlignment);
            this._io.writeU2le(this.majorOperatingSystemVersion);
            this._io.writeU2le(this.minorOperatingSystemVersion);
            this._io.writeU2le(this.majorImageVersion);
            this._io.writeU2le(this.minorImageVersion);
            this._io.writeU2le(this.majorSubsystemVersion);
            this._io.writeU2le(this.minorSubsystemVersion);
            this._io.writeU4le(this.win32VersionValue);
            this._io.writeU4le(this.sizeOfImage);
            this._io.writeU4le(this.sizeOfHeaders);
            this._io.writeU4le(this.checkSum);
            this._io.writeU2le(((Number) (this.subsystem.id())).intValue());
            this._io.writeU2le(this.dllCharacteristics);
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.sizeOfStackReserve32);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this._io.writeU8le(this.sizeOfStackReserve64);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.sizeOfStackCommit32);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this._io.writeU8le(this.sizeOfStackCommit64);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.sizeOfHeapReserve32);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this._io.writeU8le(this.sizeOfHeapReserve64);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
                this._io.writeU4le(this.sizeOfHeapCommit32);
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
                this._io.writeU8le(this.sizeOfHeapCommit64);
            }
            this._io.writeU4le(this.loaderFlags);
            this._io.writeU4le(this.numberOfRvaAndSizes);
        }

        public void _check() {
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32) {
            }
            if (_parent().std().format() == MicrosoftPe.PeFormat.PE32_PLUS) {
            }
            _dirty = false;
        }
        private Long imageBase32;
        private Long imageBase64;
        private long sectionAlignment;
        private long fileAlignment;
        private int majorOperatingSystemVersion;
        private int minorOperatingSystemVersion;
        private int majorImageVersion;
        private int minorImageVersion;
        private int majorSubsystemVersion;
        private int minorSubsystemVersion;
        private long win32VersionValue;
        private long sizeOfImage;
        private long sizeOfHeaders;
        private long checkSum;
        private SubsystemEnum subsystem;
        private int dllCharacteristics;
        private Long sizeOfStackReserve32;
        private Long sizeOfStackReserve64;
        private Long sizeOfStackCommit32;
        private Long sizeOfStackCommit64;
        private Long sizeOfHeapReserve32;
        private Long sizeOfHeapReserve64;
        private Long sizeOfHeapCommit32;
        private Long sizeOfHeapCommit64;
        private long loaderFlags;
        private long numberOfRvaAndSizes;
        private MicrosoftPe _root;
        private MicrosoftPe.OptionalHeader _parent;
        public Long imageBase32() { return imageBase32; }
        public void setImageBase32(Long _v) { _dirty = true; imageBase32 = _v; }
        public Long imageBase64() { return imageBase64; }
        public void setImageBase64(Long _v) { _dirty = true; imageBase64 = _v; }
        public long sectionAlignment() { return sectionAlignment; }
        public void setSectionAlignment(long _v) { _dirty = true; sectionAlignment = _v; }
        public long fileAlignment() { return fileAlignment; }
        public void setFileAlignment(long _v) { _dirty = true; fileAlignment = _v; }
        public int majorOperatingSystemVersion() { return majorOperatingSystemVersion; }
        public void setMajorOperatingSystemVersion(int _v) { _dirty = true; majorOperatingSystemVersion = _v; }
        public int minorOperatingSystemVersion() { return minorOperatingSystemVersion; }
        public void setMinorOperatingSystemVersion(int _v) { _dirty = true; minorOperatingSystemVersion = _v; }
        public int majorImageVersion() { return majorImageVersion; }
        public void setMajorImageVersion(int _v) { _dirty = true; majorImageVersion = _v; }
        public int minorImageVersion() { return minorImageVersion; }
        public void setMinorImageVersion(int _v) { _dirty = true; minorImageVersion = _v; }
        public int majorSubsystemVersion() { return majorSubsystemVersion; }
        public void setMajorSubsystemVersion(int _v) { _dirty = true; majorSubsystemVersion = _v; }
        public int minorSubsystemVersion() { return minorSubsystemVersion; }
        public void setMinorSubsystemVersion(int _v) { _dirty = true; minorSubsystemVersion = _v; }
        public long win32VersionValue() { return win32VersionValue; }
        public void setWin32VersionValue(long _v) { _dirty = true; win32VersionValue = _v; }
        public long sizeOfImage() { return sizeOfImage; }
        public void setSizeOfImage(long _v) { _dirty = true; sizeOfImage = _v; }
        public long sizeOfHeaders() { return sizeOfHeaders; }
        public void setSizeOfHeaders(long _v) { _dirty = true; sizeOfHeaders = _v; }
        public long checkSum() { return checkSum; }
        public void setCheckSum(long _v) { _dirty = true; checkSum = _v; }
        public SubsystemEnum subsystem() { return subsystem; }
        public void setSubsystem(SubsystemEnum _v) { _dirty = true; subsystem = _v; }
        public int dllCharacteristics() { return dllCharacteristics; }
        public void setDllCharacteristics(int _v) { _dirty = true; dllCharacteristics = _v; }
        public Long sizeOfStackReserve32() { return sizeOfStackReserve32; }
        public void setSizeOfStackReserve32(Long _v) { _dirty = true; sizeOfStackReserve32 = _v; }
        public Long sizeOfStackReserve64() { return sizeOfStackReserve64; }
        public void setSizeOfStackReserve64(Long _v) { _dirty = true; sizeOfStackReserve64 = _v; }
        public Long sizeOfStackCommit32() { return sizeOfStackCommit32; }
        public void setSizeOfStackCommit32(Long _v) { _dirty = true; sizeOfStackCommit32 = _v; }
        public Long sizeOfStackCommit64() { return sizeOfStackCommit64; }
        public void setSizeOfStackCommit64(Long _v) { _dirty = true; sizeOfStackCommit64 = _v; }
        public Long sizeOfHeapReserve32() { return sizeOfHeapReserve32; }
        public void setSizeOfHeapReserve32(Long _v) { _dirty = true; sizeOfHeapReserve32 = _v; }
        public Long sizeOfHeapReserve64() { return sizeOfHeapReserve64; }
        public void setSizeOfHeapReserve64(Long _v) { _dirty = true; sizeOfHeapReserve64 = _v; }
        public Long sizeOfHeapCommit32() { return sizeOfHeapCommit32; }
        public void setSizeOfHeapCommit32(Long _v) { _dirty = true; sizeOfHeapCommit32 = _v; }
        public Long sizeOfHeapCommit64() { return sizeOfHeapCommit64; }
        public void setSizeOfHeapCommit64(Long _v) { _dirty = true; sizeOfHeapCommit64 = _v; }
        public long loaderFlags() { return loaderFlags; }
        public void setLoaderFlags(long _v) { _dirty = true; loaderFlags = _v; }
        public long numberOfRvaAndSizes() { return numberOfRvaAndSizes; }
        public void setNumberOfRvaAndSizes(long _v) { _dirty = true; numberOfRvaAndSizes = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.OptionalHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.OptionalHeader _v) { _dirty = true; _parent = _v; }
    }
    public static class PeHeader extends KaitaiStruct.ReadWrite {
        public static PeHeader fromFile(String fileName) throws IOException {
            return new PeHeader(new ByteBufferKaitaiStream(fileName));
        }
        public PeHeader() {
            this(null, null, null);
        }

        public PeHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public PeHeader(KaitaiStream _io, MicrosoftPe _parent) {
            this(_io, _parent, null);
        }

        public PeHeader(KaitaiStream _io, MicrosoftPe _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.peSignature = this._io.readBytes(4);
            if (!(Arrays.equals(this.peSignature, new byte[] { 80, 69, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 69, 0, 0 }, this.peSignature, this._io, "/types/pe_header/seq/0");
            }
            this.coffHdr = new CoffHeader(this._io, this, _root);
            this.coffHdr._read();
            this._raw_optionalHdr = this._io.readBytes(coffHdr().sizeOfOptionalHeader());
            KaitaiStream _io__raw_optionalHdr = new ByteBufferKaitaiStream(this._raw_optionalHdr);
            this.optionalHdr = new OptionalHeader(_io__raw_optionalHdr, this, _root);
            this.optionalHdr._read();
            this.sections = new ArrayList<Section>();
            for (int i = 0; i < coffHdr().numberOfSections(); i++) {
                Section _t_sections = new Section(this._io, this, _root);
                try {
                    _t_sections._read();
                } finally {
                    this.sections.add(_t_sections);
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.coffHdr._fetchInstances();
            this.optionalHdr._fetchInstances();
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._fetchInstances();
            }
            certificateTable();
            if (this.certificateTable != null) {
                this.certificateTable._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteCertificateTable = _enabledCertificateTable;
            this._io.writeBytes(this.peSignature);
            this.coffHdr._write_Seq(this._io);
            final KaitaiStream _io__raw_optionalHdr = new ByteBufferKaitaiStream(coffHdr().sizeOfOptionalHeader());
            this._io.addChildStream(_io__raw_optionalHdr);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (coffHdr().sizeOfOptionalHeader()));
                final PeHeader _this = this;
                _io__raw_optionalHdr.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_optionalHdr = _io__raw_optionalHdr.toByteArray();
                        if (_this._raw_optionalHdr.length != coffHdr().sizeOfOptionalHeader())
                            throw new ConsistencyError("raw(optional_hdr)", coffHdr().sizeOfOptionalHeader(), _this._raw_optionalHdr.length);
                        parent.writeBytes(_this._raw_optionalHdr);
                    }
                });
            }
            this.optionalHdr._write_Seq(_io__raw_optionalHdr);
            for (int i = 0; i < this.sections.size(); i++) {
                this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
        }

        public void _check() {
            if (this.peSignature.length != 4)
                throw new ConsistencyError("pe_signature", 4, this.peSignature.length);
            if (!(Arrays.equals(this.peSignature, new byte[] { 80, 69, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 80, 69, 0, 0 }, this.peSignature, null, "/types/pe_header/seq/0");
            }
            if (!Objects.equals(this.coffHdr._root(), _root()))
                throw new ConsistencyError("coff_hdr", _root(), this.coffHdr._root());
            if (!Objects.equals(this.coffHdr._parent(), this))
                throw new ConsistencyError("coff_hdr", this, this.coffHdr._parent());
            if (!Objects.equals(this.optionalHdr._root(), _root()))
                throw new ConsistencyError("optional_hdr", _root(), this.optionalHdr._root());
            if (!Objects.equals(this.optionalHdr._parent(), this))
                throw new ConsistencyError("optional_hdr", this, this.optionalHdr._parent());
            if (this.sections.size() != coffHdr().numberOfSections())
                throw new ConsistencyError("sections", coffHdr().numberOfSections(), this.sections.size());
            for (int i = 0; i < this.sections.size(); i++) {
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
            }
            if (_enabledCertificateTable) {
                if (optionalHdr().dataDirs().certificateTable().virtualAddress() != 0) {
                    if (!Objects.equals(this.certificateTable._root(), _root()))
                        throw new ConsistencyError("certificate_table", _root(), this.certificateTable._root());
                    if (!Objects.equals(this.certificateTable._parent(), this))
                        throw new ConsistencyError("certificate_table", this, this.certificateTable._parent());
                }
            }
            _dirty = false;
        }
        private CertificateTable certificateTable;
        private boolean _shouldWriteCertificateTable = false;
        private boolean _enabledCertificateTable = true;
        public CertificateTable certificateTable() {
            if (_shouldWriteCertificateTable)
                _writeCertificateTable();
            if (this.certificateTable != null)
                return this.certificateTable;
            if (!_enabledCertificateTable)
                return null;
            if (optionalHdr().dataDirs().certificateTable().virtualAddress() != 0) {
                long _pos = this._io.pos();
                this._io.seek(optionalHdr().dataDirs().certificateTable().virtualAddress());
                this._raw_certificateTable = this._io.readBytes(optionalHdr().dataDirs().certificateTable().size());
                KaitaiStream _io__raw_certificateTable = new ByteBufferKaitaiStream(this._raw_certificateTable);
                this.certificateTable = new CertificateTable(_io__raw_certificateTable, this, _root);
                this.certificateTable._read();
                this._io.seek(_pos);
            }
            return this.certificateTable;
        }
        public void setCertificateTable(CertificateTable _v) { _dirty = true; certificateTable = _v; }
        public void setCertificateTable_Enabled(boolean _v) { _dirty = true; _enabledCertificateTable = _v; }

        private void _writeCertificateTable() {
            _shouldWriteCertificateTable = false;
            if (optionalHdr().dataDirs().certificateTable().virtualAddress() != 0) {
                long _pos = this._io.pos();
                this._io.seek(optionalHdr().dataDirs().certificateTable().virtualAddress());
                final KaitaiStream _io__raw_certificateTable = new ByteBufferKaitaiStream(optionalHdr().dataDirs().certificateTable().size());
                this._io.addChildStream(_io__raw_certificateTable);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (optionalHdr().dataDirs().certificateTable().size()));
                    final PeHeader _this = this;
                    _io__raw_certificateTable.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_certificateTable = _io__raw_certificateTable.toByteArray();
                            if (_this._raw_certificateTable.length != optionalHdr().dataDirs().certificateTable().size())
                                throw new ConsistencyError("raw(certificate_table)", optionalHdr().dataDirs().certificateTable().size(), _this._raw_certificateTable.length);
                            parent.writeBytes(_this._raw_certificateTable);
                        }
                    });
                }
                this.certificateTable._write_Seq(_io__raw_certificateTable);
                this._io.seek(_pos);
            }
        }
        private byte[] peSignature;
        private CoffHeader coffHdr;
        private OptionalHeader optionalHdr;
        private List<Section> sections;
        private MicrosoftPe _root;
        private MicrosoftPe _parent;
        private byte[] _raw_optionalHdr;
        private byte[] _raw_certificateTable;
        public byte[] peSignature() { return peSignature; }
        public void setPeSignature(byte[] _v) { _dirty = true; peSignature = _v; }
        public CoffHeader coffHdr() { return coffHdr; }
        public void setCoffHdr(CoffHeader _v) { _dirty = true; coffHdr = _v; }
        public OptionalHeader optionalHdr() { return optionalHdr; }
        public void setOptionalHdr(OptionalHeader _v) { _dirty = true; optionalHdr = _v; }
        public List<Section> sections() { return sections; }
        public void setSections(List<Section> _v) { _dirty = true; sections = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe _parent() { return _parent; }
        public void set_parent(MicrosoftPe _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_optionalHdr() { return _raw_optionalHdr; }
        public void set_raw_OptionalHdr(byte[] _v) { _dirty = true; _raw_optionalHdr = _v; }
        public byte[] _raw_certificateTable() { return _raw_certificateTable; }
        public void set_raw_CertificateTable(byte[] _v) { _dirty = true; _raw_certificateTable = _v; }
    }
    public static class Section extends KaitaiStruct.ReadWrite {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
        }
        public Section() {
            this(null, null, null);
        }

        public Section(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Section(KaitaiStream _io, MicrosoftPe.PeHeader _parent) {
            this(_io, _parent, null);
        }

        public Section(KaitaiStream _io, MicrosoftPe.PeHeader _parent, MicrosoftPe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), StandardCharsets.UTF_8);
            this.virtualSize = this._io.readU4le();
            this.virtualAddress = this._io.readU4le();
            this.sizeOfRawData = this._io.readU4le();
            this.pointerToRawData = this._io.readU4le();
            this.pointerToRelocations = this._io.readU4le();
            this.pointerToLinenumbers = this._io.readU4le();
            this.numberOfRelocations = this._io.readU2le();
            this.numberOfLinenumbers = this._io.readU2le();
            this.characteristics = this._io.readU4le();
            _dirty = false;
        }

        public void _fetchInstances() {
            body();
            if (this.body != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteBody = _enabledBody;
            this._io.writeBytesLimit((this.name).getBytes(Charset.forName("UTF-8")), 8, (byte) 0, (byte) 0);
            this._io.writeU4le(this.virtualSize);
            this._io.writeU4le(this.virtualAddress);
            this._io.writeU4le(this.sizeOfRawData);
            this._io.writeU4le(this.pointerToRawData);
            this._io.writeU4le(this.pointerToRelocations);
            this._io.writeU4le(this.pointerToLinenumbers);
            this._io.writeU2le(this.numberOfRelocations);
            this._io.writeU2le(this.numberOfLinenumbers);
            this._io.writeU4le(this.characteristics);
        }

        public void _check() {
            if ((this.name).getBytes(Charset.forName("UTF-8")).length > 8)
                throw new ConsistencyError("name", 8, (this.name).getBytes(Charset.forName("UTF-8")).length);
            if ( (((this.name).getBytes(Charset.forName("UTF-8")).length != 0) && (((this.name).getBytes(Charset.forName("UTF-8"))[((Number) ((this.name).getBytes(Charset.forName("UTF-8")).length - 1)).intValue()] & 0xff) == 0)) )
                throw new ConsistencyError("name", 0, ((this.name).getBytes(Charset.forName("UTF-8"))[((Number) ((this.name).getBytes(Charset.forName("UTF-8")).length - 1)).intValue()] & 0xff));
            if (_enabledBody) {
                if (this.body.length != sizeOfRawData())
                    throw new ConsistencyError("body", sizeOfRawData(), this.body.length);
            }
            _dirty = false;
        }
        private byte[] body;
        private boolean _shouldWriteBody = false;
        private boolean _enabledBody = true;
        public byte[] body() {
            if (_shouldWriteBody)
                _writeBody();
            if (this.body != null)
                return this.body;
            if (!_enabledBody)
                return null;
            long _pos = this._io.pos();
            this._io.seek(pointerToRawData());
            this.body = this._io.readBytes(sizeOfRawData());
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek(pointerToRawData());
            this._io.writeBytes(this.body);
            this._io.seek(_pos);
        }
        private String name;
        private long virtualSize;
        private long virtualAddress;
        private long sizeOfRawData;
        private long pointerToRawData;
        private long pointerToRelocations;
        private long pointerToLinenumbers;
        private int numberOfRelocations;
        private int numberOfLinenumbers;
        private long characteristics;
        private MicrosoftPe _root;
        private MicrosoftPe.PeHeader _parent;
        public String name() { return name; }
        public void setName(String _v) { _dirty = true; name = _v; }
        public long virtualSize() { return virtualSize; }
        public void setVirtualSize(long _v) { _dirty = true; virtualSize = _v; }
        public long virtualAddress() { return virtualAddress; }
        public void setVirtualAddress(long _v) { _dirty = true; virtualAddress = _v; }
        public long sizeOfRawData() { return sizeOfRawData; }
        public void setSizeOfRawData(long _v) { _dirty = true; sizeOfRawData = _v; }
        public long pointerToRawData() { return pointerToRawData; }
        public void setPointerToRawData(long _v) { _dirty = true; pointerToRawData = _v; }
        public long pointerToRelocations() { return pointerToRelocations; }
        public void setPointerToRelocations(long _v) { _dirty = true; pointerToRelocations = _v; }
        public long pointerToLinenumbers() { return pointerToLinenumbers; }
        public void setPointerToLinenumbers(long _v) { _dirty = true; pointerToLinenumbers = _v; }
        public int numberOfRelocations() { return numberOfRelocations; }
        public void setNumberOfRelocations(int _v) { _dirty = true; numberOfRelocations = _v; }
        public int numberOfLinenumbers() { return numberOfLinenumbers; }
        public void setNumberOfLinenumbers(int _v) { _dirty = true; numberOfLinenumbers = _v; }
        public long characteristics() { return characteristics; }
        public void setCharacteristics(long _v) { _dirty = true; characteristics = _v; }
        public MicrosoftPe _root() { return _root; }
        public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
        public MicrosoftPe.PeHeader _parent() { return _parent; }
        public void set_parent(MicrosoftPe.PeHeader _v) { _dirty = true; _parent = _v; }
    }
    private PeHeader pe;
    private boolean _shouldWritePe = false;
    private boolean _enabledPe = true;
    public PeHeader pe() {
        if (_shouldWritePe)
            _writePe();
        if (this.pe != null)
            return this.pe;
        if (!_enabledPe)
            return null;
        long _pos = this._io.pos();
        this._io.seek(mz().ofsPe());
        this.pe = new PeHeader(this._io, this, _root);
        this.pe._read();
        this._io.seek(_pos);
        return this.pe;
    }
    public void setPe(PeHeader _v) { _dirty = true; pe = _v; }
    public void setPe_Enabled(boolean _v) { _dirty = true; _enabledPe = _v; }

    private void _writePe() {
        _shouldWritePe = false;
        long _pos = this._io.pos();
        this._io.seek(mz().ofsPe());
        this.pe._write_Seq(this._io);
        this._io.seek(_pos);
    }
    private MzPlaceholder mz;
    private MicrosoftPe _root;
    private KaitaiStruct.ReadWrite _parent;
    public MzPlaceholder mz() { return mz; }
    public void setMz(MzPlaceholder _v) { _dirty = true; mz = _v; }
    public MicrosoftPe _root() { return _root; }
    public void set_root(MicrosoftPe _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
