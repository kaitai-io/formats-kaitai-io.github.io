// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Arrays;
import java.nio.charset.Charset;
import java.util.ArrayList;


/**
 * [GNU gettext](https://www.gnu.org/software/gettext/) is a popular
 * solution in free/open source software world to do i18n/l10n of
 * software, by providing translated strings that will substitute
 * strings in original language (typically, English).
 * 
 * gettext .mo is a binary database format which stores these string
 * translation pairs in an efficient binary format, ready to be used by
 * gettext-enabled software. .mo format is a result of compilation of
 * text-based .po files using
 * [msgfmt](https://www.gnu.org/software/gettext/manual/html_node/msgfmt-Invocation.html#msgfmt-Invocation)
 * utility. The reverse conversion (.mo -> .po) is also possible using
 * [msgunfmt](https://www.gnu.org/software/gettext/manual/html_node/msgunfmt-Invocation.html#msgunfmt-Invocation)
 * decompiler utility.
 * @see <a href="https://gitlab.com/worr/libintl">Source</a>
 */
public class GettextMo extends KaitaiStruct {
    public static GettextMo fromFile(String fileName) throws IOException {
        return new GettextMo(new ByteBufferKaitaiStream(fileName));
    }

    public GettextMo(KaitaiStream _io) {
        this(_io, null, null);
    }

