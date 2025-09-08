// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Objects;
import io.kaitai.struct.ConsistencyError;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;


/**
 * Windows .lnk files (AKA "shell link" file) are most frequently used
 * in Windows shell to create "shortcuts" to another files, usually for
 * purposes of running a program from some other directory, sometimes
 * with certain preconfigured arguments and some other options.
 * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Source</a>
 */
public class WindowsLnkFile extends KaitaiStruct.ReadWrite {
    public static WindowsLnkFile fromFile(String fileName) throws IOException {
        return new WindowsLnkFile(new ByteBufferKaitaiStream(fileName));
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
    public WindowsLnkFile() {
        this(null, null, null);
    }

    public WindowsLnkFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsLnkFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsLnkFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsLnkFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.header = new FileHeader(this._io, this, _root);
        this.header._read();
        if (header().flags().hasLinkTargetIdList()) {
            this.targetIdList = new LinkTargetIdList(this._io, this, _root);
            this.targetIdList._read();
        }
        if (header().flags().hasLinkInfo()) {
            this.info = new LinkInfo(this._io, this, _root);
            this.info._read();
        }
        if (header().flags().hasName()) {
            this.name = new StringData(this._io, this, _root);
            this.name._read();
        }
        if (header().flags().hasRelPath()) {
            this.relPath = new StringData(this._io, this, _root);
            this.relPath._read();
        }
        if (header().flags().hasWorkDir()) {
            this.workDir = new StringData(this._io, this, _root);
            this.workDir._read();
        }
        if (header().flags().hasArguments()) {
            this.arguments = new StringData(this._io, this, _root);
            this.arguments._read();
        }
        if (header().flags().hasIconLocation()) {
            this.iconLocation = new StringData(this._io, this, _root);
            this.iconLocation._read();
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        if (header().flags().hasLinkTargetIdList()) {
            this.targetIdList._fetchInstances();
        }
        if (header().flags().hasLinkInfo()) {
            this.info._fetchInstances();
        }
        if (header().flags().hasName()) {
            this.name._fetchInstances();
        }
        if (header().flags().hasRelPath()) {
            this.relPath._fetchInstances();
        }
        if (header().flags().hasWorkDir()) {
            this.workDir._fetchInstances();
        }
        if (header().flags().hasArguments()) {
            this.arguments._fetchInstances();
        }
        if (header().flags().hasIconLocation()) {
            this.iconLocation._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        this.header._write_Seq(this._io);
        if (header().flags().hasLinkTargetIdList()) {
            this.targetIdList._write_Seq(this._io);
        }
        if (header().flags().hasLinkInfo()) {
            this.info._write_Seq(this._io);
        }
        if (header().flags().hasName()) {
            this.name._write_Seq(this._io);
        }
        if (header().flags().hasRelPath()) {
            this.relPath._write_Seq(this._io);
        }
        if (header().flags().hasWorkDir()) {
            this.workDir._write_Seq(this._io);
        }
        if (header().flags().hasArguments()) {
            this.arguments._write_Seq(this._io);
        }
        if (header().flags().hasIconLocation()) {
            this.iconLocation._write_Seq(this._io);
        }
    }

    public void _check() {
        if (!Objects.equals(this.header._root(), _root()))
            throw new ConsistencyError("header", _root(), this.header._root());
        if (!Objects.equals(this.header._parent(), this))
            throw new ConsistencyError("header", this, this.header._parent());
        if (header().flags().hasLinkTargetIdList()) {
            if (!Objects.equals(this.targetIdList._root(), _root()))
                throw new ConsistencyError("target_id_list", _root(), this.targetIdList._root());
            if (!Objects.equals(this.targetIdList._parent(), this))
                throw new ConsistencyError("target_id_list", this, this.targetIdList._parent());
        }
        if (header().flags().hasLinkInfo()) {
            if (!Objects.equals(this.info._root(), _root()))
                throw new ConsistencyError("info", _root(), this.info._root());
            if (!Objects.equals(this.info._parent(), this))
                throw new ConsistencyError("info", this, this.info._parent());
        }
        if (header().flags().hasName()) {
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
        }
        if (header().flags().hasRelPath()) {
            if (!Objects.equals(this.relPath._root(), _root()))
                throw new ConsistencyError("rel_path", _root(), this.relPath._root());
            if (!Objects.equals(this.relPath._parent(), this))
                throw new ConsistencyError("rel_path", this, this.relPath._parent());
        }
        if (header().flags().hasWorkDir()) {
            if (!Objects.equals(this.workDir._root(), _root()))
                throw new ConsistencyError("work_dir", _root(), this.workDir._root());
            if (!Objects.equals(this.workDir._parent(), this))
                throw new ConsistencyError("work_dir", this, this.workDir._parent());
        }
        if (header().flags().hasArguments()) {
            if (!Objects.equals(this.arguments._root(), _root()))
                throw new ConsistencyError("arguments", _root(), this.arguments._root());
            if (!Objects.equals(this.arguments._parent(), this))
                throw new ConsistencyError("arguments", this, this.arguments._parent());
        }
        if (header().flags().hasIconLocation()) {
            if (!Objects.equals(this.iconLocation._root(), _root()))
                throw new ConsistencyError("icon_location", _root(), this.iconLocation._root());
            if (!Objects.equals(this.iconLocation._parent(), this))
                throw new ConsistencyError("icon_location", this, this.iconLocation._parent());
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1</a>
     */
    public static class FileHeader extends KaitaiStruct.ReadWrite {
        public static FileHeader fromFile(String fileName) throws IOException {
            return new FileHeader(new ByteBufferKaitaiStream(fileName));
        }
        public FileHeader() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenHeader = this._io.readBytes(4);
            if (!(Arrays.equals(this.lenHeader, new byte[] { 76, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 0, 0, 0 }, this.lenHeader, this._io, "/types/file_header/seq/0");
            }
            this.linkClsid = this._io.readBytes(16);
            if (!(Arrays.equals(this.linkClsid, new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }, this.linkClsid, this._io, "/types/file_header/seq/1");
            }
            this._raw_flags = this._io.readBytes(4);
            KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(this._raw_flags);
            this.flags = new LinkFlags(_io__raw_flags, this, _root);
            this.flags._read();
            this.fileAttrs = this._io.readU4le();
            this.timeCreation = this._io.readU8le();
            this.timeAccess = this._io.readU8le();
            this.timeWrite = this._io.readU8le();
            this.targetFileSize = this._io.readU4le();
            this.iconIndex = this._io.readS4le();
            this.showCommand = WindowsLnkFile.WindowState.byId(this._io.readU4le());
            this.hotkey = this._io.readU2le();
            this.reserved = this._io.readBytes(10);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.reserved, this._io, "/types/file_header/seq/11");
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            this.flags._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBytes(this.lenHeader);
            this._io.writeBytes(this.linkClsid);
            final KaitaiStream _io__raw_flags = new ByteBufferKaitaiStream(4);
            this._io.addChildStream(_io__raw_flags);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (4));
                final FileHeader _this = this;
                _io__raw_flags.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_flags = _io__raw_flags.toByteArray();
                        if (_this._raw_flags.length != 4)
                            throw new ConsistencyError("raw(flags)", 4, _this._raw_flags.length);
                        parent.writeBytes(_this._raw_flags);
                    }
                });
            }
            this.flags._write_Seq(_io__raw_flags);
            this._io.writeU4le(this.fileAttrs);
            this._io.writeU8le(this.timeCreation);
            this._io.writeU8le(this.timeAccess);
            this._io.writeU8le(this.timeWrite);
            this._io.writeU4le(this.targetFileSize);
            this._io.writeS4le(this.iconIndex);
            this._io.writeU4le(((Number) (this.showCommand.id())).longValue());
            this._io.writeU2le(this.hotkey);
            this._io.writeBytes(this.reserved);
        }

        public void _check() {
            if (this.lenHeader.length != 4)
                throw new ConsistencyError("len_header", 4, this.lenHeader.length);
            if (!(Arrays.equals(this.lenHeader, new byte[] { 76, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 76, 0, 0, 0 }, this.lenHeader, null, "/types/file_header/seq/0");
            }
            if (this.linkClsid.length != 16)
                throw new ConsistencyError("link_clsid", 16, this.linkClsid.length);
            if (!(Arrays.equals(this.linkClsid, new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 1, 20, 2, 0, 0, 0, 0, 0, -64, 0, 0, 0, 0, 0, 0, 70 }, this.linkClsid, null, "/types/file_header/seq/1");
            }
            if (!Objects.equals(this.flags._root(), _root()))
                throw new ConsistencyError("flags", _root(), this.flags._root());
            if (!Objects.equals(this.flags._parent(), this))
                throw new ConsistencyError("flags", this, this.flags._parent());
            if (this.reserved.length != 10)
                throw new ConsistencyError("reserved", 10, this.reserved.length);
            if (!(Arrays.equals(this.reserved, new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 }, this.reserved, null, "/types/file_header/seq/11");
            }
            _dirty = false;
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
        public void setLenHeader(byte[] _v) { _dirty = true; lenHeader = _v; }

        /**
         * 16-byte class identified (CLSID), reserved for Windows shell
         * link files.
         */
        public byte[] linkClsid() { return linkClsid; }
        public void setLinkClsid(byte[] _v) { _dirty = true; linkClsid = _v; }
        public LinkFlags flags() { return flags; }
        public void setFlags(LinkFlags _v) { _dirty = true; flags = _v; }
        public long fileAttrs() { return fileAttrs; }
        public void setFileAttrs(long _v) { _dirty = true; fileAttrs = _v; }
        public long timeCreation() { return timeCreation; }
        public void setTimeCreation(long _v) { _dirty = true; timeCreation = _v; }
        public long timeAccess() { return timeAccess; }
        public void setTimeAccess(long _v) { _dirty = true; timeAccess = _v; }
        public long timeWrite() { return timeWrite; }
        public void setTimeWrite(long _v) { _dirty = true; timeWrite = _v; }

        /**
         * Lower 32 bits of the size of the file that this link targets
         */
        public long targetFileSize() { return targetFileSize; }
        public void setTargetFileSize(long _v) { _dirty = true; targetFileSize = _v; }

        /**
         * Index of an icon to use from target file
         */
        public int iconIndex() { return iconIndex; }
        public void setIconIndex(int _v) { _dirty = true; iconIndex = _v; }

        /**
         * Window state to set after the launch of target executable
         */
        public WindowState showCommand() { return showCommand; }
        public void setShowCommand(WindowState _v) { _dirty = true; showCommand = _v; }
        public int hotkey() { return hotkey; }
        public void setHotkey(int _v) { _dirty = true; hotkey = _v; }
        public byte[] reserved() { return reserved; }
        public void setReserved(byte[] _v) { _dirty = true; reserved = _v; }
        public WindowsLnkFile _root() { return _root; }
        public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
        public WindowsLnkFile _parent() { return _parent; }
        public void set_parent(WindowsLnkFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_flags() { return _raw_flags; }
        public void set_raw_Flags(byte[] _v) { _dirty = true; _raw_flags = _v; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.1.1</a>
     */
    public static class LinkFlags extends KaitaiStruct.ReadWrite {
        public static LinkFlags fromFile(String fileName) throws IOException {
            return new LinkFlags(new ByteBufferKaitaiStream(fileName));
        }
        public LinkFlags() {
            this(null, null, null);
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
        }
        public void _read() {
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
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(1, (this.isUnicode ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasIconLocation ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasArguments ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasWorkDir ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasRelPath ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasName ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasLinkInfo ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.hasLinkTargetIdList ? 1 : 0));
            this._io.writeBitsIntBe(16, this._unnamed8);
            this._io.writeBitsIntBe(5, this.reserved);
            this._io.writeBitsIntBe(1, (this.keepLocalIdListForUncTarget ? 1 : 0));
            this._io.writeBitsIntBe(2, this._unnamed11);
        }

        public void _check() {
            _dirty = false;
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
        public void setIsUnicode(boolean _v) { _dirty = true; isUnicode = _v; }
        public boolean hasIconLocation() { return hasIconLocation; }
        public void setHasIconLocation(boolean _v) { _dirty = true; hasIconLocation = _v; }
        public boolean hasArguments() { return hasArguments; }
        public void setHasArguments(boolean _v) { _dirty = true; hasArguments = _v; }
        public boolean hasWorkDir() { return hasWorkDir; }
        public void setHasWorkDir(boolean _v) { _dirty = true; hasWorkDir = _v; }
        public boolean hasRelPath() { return hasRelPath; }
        public void setHasRelPath(boolean _v) { _dirty = true; hasRelPath = _v; }
        public boolean hasName() { return hasName; }
        public void setHasName(boolean _v) { _dirty = true; hasName = _v; }
        public boolean hasLinkInfo() { return hasLinkInfo; }
        public void setHasLinkInfo(boolean _v) { _dirty = true; hasLinkInfo = _v; }
        public boolean hasLinkTargetIdList() { return hasLinkTargetIdList; }
        public void setHasLinkTargetIdList(boolean _v) { _dirty = true; hasLinkTargetIdList = _v; }
        public long _unnamed8() { return _unnamed8; }
        public void set_unnamed8(long _v) { _dirty = true; _unnamed8 = _v; }
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }
        public boolean keepLocalIdListForUncTarget() { return keepLocalIdListForUncTarget; }
        public void setKeepLocalIdListForUncTarget(boolean _v) { _dirty = true; keepLocalIdListForUncTarget = _v; }
        public long _unnamed11() { return _unnamed11; }
        public void set_unnamed11(long _v) { _dirty = true; _unnamed11 = _v; }
        public WindowsLnkFile _root() { return _root; }
        public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
        public WindowsLnkFile.FileHeader _parent() { return _parent; }
        public void set_parent(WindowsLnkFile.FileHeader _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
     */
    public static class LinkInfo extends KaitaiStruct.ReadWrite {
        public static LinkInfo fromFile(String fileName) throws IOException {
            return new LinkInfo(new ByteBufferKaitaiStream(fileName));
        }
        public LinkInfo() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenAll = this._io.readU4le();
            this._raw_all = this._io.readBytes(lenAll() - 4);
            KaitaiStream _io__raw_all = new ByteBufferKaitaiStream(this._raw_all);
            this.all = new All(_io__raw_all, this, _root);
            this.all._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.all._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.lenAll);
            final KaitaiStream _io__raw_all = new ByteBufferKaitaiStream(lenAll() - 4);
            this._io.addChildStream(_io__raw_all);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenAll() - 4));
                final LinkInfo _this = this;
                _io__raw_all.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_all = _io__raw_all.toByteArray();
                        if (_this._raw_all.length != lenAll() - 4)
                            throw new ConsistencyError("raw(all)", lenAll() - 4, _this._raw_all.length);
                        parent.writeBytes(_this._raw_all);
                    }
                });
            }
            this.all._write_Seq(_io__raw_all);
        }

        public void _check() {
            if (!Objects.equals(this.all._root(), _root()))
                throw new ConsistencyError("all", _root(), this.all._root());
            if (!Objects.equals(this.all._parent(), this))
                throw new ConsistencyError("all", this, this.all._parent());
            _dirty = false;
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class All extends KaitaiStruct.ReadWrite {
            public static All fromFile(String fileName) throws IOException {
                return new All(new ByteBufferKaitaiStream(fileName));
            }
            public All() {
                this(null, null, null);
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
            }
            public void _read() {
                this.lenHeader = this._io.readU4le();
                this._raw_header = this._io.readBytes(lenHeader() - 8);
                KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(this._raw_header);
                this.header = new Header(_io__raw_header, this, _root);
                this.header._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.header._fetchInstances();
                localBasePath();
                if (this.localBasePath != null) {
                }
                volumeId();
                if (this.volumeId != null) {
                    this.volumeId._fetchInstances();
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteLocalBasePath = _enabledLocalBasePath;
                _shouldWriteVolumeId = _enabledVolumeId;
                this._io.writeU4le(this.lenHeader);
                final KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(lenHeader() - 8);
                this._io.addChildStream(_io__raw_header);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenHeader() - 8));
                    final All _this = this;
                    _io__raw_header.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_header = _io__raw_header.toByteArray();
                            if (_this._raw_header.length != lenHeader() - 8)
                                throw new ConsistencyError("raw(header)", lenHeader() - 8, _this._raw_header.length);
                            parent.writeBytes(_this._raw_header);
                        }
                    });
                }
                this.header._write_Seq(_io__raw_header);
            }

            public void _check() {
                if (!Objects.equals(this.header._root(), _root()))
                    throw new ConsistencyError("header", _root(), this.header._root());
                if (!Objects.equals(this.header._parent(), this))
                    throw new ConsistencyError("header", this, this.header._parent());
                if (_enabledLocalBasePath) {
                    if (header().flags().hasVolumeIdAndLocalBasePath()) {
                        if (KaitaiStream.byteArrayIndexOf(this.localBasePath, ((byte) 0)) != -1)
                            throw new ConsistencyError("local_base_path", -1, KaitaiStream.byteArrayIndexOf(this.localBasePath, ((byte) 0)));
                    }
                }
                if (_enabledVolumeId) {
                    if (header().flags().hasVolumeIdAndLocalBasePath()) {
                        if (!Objects.equals(this.volumeId._root(), _root()))
                            throw new ConsistencyError("volume_id", _root(), this.volumeId._root());
                        if (!Objects.equals(this.volumeId._parent(), this))
                            throw new ConsistencyError("volume_id", this, this.volumeId._parent());
                    }
                }
                _dirty = false;
            }
            private byte[] localBasePath;
            private boolean _shouldWriteLocalBasePath = false;
            private boolean _enabledLocalBasePath = true;
            public byte[] localBasePath() {
                if (_shouldWriteLocalBasePath)
                    _writeLocalBasePath();
                if (this.localBasePath != null)
                    return this.localBasePath;
                if (!_enabledLocalBasePath)
                    return null;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek(header().ofsLocalBasePath() - 4);
                    this.localBasePath = this._io.readBytesTerm((byte) 0, false, true, true);
                    this._io.seek(_pos);
                }
                return this.localBasePath;
            }
            public void setLocalBasePath(byte[] _v) { _dirty = true; localBasePath = _v; }
            public void setLocalBasePath_Enabled(boolean _v) { _dirty = true; _enabledLocalBasePath = _v; }

            private void _writeLocalBasePath() {
                _shouldWriteLocalBasePath = false;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek(header().ofsLocalBasePath() - 4);
                    this._io.writeBytes(this.localBasePath);
                    this._io.writeU1(0);
                    this._io.seek(_pos);
                }
            }
            private VolumeIdSpec volumeId;
            private boolean _shouldWriteVolumeId = false;
            private boolean _enabledVolumeId = true;
            public VolumeIdSpec volumeId() {
                if (_shouldWriteVolumeId)
                    _writeVolumeId();
                if (this.volumeId != null)
                    return this.volumeId;
                if (!_enabledVolumeId)
                    return null;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek(header().ofsVolumeId() - 4);
                    this.volumeId = new VolumeIdSpec(this._io, this, _root);
                    this.volumeId._read();
                    this._io.seek(_pos);
                }
                return this.volumeId;
            }
            public void setVolumeId(VolumeIdSpec _v) { _dirty = true; volumeId = _v; }
            public void setVolumeId_Enabled(boolean _v) { _dirty = true; _enabledVolumeId = _v; }

            private void _writeVolumeId() {
                _shouldWriteVolumeId = false;
                if (header().flags().hasVolumeIdAndLocalBasePath()) {
                    long _pos = this._io.pos();
                    this._io.seek(header().ofsVolumeId() - 4);
                    this.volumeId._write_Seq(this._io);
                    this._io.seek(_pos);
                }
            }
            private long lenHeader;
            private Header header;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo _parent;
            private byte[] _raw_header;
            public long lenHeader() { return lenHeader; }
            public void setLenHeader(long _v) { _dirty = true; lenHeader = _v; }
            public Header header() { return header; }
            public void setHeader(Header _v) { _dirty = true; header = _v; }
            public WindowsLnkFile _root() { return _root; }
            public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
            public WindowsLnkFile.LinkInfo _parent() { return _parent; }
            public void set_parent(WindowsLnkFile.LinkInfo _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_header() { return _raw_header; }
            public void set_raw_Header(byte[] _v) { _dirty = true; _raw_header = _v; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class Header extends KaitaiStruct.ReadWrite {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }
            public Header() {
                this(null, null, null);
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
            }
            public void _read() {
                this.flags = new LinkInfoFlags(this._io, this, _root);
                this.flags._read();
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
                _dirty = false;
            }

            public void _fetchInstances() {
                this.flags._fetchInstances();
                if (!(_io().isEof())) {
                }
                if (!(_io().isEof())) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                this.flags._write_Seq(this._io);
                this._io.writeU4le(this.ofsVolumeId);
                this._io.writeU4le(this.ofsLocalBasePath);
                this._io.writeU4le(this.ofsCommonNetRelLink);
                this._io.writeU4le(this.ofsCommonPathSuffix);
                if (!(_io().isEof())) {
                    this._io.writeU4le(this.ofsLocalBasePathUnicode);
                }
                if (!(_io().isEof())) {
                    this._io.writeU4le(this.ofsCommonPathSuffixUnicode);
                }
            }

            public void _check() {
                if (!Objects.equals(this.flags._root(), _root()))
                    throw new ConsistencyError("flags", _root(), this.flags._root());
                if (!Objects.equals(this.flags._parent(), this))
                    throw new ConsistencyError("flags", this, this.flags._parent());
                _dirty = false;
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
            public void setFlags(LinkInfoFlags _v) { _dirty = true; flags = _v; }
            public long ofsVolumeId() { return ofsVolumeId; }
            public void setOfsVolumeId(long _v) { _dirty = true; ofsVolumeId = _v; }
            public long ofsLocalBasePath() { return ofsLocalBasePath; }
            public void setOfsLocalBasePath(long _v) { _dirty = true; ofsLocalBasePath = _v; }
            public long ofsCommonNetRelLink() { return ofsCommonNetRelLink; }
            public void setOfsCommonNetRelLink(long _v) { _dirty = true; ofsCommonNetRelLink = _v; }
            public long ofsCommonPathSuffix() { return ofsCommonPathSuffix; }
            public void setOfsCommonPathSuffix(long _v) { _dirty = true; ofsCommonPathSuffix = _v; }
            public Long ofsLocalBasePathUnicode() { return ofsLocalBasePathUnicode; }
            public void setOfsLocalBasePathUnicode(Long _v) { _dirty = true; ofsLocalBasePathUnicode = _v; }
            public Long ofsCommonPathSuffixUnicode() { return ofsCommonPathSuffixUnicode; }
            public void setOfsCommonPathSuffixUnicode(Long _v) { _dirty = true; ofsCommonPathSuffixUnicode = _v; }
            public WindowsLnkFile _root() { return _root; }
            public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
            public WindowsLnkFile.LinkInfo.All _parent() { return _parent; }
            public void set_parent(WindowsLnkFile.LinkInfo.All _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3</a>
         */
        public static class LinkInfoFlags extends KaitaiStruct.ReadWrite {
            public static LinkInfoFlags fromFile(String fileName) throws IOException {
                return new LinkInfoFlags(new ByteBufferKaitaiStream(fileName));
            }
            public LinkInfoFlags() {
                this(null, null, null);
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
            }
            public void _read() {
                this.reserved1 = this._io.readBitsIntBe(6);
                this.hasCommonNetRelLink = this._io.readBitsIntBe(1) != 0;
                this.hasVolumeIdAndLocalBasePath = this._io.readBitsIntBe(1) != 0;
                this.reserved2 = this._io.readBitsIntBe(24);
                _dirty = false;
            }

            public void _fetchInstances() {
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeBitsIntBe(6, this.reserved1);
                this._io.writeBitsIntBe(1, (this.hasCommonNetRelLink ? 1 : 0));
                this._io.writeBitsIntBe(1, (this.hasVolumeIdAndLocalBasePath ? 1 : 0));
                this._io.writeBitsIntBe(24, this.reserved2);
            }

            public void _check() {
                _dirty = false;
            }
            private long reserved1;
            private boolean hasCommonNetRelLink;
            private boolean hasVolumeIdAndLocalBasePath;
            private long reserved2;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.Header _parent;
            public long reserved1() { return reserved1; }
            public void setReserved1(long _v) { _dirty = true; reserved1 = _v; }
            public boolean hasCommonNetRelLink() { return hasCommonNetRelLink; }
            public void setHasCommonNetRelLink(boolean _v) { _dirty = true; hasCommonNetRelLink = _v; }
            public boolean hasVolumeIdAndLocalBasePath() { return hasVolumeIdAndLocalBasePath; }
            public void setHasVolumeIdAndLocalBasePath(boolean _v) { _dirty = true; hasVolumeIdAndLocalBasePath = _v; }
            public long reserved2() { return reserved2; }
            public void setReserved2(long _v) { _dirty = true; reserved2 = _v; }
            public WindowsLnkFile _root() { return _root; }
            public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
            public WindowsLnkFile.LinkInfo.Header _parent() { return _parent; }
            public void set_parent(WindowsLnkFile.LinkInfo.Header _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
         */
        public static class VolumeIdBody extends KaitaiStruct.ReadWrite {
            public static VolumeIdBody fromFile(String fileName) throws IOException {
                return new VolumeIdBody(new ByteBufferKaitaiStream(fileName));
            }
            public VolumeIdBody() {
                this(null, null, null);
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
            }
            public void _read() {
                this.driveType = WindowsLnkFile.DriveTypes.byId(this._io.readU4le());
                this.driveSerialNumber = this._io.readU4le();
                this.ofsVolumeLabel = this._io.readU4le();
                if (isUnicode()) {
                    this.ofsVolumeLabelUnicode = this._io.readU4le();
                }
                _dirty = false;
            }

            public void _fetchInstances() {
                if (isUnicode()) {
                }
                volumeLabelAnsi();
                if (this.volumeLabelAnsi != null) {
                }
            }

            public void _write_Seq() {
                _assertNotDirty();
                _shouldWriteVolumeLabelAnsi = _enabledVolumeLabelAnsi;
                this._io.writeU4le(((Number) (this.driveType.id())).longValue());
                this._io.writeU4le(this.driveSerialNumber);
                this._io.writeU4le(this.ofsVolumeLabel);
                if (isUnicode()) {
                    this._io.writeU4le(this.ofsVolumeLabelUnicode);
                }
            }

            public void _check() {
                if (isUnicode()) {
                }
                if (_enabledVolumeLabelAnsi) {
                    if (!(isUnicode())) {
                        if (KaitaiStream.byteArrayIndexOf((this.volumeLabelAnsi).getBytes(Charset.forName("IBM437")), ((byte) 0)) != -1)
                            throw new ConsistencyError("volume_label_ansi", -1, KaitaiStream.byteArrayIndexOf((this.volumeLabelAnsi).getBytes(Charset.forName("IBM437")), ((byte) 0)));
                    }
                }
                _dirty = false;
            }
            private Boolean isUnicode;
            public Boolean isUnicode() {
                if (this.isUnicode != null)
                    return this.isUnicode;
                this.isUnicode = ofsVolumeLabel() == 20;
                return this.isUnicode;
            }
            public void _invalidateIsUnicode() { this.isUnicode = null; }
            private String volumeLabelAnsi;
            private boolean _shouldWriteVolumeLabelAnsi = false;
            private boolean _enabledVolumeLabelAnsi = true;
            public String volumeLabelAnsi() {
                if (_shouldWriteVolumeLabelAnsi)
                    _writeVolumeLabelAnsi();
                if (this.volumeLabelAnsi != null)
                    return this.volumeLabelAnsi;
                if (!_enabledVolumeLabelAnsi)
                    return null;
                if (!(isUnicode())) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsVolumeLabel() - 4);
                    this.volumeLabelAnsi = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("IBM437"));
                    this._io.seek(_pos);
                }
                return this.volumeLabelAnsi;
            }
            public void setVolumeLabelAnsi(String _v) { _dirty = true; volumeLabelAnsi = _v; }
            public void setVolumeLabelAnsi_Enabled(boolean _v) { _dirty = true; _enabledVolumeLabelAnsi = _v; }

            private void _writeVolumeLabelAnsi() {
                _shouldWriteVolumeLabelAnsi = false;
                if (!(isUnicode())) {
                    long _pos = this._io.pos();
                    this._io.seek(ofsVolumeLabel() - 4);
                    this._io.writeBytes((this.volumeLabelAnsi).getBytes(Charset.forName("IBM437")));
                    this._io.writeU1(0);
                    this._io.seek(_pos);
                }
            }
            private DriveTypes driveType;
            private long driveSerialNumber;
            private long ofsVolumeLabel;
            private Long ofsVolumeLabelUnicode;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.VolumeIdSpec _parent;
            public DriveTypes driveType() { return driveType; }
            public void setDriveType(DriveTypes _v) { _dirty = true; driveType = _v; }
            public long driveSerialNumber() { return driveSerialNumber; }
            public void setDriveSerialNumber(long _v) { _dirty = true; driveSerialNumber = _v; }
            public long ofsVolumeLabel() { return ofsVolumeLabel; }
            public void setOfsVolumeLabel(long _v) { _dirty = true; ofsVolumeLabel = _v; }
            public Long ofsVolumeLabelUnicode() { return ofsVolumeLabelUnicode; }
            public void setOfsVolumeLabelUnicode(Long _v) { _dirty = true; ofsVolumeLabelUnicode = _v; }
            public WindowsLnkFile _root() { return _root; }
            public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
            public WindowsLnkFile.LinkInfo.VolumeIdSpec _parent() { return _parent; }
            public void set_parent(WindowsLnkFile.LinkInfo.VolumeIdSpec _v) { _dirty = true; _parent = _v; }
        }

        /**
         * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.3.1</a>
         */
        public static class VolumeIdSpec extends KaitaiStruct.ReadWrite {
            public static VolumeIdSpec fromFile(String fileName) throws IOException {
                return new VolumeIdSpec(new ByteBufferKaitaiStream(fileName));
            }
            public VolumeIdSpec() {
                this(null, null, null);
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
            }
            public void _read() {
                this.lenAll = this._io.readU4le();
                this._raw_body = this._io.readBytes(lenAll() - 4);
                KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(this._raw_body);
                this.body = new VolumeIdBody(_io__raw_body, this, _root);
                this.body._read();
                _dirty = false;
            }

            public void _fetchInstances() {
                this.body._fetchInstances();
            }

            public void _write_Seq() {
                _assertNotDirty();
                this._io.writeU4le(this.lenAll);
                final KaitaiStream _io__raw_body = new ByteBufferKaitaiStream(lenAll() - 4);
                this._io.addChildStream(_io__raw_body);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenAll() - 4));
                    final VolumeIdSpec _this = this;
                    _io__raw_body.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_body = _io__raw_body.toByteArray();
                            if (_this._raw_body.length != lenAll() - 4)
                                throw new ConsistencyError("raw(body)", lenAll() - 4, _this._raw_body.length);
                            parent.writeBytes(_this._raw_body);
                        }
                    });
                }
                this.body._write_Seq(_io__raw_body);
            }

            public void _check() {
                if (!Objects.equals(this.body._root(), _root()))
                    throw new ConsistencyError("body", _root(), this.body._root());
                if (!Objects.equals(this.body._parent(), this))
                    throw new ConsistencyError("body", this, this.body._parent());
                _dirty = false;
            }
            private long lenAll;
            private VolumeIdBody body;
            private WindowsLnkFile _root;
            private WindowsLnkFile.LinkInfo.All _parent;
            private byte[] _raw_body;
            public long lenAll() { return lenAll; }
            public void setLenAll(long _v) { _dirty = true; lenAll = _v; }
            public VolumeIdBody body() { return body; }
            public void setBody(VolumeIdBody _v) { _dirty = true; body = _v; }
            public WindowsLnkFile _root() { return _root; }
            public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
            public WindowsLnkFile.LinkInfo.All _parent() { return _parent; }
            public void set_parent(WindowsLnkFile.LinkInfo.All _v) { _dirty = true; _parent = _v; }
            public byte[] _raw_body() { return _raw_body; }
            public void set_raw_Body(byte[] _v) { _dirty = true; _raw_body = _v; }
        }
        private long lenAll;
        private All all;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        private byte[] _raw_all;
        public long lenAll() { return lenAll; }
        public void setLenAll(long _v) { _dirty = true; lenAll = _v; }
        public All all() { return all; }
        public void setAll(All _v) { _dirty = true; all = _v; }
        public WindowsLnkFile _root() { return _root; }
        public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
        public WindowsLnkFile _parent() { return _parent; }
        public void set_parent(WindowsLnkFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_all() { return _raw_all; }
        public void set_raw_All(byte[] _v) { _dirty = true; _raw_all = _v; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2</a>
     */
    public static class LinkTargetIdList extends KaitaiStruct.ReadWrite {
        public static LinkTargetIdList fromFile(String fileName) throws IOException {
            return new LinkTargetIdList(new ByteBufferKaitaiStream(fileName));
        }
        public LinkTargetIdList() {
            this(null, null, null);
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
        }
        public void _read() {
            this.lenIdList = this._io.readU2le();
            this._raw_idList = this._io.readBytes(lenIdList());
            KaitaiStream _io__raw_idList = new ByteBufferKaitaiStream(this._raw_idList);
            this.idList = new WindowsShellItems(_io__raw_idList);
            this.idList._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.idList._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.lenIdList);
            final KaitaiStream _io__raw_idList = new ByteBufferKaitaiStream(lenIdList());
            this._io.addChildStream(_io__raw_idList);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenIdList()));
                final LinkTargetIdList _this = this;
                _io__raw_idList.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_idList = _io__raw_idList.toByteArray();
                        if (_this._raw_idList.length != lenIdList())
                            throw new ConsistencyError("raw(id_list)", lenIdList(), _this._raw_idList.length);
                        parent.writeBytes(_this._raw_idList);
                    }
                });
            }
            this.idList._write_Seq(_io__raw_idList);
        }

        public void _check() {
            _dirty = false;
        }
        private int lenIdList;
        private WindowsShellItems idList;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        private byte[] _raw_idList;
        public int lenIdList() { return lenIdList; }
        public void setLenIdList(int _v) { _dirty = true; lenIdList = _v; }
        public WindowsShellItems idList() { return idList; }
        public void setIdList(WindowsShellItems _v) { _dirty = true; idList = _v; }
        public WindowsLnkFile _root() { return _root; }
        public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
        public WindowsLnkFile _parent() { return _parent; }
        public void set_parent(WindowsLnkFile _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_idList() { return _raw_idList; }
        public void set_raw_IdList(byte[] _v) { _dirty = true; _raw_idList = _v; }
    }
    public static class StringData extends KaitaiStruct.ReadWrite {
        public static StringData fromFile(String fileName) throws IOException {
            return new StringData(new ByteBufferKaitaiStream(fileName));
        }
        public StringData() {
            this(null, null, null);
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
        }
        public void _read() {
            this.charsStr = this._io.readU2le();
            this.str = new String(this._io.readBytes(charsStr() * 2), StandardCharsets.UTF_16LE);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.charsStr);
            this._io.writeBytes((this.str).getBytes(Charset.forName("UTF-16LE")));
        }

        public void _check() {
            if ((this.str).getBytes(Charset.forName("UTF-16LE")).length != charsStr() * 2)
                throw new ConsistencyError("str", charsStr() * 2, (this.str).getBytes(Charset.forName("UTF-16LE")).length);
            _dirty = false;
        }
        private int charsStr;
        private String str;
        private WindowsLnkFile _root;
        private WindowsLnkFile _parent;
        public int charsStr() { return charsStr; }
        public void setCharsStr(int _v) { _dirty = true; charsStr = _v; }
        public String str() { return str; }
        public void setStr(String _v) { _dirty = true; str = _v; }
        public WindowsLnkFile _root() { return _root; }
        public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
        public WindowsLnkFile _parent() { return _parent; }
        public void set_parent(WindowsLnkFile _v) { _dirty = true; _parent = _v; }
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
    private KaitaiStruct.ReadWrite _parent;
    public FileHeader header() { return header; }
    public void setHeader(FileHeader _v) { _dirty = true; header = _v; }
    public LinkTargetIdList targetIdList() { return targetIdList; }
    public void setTargetIdList(LinkTargetIdList _v) { _dirty = true; targetIdList = _v; }
    public LinkInfo info() { return info; }
    public void setInfo(LinkInfo _v) { _dirty = true; info = _v; }
    public StringData name() { return name; }
    public void setName(StringData _v) { _dirty = true; name = _v; }
    public StringData relPath() { return relPath; }
    public void setRelPath(StringData _v) { _dirty = true; relPath = _v; }
    public StringData workDir() { return workDir; }
    public void setWorkDir(StringData _v) { _dirty = true; workDir = _v; }
    public StringData arguments() { return arguments; }
    public void setArguments(StringData _v) { _dirty = true; arguments = _v; }
    public StringData iconLocation() { return iconLocation; }
    public void setIconLocation(StringData _v) { _dirty = true; iconLocation = _v; }
    public WindowsLnkFile _root() { return _root; }
    public void set_root(WindowsLnkFile _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
