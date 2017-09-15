// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

using System.Collections.Generic;

namespace Kaitai
{

    /// <summary>
    /// Windows Shell Items (AKA &quot;shellbags&quot;) is an undocumented set of
    /// structures used internally within Windows to identify paths in
    /// Windows Folder Hierarchy. It is widely used in Windows Shell (and
    /// most visible in File Explorer), both as in-memory and in-file
    /// structures. Some formats embed them, namely:
    /// 
    /// * Windows Shell link files (.lnk) Windows registry
    /// * Windows registry &quot;ShellBags&quot; keys
    /// 
    /// The format is mostly undocumented, and is known to vary between
    /// various Windows versions.
    /// </summary>
    /// <remarks>
    /// Reference: <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc">Source</a>
    /// </remarks>
    public partial class WindowsShellItems : KaitaiStruct
    {
        public static WindowsShellItems FromFile(string fileName)
        {
            return new WindowsShellItems(new KaitaiStream(fileName));
        }

        public WindowsShellItems(KaitaiStream p__io, KaitaiStruct p__parent = null, WindowsShellItems p__root = null) : base(p__io)
        {
            m_parent = p__parent;
            m_root = p__root ?? this;
            _read();
        }
        private void _read()
        {
            _items = new List<ShellItem>();
            {
                var i = 0;
                ShellItem M_;
                do {
                    M_ = new ShellItem(m_io, this, m_root);
                    _items.Add(M_);
                    i++;
                } while (!(M_.LenData == 0));
            }
        }
        public partial class ShellItemData : KaitaiStruct
        {
            public static ShellItemData FromFile(string fileName)
            {
                return new ShellItemData(new KaitaiStream(fileName));
            }

            public ShellItemData(KaitaiStream p__io, WindowsShellItems.ShellItem p__parent = null, WindowsShellItems p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _code = m_io.ReadU1();
                switch (Code) {
                case 31: {
                    _body1 = new RootFolderBody(m_io, this, m_root);
                    break;
                }
                }
                switch ((Code & 112)) {
                case 32: {
                    _body2 = new VolumeBody(m_io, this, m_root);
                    break;
                }
                case 48: {
                    _body2 = new FileEntryBody(m_io, this, m_root);
                    break;
                }
                }
            }
            private byte _code;
            private RootFolderBody _body1;
            private KaitaiStruct _body2;
            private WindowsShellItems m_root;
            private WindowsShellItems.ShellItem m_parent;
            public byte Code { get { return _code; } }
            public RootFolderBody Body1 { get { return _body1; } }
            public KaitaiStruct Body2 { get { return _body2; } }
            public WindowsShellItems M_Root { get { return m_root; } }
            public WindowsShellItems.ShellItem M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.2</a>
        /// </remarks>
        public partial class ShellItem : KaitaiStruct
        {
            public static ShellItem FromFile(string fileName)
            {
                return new ShellItem(new KaitaiStream(fileName));
            }

