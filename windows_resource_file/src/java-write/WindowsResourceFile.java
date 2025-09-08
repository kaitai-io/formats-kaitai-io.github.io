// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;
import java.util.List;


/**
 * Windows resource file (.res) are binary bundles of
 * "resources". Resource has some sort of ID (numerical or string),
 * type (predefined or user-defined), and raw value. Resource files can
 * be seen standalone (as .res file), or embedded inside PE executable
 * (.exe, .dll) files.
 * 
 * Typical use cases include:
 * 
 * * providing information about the application (such as title, copyrights, etc)
 * * embedding icon(s) to be displayed in file managers into .exe
 * * adding non-code data into the binary, such as menus, dialog forms,
 *   cursor images, fonts, various misc bitmaps, and locale-aware
 *   strings
 * 
 * Windows provides special API to access "resources" from a binary.
 * 
 * Normally, resources files are created with `rc` compiler: it takes a
 * .rc file (so called "resource-definition script") + all the raw
 * resource binary files for input, and outputs .res file. That .res
 * file can be linked into an .exe / .dll afterwards using a linker.
 * 
 * Internally, resource file is just a sequence of individual resource
 * definitions. RC tool ensures that first resource (#0) is always
 * empty.
 */
public class WindowsResourceFile extends KaitaiStruct.ReadWrite {
    public static WindowsResourceFile fromFile(String fileName) throws IOException {
        return new WindowsResourceFile(new ByteBufferKaitaiStream(fileName));
    }
    public WindowsResourceFile() {
        this(null, null, null);
    }

