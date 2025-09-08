// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
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
public class WindowsShellItems extends KaitaiStruct {
    public static WindowsShellItems fromFile(String fileName) throws IOException {
        return new WindowsShellItems(new ByteBufferKaitaiStream(fileName));
    }

    public WindowsShellItems(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsShellItems(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsShellItems(KaitaiStream _io, KaitaiStruct _parent, WindowsShellItems _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.items = new ArrayList<ShellItem>();
        {
            ShellItem _it;
            int i = 0;
            do {
                _it = new ShellItem(this._io, this, _root);
                this.items.add(_it);
                i++;
            } while (!(_it.lenData() == 0));
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.items.size(); i++) {
            this.items.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item">Source</a>
     */
    public static class FileEntryBody extends KaitaiStruct {
        public static FileEntryBody fromFile(String fileName) throws IOException {
            return new FileEntryBody(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this._unnamed0 = this._io.readU1();
            this.fileSize = this._io.readU4le();
            this.lastModTime = this._io.readU4le();
            this.fileAttrs = this._io.readU2le();
        }

        public void _fetchInstances() {
        }
        private Boolean isDir;
        public Boolean isDir() {
            if (this.isDir != null)
                return this.isDir;
            this.isDir = (_parent().code() & 1) != 0;
            return this.isDir;
        }
        private Boolean isFile;
        public Boolean isFile() {
            if (this.isFile != null)
                return this.isFile;
            this.isFile = (_parent().code() & 2) != 0;
            return this.isFile;
        }
        private int _unnamed0;
        private long fileSize;
        private long lastModTime;
        private int fileAttrs;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int _unnamed0() { return _unnamed0; }
        public long fileSize() { return fileSize; }
        public long lastModTime() { return lastModTime; }
        public int fileAttrs() { return fileAttrs; }
        public WindowsShellItems _root() { return _root; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item">Source</a>
     */
    public static class RootFolderBody extends KaitaiStruct {
        public static RootFolderBody fromFile(String fileName) throws IOException {
            return new RootFolderBody(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.sortIndex = this._io.readU1();
            this.shellFolderId = this._io.readBytes(16);
        }

        public void _fetchInstances() {
        }
        private int sortIndex;
        private byte[] shellFolderId;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int sortIndex() { return sortIndex; }
        public byte[] shellFolderId() { return shellFolderId; }
        public WindowsShellItems _root() { return _root; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
    }

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.2</a>
     */
    public static class ShellItem extends KaitaiStruct {
        public static ShellItem fromFile(String fileName) throws IOException {
            return new ShellItem(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.lenData = this._io.readU2le();
            if (lenData() >= 2) {
                KaitaiStream _io_data = this._io.substream(lenData() - 2);
                this.data = new ShellItemData(_io_data, this, _root);
            }
        }

        public void _fetchInstances() {
            if (lenData() >= 2) {
                this.data._fetchInstances();
            }
        }
        private int lenData;
        private ShellItemData data;
        private WindowsShellItems _root;
        private WindowsShellItems _parent;
        public int lenData() { return lenData; }
        public ShellItemData data() { return data; }
        public WindowsShellItems _root() { return _root; }
        public WindowsShellItems _parent() { return _parent; }
    }
    public static class ShellItemData extends KaitaiStruct {
        public static ShellItemData fromFile(String fileName) throws IOException {
            return new ShellItemData(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.code = this._io.readU1();
            switch (code()) {
            case 31: {
                this.body1 = new RootFolderBody(this._io, this, _root);
                break;
            }
            }
            switch (code() & 112) {
            case 32: {
                this.body2 = new VolumeBody(this._io, this, _root);
                break;
            }
            case 48: {
                this.body2 = new FileEntryBody(this._io, this, _root);
                break;
            }
            }
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
        private int code;
        private RootFolderBody body1;
        private KaitaiStruct body2;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItem _parent;
        public int code() { return code; }
        public RootFolderBody body1() { return body1; }
        public KaitaiStruct body2() { return body2; }
        public WindowsShellItems _root() { return _root; }
        public WindowsShellItems.ShellItem _parent() { return _parent; }
    }

    /**
     * @see <a href="https://github.com/libyal/libfwsi/blob/main/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item">Source</a>
     */
    public static class VolumeBody extends KaitaiStruct {
        public static VolumeBody fromFile(String fileName) throws IOException {
            return new VolumeBody(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
            this.flags = this._io.readU1();
        }

        public void _fetchInstances() {
        }
        private int flags;
        private WindowsShellItems _root;
        private WindowsShellItems.ShellItemData _parent;
        public int flags() { return flags; }
        public WindowsShellItems _root() { return _root; }
        public WindowsShellItems.ShellItemData _parent() { return _parent; }
    }
    private List<ShellItem> items;
    private WindowsShellItems _root;
    private KaitaiStruct _parent;

    /**
     * @see <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.1</a>
     */
    public List<ShellItem> items() { return items; }
    public WindowsShellItems _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
