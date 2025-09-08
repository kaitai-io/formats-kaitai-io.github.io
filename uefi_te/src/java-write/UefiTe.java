// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.List;


/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system's motherboard. UEFI firmware is very modular: it usually contains
 * dozens, if not hundreds, of executables. To store all these separates files,
 * the firmware is laid out in volumes using the Firmware File System (FFS), a
 * file system specifically designed to store firmware images. The volumes
 * contain files that are identified by GUIDs and each of these files contain
 * one or more sections holding the data. One of these sections contains the
 * actual executable image. Most of the executable images follow the PE format.
 * However, some of them follow the TE format.
 * 
 * The Terse Executable (TE) image format was created as a mechanism to reduce
 * the overhead of the PE/COFF headers in PE32/PE32+ images, resulting in a
 * corresponding reduction of image sizes for executables running in the PI
 * (Platform Initialization) Architecture environment. Reducing image size
 * provides an opportunity for use of a smaller system flash part.
 * 
 * So the TE format is basically a stripped version of PE.
 * @see <a href="https://uefi.org/sites/default/files/resources/PI_Spec_1_6.pdf">Source</a>
 */
public class UefiTe extends KaitaiStruct.ReadWrite {
    public static UefiTe fromFile(String fileName) throws IOException {
        return new UefiTe(new ByteBufferKaitaiStream(fileName));
    }
    public UefiTe() {
        this(null, null, null);
    }