    public WindowsResourceFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsResourceFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public WindowsResourceFile(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, WindowsResourceFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.resources = new ArrayList<Resource>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Resource _t_resources = new Resource(this._io, this, _root);
                try {
                    _t_resources._read();
                } finally {
                    this.resources.add(_t_resources);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.resources.size(); i++) {
            this.resources.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.resources.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("resources", 0, this._io.size() - this._io.pos());
            this.resources.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("resources", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.resources.size(); i++) {
            if (!Objects.equals(this.resources.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("resources", _root(), this.resources.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.resources.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("resources", this, this.resources.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * Each resource has a `type` and a `name`, which can be used to
     * identify it, and a `value`. Both `type` and `name` can be a
     * number or a string.
     * @see <a href="https://learn.microsoft.com/en-us/windows/win32/menurc/resourceheader">Source</a>
     */
    public static class Resource extends KaitaiStruct.ReadWrite {
        public static Resource fromFile(String fileName) throws IOException {
            return new Resource(new ByteBufferKaitaiStream(fileName));
        }

        public enum PredefTypes {
            CURSOR(1),
            BITMAP(2),
            ICON(3),
            MENU(4),
            DIALOG(5),
            STRING(6),
            FONTDIR(7),
            FONT(8),
            ACCELERATOR(9),
            RCDATA(10),
            MESSAGETABLE(11),
            GROUP_CURSOR(12),
            GROUP_ICON(14),
            VERSION(16),
            DLGINCLUDE(17),
            PLUGPLAY(19),
            VXD(20),
            ANICURSOR(21),
            ANIICON(22),
            HTML(23),
            MANIFEST(24);

            private final long id;
            PredefTypes(long id) { this.id = id; }
            public long id() { return id; }
            private static final Map<Long, PredefTypes> byId = new HashMap<Long, PredefTypes>(21);
            static {
                for (PredefTypes e : PredefTypes.values())
                    byId.put(e.id(), e);
            }
            public static PredefTypes byId(long id) { return byId.get(id); }
        }
        public Resource() {
            this(null, null, null);
        }

        public Resource(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Resource(KaitaiStream _io, WindowsResourceFile _parent) {
            this(_io, _parent, null);
        }

        public Resource(KaitaiStream _io, WindowsResourceFile _parent, WindowsResourceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            this.valueSize = this._io.readU4le();
            this.headerSize = this._io.readU4le();
            this.type = new UnicodeOrId(this._io, this, _root);
            this.type._read();
            this.name = new UnicodeOrId(this._io, this, _root);
            this.name._read();
            this.padding1 = this._io.readBytes(KaitaiStream.mod(4 - _io().pos(), 4));
            this.formatVersion = this._io.readU4le();
            this.flags = this._io.readU2le();
            this.language = this._io.readU2le();
            this.valueVersion = this._io.readU4le();
            this.characteristics = this._io.readU4le();
            this.value = this._io.readBytes(valueSize());
            this.padding2 = this._io.readBytes(KaitaiStream.mod(4 - _io().pos(), 4));
            _dirty = false;
        }

        public void _fetchInstances() {
            this.type._fetchInstances();
            this.name._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU4le(this.valueSize);
            this._io.writeU4le(this.headerSize);
            this.type._write_Seq(this._io);
            this.name._write_Seq(this._io);
            if (this.padding1.length != KaitaiStream.mod(4 - _io().pos(), 4))
                throw new ConsistencyError("padding1", KaitaiStream.mod(4 - _io().pos(), 4), this.padding1.length);
            this._io.writeBytes(this.padding1);
            this._io.writeU4le(this.formatVersion);
            this._io.writeU2le(this.flags);
            this._io.writeU2le(this.language);
            this._io.writeU4le(this.valueVersion);
            this._io.writeU4le(this.characteristics);
            this._io.writeBytes(this.value);
            if (this.padding2.length != KaitaiStream.mod(4 - _io().pos(), 4))
                throw new ConsistencyError("padding2", KaitaiStream.mod(4 - _io().pos(), 4), this.padding2.length);
            this._io.writeBytes(this.padding2);
        }

        public void _check() {
            if (!Objects.equals(this.type._root(), _root()))
                throw new ConsistencyError("type", _root(), this.type._root());
            if (!Objects.equals(this.type._parent(), this))
                throw new ConsistencyError("type", this, this.type._parent());
            if (!Objects.equals(this.name._root(), _root()))
                throw new ConsistencyError("name", _root(), this.name._root());
            if (!Objects.equals(this.name._parent(), this))
                throw new ConsistencyError("name", this, this.name._parent());
            if (this.value.length != valueSize())
                throw new ConsistencyError("value", valueSize(), this.value.length);
            _dirty = false;
        }
        private PredefTypes typeAsPredef;

        /**
         * Numeric type IDs in range of [0..0xff] are reserved for
         * system usage in Windows, and there are some predefined,
         * well-known values in that range. This instance allows to get
         * it as enum value, if applicable.
         */
        public PredefTypes typeAsPredef() {
            if (this.typeAsPredef != null)
                return this.typeAsPredef;
            if ( ((!(type().isString())) && (type().asNumeric() <= 255)) ) {
                this.typeAsPredef = PredefTypes.byId(type().asNumeric());
            }
            return this.typeAsPredef;
        }
        public void _invalidateTypeAsPredef() { this.typeAsPredef = null; }
        private long valueSize;
        private long headerSize;
        private UnicodeOrId type;
        private UnicodeOrId name;
        private byte[] padding1;
        private long formatVersion;
        private int flags;
        private int language;
        private long valueVersion;
        private long characteristics;
        private byte[] value;
        private byte[] padding2;
        private WindowsResourceFile _root;
        private WindowsResourceFile _parent;

        /**
         * Size of resource value that follows the header
         */
        public long valueSize() { return valueSize; }
        public void setValueSize(long _v) { _dirty = true; valueSize = _v; }

        /**
         * Size of this header (i.e. every field except `value` and an
         * optional padding after it)
         */
        public long headerSize() { return headerSize; }
        public void setHeaderSize(long _v) { _dirty = true; headerSize = _v; }
        public UnicodeOrId type() { return type; }
        public void setType(UnicodeOrId _v) { _dirty = true; type = _v; }
        public UnicodeOrId name() { return name; }
        public void setName(UnicodeOrId _v) { _dirty = true; name = _v; }
        public byte[] padding1() { return padding1; }
        public void setPadding1(byte[] _v) { _dirty = true; padding1 = _v; }
        public long formatVersion() { return formatVersion; }
        public void setFormatVersion(long _v) { _dirty = true; formatVersion = _v; }
        public int flags() { return flags; }
        public void setFlags(int _v) { _dirty = true; flags = _v; }
        public int language() { return language; }
        public void setLanguage(int _v) { _dirty = true; language = _v; }

        /**
         * Version for value, as specified by a user.
         */
        public long valueVersion() { return valueVersion; }
        public void setValueVersion(long _v) { _dirty = true; valueVersion = _v; }

        /**
         * Extra 4 bytes that can be used by user for any purpose.
         */
        public long characteristics() { return characteristics; }
        public void setCharacteristics(long _v) { _dirty = true; characteristics = _v; }
        public byte[] value() { return value; }
        public void setValue(byte[] _v) { _dirty = true; value = _v; }
        public byte[] padding2() { return padding2; }
        public void setPadding2(byte[] _v) { _dirty = true; padding2 = _v; }
        public WindowsResourceFile _root() { return _root; }
        public void set_root(WindowsResourceFile _v) { _dirty = true; _root = _v; }
        public WindowsResourceFile _parent() { return _parent; }
        public void set_parent(WindowsResourceFile _v) { _dirty = true; _parent = _v; }
    }

    /**
     * Resources use a special serialization of names and types: they
     * can be either a number or a string.
     * 
     * Use `is_string` to check which kind we've got here, and then use
     * `as_numeric` or `as_string` to get relevant value.
     */
    public static class UnicodeOrId extends KaitaiStruct.ReadWrite {
        public static UnicodeOrId fromFile(String fileName) throws IOException {
            return new UnicodeOrId(new ByteBufferKaitaiStream(fileName));
        }
        public UnicodeOrId() {
            this(null, null, null);
        }

        public UnicodeOrId(KaitaiStream _io) {
            this(_io, null, null);
        }

        public UnicodeOrId(KaitaiStream _io, WindowsResourceFile.Resource _parent) {
            this(_io, _parent, null);
        }

        public UnicodeOrId(KaitaiStream _io, WindowsResourceFile.Resource _parent, WindowsResourceFile _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
        }
        public void _read() {
            if (savePos1() >= 0) {
                this.first = this._io.readU2le();
            }
            if (!(isString())) {
                this.asNumeric = this._io.readU2le();
            }
            if (isString()) {
                this.rest = new ArrayList<Integer>();
                {
                    int _it;
                    int i = 0;
                    do {
                        _it = this._io.readU2le();
                        this.rest.add(_it);
                        i++;
                    } while (!(_it == 0));
                }
            }
            if ( ((isString()) && (savePos2() >= 0)) ) {
                this.noop = this._io.readBytes(0);
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            if (savePos1() >= 0) {
            }
            if (!(isString())) {
            }
            if (isString()) {
                for (int i = 0; i < this.rest.size(); i++) {
                }
            }
            if ( ((isString()) && (savePos2() >= 0)) ) {
            }
            asString();
            if (this.asString != null) {
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            _shouldWriteAsString = _enabledAsString;
            if (savePos1() >= 0) {
                this._io.writeU2le(this.first);
            }
            if (!(isString())) {
                this._io.writeU2le(this.asNumeric);
            }
            if (isString()) {
                for (int i = 0; i < this.rest.size(); i++) {
                    this._io.writeU2le(this.rest.get(((Number) (i)).intValue()));
                }
            }
            if ( ((isString()) && (savePos2() >= 0)) ) {
                if (this.noop.length != 0)
                    throw new ConsistencyError("noop", 0, this.noop.length);
                this._io.writeBytes(this.noop);
            }
        }

        public void _check() {
            if (!(isString())) {
            }
            if (isString()) {
                if (this.rest.size() == 0)
                    throw new ConsistencyError("rest", 0, this.rest.size());
                for (int i = 0; i < this.rest.size(); i++) {
                    {
                        int _it = this.rest.get(((Number) (i)).intValue());
                        if ((_it == 0) != (i == this.rest.size() - 1))
                            throw new ConsistencyError("rest", i == this.rest.size() - 1, _it == 0);
                    }
                }
            }
            if (_enabledAsString) {
                if (isString()) {
                }
            }
            _dirty = false;
        }
        private String asString;
        private boolean _shouldWriteAsString = false;
        private boolean _enabledAsString = true;
        public String asString() {
            if (_shouldWriteAsString)
                _writeAsString();
            if (this.asString != null)
                return this.asString;
            if (!_enabledAsString)
                return null;
            if (isString()) {
                long _pos = this._io.pos();
                this._io.seek(savePos1());
                this.asString = new String(this._io.readBytes((savePos2() - savePos1()) - 2), StandardCharsets.UTF_16LE);
                this._io.seek(_pos);
            }
            return this.asString;
        }
        public void setAsString(String _v) { _dirty = true; asString = _v; }
        public void setAsString_Enabled(boolean _v) { _dirty = true; _enabledAsString = _v; }

        private void _writeAsString() {
            _shouldWriteAsString = false;
            if (isString()) {
                long _pos = this._io.pos();
                this._io.seek(savePos1());
                if ((this.asString).getBytes(Charset.forName("UTF-16LE")).length != (savePos2() - savePos1()) - 2)
                    throw new ConsistencyError("as_string", (savePos2() - savePos1()) - 2, (this.asString).getBytes(Charset.forName("UTF-16LE")).length);
                this._io.writeBytes((this.asString).getBytes(Charset.forName("UTF-16LE")));
                this._io.seek(_pos);
            }
        }
        private Boolean isString;
        public Boolean isString() {
            if (this.isString != null)
                return this.isString;
            this.isString = first() != 65535;
            return this.isString;
        }
        public void _invalidateIsString() { this.isString = null; }
        private Integer savePos1;
        public Integer savePos1() {
            if (this.savePos1 != null)
                return this.savePos1;
            this.savePos1 = ((Number) (_io().pos())).intValue();
            return this.savePos1;
        }
        public void _invalidateSavePos1() { this.savePos1 = null; }
        private Integer savePos2;
        public Integer savePos2() {
            if (this.savePos2 != null)
                return this.savePos2;
            this.savePos2 = ((Number) (_io().pos())).intValue();
            return this.savePos2;
        }
        public void _invalidateSavePos2() { this.savePos2 = null; }
        private Integer first;
        private Integer asNumeric;
        private List<Integer> rest;
        private byte[] noop;
        private WindowsResourceFile _root;
        private WindowsResourceFile.Resource _parent;
        public Integer first() { return first; }
        public void setFirst(Integer _v) { _dirty = true; first = _v; }
        public Integer asNumeric() { return asNumeric; }
        public void setAsNumeric(Integer _v) { _dirty = true; asNumeric = _v; }
        public List<Integer> rest() { return rest; }
        public void setRest(List<Integer> _v) { _dirty = true; rest = _v; }
        public byte[] noop() { return noop; }
        public void setNoop(byte[] _v) { _dirty = true; noop = _v; }
        public WindowsResourceFile _root() { return _root; }
        public void set_root(WindowsResourceFile _v) { _dirty = true; _root = _v; }
        public WindowsResourceFile.Resource _parent() { return _parent; }
        public void set_parent(WindowsResourceFile.Resource _v) { _dirty = true; _parent = _v; }
    }
    private List<Resource> resources;
    private WindowsResourceFile _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Resource> resources() { return resources; }
    public void setResources(List<Resource> _v) { _dirty = true; resources = _v; }
    public WindowsResourceFile _root() { return _root; }
    public void set_root(WindowsResourceFile _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
