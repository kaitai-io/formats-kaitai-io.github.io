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
 * Windows Shell Items (AKA "shellbags") is an undocumented set of
 * structures used internally within Windows to identify paths in
 * Windows Folder Hierarchy. It is widely used in Windows Shell (and
 * most visible in File Explorer), both as in-memory and in-file
 * structures. Some formats embed them, namely:
 * 
 * * Windows Shell link files (.lnk) Windows registry
 * * Windows registry "ShellBags" keys
 * 
 * The format is mostly undocumented, and is known to vary between
 * various Windows versions.
 * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc">Source</a>
 */
public class WindowsShellItems extends KaitaiStruct.ReadWrite {
    public static WindowsShellItems fromFile(String fileName) throws IOException {
        return new WindowsShellItems(new ByteBufferKaitaiStream(fileName));
    }
    public WindowsShellItems() {
        this(null, null, null);
    }

    public WindowsShellItems(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsShellItems(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsShellItems(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsShellItems _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.items = new ArrayList<ShellItem>();
        {
            ShellItem _it;
            int i = 0;
            do {
                ShellItem _t_items = new ShellItem(this._io, this, _root);
                try {
                    _t_items._read();
                } finally {
                    _it = _t_items;
                    this.items.add(_it);
                }
                i++;
            } while (!(_it.lenData() == 0));
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
            this.items.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
    }

    public void _check() {
        if (this.items.size() == 0)
            throw new ConsistencyError("items", 0, this.items.size());
        for (int i = 0; i < this.items.size(); i++) {
            if (!Objects.equals(this.items.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("items", _root(), this.items.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.items.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("items", this, this.items.get(((Number) (i)).intValue())._parent());
            {
                ShellItem _it = this.items.get(((Number) (i)).intValue());
                if ((_it.lenData() == 0) != (i == this.items.size() - 1))
                    throw new ConsistencyError("items", i == this.items.size() - 1, _it.lenData() == 0);
            }
        }
        _dirty = false;
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item">Source</a>
     */
    public static class FileEntryBody extends KaitaiStruct.ReadWrite {
        public static FileEntryBody fromFile(String fileName) throws IOException {
            return new FileEntryBody(new ByteBufferKaitaiStream(fileName));
        }
        public FileEntryBody() {
            this(null, null, null);
        }

        public FileEntryBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public FileEntryBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent) {
            this(_io, _parent, null);
        }

        public FileEntryBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent, WindowsShellItems _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this._unnamed0 = this._io.readU1();
            this.fileSize = this._io.readU4le();
            this.lastModTime = this._io.readU4le();
            this.fileAttrs = this._io.readU2le();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this._unnamed0);
            this._io.writeU4le(this.fileSize);
            this._io.writeU4le(this.lastModTime);
            this._io.writeU2le(this.fileAttrs);
        }

        public void _check() {
            _dirty = false;
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (_parent().code() & 1) != 0;
            return this.isDir;
        }
        public void _invalidateIsDir() { this.isDir = null; }
        private Boolean isFile;
        public Boolean isFile() {
            if (this.isFile != null)
                return this.isFile;
            this.isFile = (_parent().code() & 2) != 0;
            return this.isFile;
        }
        public void _invalidateIsFile() { this.isFile = null; }
        private int _unnamed0;
        private long fileSize;
        private long lastModTime;
        private int fileAttrs;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int _unnamed0() { return _unnamed0; }
        public void set_unnamed0(int _v) { _dirty = true; _unnamed0 = _v; }
        public long fileSize() { return fileSize; }
        public void setFileSize(long _v) { _dirty = true; fileSize = _v; }
        public long lastModTime() { return lastModTime; }
        public void setLastModTime(long _v) { _dirty = true; lastModTime = _v; }
        public int fileAttrs() { return fileAttrs; }
        public void setFileAttrs(int _v) { _dirty = true; fileAttrs = _v; }
        public WindowsShellItems _root() { return _root; }
        public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
        public void set_parent(WindowsShellItems.ShellItemData _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item">Source</a>
     */
    public static class RootFolderBody extends KaitaiStruct.ReadWrite {
        public static RootFolderBody fromFile(String fileName) throws IOException {
            return new RootFolderBody(new ByteBufferKaitaiStream(fileName));
        }
        public RootFolderBody() {
            this(null, null, null);
        }

        public RootFolderBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public RootFolderBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent) {
            this(_io, _parent, null);
        }

        public RootFolderBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent, WindowsShellItems _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.sortIndex = this._io.readU1();
            this.shellFolderId = this._io.readBytes(16);
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.sortIndex);
            this._io.writeBytes(this.shellFolderId);
        }

        public void _check() {
            if (this.shellFolderId.length != 16)
                throw new ConsistencyError("shell_folder_id", 16, this.shellFolderId.length);
            _dirty = false;
        }
        private int sortIndex;
        private byte[] shellFolderId;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int sortIndex() { return sortIndex; }
        public void setSortIndex(int _v) { _dirty = true; sortIndex = _v; }
        public byte[] shellFolderId() { return shellFolderId; }
        public void setShellFolderId(byte[] _v) { _dirty = true; shellFolderId = _v; }
        public WindowsShellItems _root() { return _root; }
        public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
        public void set_parent(WindowsShellItems.ShellItemData _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.2</a>
     */
    public static class ShellItem extends KaitaiStruct.ReadWrite {
        public static ShellItem fromFile(String fileName) throws IOException {
            return new ShellItem(new ByteBufferKaitaiStream(fileName));
        }
        public ShellItem() {
            this(null, null, null);
        }

        public ShellItem(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ShellItem(KaitaiStream _io, WindowsShellItems _parent) {
            this(_io, _parent, null);
        }

        public ShellItem(KaitaiStream _io, WindowsShellItems _parent, WindowsShellItems _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.lenData = this._io.readU2le();
            if (lenData() >= 2) {
                this._raw_data = this._io.readBytes(lenData() - 2);
                KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(this._raw_data);
                this.data = new ShellItemData(_io__raw_data, this, _root);
                this.data._read();
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (lenData() >= 2) {
                this.data._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2le(this.lenData);
            if (lenData() >= 2) {
                final KaitaiStream _io__raw_data = new ByteBufferKaitaiStream(lenData() - 2);
                this._io.addChildStream(_io__raw_data);
                {
                    long _pos2 = this._io.pos();
                    this._io.seek(this._io.pos() + (lenData() - 2));
                    final ShellItem _this = this;
                    _io__raw_data.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                        @Override
                        protected void write(KaitaiStream parent) {
                            _this._raw_data = _io__raw_data.toByteArray();
                            if (_this._raw_data.length != lenData() - 2)
                                throw new ConsistencyError("raw(data)", lenData() - 2, _this._raw_data.length);
                            parent.writeBytes(_this._raw_data);
                        }
                    });
                }
                this.data._write_Seq(_io__raw_data);
            }
        }

        public void _check() {
            if (lenData() >= 2) {
                if (!Objects.equals(this.data._root(), _root()))
                    throw new ConsistencyError("data", _root(), this.data._root());
                if (!Objects.equals(this.data._parent(), this))
                    throw new ConsistencyError("data", this, this.data._parent());
            }
            _dirty = false;
        }
        private int lenData;
        private ShellItemData data;
        private WindowsShellItems _root;
        private WindowsShellItems _parent;
        private byte[] _raw_data;
        public int lenData() { return lenData; }
        public void setLenData(int _v) { _dirty = true; lenData = _v; }
        public ShellItemData data() { return data; }
        public void setData(ShellItemData _v) { _dirty = true; data = _v; }
        public WindowsShellItems _root() { return _root; }
        public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
        public WindowsShellItems _parent() { return _parent; }
        public void set_parent(WindowsShellItems _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_data() { return _raw_data; }
        public void set_raw_Data(byte[] _v) { _dirty = true; _raw_data = _v; }
    }
    public static class ShellItemData extends KaitaiStruct.ReadWrite {
        public static ShellItemData fromFile(String fileName) throws IOException {
            return new ShellItemData(new ByteBufferKaitaiStream(fileName));
        }
        public ShellItemData() {
            this(null, null, null);
        }

        public ShellItemData(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ShellItemData(KaitaiStream _io, WindowsShellItems.ShellItem _parent) {
            this(_io, _parent, null);
        }

        public ShellItemData(KaitaiStream _io, WindowsShellItems.ShellItem _parent, WindowsShellItems _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.code = this._io.readU1();
            switch (code()) {
            case 31: {
                this.body1 = new RootFolderBody(this._io, this, _root);
                this.body1._read();
                break;
            }
            }
            switch (code() & 112) {
            case 32: {
                this.body2 = new VolumeBody(this._io, this, _root);
                ((VolumeBody) (this.body2))._read();
                break;
            }
            case 48: {
                this.body2 = new FileEntryBody(this._io, this, _root);
                ((FileEntryBody) (this.body2))._read();
                break;
            }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            switch (code()) {
            case 31: {
                this.body1._fetchInstances();
                break;
            }
            }
            switch (code() & 112) {
            case 32: {
                ((VolumeBody) (this.body2))._fetchInstances();
                break;
            }
            case 48: {
                ((FileEntryBody) (this.body2))._fetchInstances();
                break;
            }
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.code);
            switch (code()) {
            case 31: {
                this.body1._write_Seq(this._io);
                break;
            }
            }
            switch (code() & 112) {
            case 32: {
                ((VolumeBody) (this.body2))._write_Seq(this._io);
                break;
            }
            case 48: {
                ((FileEntryBody) (this.body2))._write_Seq(this._io);
                break;
            }
            }
        }

        public void _check() {
            switch (code()) {
            case 31: {
                if (!Objects.equals(this.body1._root(), _root()))
                    throw new ConsistencyError("body1", _root(), this.body1._root());
                if (!Objects.equals(this.body1._parent(), this))
                    throw new ConsistencyError("body1", this, this.body1._parent());
                break;
            }
            }
            switch (code() & 112) {
            case 32: {
                if (!Objects.equals(((WindowsShellItems.VolumeBody) (this.body2))._root(), _root()))
                    throw new ConsistencyError("body2", _root(), ((WindowsShellItems.VolumeBody) (this.body2))._root());
                if (!Objects.equals(((WindowsShellItems.VolumeBody) (this.body2))._parent(), this))
                    throw new ConsistencyError("body2", this, ((WindowsShellItems.VolumeBody) (this.body2))._parent());
                break;
            }
            case 48: {
                if (!Objects.equals(((WindowsShellItems.FileEntryBody) (this.body2))._root(), _root()))
                    throw new ConsistencyError("body2", _root(), ((WindowsShellItems.FileEntryBody) (this.body2))._root());
                if (!Objects.equals(((WindowsShellItems.FileEntryBody) (this.body2))._parent(), this))
                    throw new ConsistencyError("body2", this, ((WindowsShellItems.FileEntryBody) (this.body2))._parent());
                break;
            }
            }
            _dirty = false;
        }
        private int code;
        private RootFolderBody body1;
        private KaitaiStruct.ReadWrite body2;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItem _parent;
        public int code() { return code; }
        public void setCode(int _v) { _dirty = true; code = _v; }
        public RootFolderBody body1() { return body1; }
        public void setBody1(RootFolderBody _v) { _dirty = true; body1 = _v; }
        public KaitaiStruct.ReadWrite body2() { return body2; }
        public void setBody2(KaitaiStruct.ReadWrite _v) { _dirty = true; body2 = _v; }
        public WindowsShellItems _root() { return _root; }
        public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
        public WindowsShellItems.ShellItem _parent() { return _parent; }
        public void set_parent(WindowsShellItems.ShellItem _v) { _dirty = true; _parent = _v; }
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item">Source</a>
     */
    public static class VolumeBody extends KaitaiStruct.ReadWrite {
        public static VolumeBody fromFile(String fileName) throws IOException {
            return new VolumeBody(new ByteBufferKaitaiStream(fileName));
        }
        public VolumeBody() {
            this(null, null, null);
        }

        public VolumeBody(KaitaiStream _io) {
            this(_io, null, null);
        }

        public VolumeBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent) {
            this(_io, _parent, null);
        }

        public VolumeBody(KaitaiStream _io, WindowsShellItems.ShellItemData _parent, WindowsShellItems _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.flags = this._io.readU1();
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU1(this.flags);
        }

        public void _check() {
            _dirty = false;
        }
        private int flags;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public WindowsShellItems _root() { return _root; }
        public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
        public void set_parent(WindowsShellItems.ShellItemData _v) { _dirty = true; _parent = _v; }
    }
    private List<ShellItem> items;
    private WindowsShellItems _root;
    private KaitaiStruct.ReadWrite _parent;

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.1</a>
     */
    public List<ShellItem> items() { return items; }
    public void setItems(List<ShellItem> _v) { _dirty = true; items = _v; }
    public WindowsShellItems _root() { return _root; }
    public void set_root(WindowsShellItems _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
