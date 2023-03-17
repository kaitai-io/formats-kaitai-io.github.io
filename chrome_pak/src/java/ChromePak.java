// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;


/**
 * Format mostly used by Google Chrome and various Android apps to store
 * resources such as translated strings, help messages and images.
 * @see <a href="https://web.archive.org/web/20220126211447/https://dev.chromium.org/developers/design-documents/linuxresourcesandlocalizedstrings">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/3c36f27/grit/format/data_pack.py">Source</a>
 * @see <a href="https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/grit/format/data_pack.py">Source</a>
 */
public class ChromePak extends KaitaiStruct {
    public static ChromePak fromFile(String fileName) throws IOException {
        return new ChromePak(new ByteBufferKaitaiStream(fileName));
    }

    public enum Encodings {
        BINARY(0),
        UTF8(1),
        UTF16(2);

        private final long id;
        Encodings(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, Encodings> byId = new HashMap<Long, Encodings>(3);
        static {
            for (Encodings e : Encodings.values())
                byId.put(e.id(), e);
        }
        public static Encodings byId(long id) { return byId.get(id); }
    }

    public ChromePak(KaitaiStream _io) {
        this(_io, null, null);
    }

    public ChromePak(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public ChromePak(KaitaiStream _io, KaitaiStruct _parent, ChromePak _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.version = this._io.readU4le();
        if (!( ((version() == 4) || (version() == 5)) )) {
            throw new KaitaiStream.ValidationNotAnyOfError(version(), _io(), "/seq/0");
        }
        if (version() == 4) {
            this.numResourcesV4 = this._io.readU4le();
        }
        this.encoding = Encodings.byId(this._io.readU1());
        if (version() == 5) {
            this.v5Part = new HeaderV5Part(this._io, this, _root);
        }
        this.resources = new ArrayList<Resource>();
        for (int i = 0; i < (numResources() + 1); i++) {
            this.resources.add(new Resource(this._io, this, _root, i, i < numResources()));
        }
        this.aliases = new ArrayList<Alias>();
        for (int i = 0; i < numAliases(); i++) {
            this.aliases.add(new Alias(this._io, this, _root));
        }
    }
    public static class HeaderV5Part extends KaitaiStruct {
        public static HeaderV5Part fromFile(String fileName) throws IOException {
            return new HeaderV5Part(new ByteBufferKaitaiStream(fileName));
        }

        public HeaderV5Part(KaitaiStream _io) {
            this(_io, null, null);
        }

        public HeaderV5Part(KaitaiStream _io, ChromePak _parent) {
            this(_io, _parent, null);
        }

        public HeaderV5Part(KaitaiStream _io, ChromePak _parent, ChromePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.encodingPadding = this._io.readBytes(3);
            this.numResources = this._io.readU2le();
            this.numAliases = this._io.readU2le();
        }
        private byte[] encodingPadding;
        private int numResources;
        private int numAliases;
        private ChromePak _root;
        private ChromePak _parent;
        public byte[] encodingPadding() { return encodingPadding; }
        public int numResources() { return numResources; }
        public int numAliases() { return numAliases; }
        public ChromePak _root() { return _root; }
        public ChromePak _parent() { return _parent; }
    }
    public static class Resource extends KaitaiStruct {

        public Resource(KaitaiStream _io, int idx, boolean hasBody) {
            this(_io, null, null, idx, hasBody);
        }

        public Resource(KaitaiStream _io, ChromePak _parent, int idx, boolean hasBody) {
            this(_io, _parent, null, idx, hasBody);
        }

        public Resource(KaitaiStream _io, ChromePak _parent, ChromePak _root, int idx, boolean hasBody) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            this.hasBody = hasBody;
            _read();
        }
        private void _read() {
            this.id = this._io.readU2le();
            this.ofsBody = this._io.readU4le();
        }
        private Integer lenBody;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public Integer lenBody() {
            if (this.lenBody != null)
                return this.lenBody;
            if (hasBody()) {
                int _tmp = (int) ((_parent().resources().get((int) (idx() + 1)).ofsBody() - ofsBody()));
                this.lenBody = _tmp;
            }
            return this.lenBody;
        }
        private byte[] body;

        /**
         * MUST NOT be accessed until the next `resource` is parsed
         */
        public byte[] body() {
            if (this.body != null)
                return this.body;
            if (hasBody()) {
                long _pos = this._io.pos();
                this._io.seek(ofsBody());
                this.body = this._io.readBytes(lenBody());
                this._io.seek(_pos);
            }
            return this.body;
        }
        private int id;
        private long ofsBody;
        private int idx;
        private boolean hasBody;
        private ChromePak _root;
        private ChromePak _parent;
        public int id() { return id; }
        public long ofsBody() { return ofsBody; }
        public int idx() { return idx; }
        public boolean hasBody() { return hasBody; }
        public ChromePak _root() { return _root; }
        public ChromePak _parent() { return _parent; }
    }
    public static class Alias extends KaitaiStruct {
        public static Alias fromFile(String fileName) throws IOException {
            return new Alias(new ByteBufferKaitaiStream(fileName));
        }

