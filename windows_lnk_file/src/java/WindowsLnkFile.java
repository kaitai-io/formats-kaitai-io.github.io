// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;
import java.util.Arrays;


/**
 * Windows .lnk files (AKA "shell link" file) are most frequently used
 * in Windows shell to create "shortcuts" to another files, usually for
 * purposes of running a program from some other directory, sometimes
 * with certain preconfigured arguments and some other options.
 * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Source</a>
 */
public class WindowsLnkFile extends KaitaiStruct {
    public static WindowsLnkFile fromFile(String fileName) throws IOException {
        return new WindowsLnkFile(new ByteBufferKaitaiStream(fileName));
    }

    public enum WindowState {
        NORMAL(1),
        MAXIMIZED(3),
        MIN_NO_ACTIVE(7);

        private final long id;
        WindowState(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, WindowState> byId = new HashMap<Long, WindowState>(3);
        static {
            for (WindowState e : WindowState.values())
                byId.put(e.id(), e);
        }
        public static WindowState byId(long id) { return byId.get(id); }
    }

    public enum DriveTypes {
        UNKNOWN(0),
        NO_ROOT_DIR(1),
        REMOVABLE(2),
        FIXED(3),
        REMOTE(4),
        CDROM(5),
        RAMDISK(6);

        private final long id;
        DriveTypes(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, DriveTypes> byId = new HashMap<Long, DriveTypes>(7);
        static {
            for (DriveTypes e : DriveTypes.values())
                byId.put(e.id(), e);
        }
        public static DriveTypes byId(long id) { return byId.get(id); }
    }

