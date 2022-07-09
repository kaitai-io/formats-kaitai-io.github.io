// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.HashMap;


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
 * @see <a href="https://github.com/libyal/libregf/blob/master/documentation/Windows%20NT%20Registry%20File%20(REGF)%20format.asciidoc">Source</a>
 */
public class Regf extends KaitaiStruct {
    public static Regf fromFile(String fileName) throws IOException {
        return new Regf(new ByteBufferKaitaiStream(fileName));
    }

    public Regf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Regf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Regf(KaitaiStream _io, KaitaiStruct _parent, Regf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this._raw_hiveBins = new ArrayList<byte[]>();
        this.hiveBins = new ArrayList<HiveBin>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this._raw_hiveBins.add(this._io.readBytes(4096));
                KaitaiStream _io__raw_hiveBins = new ByteBufferKaitaiStream(_raw_hiveBins.get(_raw_hiveBins.size() - 1));
                this.hiveBins.add(new HiveBin(_io__raw_hiveBins, this, _root));
                i++;
            }
        }
    }
    public static class Filetime extends KaitaiStruct {
        public static Filetime fromFile(String fileName) throws IOException {
            return new Filetime(new ByteBufferKaitaiStream(fileName));
        }

        public Filetime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Filetime(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Filetime(KaitaiStream _io, KaitaiStruct _parent, Regf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.value = this._io.readU8le();
        }
        private long value;
        private Regf _root;
        private KaitaiStruct _parent;
        public long value() { return value; }
        public Regf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class HiveBin extends KaitaiStruct {
        public static HiveBin fromFile(String fileName) throws IOException {
            return new HiveBin(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.header = new HiveBinHeader(this._io, this, _root);
            this.cells = new ArrayList<HiveBinCell>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.cells.add(new HiveBinCell(this._io, this, _root));
                    i++;
                }
            }
        }
        private HiveBinHeader header;
        private ArrayList<HiveBinCell> cells;
        private Regf _root;
        private Regf _parent;
        public HiveBinHeader header() { return header; }
        public ArrayList<HiveBinCell> cells() { return cells; }
        public Regf _root() { return _root; }
        public Regf _parent() { return _parent; }
    }
    public static class HiveBinHeader extends KaitaiStruct {
        public static HiveBinHeader fromFile(String fileName) throws IOException {
            return new HiveBinHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(signature(), new byte[] { 104, 98, 105, 110 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 104, 98, 105, 110 }, signature(), _io(), "/types/hive_bin_header/seq/0");
            }
            this.offset = this._io.readU4le();
            this.size = this._io.readU4le();
            this.unknown1 = this._io.readU4le();
            this.unknown2 = this._io.readU4le();
            this.timestamp = new Filetime(this._io, this, _root);
            this.unknown4 = this._io.readU4le();
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

        /**
         * The offset of the hive bin, Value in bytes and relative from
         * the start of the hive bin data
         */
        public long offset() { return offset; }

        /**
         * Size of the hive bin
         */
        public long size() { return size; }

        /**
         * 0 most of the time, can contain remnant data
         */
        public long unknown1() { return unknown1; }

        /**
         * 0 most of the time, can contain remnant data
         */
        public long unknown2() { return unknown2; }

        /**
         * Only the root (first) hive bin seems to contain a valid FILETIME
         */
        public Filetime timestamp() { return timestamp; }

        /**
         * Contains number of bytes
         */
        public long unknown4() { return unknown4; }
        public Regf _root() { return _root; }
        public Regf.HiveBin _parent() { return _parent; }
    }
    public static class HiveBinCell extends KaitaiStruct {
        public static HiveBinCell fromFile(String fileName) throws IOException {
            return new HiveBinCell(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.cellSizeRaw = this._io.readS4le();
            this.identifier = new String(this._io.readBytes(2), Charset.forName("ascii"));
            switch (identifier()) {
            case "li": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListLi(_io__raw_data, this, _root);
                break;
            }
            case "vk": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListVk(_io__raw_data, this, _root);
                break;
            }
            case "lf": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListLhLf(_io__raw_data, this, _root);
                break;
            }
            case "ri": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListRi(_io__raw_data, this, _root);
                break;
            }
            case "lh": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListLhLf(_io__raw_data, this, _root);
                break;
            }
            case "nk": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new NamedKey(_io__raw_data, this, _root);
                break;
            }
            case "sk": {
                this._raw_data = this._io.readBytes(((cellSize() - 2) - 4));
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(_raw_data);
                this.data = new SubKeyListSk(_io__raw_data, this, _root);
                break;
            }
            default: {
                this.data = this._io.readBytes(((cellSize() - 2) - 4));
                break;
            }
            }
        }
        public static class SubKeyListVk extends KaitaiStruct {
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
                _read();
            }
            private void _read() {
                this.valueNameSize = this._io.readU2le();
                this.dataSize = this._io.readU4le();
                this.dataOffset = this._io.readU4le();
                this.dataType = DataTypeEnum.byId(this._io.readU4le());
                this.flags = VkFlags.byId(this._io.readU2le());
                this.padding = this._io.readU2le();
                if (flags() == VkFlags.VALUE_COMP_NAME) {
                    this.valueName = new String(this._io.readBytes(valueNameSize()), Charset.forName("ascii"));
                }
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
            public long dataSize() { return dataSize; }
            public long dataOffset() { return dataOffset; }
            public DataTypeEnum dataType() { return dataType; }
            public VkFlags flags() { return flags; }
            public int padding() { return padding; }
            public String valueName() { return valueName; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        public static class SubKeyListLhLf extends KaitaiStruct {
            public static SubKeyListLhLf fromFile(String fileName) throws IOException {
                return new SubKeyListLhLf(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    this.items.add(new Item(this._io, this, _root));
                }
            }
            public static class Item extends KaitaiStruct {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.namedKeyOffset = this._io.readU4le();
                    this.hashValue = this._io.readU4le();
                }
                private long namedKeyOffset;
                private long hashValue;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListLhLf _parent;
                public long namedKeyOffset() { return namedKeyOffset; }
                public long hashValue() { return hashValue; }
                public Regf _root() { return _root; }
                public Regf.HiveBinCell.SubKeyListLhLf _parent() { return _parent; }
            }
            private int count;
            private ArrayList<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public ArrayList<Item> items() { return items; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        public static class SubKeyListSk extends KaitaiStruct {
            public static SubKeyListSk fromFile(String fileName) throws IOException {
                return new SubKeyListSk(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.unknown1 = this._io.readU2le();
                this.previousSecurityKeyOffset = this._io.readU4le();
                this.nextSecurityKeyOffset = this._io.readU4le();
                this.referenceCount = this._io.readU4le();
            }
            private int unknown1;
            private long previousSecurityKeyOffset;
            private long nextSecurityKeyOffset;
            private long referenceCount;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int unknown1() { return unknown1; }
            public long previousSecurityKeyOffset() { return previousSecurityKeyOffset; }
            public long nextSecurityKeyOffset() { return nextSecurityKeyOffset; }
            public long referenceCount() { return referenceCount; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        public static class SubKeyListLi extends KaitaiStruct {
            public static SubKeyListLi fromFile(String fileName) throws IOException {
                return new SubKeyListLi(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    this.items.add(new Item(this._io, this, _root));
                }
            }
            public static class Item extends KaitaiStruct {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.namedKeyOffset = this._io.readU4le();
                }
                private long namedKeyOffset;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListLi _parent;
                public long namedKeyOffset() { return namedKeyOffset; }
                public Regf _root() { return _root; }
                public Regf.HiveBinCell.SubKeyListLi _parent() { return _parent; }
            }
            private int count;
            private ArrayList<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public ArrayList<Item> items() { return items; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        public static class NamedKey extends KaitaiStruct {
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
                _read();
            }
            private void _read() {
                this.flags = NkFlags.byId(this._io.readU2le());
                this.lastKeyWrittenDateAndTime = new Filetime(this._io, this, _root);
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
                this.unknownString = new String(this._io.readBytes(unknownStringSize()), Charset.forName("ascii"));
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
            public Filetime lastKeyWrittenDateAndTime() { return lastKeyWrittenDateAndTime; }
            public long unknown1() { return unknown1; }
            public long parentKeyOffset() { return parentKeyOffset; }
            public long numberOfSubKeys() { return numberOfSubKeys; }
            public long numberOfVolatileSubKeys() { return numberOfVolatileSubKeys; }
            public long subKeysListOffset() { return subKeysListOffset; }
            public long numberOfValues() { return numberOfValues; }
            public long valuesListOffset() { return valuesListOffset; }
            public long securityKeyOffset() { return securityKeyOffset; }
            public long classNameOffset() { return classNameOffset; }
            public long largestSubKeyNameSize() { return largestSubKeyNameSize; }
            public long largestSubKeyClassNameSize() { return largestSubKeyClassNameSize; }
            public long largestValueNameSize() { return largestValueNameSize; }
            public long largestValueDataSize() { return largestValueDataSize; }
            public long unknown2() { return unknown2; }
            public int keyNameSize() { return keyNameSize; }
            public int classNameSize() { return classNameSize; }
            public long unknownStringSize() { return unknownStringSize; }
            public String unknownString() { return unknownString; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        public static class SubKeyListRi extends KaitaiStruct {
            public static SubKeyListRi fromFile(String fileName) throws IOException {
                return new SubKeyListRi(new ByteBufferKaitaiStream(fileName));
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
                _read();
            }
            private void _read() {
                this.count = this._io.readU2le();
                this.items = new ArrayList<Item>();
                for (int i = 0; i < count(); i++) {
                    this.items.add(new Item(this._io, this, _root));
                }
            }
            public static class Item extends KaitaiStruct {
                public static Item fromFile(String fileName) throws IOException {
                    return new Item(new ByteBufferKaitaiStream(fileName));
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
                    _read();
                }
                private void _read() {
                    this.subKeyListOffset = this._io.readU4le();
                }
                private long subKeyListOffset;
                private Regf _root;
                private Regf.HiveBinCell.SubKeyListRi _parent;
                public long subKeyListOffset() { return subKeyListOffset; }
                public Regf _root() { return _root; }
                public Regf.HiveBinCell.SubKeyListRi _parent() { return _parent; }
            }
            private int count;
            private ArrayList<Item> items;
            private Regf _root;
            private Regf.HiveBinCell _parent;
            public int count() { return count; }
            public ArrayList<Item> items() { return items; }
            public Regf _root() { return _root; }
            public Regf.HiveBinCell _parent() { return _parent; }
        }
        private Integer cellSize;
        public Integer cellSize() {
            if (this.cellSize != null)
                return this.cellSize;
            int _tmp = (int) (((cellSizeRaw() < 0 ? -1 : 1) * cellSizeRaw()));
            this.cellSize = _tmp;
            return this.cellSize;
        }
        private Boolean isAllocated;
        public Boolean isAllocated() {
            if (this.isAllocated != null)
                return this.isAllocated;
            boolean _tmp = (boolean) (cellSizeRaw() < 0);
            this.isAllocated = _tmp;
            return this.isAllocated;
        }
        private int cellSizeRaw;
        private String identifier;
        private Object data;
        private Regf _root;
        private Regf.HiveBin _parent;
        private byte[] _raw_data;
        public int cellSizeRaw() { return cellSizeRaw; }
        public String identifier() { return identifier; }
        public Object data() { return data; }
        public Regf _root() { return _root; }
        public Regf.HiveBin _parent() { return _parent; }
        public byte[] _raw_data() { return _raw_data; }
    }
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.signature = this._io.readBytes(4);
            if (!(Arrays.equals(signature(), new byte[] { 114, 101, 103, 102 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 114, 101, 103, 102 }, signature(), _io(), "/types/file_header/seq/0");
            }
            this.primarySequenceNumber = this._io.readU4le();
            this.secondarySequenceNumber = this._io.readU4le();
            this.lastModificationDateAndTime = new Filetime(this._io, this, _root);
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
        public long primarySequenceNumber() { return primarySequenceNumber; }
        public long secondarySequenceNumber() { return secondarySequenceNumber; }
        public Filetime lastModificationDateAndTime() { return lastModificationDateAndTime; }
        public long majorVersion() { return majorVersion; }
        public long minorVersion() { return minorVersion; }
        public FileType type() { return type; }
        public FileFormat format() { return format; }
        public long rootKeyOffset() { return rootKeyOffset; }
        public long hiveBinsDataSize() { return hiveBinsDataSize; }
        public long clusteringFactor() { return clusteringFactor; }
        public byte[] unknown1() { return unknown1; }
        public byte[] unknown2() { return unknown2; }
        public long checksum() { return checksum; }
        public byte[] reserved() { return reserved; }
        public long bootType() { return bootType; }
        public long bootRecover() { return bootRecover; }
        public Regf _root() { return _root; }
        public Regf _parent() { return _parent; }
    }
    private FileHeader header;
    private ArrayList<HiveBin> hiveBins;
    private Regf _root;
    private KaitaiStruct _parent;
    private ArrayList<byte[]> _raw_hiveBins;
    public FileHeader header() { return header; }
    public ArrayList<HiveBin> hiveBins() { return hiveBins; }
    public Regf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public ArrayList<byte[]> _raw_hiveBins() { return _raw_hiveBins; }
}