            public ShellItem(KaitaiStream p__io, WindowsShellItems p__parent = null, WindowsShellItems p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _lenData = m_io.ReadU2le();
                if (LenData >= 2) {
                    __raw_data = m_io.ReadBytes((LenData - 2));
                    var io___raw_data = new KaitaiStream(__raw_data);
                    _data = new ShellItemData(io___raw_data, this, m_root);
                }
            }
            private ushort _lenData;
            private ShellItemData _data;
            private WindowsShellItems m_root;
            private WindowsShellItems m_parent;
            private byte[] __raw_data;
            public ushort LenData { get { return _lenData; } }
            public ShellItemData Data { get { return _data; } }
            public WindowsShellItems M_Root { get { return m_root; } }
            public WindowsShellItems M_Parent { get { return m_parent; } }
            public byte[] M_RawData { get { return __raw_data; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item">Source</a>
        /// </remarks>
        public partial class RootFolderBody : KaitaiStruct
        {
            public static RootFolderBody FromFile(string fileName)
            {
                return new RootFolderBody(new KaitaiStream(fileName));
            }

            public RootFolderBody(KaitaiStream p__io, WindowsShellItems.ShellItemData p__parent = null, WindowsShellItems p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _sortIndex = m_io.ReadU1();
                _shellFolderId = m_io.ReadBytes(16);
            }
            private byte _sortIndex;
            private byte[] _shellFolderId;
            private WindowsShellItems m_root;
            private WindowsShellItems.ShellItemData m_parent;
            public byte SortIndex { get { return _sortIndex; } }
            public byte[] ShellFolderId { get { return _shellFolderId; } }
            public WindowsShellItems M_Root { get { return m_root; } }
            public WindowsShellItems.ShellItemData M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item">Source</a>
        /// </remarks>
        public partial class VolumeBody : KaitaiStruct
        {
            public static VolumeBody FromFile(string fileName)
            {
                return new VolumeBody(new KaitaiStream(fileName));
            }

            public VolumeBody(KaitaiStream p__io, WindowsShellItems.ShellItemData p__parent = null, WindowsShellItems p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                _read();
            }
            private void _read()
            {
                _flags = m_io.ReadU1();
            }
            private byte _flags;
            private WindowsShellItems m_root;
            private WindowsShellItems.ShellItemData m_parent;
            public byte Flags { get { return _flags; } }
            public WindowsShellItems M_Root { get { return m_root; } }
            public WindowsShellItems.ShellItemData M_Parent { get { return m_parent; } }
        }

        /// <remarks>
        /// Reference: <a href="https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item">Source</a>
        /// </remarks>
        public partial class FileEntryBody : KaitaiStruct
        {
            public static FileEntryBody FromFile(string fileName)
            {
                return new FileEntryBody(new KaitaiStream(fileName));
            }

            public FileEntryBody(KaitaiStream p__io, WindowsShellItems.ShellItemData p__parent = null, WindowsShellItems p__root = null) : base(p__io)
            {
                m_parent = p__parent;
                m_root = p__root;
                f_isDir = false;
                f_isFile = false;
                _read();
            }
            private void _read()
            {
                __unnamed0 = m_io.ReadU1();
                _fileSize = m_io.ReadU4le();
                _lastModTime = m_io.ReadU4le();
                _fileAttrs = m_io.ReadU2le();
            }
            private bool f_isDir;
            private bool _isDir;
            public bool IsDir
            {
                get
                {
                    if (f_isDir)
                        return _isDir;
                    _isDir = (bool) ((M_Parent.Code & 1) != 0);
                    f_isDir = true;
                    return _isDir;
                }
            }
            private bool f_isFile;
            private bool _isFile;
            public bool IsFile
            {
                get
                {
                    if (f_isFile)
                        return _isFile;
                    _isFile = (bool) ((M_Parent.Code & 2) != 0);
                    f_isFile = true;
                    return _isFile;
                }
            }
            private byte __unnamed0;
            private uint _fileSize;
            private uint _lastModTime;
            private ushort _fileAttrs;
            private WindowsShellItems m_root;
            private WindowsShellItems.ShellItemData m_parent;
            public byte Unnamed_0 { get { return __unnamed0; } }
            public uint FileSize { get { return _fileSize; } }
            public uint LastModTime { get { return _lastModTime; } }
            public ushort FileAttrs { get { return _fileAttrs; } }
            public WindowsShellItems M_Root { get { return m_root; } }
            public WindowsShellItems.ShellItemData M_Parent { get { return m_parent; } }
        }
        private List<ShellItem> _items;
        private WindowsShellItems m_root;
        private KaitaiStruct m_parent;

        /// <remarks>
        /// Reference: <a href="https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf">Section 2.2.1</a>
        /// </remarks>
        public List<ShellItem> Items { get { return _items; } }
        public WindowsShellItems M_Root { get { return m_root; } }
        public KaitaiStruct M_Parent { get { return m_parent; } }
    }
}