    public WindowsLnkFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsLnkFile(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsLnkFile(KaitaiStream _io, KaitaiStruct _parent, WindowsLnkFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new FileHeader(this._io, this, _root);
        if (header().flags().hasLinkTargetIdList()) {
            this.targetIdList = new LinkTargetIdList(this._io, this, _root);
        }
        if (header().flags().hasLinkInfo()) {
            this.info = new LinkInfo(this._io, this, _root);
        }
        if (header().flags().hasName()) {
            this.name = new StringData(this._io, this, _root);
        }
        if (header().flags().hasRelPath()) {
            this.relPath = new StringData(this._io, this, _root);
        }
        if (header().flags().hasWorkDir()) {
            this.workDir = new StringData(this._io, this, _root);
        }
        if (header().flags().hasArguments()) {
            this.arguments = new StringData(this._io, this, _root);
        }
        if (header().flags().hasIconLocation()) {
            this.iconLocation = new StringData(this._io, this, _root);
        }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2</a>
     */
    public static class LinkTargetIdList extends KaitaiStruct {
        public static LinkTargetIdList fromFile(String fileName) throws IOException {
            return new LinkTargetIdList(new ByteBufferKaitaiStream(fileName));
        }

        public LinkTargetIdList(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LinkTargetIdList(KaitaiStream _io, WindowsLnkFile _parent) {
            this(_io, _parent, null);
        }

        public LinkTargetIdList(KaitaiStream _io, WindowsLnkFile _parent, WindowsLnkFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenIdList = this._io.readU2le();
            this._raw_idList = this._io.readBytes(lenIdList());
            KaitaiStream _io__raw_idList = new ByteBufferKaitaiStream(_raw_idList);
            this.idList = new WindowsShellItems(_io__raw_idList);
        }
        private int lenIdList;
        private WindowsShellItems idList;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        private byte[] _raw_idList;
        public int lenIdList() { return lenIdList; }
        public WindowsShellItems idList() { return idList; }
        public WindowsLnkFile _root() { return _root; }
        public WindowsLnkFile _parent() { return _parent; }
        public byte[] _raw_idList() { return _raw_idList; }
    }
    public static class StringData extends KaitaiStruct {
        public static StringData fromFile(String fileName) throws IOException {
            return new StringData(new ByteBufferKaitaiStream(fileName));
        }

        public StringData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public StringData(KaitaiStream _io, WindowsLnkFile _parent) {
            this(_io, _parent, null);
        }

        public StringData(KaitaiStream _io, WindowsLnkFile _parent, WindowsLnkFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.charsStr = this._io.readU2le();
            this.str = new String(this._io.readBytes((charsStr() * 2)), Charset.forName("UTF-16LE"));
        }
        private int charsStr;
        private String str;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        public int charsStr() { return charsStr; }
        public String str() { return str; }
        public WindowsLnkFile _root() { return _root; }
        public WindowsLnkFile _parent() { return _parent; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
     */
    public static class LinkInfo extends KaitaiStruct {
        public static LinkInfo fromFile(String fileName) throws IOException {
            return new LinkInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LinkInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LinkInfo(KaitaiStream _io, WindowsLnkFile _parent) {
            this(_io, _parent, null);
        }

        public LinkInfo(KaitaiStream _io, WindowsLnkFile _parent, WindowsLnkFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenAll = this._io.readU4le();
            this._raw_all = this._io.readBytes((lenAll() - 4));
            KaitaiStream _io__raw_all = new ByteBufferKaitaiStream(_raw_all);
            this.all = new All(_io__raw_all, this, _root);
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
         */
        public static class VolumeIdBody extends KaitaiStruct {
            public static VolumeIdBody fromFile(String fileName) throws IOException {
                return new VolumeIdBody(new ByteBufferKaitaiStream(fileName));
            }

            public VolumeIdBody(KaitaiStream _io) {
                this(_io, null, null);
            }

            public VolumeIdBody(KaitaiStream _io, WindowsLnkFile.LinkInfo.VolumeIdSpec _parent) {
                this(_io, _parent, null);
            }

            public VolumeIdBody(KaitaiStream _io, WindowsLnkFile.LinkInfo.VolumeIdSpec _parent, WindowsLnkFile _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.driveType = WindowsLnkFile.DriveTypes.byId(this._io.readU4le());
                this.driveSerialNumber = this._io.readU4le();
                this.ofsVolumeLabel = this._io.readU4le();
                if (isUnicode()) {
                    this.ofsVolumeLabelUnicode = this._io.readU4le();
                }
            }
            private Boolean isUnicode;
            public Boolean isUnicode() {
                if (this.isUnicode != null)
                    return this.isUnicode;
                boolean _tmp = (boolean) (ofsVolumeLabel() == 20);
                this.isUnicode = _tmp;
                return this.isUnicode;
            }
            private String volumeLabelAnsi;
            public String volumeLabelAnsi() {
                if (this.volumeLabelAnsi != null)
                    return this.volumeLabelAnsi;
                if (!(isUnicode())) {
                    long _pos = this._io.pos();
                    this._io.seek((ofsVolumeLabel() - 4));
                    this.volumeLabelAnsi = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("cp437"));
                    this._io.seek(_pos);
                }
                return this.volumeLabelAnsi;
            }
            private DriveTypes driveType;
            private long driveSerialNumber;
            private long ofsVolumeLabel;
            private Long ofsVolumeLabelUnicode;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.VolumeIdSpec _parent;
            public DriveTypes driveType() { return driveType; }
            public long driveSerialNumber() { return driveSerialNumber; }
            public long ofsVolumeLabel() { return ofsVolumeLabel; }
            public Long ofsVolumeLabelUnicode() { return ofsVolumeLabelUnicode; }
            public WindowsLnkFile _root() { return _root; }
            public WindowsLnkFile.LinkInfo.VolumeIdSpec _parent() { return _parent; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class All extends KaitaiStruct {
            public static All fromFile(String fileName) throws IOException {
                return new All(new ByteBufferKaitaiStream(fileName));
            }

            public All(KaitaiStream _io) {
                this(_io, null, null);
            }

            public All(KaitaiStream _io, WindowsLnkFile.LinkInfo _parent) {
                this(_io, _parent, null);
            }

            public All(KaitaiStream _io, WindowsLnkFile.LinkInfo _parent, WindowsLnkFile _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.lenHeader = this._io.readU4le();
                this._raw_header = this._io.readBytes((lenHeader() - 8));
                KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
                this.header = new Header(_io__raw_header, this, _root);
            }
            private VolumeIdSpec volumeId;
            public VolumeIdSpec volumeId() {
                if (this.volumeId != null)
                    return this.volumeId;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek((header().ofsVolumeId() - 4));
                    this.volumeId = new VolumeIdSpec(this._io, this, _root);
                    this._io.seek(_pos);
                }
                return this.volumeId;
            }
            private byte[] localBasePath;
            public byte[] localBasePath() {
                if (this.localBasePath != null)
                    return this.localBasePath;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek((header().ofsLocalBasePath() - 4));
                    this.localBasePath = this._io.readBytesTerm((byte) 0, false, true, true);
                    this._io.seek(_pos);
                }
                return this.localBasePath;
            }
            private long lenHeader;
            private Header header;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo _parent;
            private byte[] _raw_header;
            public long lenHeader() { return lenHeader; }
            public Header header() { return header; }
            public WindowsLnkFile _root() { return _root; }
            public WindowsLnkFile.LinkInfo _parent() { return _parent; }
            public byte[] _raw_header() { return _raw_header; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
         */
        public static class VolumeIdSpec extends KaitaiStruct {
            public static VolumeIdSpec fromFile(String fileName) throws IOException {
                return new VolumeIdSpec(new ByteBufferKaitaiStream(fileName));
            }

            public VolumeIdSpec(KaitaiStream _io) {
                this(_io, null, null);
            }

            public VolumeIdSpec(KaitaiStream _io, WindowsLnkFile.LinkInfo.All _parent) {
                this(_io, _parent, null);
            }

            public VolumeIdSpec(KaitaiStream _io, WindowsLnkFile.LinkInfo.All _parent, WindowsLnkFile _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.lenAll = this._io.readU4le();
                this._raw_body = this._io.readBytes((lenAll() - 4));
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(_raw_body);
                this.body = new VolumeIdBody(_io__raw_body, this, _root);
            }
            private long lenAll;
            private VolumeIdBody body;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.All _parent;
            private byte[] _raw_body;
            public long lenAll() { return lenAll; }
            public VolumeIdBody body() { return body; }
            public WindowsLnkFile _root() { return _root; }
            public WindowsLnkFile.LinkInfo.All _parent() { return _parent; }
            public byte[] _raw_body() { return _raw_body; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class LinkInfoFlags extends KaitaiStruct {
            public static LinkInfoFlags fromFile(String fileName) throws IOException {
                return new LinkInfoFlags(new ByteBufferKaitaiStream(fileName));
            }

            public LinkInfoFlags(KaitaiStream _io) {
                this(_io, null, null);
            }

            public LinkInfoFlags(KaitaiStream _io, WindowsLnkFile.LinkInfo.Header _parent) {
                this(_io, _parent, null);
            }

            public LinkInfoFlags(KaitaiStream _io, WindowsLnkFile.LinkInfo.Header _parent, WindowsLnkFile _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.reserved1 = this._io.readBitsIntBe(6);
                this.hasCommonNetRelLink = this._io.readBitsIntBe(1) != 0;
                this.hasVolumeIdAndLocalBasePath = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(24);
            }
            private long reserved1;
            private boolean hasCommonNetRelLink;
            private boolean hasVolumeIdAndLocalBasePath;
            private long reserved2;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.Header _parent;
            public long reserved1() { return reserved1; }
            public boolean hasCommonNetRelLink() { return hasCommonNetRelLink; }
            public boolean hasVolumeIdAndLocalBasePath() { return hasVolumeIdAndLocalBasePath; }
            public long reserved2() { return reserved2; }
            public WindowsLnkFile _root() { return _root; }
            public WindowsLnkFile.LinkInfo.Header _parent() { return _parent; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class Header extends KaitaiStruct {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }

            public Header(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Header(KaitaiStream _io, WindowsLnkFile.LinkInfo.All _parent) {
                this(_io, _parent, null);
            }

            public Header(KaitaiStream _io, WindowsLnkFile.LinkInfo.All _parent, WindowsLnkFile _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.flags = new LinkInfoFlags(this._io, this, _root);
                this.ofsVolumeId = this._io.readU4le();
                this.ofsLocalBasePath = this._io.readU4le();
                this.ofsCommonNetRelLink = this._io.readU4le();
                this.ofsCommonPathSuffix = this._io.readU4le();
                if (!(_io().isEof())) {
                    this.ofsLocalBasePathUnicode = this._io.readU4le();
                }
                if (!(_io().isEof())) {
                    this.ofsCommonPathSuffixUnicode = this._io.readU4le();
                }
            }
            private LinkInfoFlags flags;
            private long ofsVolumeId;
            private long ofsLocalBasePath;
            private long ofsCommonNetRelLink;
            private long ofsCommonPathSuffix;
            private Long ofsLocalBasePathUnicode;
            private Long ofsCommonPathSuffixUnicode;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.All _parent;
            public LinkInfoFlags flags() { return flags; }
            public long ofsVolumeId() { return ofsVolumeId; }
            public long ofsLocalBasePath() { return ofsLocalBasePath; }
            public long ofsCommonNetRelLink() { return ofsCommonNetRelLink; }
            public long ofsCommonPathSuffix() { return ofsCommonPathSuffix; }
            public Long ofsLocalBasePathUnicode() { return ofsLocalBasePathUnicode; }
            public Long ofsCommonPathSuffixUnicode() { return ofsCommonPathSuffixUnicode; }
            public WindowsLnkFile _root() { return _root; }
            public WindowsLnkFile.LinkInfo.All _parent() { return _parent; }
        }
        private long lenAll;
        private All all;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        private byte[] _raw_all;
        public long lenAll() { return lenAll; }
        public All all() { return all; }
        public WindowsLnkFile _root() { return _root; }
        public WindowsLnkFile _parent() { return _parent; }
        public byte[] _raw_all() { return _raw_all; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1.1</a>
     */
    public static class LinkFlags extends KaitaiStruct {
        public static LinkFlags fromFile(String fileName) throws IOException {
            return new LinkFlags(new ByteBufferKaitaiStream(fileName));
        }

        public LinkFlags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LinkFlags(KaitaiStream _io, WindowsLnkFile.FileHeader _parent) {
            this(_io, _parent, null);
        }

        public LinkFlags(KaitaiStream _io, WindowsLnkFile.FileHeader _parent, WindowsLnkFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.isUnicode = this._io.readBitsIntBe(1) != 0;
            this.hasIconLocation = this._io.readBitsIntBe(1) != 0;
            this.hasArguments = this._io.readBitsIntBe(1) != 0;
            this.hasWorkDir = this._io.readBitsIntBe(1) != 0;
            this.hasRelPath = this._io.readBitsIntBe(1) != 0;
            this.hasName = this._io.readBitsIntBe(1) != 0;
            this.hasLinkInfo = this._io.readBitsIntBe(1) != 0;
            this.hasLinkTargetIdList = this._io.readBitsIntBe(1) != 0;
            this._unnamed8 = this._io.readBitsIntBe(16);
            this.reserved = this._io.readBitsIntBe(5);
            this.keepLocalIdListForUncTarget = this._io.readBitsIntBe(1) != 0;
            this._unnamed11 = this._io.readBitsIntBe(2);
        }
        private boolean isUnicode;
        private boolean hasIconLocation;
        private boolean hasArguments;
        private boolean hasWorkDir;
        private boolean hasRelPath;
        private boolean hasName;
        private boolean hasLinkInfo;
        private boolean hasLinkTargetIdList;
        private long _unnamed8;
        private long reserved;
        private boolean keepLocalIdListForUncTarget;
        private long _unnamed11;
        private WindowsLnkFile _root;
        private WindowsLnkFile.FileHeader _parent;
        public boolean isUnicode() { return isUnicode; }
        public boolean hasIconLocation() { return hasIconLocation; }
        public boolean hasArguments() { return hasArguments; }
        public boolean hasWorkDir() { return hasWorkDir; }
        public boolean hasRelPath() { return hasRelPath; }
        public boolean hasName() { return hasName; }
        public boolean hasLinkInfo() { return hasLinkInfo; }
        public boolean hasLinkTargetIdList() { return hasLinkTargetIdList; }
        public long _unnamed8() { return _unnamed8; }
        public long reserved() { return reserved; }
        public boolean keepLocalIdListForUncTarget() { return keepLocalIdListForUncTarget; }
        public long _unnamed11() { return _unnamed11; }
        public WindowsLnkFile _root() { return _root; }
        public WindowsLnkFile.FileHeader _parent() { return _parent; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1</a>
     */
    public static class FileHeader extends KaitaiStruct {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }

        public FileHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileHeader(KaitaiStream _io, WindowsLnkFile _parent) {
            this(_io, _parent, null);
        }

        public FileHeader(KaitaiStream _io, WindowsLnkFile _parent, WindowsLnkFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenHeader = this._io.readBytes(4);
            if (!(Arrays.equals(lenHeader(), new byte[] { 76, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 0, 0, 0 }, lenHeader(), _io(), "/types/file_header/seq/0");
            }
            this.linkClsid = this._io.readBytes(16);
            if (!(Arrays.equals(linkClsid(), new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }, linkClsid(), _io(), "/types/file_header/seq/1");
            }
            this._raw_flags = this._io.readBytes(4);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(_raw_flags);
            this.flags = new LinkFlags(_io__raw_flags, this, _root);
            this.fileAttrs = this._io.readU4le();
            this.timeCreation = this._io.readU8le();
            this.timeAccess = this._io.readU8le();
            this.timeWrite = this._io.readU8le();
            this.targetFileSize = this._io.readU4le();
            this.iconIndex = this._io.readS4le();
            this.showCommand = WindowsLnkFile.WindowState.byId(this._io.readU4le());
            this.hotkey = this._io.readU2le();
            this.reserved = this._io.readBytes(10);
            if (!(Arrays.equals(reserved(), new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, reserved(), _io(), "/types/file_header/seq/11");
            }
        }
        private byte[] lenHeader;
        private byte[] linkClsid;
        private LinkFlags flags;
        private long fileAttrs;
        private long timeCreation;
        private long timeAccess;
        private long timeWrite;
        private long targetFileSize;
        private int iconIndex;
        private WindowState showCommand;
        private int hotkey;
        private byte[] reserved;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        private byte[] _raw_flags;

        /**
         * Technically, a size of the header, but in reality, it's
         * fixed by standard.
         */
        public byte[] lenHeader() { return lenHeader; }

        /**
         * 16-byte class identified (CLSID), reserved for Windows shell
         * link files.
         */
        public byte[] linkClsid() { return linkClsid; }
        public LinkFlags flags() { return flags; }
        public long fileAttrs() { return fileAttrs; }
        public long timeCreation() { return timeCreation; }
        public long timeAccess() { return timeAccess; }
        public long timeWrite() { return timeWrite; }

        /**
         * Lower 32 bits of the size of the file that this link targets
         */
        public long targetFileSize() { return targetFileSize; }

        /**
         * Index of an icon to use from target file
         */
        public int iconIndex() { return iconIndex; }

        /**
         * Window state to set after the launch of target executable
         */
        public WindowState showCommand() { return showCommand; }
        public int hotkey() { return hotkey; }
        public byte[] reserved() { return reserved; }
        public WindowsLnkFile _root() { return _root; }
        public WindowsLnkFile _parent() { return _parent; }
        public byte[] _raw_flags() { return _raw_flags; }
    }
    private FileHeader header;
    private LinkTargetIdList targetIdList;
    private LinkInfo info;
    private StringData name;
    private StringData relPath;
    private StringData workDir;
    private StringData arguments;
    private StringData iconLocation;
    private WindowsLnkFile _root;
    private KaitaiStruct _parent;
    public FileHeader header() { return header; }
    public LinkTargetIdList targetIdList() { return targetIdList; }
    public LinkInfo info() { return info; }
    public StringData name() { return name; }
    public StringData relPath() { return relPath; }
    public StringData workDir() { return workDir; }
    public StringData arguments() { return arguments; }
    public StringData iconLocation() { return iconLocation; }
    public WindowsLnkFile _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