    public GettextMo(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public GettextMo(KaitaiStream _io, KaitaiStruct _parent, GettextMo _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.signature = this._io.readBytes(4);
        this.mo = new Mo(this._io, this, _root);
    }
    public static class HashLookupIteration extends KaitaiStruct {

        public HashLookupIteration(KaitaiStream _io, long idx, long collisionStep) {
            this(_io, null, null, idx, collisionStep);
        }

        public HashLookupIteration(KaitaiStream _io, KaitaiStruct _parent, long idx, long collisionStep) {
            this(_io, _parent, null, idx, collisionStep);
        }

        public HashLookupIteration(KaitaiStream _io, KaitaiStruct _parent, GettextMo _root, long idx, long collisionStep) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.collisionStep = collisionStep;
            _read();
        }
        private void _read() {
        }
        private String original;
        public String original() {
            if (this.original != null)
                return this.original;
            this.original = _root.mo().originals().get((int) idx()).str();
            return this.original;
        }
        private String translation;
        public String translation() {
            if (this.translation != null)
                return this.translation;
            this.translation = _root.mo().translations().get((int) idx()).str();
            return this.translation;
        }
        private Integer nextIdx;
        public Integer nextIdx() {
            if (this.nextIdx != null)
                return this.nextIdx;
            int _tmp = (int) (((idx() + collisionStep()) - (idx() >= (_root.mo().numHashtableItems() - collisionStep()) ? _root.mo().numHashtableItems() : 0)));
            this.nextIdx = _tmp;
            return this.nextIdx;
        }
        private HashLookupIteration next;
        public HashLookupIteration next() {
            if (this.next != null)
                return this.next;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.next = new HashLookupIteration(this._io, this, _root, _root.mo().hashtableItems().get((int) nextIdx()).val(), collisionStep());
            this._io.seek(_pos);
            return this.next;
        }
        private long idx;
        private long collisionStep;
        private GettextMo _root;
        private KaitaiStruct _parent;
        public long idx() { return idx; }
        public long collisionStep() { return collisionStep; }
        public GettextMo _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class LookupIteration extends KaitaiStruct {

        public LookupIteration(KaitaiStream _io, HashLookupIteration current, String query) {
            this(_io, null, null, current, query);
        }

        public LookupIteration(KaitaiStream _io, KaitaiStruct _parent, HashLookupIteration current, String query) {
            this(_io, _parent, null, current, query);
        }

        public LookupIteration(KaitaiStream _io, KaitaiStruct _parent, GettextMo _root, HashLookupIteration current, String query) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.current = current;
            this.query = query;
            _read();
        }
        private void _read() {
        }
        private Boolean found;
        public Boolean found() {
            if (this.found != null)
                return this.found;
            boolean _tmp = (boolean) (query().equals(current().original()));
            this.found = _tmp;
            return this.found;
        }
        private LookupIteration next;
        public LookupIteration next() {
            if (this.next != null)
                return this.next;
            if (!(found())) {
                long _pos = this._io.pos();
                this._io.seek(0);
                this.next = new LookupIteration(this._io, this, _root, current().next(), query());
                this._io.seek(_pos);
            }
            return this.next;
        }
        private HashLookupIteration current;
        private String query;
        private GettextMo _root;
        private KaitaiStruct _parent;
        public HashLookupIteration current() { return current; }
        public String query() { return query; }
        public GettextMo _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * def lookup(s:str, t:gettext_mo.GettextMo):
     *   try:
     *     l=gettext_mo.GettextMo.HashtableLookup(s, string_hash(s), t._io, _parent=t, _root=t)
     *     e=l.entry
     *     while(not e.found):
     *       e=e.next
     *     return e.current
     *   except:
     *     raise Exception("Not found "+s+" in the hashtable!")
     * 
     * lookup(t.mo.originals[145].str, t)
     * @see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/gettext.c">Source</a>
     */
    public static class HashtableLookup extends KaitaiStruct {

        public HashtableLookup(KaitaiStream _io, String query, long hash) {
            this(_io, null, null, query, hash);
        }

        public HashtableLookup(KaitaiStream _io, KaitaiStruct _parent, String query, long hash) {
            this(_io, _parent, null, query, hash);
        }

        public HashtableLookup(KaitaiStream _io, KaitaiStruct _parent, GettextMo _root, String query, long hash) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.query = query;
            this.hash = hash;
            _read();
        }
        private void _read() {
        }
        private Integer collisionStep;
        public Integer collisionStep() {
            if (this.collisionStep != null)
                return this.collisionStep;
            int _tmp = (int) ((KaitaiStream.mod(hash(), (_root.mo().numHashtableItems() - 2)) + 1));
            this.collisionStep = _tmp;
            return this.collisionStep;
        }
        private Integer idx;
        public Integer idx() {
            if (this.idx != null)
                return this.idx;
            int _tmp = (int) (KaitaiStream.mod(hash(), _root.mo().numHashtableItems()));
            this.idx = _tmp;
            return this.idx;
        }
        private HashLookupIteration hashLookupIteration;
        public HashLookupIteration hashLookupIteration() {
            if (this.hashLookupIteration != null)
                return this.hashLookupIteration;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.hashLookupIteration = new HashLookupIteration(this._io, this, _root, _root.mo().hashtableItems().get((int) idx()).val(), collisionStep());
            this._io.seek(_pos);
            return this.hashLookupIteration;
        }
        private LookupIteration entry;
        public LookupIteration entry() {
            if (this.entry != null)
                return this.entry;
            long _pos = this._io.pos();
            this._io.seek(0);
            this.entry = new LookupIteration(this._io, this, _root, hashLookupIteration(), query());
            this._io.seek(_pos);
            return this.entry;
        }
        private String query;
        private long hash;
        private GettextMo _root;
        private KaitaiStruct _parent;
        public String query() { return query; }

        /**
         * def string_hash(s):
         *   s=s.encode("utf-8")
         *   h = 0
         *   for i in range(len(s)):
         *     h = h << 4
         *     h += s[i]
         *     tmp = h & 0xF0000000
         *     if tmp != 0:
         *       h ^= tmp
         *       h ^= tmp >> 24
         *   return h
         * @see <a href="https://gitlab.com/worr/libintl/raw/master/src/lib/libintl/strhash.c">Source</a>
         */
        public long hash() { return hash; }
        public GettextMo _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Mo extends KaitaiStruct {
        public static Mo fromFile(String fileName) throws IOException {
            return new Mo(new ByteBufferKaitaiStream(fileName));
        }
        private Boolean _is_le;

        public Mo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Mo(KaitaiStream _io, GettextMo _parent) {
            this(_io, _parent, null);
        }

        public Mo(KaitaiStream _io, GettextMo _parent, GettextMo _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            {
                byte[] on = _root.signature();
                if (Arrays.equals(on, new byte[] { -34, 18, 4, -107 })) {
                    boolean _tmp = (boolean) (true);
                    this._is_le = _tmp;
                }
                else if (Arrays.equals(on, new byte[] { -107, 4, 18, -34 })) {
                    boolean _tmp = (boolean) (false);
                    this._is_le = _tmp;
                }
            }

            if (_is_le == null) {
                throw new KaitaiStream.UndecidedEndiannessError();
            } else if (_is_le) {
                _readLE();
            } else {
                _readBE();
            }
        }
        private void _readLE() {
            this.version = new Version(this._io, this, _root, _is_le);
            this.numTranslations = this._io.readU4le();
            this.ofsOriginals = this._io.readU4le();
            this.ofsTranslations = this._io.readU4le();
            this.numHashtableItems = this._io.readU4le();
            this.ofsHashtableItems = this._io.readU4le();
        }
        private void _readBE() {
            this.version = new Version(this._io, this, _root, _is_le);
            this.numTranslations = this._io.readU4be();
            this.ofsOriginals = this._io.readU4be();
            this.ofsTranslations = this._io.readU4be();
            this.numHashtableItems = this._io.readU4be();
            this.ofsHashtableItems = this._io.readU4be();
        }
        public static class Version extends KaitaiStruct {
            private Boolean _is_le;

            public Version(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.versionRaw = this._io.readU4le();
            }
            private void _readBE() {
                this.versionRaw = this._io.readU4be();
            }
            private Integer major;
            public Integer major() {
                if (this.major != null)
                    return this.major;
                int _tmp = (int) ((versionRaw() >> 16));
                this.major = _tmp;
                return this.major;
            }
            private Integer minor;
            public Integer minor() {
                if (this.minor != null)
                    return this.minor;
                int _tmp = (int) ((versionRaw() & 65535));
                this.minor = _tmp;
                return this.minor;
            }
            private long versionRaw;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long versionRaw() { return versionRaw; }
            public GettextMo _root() { return _root; }
            public GettextMo.Mo _parent() { return _parent; }
        }
        public static class HashtableItem extends KaitaiStruct {
            private Boolean _is_le;

            public HashtableItem(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.rawVal = this._io.readU4le();
            }
            private void _readBE() {
                this.rawVal = this._io.readU4be();
            }
            private Integer mask;
            public Integer mask() {
                if (this.mask != null)
                    return this.mask;
                int _tmp = (int) (2147483648L);
                this.mask = _tmp;
                return this.mask;
            }
            private Integer val1;
            public Integer val1() {
                if (this.val1 != null)
                    return this.val1;
                if (rawVal() != 0) {
                    int _tmp = (int) ((rawVal() - 1));
                    this.val1 = _tmp;
                }
                return this.val1;
            }
            private Boolean isSystemDependent;
            public Boolean isSystemDependent() {
                if (this.isSystemDependent != null)
                    return this.isSystemDependent;
                if (rawVal() != 0) {
                    boolean _tmp = (boolean) ((val1() & mask()) == 1);
                    this.isSystemDependent = _tmp;
                }
                return this.isSystemDependent;
            }
            private Integer val;
            public Integer val() {
                if (this.val != null)
                    return this.val;
                if (rawVal() != 0) {
                    int _tmp = (int) ((val1() & ~(mask())));
                    this.val = _tmp;
                }
                return this.val;
            }
            private long rawVal;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long rawVal() { return rawVal; }
            public GettextMo _root() { return _root; }
            public GettextMo.Mo _parent() { return _parent; }
        }
        public static class Descriptor extends KaitaiStruct {
            private Boolean _is_le;

            public Descriptor(KaitaiStream _io, GettextMo.Mo _parent, GettextMo _root, boolean _is_le) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this._is_le = _is_le;
                _read();
            }
            private void _read() {

                if (_is_le == null) {
                    throw new KaitaiStream.UndecidedEndiannessError();
                } else if (_is_le) {
                    _readLE();
                } else {
                    _readBE();
                }
            }
            private void _readLE() {
                this.lenStr = this._io.readU4le();
                this.ofsStr = this._io.readU4le();
            }
            private void _readBE() {
                this.lenStr = this._io.readU4be();
                this.ofsStr = this._io.readU4be();
            }
            private String str;
            public String str() {
                if (this.str != null)
                    return this.str;
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek(ofsStr());
                if (_is_le) {
                    this.str = new String(KaitaiStream.bytesTerminate(io.readBytes(lenStr()), (byte) 0, false), Charset.forName("UTF-8"));
                } else {
                    this.str = new String(KaitaiStream.bytesTerminate(io.readBytes(lenStr()), (byte) 0, false), Charset.forName("UTF-8"));
                }
                io.seek(_pos);
                return this.str;
            }
            private long lenStr;
            private long ofsStr;
            private GettextMo _root;
            private GettextMo.Mo _parent;
            public long lenStr() { return lenStr; }
            public long ofsStr() { return ofsStr; }
            public GettextMo _root() { return _root; }
            public GettextMo.Mo _parent() { return _parent; }
        }
        private ArrayList<Descriptor> originals;
        public ArrayList<Descriptor> originals() {
            if (this.originals != null)
                return this.originals;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofsOriginals());
            if (_is_le) {
                originals = new ArrayList<Descriptor>(((Number) (numTranslations())).intValue());
                for (int i = 0; i < numTranslations(); i++) {
                    this.originals.add(new Descriptor(io, this, _root, _is_le));
                }
            } else {
                originals = new ArrayList<Descriptor>(((Number) (numTranslations())).intValue());
                for (int i = 0; i < numTranslations(); i++) {
                    this.originals.add(new Descriptor(io, this, _root, _is_le));
                }
            }
            io.seek(_pos);
            return this.originals;
        }
        private ArrayList<Descriptor> translations;
        public ArrayList<Descriptor> translations() {
            if (this.translations != null)
                return this.translations;
            KaitaiStream io = _root._io();
            long _pos = io.pos();
            io.seek(ofsTranslations());
            if (_is_le) {
                translations = new ArrayList<Descriptor>(((Number) (numTranslations())).intValue());
                for (int i = 0; i < numTranslations(); i++) {
                    this.translations.add(new Descriptor(io, this, _root, _is_le));
                }
            } else {
                translations = new ArrayList<Descriptor>(((Number) (numTranslations())).intValue());
                for (int i = 0; i < numTranslations(); i++) {
                    this.translations.add(new Descriptor(io, this, _root, _is_le));
                }
            }
            io.seek(_pos);
            return this.translations;
        }
        private ArrayList<HashtableItem> hashtableItems;
        public ArrayList<HashtableItem> hashtableItems() {
            if (this.hashtableItems != null)
                return this.hashtableItems;
            if (ofsHashtableItems() != 0) {
                KaitaiStream io = _root._io();
                long _pos = io.pos();
                io.seek(ofsHashtableItems());
                if (_is_le) {
                    hashtableItems = new ArrayList<HashtableItem>(((Number) (numHashtableItems())).intValue());
                    for (int i = 0; i < numHashtableItems(); i++) {
                        this.hashtableItems.add(new HashtableItem(io, this, _root, _is_le));
                    }
                } else {
                    hashtableItems = new ArrayList<HashtableItem>(((Number) (numHashtableItems())).intValue());
                    for (int i = 0; i < numHashtableItems(); i++) {
                        this.hashtableItems.add(new HashtableItem(io, this, _root, _is_le));
                    }
                }
                io.seek(_pos);
            }
            return this.hashtableItems;
        }
        private Version version;
        private long numTranslations;
        private long ofsOriginals;
        private long ofsTranslations;
        private long numHashtableItems;
        private long ofsHashtableItems;
        private GettextMo _root;
        private GettextMo _parent;
        public Version version() { return version; }
        public long numTranslations() { return numTranslations; }
        public long ofsOriginals() { return ofsOriginals; }
        public long ofsTranslations() { return ofsTranslations; }
        public long numHashtableItems() { return numHashtableItems; }
        public long ofsHashtableItems() { return ofsHashtableItems; }
        public GettextMo _root() { return _root; }
        public GettextMo _parent() { return _parent; }
    }
    private byte[] signature;
    private Mo mo;
    private GettextMo _root;
    private KaitaiStruct _parent;
    public byte[] signature() { return signature; }
    public Mo mo() { return mo; }
    public GettextMo _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