    public UefiTe(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UefiTe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public UefiTe(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, UefiTe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this._raw_teHdr = this._io.readBytes(40);
        KaitaiStream _io__raw_teHdr = new ByteBufferKaitaiStream(this._raw_teHdr);
        this.teHdr = new TeHeader(_io__raw_teHdr, this, _root);
        this.teHdr._read();
        this.sections = new ArrayList<Section>();
        for (int i = 0; i < teHdr().numSections(); i++) {
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
        this.teHdr._fetchInstances();
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        final KaitaiStream _io__raw_teHdr = new ByteBufferKaitaiStream(40);
        this._io.addChildStream(_io__raw_teHdr);
        {
            long _pos2 = this._io.pos();
            this._io.seek(this._io.pos() + (40));
            final UefiTe _this = this;
            _io__raw_teHdr.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                @Override
                protected void write(KaitaiStream parent) {
                    _this._raw_teHdr = _io__raw_teHdr.toByteArray();
                    if (_this._raw_teHdr.length != 40)
                        throw new ConsistencyError("raw(te_hdr)", 40, _this._raw_teHdr.length);
                    parent.writeBytes(_this._raw_teHdr);
                }
            });
        }
        this.teHdr._write_Seq(_io__raw_teHdr);
        for (int i = 0; i < this.sections.size(); i++) {
            this.sections.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.teHdr._root(), _root()))
            throw new ConsistencyError("te_hdr", _root(), this.teHdr._root());
        if (!Objects.equals(this.teHdr._parent(), this))
            throw new ConsistencyError("te_hdr", this, this.teHdr._parent());
        if (this.sections.size() != teHdr().numSections())
            throw new ConsistencyError("sections", teHdr().numSections(), this.sections.size());
        for (int i = 0; i < this.sections.size(); i++) {
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("sections", _root(), this.sections.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.sections.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("sections", this, this.sections.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
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

        public DataDir(KaitaiStream _io, UefiTe.HeaderDataDirs _parent) {
            this(_io, _parent, null);
        }

        public DataDir(KaitaiStream _io, UefiTe.HeaderDataDirs _parent, UefiTe _root) {
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
        private UefiTe _root;
        private UefiTe.HeaderDataDirs _parent;
        public long virtualAddress() { return virtualAddress; }
        public void setVirtualAddress(long _v) { _dirty = true; virtualAddress = _v; }
        public long size() { return size; }
        public void setSize(long _v) { _dirty = true; size = _v; }
        public UefiTe _root() { return _root; }
        public void set_root(UefiTe _v) { _dirty = true; _root = _v; }
        public UefiTe.HeaderDataDirs _parent() { return _parent; }
        public void set_parent(UefiTe.HeaderDataDirs _v) { _dirty = true; _parent = _v; }
    }
    public static class HeaderDataDirs extends KaitaiStruct.ReadWrite {
        public static HeaderDataDirs fromFile(String fileName) throws IOException {
            return new HeaderDataDirs(new ByteBufferKaitaiStream(fileName));
        }
        public HeaderDataDirs() {
            this(null, null, null);
        }

        public HeaderDataDirs(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderDataDirs(KaitaiStream _io, UefiTe.TeHeader _parent) {
            this(_io, _parent, null);
        }

        public HeaderDataDirs(KaitaiStream _io, UefiTe.TeHeader _parent, UefiTe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.baseRelocationTable = new DataDir(this._io, this, _root);
            this.baseRelocationTable._read();
            this.debug = new DataDir(this._io, this, _root);
            this.debug._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.baseRelocationTable._fetchInstances();
            this.debug._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this.baseRelocationTable._write_Seq(this._io);
            this.debug._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.baseRelocationTable._root(), _root()))
                throw new ConsistencyError("base_relocation_table", _root(), this.baseRelocationTable._root());
            if (!Objects.equals(this.baseRelocationTable._parent(), this))
                throw new ConsistencyError("base_relocation_table", this, this.baseRelocationTable._parent());
            if (!Objects.equals(this.debug._root(), _root()))
                throw new ConsistencyError("debug", _root(), this.debug._root());
            if (!Objects.equals(this.debug._parent(), this))
                throw new ConsistencyError("debug", this, this.debug._parent());
            _dirty = false;
        }
        private DataDir baseRelocationTable;
        private DataDir debug;
        private UefiTe _root;
        private UefiTe.TeHeader _parent;
        public DataDir baseRelocationTable() { return baseRelocationTable; }
        public void setBaseRelocationTable(DataDir _v) { _dirty = true; baseRelocationTable = _v; }
        public DataDir debug() { return debug; }
        public void setDebug(DataDir _v) { _dirty = true; debug = _v; }
        public UefiTe _root() { return _root; }
        public void set_root(UefiTe _v) { _dirty = true; _root = _v; }
        public UefiTe.TeHeader _parent() { return _parent; }
        public void set_parent(UefiTe.TeHeader _v) { _dirty = true; _parent = _v; }
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

        public Section(KaitaiStream _io, UefiTe _parent) {
            this(_io, _parent, null);
        }

        public Section(KaitaiStream _io, UefiTe _parent, UefiTe _root) {
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
            this.numRelocations = this._io.readU2le();
            this.numLinenumbers = this._io.readU2le();
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
            this._io.writeU2le(this.numRelocations);
            this._io.writeU2le(this.numLinenumbers);
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
            this._io.seek((pointerToRawData() - _root().teHdr().strippedSize()) + _root().teHdr()._io().size());
            this.body = this._io.readBytes(sizeOfRawData());
            this._io.seek(_pos);
            return this.body;
        }
        public void setBody(byte[] _v) { _dirty = true; body = _v; }
        public void setBody_Enabled(boolean _v) { _dirty = true; _enabledBody = _v; }

        private void _writeBody() {
            _shouldWriteBody = false;
            long _pos = this._io.pos();
            this._io.seek((pointerToRawData() - _root().teHdr().strippedSize()) + _root().teHdr()._io().size());
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
        private int numRelocations;
        private int numLinenumbers;
        private long characteristics;
        private UefiTe _root;
        private UefiTe _parent;
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
        public int numRelocations() { return numRelocations; }
        public void setNumRelocations(int _v) { _dirty = true; numRelocations = _v; }
        public int numLinenumbers() { return numLinenumbers; }
        public void setNumLinenumbers(int _v) { _dirty = true; numLinenumbers = _v; }
        public long characteristics() { return characteristics; }
        public void setCharacteristics(long _v) { _dirty = true; characteristics = _v; }
        public UefiTe _root() { return _root; }
        public void set_root(UefiTe _v) { _dirty = true; _root = _v; }
        public UefiTe _parent() { return _parent; }
        public void set_parent(UefiTe _v) { _dirty = true; _parent = _v; }
    }
    public static class TeHeader extends KaitaiStruct.ReadWrite {
        public static TeHeader fromFile(String fileName) throws IOException {
            return new TeHeader(new ByteBufferKaitaiStream(fileName));
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
        public TeHeader() {
            this(null, null, null);
        }

        public TeHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TeHeader(KaitaiStream _io, UefiTe _parent) {
            this(_io, _parent, null);
        }

        public TeHeader(KaitaiStream _io, UefiTe _parent, UefiTe _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(this.magic, new byte[] { 86, 90 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 90 }, this.magic, this._io, "/types/te_header/seq/0");
            }
            this.machine = MachineType.byId(this._io.readU2le());
            this.numSections = this._io.readU1();
            this.subsystem = SubsystemEnum.byId(this._io.readU1());
            this.strippedSize = this._io.readU2le();
            this.entryPointAddr = this._io.readU4le();
            this.baseOfCode = this._io.readU4le();
            this.imageBase = this._io.readU8le();
            this.dataDirs = new HeaderDataDirs(this._io, this, _root);
            this.dataDirs._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.dataDirs._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.magic);
            this._io.writeU2le(((Number) (this.machine.id())).intValue());
            this._io.writeU1(this.numSections);
            this._io.writeU1(((Number) (this.subsystem.id())).intValue());
            this._io.writeU2le(this.strippedSize);
            this._io.writeU4le(this.entryPointAddr);
            this._io.writeU4le(this.baseOfCode);
            this._io.writeU8le(this.imageBase);
            this.dataDirs._write_Seq(this._io);
        }

        public void _check() {
            if (this.magic.length != 2)
                throw new ConsistencyError("magic", 2, this.magic.length);
            if (!(Arrays.equals(this.magic, new byte[] { 86, 90 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 90 }, this.magic, null, "/types/te_header/seq/0");
            }
            if (!Objects.equals(this.dataDirs._root(), _root()))
                throw new ConsistencyError("data_dirs", _root(), this.dataDirs._root());
            if (!Objects.equals(this.dataDirs._parent(), this))
                throw new ConsistencyError("data_dirs", this, this.dataDirs._parent());
            _dirty = false;
        }
        private byte[] magic;
        private MachineType machine;
        private int numSections;
        private SubsystemEnum subsystem;
        private int strippedSize;
        private long entryPointAddr;
        private long baseOfCode;
        private long imageBase;
        private HeaderDataDirs dataDirs;
        private UefiTe _root;
        private UefiTe _parent;
        public byte[] magic() { return magic; }
        public void setMagic(byte[] _v) { _dirty = true; magic = _v; }
        public MachineType machine() { return machine; }
        public void setMachine(MachineType _v) { _dirty = true; machine = _v; }
        public int numSections() { return numSections; }
        public void setNumSections(int _v) { _dirty = true; numSections = _v; }
        public SubsystemEnum subsystem() { return subsystem; }
        public void setSubsystem(SubsystemEnum _v) { _dirty = true; subsystem = _v; }
        public int strippedSize() { return strippedSize; }
        public void setStrippedSize(int _v) { _dirty = true; strippedSize = _v; }
        public long entryPointAddr() { return entryPointAddr; }
        public void setEntryPointAddr(long _v) { _dirty = true; entryPointAddr = _v; }
        public long baseOfCode() { return baseOfCode; }
        public void setBaseOfCode(long _v) { _dirty = true; baseOfCode = _v; }
        public long imageBase() { return imageBase; }
        public void setImageBase(long _v) { _dirty = true; imageBase = _v; }
        public HeaderDataDirs dataDirs() { return dataDirs; }
        public void setDataDirs(HeaderDataDirs _v) { _dirty = true; dataDirs = _v; }
        public UefiTe _root() { return _root; }
        public void set_root(UefiTe _v) { _dirty = true; _root = _v; }
        public UefiTe _parent() { return _parent; }
        public void set_parent(UefiTe _v) { _dirty = true; _parent = _v; }
    }
    private TeHeader teHdr;
    private List<Section> sections;
    private UefiTe _root;
    private KaitaiStruct.ReadWrite _parent;
    private byte[] _raw_teHdr;
    public TeHeader teHdr() { return teHdr; }
    public void setTeHdr(TeHeader _v) { _dirty = true; teHdr = _v; }
    public List<Section> sections() { return sections; }
    public void setSections(List<Section> _v) { _dirty = true; sections = _v; }
    public UefiTe _root() { return _root; }
    public void set_root(UefiTe _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
    public byte[] _raw_teHdr() { return _raw_teHdr; }
    public void set_raw_TeHdr(byte[] _v) { _dirty = true; _raw_teHdr = _v; }
}
