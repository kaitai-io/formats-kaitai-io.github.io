// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

(function (root, factory) {
  if (typeof define === 'function' && define.amd) {
    define(['kaitai-struct/KaitaiStream'], factory);
  } else if (typeof module === 'object' && module.exports) {
    module.exports = factory(require('kaitai-struct/KaitaiStream'));
  } else {
    root.WindowsShellItems = factory(root.KaitaiStream);
  }
}(this, function (KaitaiStream) {
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
 * @see {@link https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc|Source}
 */

var WindowsShellItems = (function() {
  function WindowsShellItems(_io, _parent, _root) {
    this._io = _io;
    this._parent = _parent;
    this._root = _root || this;

    this._read();
  }
  WindowsShellItems.prototype._read = function() {
    this.items = []
    var i = 0;
    do {
      var _ = new ShellItem(this._io, this, this._root);
      this.items.push(_);
      i++;
    } while (!(_.lenData == 0));
  }

  var ShellItemData = WindowsShellItems.ShellItemData = (function() {
    function ShellItemData(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ShellItemData.prototype._read = function() {
      this.code = this._io.readU1();
      switch (this.code) {
      case 31:
        this.body1 = new RootFolderBody(this._io, this, this._root);
        break;
      }
      switch ((this.code & 112)) {
      case 32:
        this.body2 = new VolumeBody(this._io, this, this._root);
        break;
      case 48:
        this.body2 = new FileEntryBody(this._io, this, this._root);
        break;
      }
    }

    return ShellItemData;
  })();

  /**
   * @see {@link https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf|Section 2.2.2}
   */

  var ShellItem = WindowsShellItems.ShellItem = (function() {
    function ShellItem(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    ShellItem.prototype._read = function() {
      this.lenData = this._io.readU2le();
      if (this.lenData >= 2) {
        this._raw_data = this._io.readBytes((this.lenData - 2));
        var _io__raw_data = new KaitaiStream(this._raw_data);
        this.data = new ShellItemData(_io__raw_data, this, this._root);
      }
    }

    return ShellItem;
  })();

  /**
   * @see {@link https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#32-root-folder-shell-item|Source}
   */

  var RootFolderBody = WindowsShellItems.RootFolderBody = (function() {
    function RootFolderBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    RootFolderBody.prototype._read = function() {
      this.sortIndex = this._io.readU1();
      this.shellFolderId = this._io.readBytes(16);
    }

    return RootFolderBody;
  })();

  /**
   * @see {@link https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#33-volume-shell-item|Source}
   */

  var VolumeBody = WindowsShellItems.VolumeBody = (function() {
    function VolumeBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    VolumeBody.prototype._read = function() {
      this.flags = this._io.readU1();
    }

    return VolumeBody;
  })();

  /**
   * @see {@link https://github.com/libyal/libfwsi/blob/master/documentation/Windows%20Shell%20Item%20format.asciidoc#34-file-entry-shell-item|Source}
   */

  var FileEntryBody = WindowsShellItems.FileEntryBody = (function() {
    function FileEntryBody(_io, _parent, _root) {
      this._io = _io;
      this._parent = _parent;
      this._root = _root || this;

      this._read();
    }
    FileEntryBody.prototype._read = function() {
      this._unnamed0 = this._io.readU1();
      this.fileSize = this._io.readU4le();
      this.lastModTime = this._io.readU4le();
      this.fileAttrs = this._io.readU2le();
    }
    Object.defineProperty(FileEntryBody.prototype, 'isDir', {
      get: function() {
        if (this._m_isDir !== undefined)
          return this._m_isDir;
        this._m_isDir = (this._parent.code & 1) != 0;
        return this._m_isDir;
      }
    });
    Object.defineProperty(FileEntryBody.prototype, 'isFile', {
      get: function() {
        if (this._m_isFile !== undefined)
          return this._m_isFile;
        this._m_isFile = (this._parent.code & 2) != 0;
        return this._m_isFile;
      }
    });

    return FileEntryBody;
  })();

  /**
   * @see {@link https://winprotocoldoc.blob.core.windows.net/productionwindowsarchives/MS-SHLLINK/[MS-SHLLINK].pdf|Section 2.2.1}
   */

  return WindowsShellItems;
})();
return WindowsShellItems;
}));
