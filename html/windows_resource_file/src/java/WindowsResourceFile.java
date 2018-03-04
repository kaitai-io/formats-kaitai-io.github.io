// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Map;
import java.util.HashMap;
import java.nio.charset.Charset;


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
public class WindowsResourceFile extends KaitaiStruct {
    public static WindowsResourceFile fromFile(String fileName) throws IOException {
        return new WindowsResourceFile(new ByteBufferKaitaiStream(fileName));
    }

    public WindowsResourceFile(KaitaiStream _io) {
        this(_io, null, null);
    }

    public WindowsResourceFile(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public WindowsResourceFile(KaitaiStream _io, KaitaiStruct _parent, WindowsResourceFile _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.resources = new ArrayList<Resource>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.resources.add(new Resource(this._io, this, _root));
                i++;
            }
        }
    }

    /**
     * Each resource has a `type` and a `name`, which can be used to
     * identify it, and a `value`. Both `type` and `name` can be a
     * number or a string.
     * @see <a href="https://msdn.microsoft.com/en-us/library/windows/desktop/ms648027.aspx">Source</a>
     */
    public static class Resource extends KaitaiStruct {
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
            _read();
        }
        private void _read() {
            this.valueSize = this._io.readU4le();
            this.headerSize = this._io.readU4le();
            this.type = new UnicodeOrId(this._io, this, _root);
            this.name = new UnicodeOrId(this._io, this, _root);
            this.padding1 = this._io.readBytes(KaitaiStream.mod((4 - _io().pos()), 4));
            this.formatVersion = this._io.readU4le();
            this.flags = this._io.readU2le();
            this.language = this._io.readU2le();
            this.valueVersion = this._io.readU4le();
            this.characteristics = this._io.readU4le();
            this.value = this._io.readBytes(valueSize());
            this.padding2 = this._io.readBytes(KaitaiStream.mod((4 - _io().pos()), 4));
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

        /**
         * Size of this header (i.e. every field except `value` and an
         * optional padding after it)
         */
        public long headerSize() { return headerSize; }
        public UnicodeOrId type() { return type; }
        public UnicodeOrId name() { return name; }
        public byte[] padding1() { return padding1; }
        public long formatVersion() { return formatVersion; }
        public int flags() { return flags; }
        public int language() { return language; }

        /**
         * Version for value, as specified by a user.
         */
        public long valueVersion() { return valueVersion; }

        /**
         * Extra 4 bytes that can be used by user for any purpose.
         */
        public long characteristics() { return characteristics; }
        public byte[] value() { return value; }
        public byte[] padding2() { return padding2; }
        public WindowsResourceFile _root() { return _root; }
        public WindowsResourceFile _parent() { return _parent; }
    }

    /**
     * Resources use a special serialization of names and types: they
     * can be either a number or a string.
     * 
     * Use `is_string` to check which kind we've got here, and then use
     * `as_numeric` or `as_string` to get relevant value.
     */
    public static class UnicodeOrId extends KaitaiStruct {
        public static UnicodeOrId fromFile(String fileName) throws IOException {
            return new UnicodeOrId(new ByteBufferKaitaiStream(fileName));
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
            _read();
        }
        private void _read() {
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
        }
        private Integer savePos1;
        public Integer savePos1() {
            if (this.savePos1 != null)
                return this.savePos1;
            int _tmp = (int) (_io().pos());
            this.savePos1 = _tmp;
            return this.savePos1;
        }
        private Integer savePos2;
        public Integer savePos2() {
            if (this.savePos2 != null)
                return this.savePos2;
            int _tmp = (int) (_io().pos());
            this.savePos2 = _tmp;
            return this.savePos2;
        }
        private Boolean isString;
        public Boolean isString() {
            if (this.isString != null)
                return this.isString;
            boolean _tmp = (boolean) (first() != 65535);
            this.isString = _tmp;
            return this.isString;
        }
        private String asString;
        public String asString() {
            if (this.asString != null)
                return this.asString;
            if (isString()) {
                long _pos = this._io.pos();
                this._io.seek(savePos1());
                this.asString = new String(this._io.readBytes(((savePos2() - savePos1()) - 2)), Charset.forName("UTF-16LE"));
                this._io.seek(_pos);
            }
            return this.asString;
        }
        private Integer first;
        private Integer asNumeric;
        private ArrayList<Integer> rest;
        private byte[] noop;
        private WindowsResourceFile _root;
        private WindowsResourceFile.Resource _parent;
        public Integer first() { return first; }
        public Integer asNumeric() { return asNumeric; }
        public ArrayList<Integer> rest() { return rest; }
        public byte[] noop() { return noop; }
        public WindowsResourceFile _root() { return _root; }
        public WindowsResourceFile.Resource _parent() { return _parent; }
    }
    private ArrayList<Resource> resources;
    private WindowsResourceFile _root;
    private KaitaiStruct _parent;
    public ArrayList<Resource> resources() { return resources; }
    public WindowsResourceFile _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
