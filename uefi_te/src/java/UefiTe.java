// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.nio.charset.Charset;


/**
 * This type of executables could be found inside the UEFI firmware. The UEFI
 * firmware is stored in SPI flash memory, which is a chip soldered on a
 * system’s motherboard. UEFI firmware is very modular: it usually contains
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
public class UefiTe extends KaitaiStruct {
    public static UefiTe fromFile(String fileName) throws IOException {
        return new UefiTe(new ByteBufferKaitaiStream(fileName));
    }

    public UefiTe(KaitaiStream _io) {
        this(_io, null, null);
    }

    public UefiTe(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public UefiTe(KaitaiStream _io, KaitaiStruct _parent, UefiTe _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this._raw_teHdr = this._io.readBytes(40);
        KaitaiStream _io__raw_teHdr = new ByteBufferKaitaiStream(_raw_teHdr);
        this.teHdr = new TeHeader(_io__raw_teHdr, this, _root);
        sections = new ArrayList<Section>(((Number) (teHdr().numSections())).intValue());
        for (int i = 0; i < teHdr().numSections(); i++) {
            this.sections.add(new Section(this._io, this, _root));
        }
    }
    public static class TeHeader extends KaitaiStruct {
        public static TeHeader fromFile(String fileName) throws IOException {
            return new TeHeader(new ByteBufferKaitaiStream(fileName));
        }

        public enum MachineType {
            UNKNOWN(0),
            I386(332),
            R4000(358),
            WCEMIPSV2(361),
            ALPHA(388),
            SH3(418),
            SH3DSP(419),
            SH4(422),
            SH5(424),
            ARM(448),
            THUMB(450),
            ARMNT(452),
            AM33(467),
            POWERPC(496),
            POWERPCFP(497),
            IA64(512),
            MIPS16(614),
            MIPSFPU(870),
            MIPSFPU16(1126),
            EBC(3772),
            RISCV32(20530),
            RISCV64(20580),
            RISCV128(20776),
            AMD64(34404),
            M32R(36929),
            ARM64(43620);

            private final long id;
            MachineType(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, MachineType> byId = new HashMap<Long, MachineType>(26);
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
            _read();
        }
        private void _read() {
            this.magic = this._io.readBytes(2);
            if (!(Arrays.equals(magic(), new byte[] { 86, 90 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 86, 90 }, magic(), _io(), "/types/te_header/seq/0");
            }
            this.machine = MachineType.byId(this._io.readU2le());
            this.numSections = this._io.readU1();
            this.subsystem = SubsystemEnum.byId(this._io.readU1());
            this.strippedSize = this._io.readU2le();
            this.entryPointAddr = this._io.readU4le();
            this.baseOfCode = this._io.readU4le();
            this.imageBase = this._io.readU8le();
            this.dataDirs = new HeaderDataDirs(this._io, this, _root);
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
        public MachineType machine() { return machine; }
        public int numSections() { return numSections; }
        public SubsystemEnum subsystem() { return subsystem; }
        public int strippedSize() { return strippedSize; }
        public long entryPointAddr() { return entryPointAddr; }
        public long baseOfCode() { return baseOfCode; }
        public long imageBase() { return imageBase; }
        public HeaderDataDirs dataDirs() { return dataDirs; }
        public UefiTe _root() { return _root; }
        public UefiTe _parent() { return _parent; }
    }
    public static class HeaderDataDirs extends KaitaiStruct {
        public static HeaderDataDirs fromFile(String fileName) throws IOException {
            return new HeaderDataDirs(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.baseRelocationTable = new DataDir(this._io, this, _root);
            this.debug = new DataDir(this._io, this, _root);
        }
        private DataDir baseRelocationTable;
        private DataDir debug;
        private UefiTe _root;
        private UefiTe.TeHeader _parent;
        public DataDir baseRelocationTable() { return baseRelocationTable; }
        public DataDir debug() { return debug; }
        public UefiTe _root() { return _root; }
        public UefiTe.TeHeader _parent() { return _parent; }
    }
    public static class DataDir extends KaitaiStruct {
        public static DataDir fromFile(String fileName) throws IOException {
            return new DataDir(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.virtualAddress = this._io.readU4le();
            this.size = this._io.readU4le();
        }
        private long virtualAddress;
        private long size;
        private UefiTe _root;
        private UefiTe.HeaderDataDirs _parent;
        public long virtualAddress() { return virtualAddress; }
        public long size() { return size; }
        public UefiTe _root() { return _root; }
        public UefiTe.HeaderDataDirs _parent() { return _parent; }
    }
    public static class Section extends KaitaiStruct {
        public static Section fromFile(String fileName) throws IOException {
            return new Section(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.name = new String(KaitaiStream.bytesStripRight(this._io.readBytes(8), (byte) 0), Charset.forName("UTF-8"));
            this.virtualSize = this._io.readU4le();
            this.virtualAddress = this._io.readU4le();
            this.sizeOfRawData = this._io.readU4le();
            this.pointerToRawData = this._io.readU4le();
            this.pointerToRelocations = this._io.readU4le();
            this.pointerToLinenumbers = this._io.readU4le();
            this.numRelocations = this._io.readU2le();
            this.numLinenumbers = this._io.readU2le();
            this.characteristics = this._io.readU4le();
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            long _pos = this._io.pos();
            this._io.seek(((pointerToRawData() - _root.teHdr().strippedSize()) + _root.teHdr()._io().size()));
            this.body = this._io.readBytes(sizeOfRawData());
            this._io.seek(_pos);
            return this.body;
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
        public long virtualSize() { return virtualSize; }
        public long virtualAddress() { return virtualAddress; }
        public long sizeOfRawData() { return sizeOfRawData; }
        public long pointerToRawData() { return pointerToRawData; }
        public long pointerToRelocations() { return pointerToRelocations; }
        public long pointerToLinenumbers() { return pointerToLinenumbers; }
        public int numRelocations() { return numRelocations; }
        public int numLinenumbers() { return numLinenumbers; }
        public long characteristics() { return characteristics; }
        public UefiTe _root() { return _root; }
        public UefiTe _parent() { return _parent; }
    }
    private TeHeader teHdr;
    private ArrayList<Section> sections;
    private UefiTe _root;
    private KaitaiStruct _parent;
    private byte[] _raw_teHdr;
    public TeHeader teHdr() { return teHdr; }
    public ArrayList<Section> sections() { return sections; }
    public UefiTe _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_teHdr() { return _raw_teHdr; }
}