        public Alias(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Alias(KaitaiStream _io, ChromePak _parent) {
            this(_io, _parent, null);
        }

        public Alias(KaitaiStream _io, ChromePak _parent, ChromePak _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.id = this._io.readU2le();
            this.resourceIdx = this._io.readU2le();
            if (!(resourceIdx() <= (_parent().numResources() - 1))) {
                throw new KaitaiStream.ValidationGreaterThanError((_parent().numResources() - 1), resourceIdx(), _io(), "/types/alias/seq/1");
            }
        }
        private Resource resource;
        public Resource resource() {
            if (this.resource != null)
                return this.resource;
            this.resource = _parent().resources().get((int) resourceIdx());
            return this.resource;
        }
        private int id;
        private int resourceIdx;
        private ChromePak _root;
        private ChromePak _parent;
        public int id() { return id; }
        public int resourceIdx() { return resourceIdx; }
        public ChromePak _root() { return _root; }
        public ChromePak _parent() { return _parent; }
    }
    private Long numResources;
    public Long numResources() {
        if (this.numResources != null)
            return this.numResources;
        long _tmp = (long) ((version() == 5 ? v5Part().numResources() : numResourcesV4()));
        this.numResources = _tmp;
        return this.numResources;
    }
    private Integer numAliases;
    public Integer numAliases() {
        if (this.numAliases != null)
            return this.numAliases;
        int _tmp = (int) ((version() == 5 ? v5Part().numAliases() : 0));
        this.numAliases = _tmp;
        return this.numAliases;
    }
    private long version;
    private Long numResourcesV4;
    private Encodings encoding;
    private HeaderV5Part v5Part;
    private ArrayList<Resource> resources;
    private ArrayList<Alias> aliases;
    private ChromePak _root;
    private KaitaiStruct _parent;

    /**
     * only versions 4 and 5 are supported
     */
    public long version() { return version; }
    public Long numResourcesV4() { return numResourcesV4; }

    /**
     * Character encoding of all text resources in the PAK file. Note that
     * the file can **always** contain binary resources, this only applies to
     * those that are supposed to hold text.
     * 
     * In practice, this will probably always be `encodings::utf8` - I haven't
     * seen any organic file that would state otherwise. `UTF8` is also usually
     * hardcoded in Python scripts from the GRIT repository that generate .pak
     * files (for example
     * [`pak_util.py:79`](https://chromium.googlesource.com/chromium/src/tools/grit/+/8a23eae/pak_util.py#79)).
     */
    public Encodings encoding() { return encoding; }
    public HeaderV5Part v5Part() { return v5Part; }

    /**
     * The length is calculated by looking at the offset of
     * the next item, so an extra entry is stored with id 0
     * and offset pointing to the end of the resources.
     */
    public ArrayList<Resource> resources() { return resources; }
    public ArrayList<Alias> aliases() { return aliases; }
    public ChromePak _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
