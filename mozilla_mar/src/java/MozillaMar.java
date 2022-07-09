// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.Arrays;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Mozilla ARchive file is Mozilla's own archive format to distribute software updates.
 * Test files can be found on Mozilla's FTP site, for example:
 * 
 * <http://ftp.mozilla.org/pub/firefox/nightly/partials/>
 * @see <a href="https://wiki.mozilla.org/Software_Update:MAR">Source</a>
 */
public class MozillaMar extends KaitaiStruct {
    public static MozillaMar fromFile(String fileName) throws IOException {
        return new MozillaMar(new ByteBufferKaitaiStream(fileName));
    }

    public enum SignatureAlgorithms {
        RSA_PKCS1_SHA1(1),
        RSA_PKCS1_SHA384(2);

        private final long id;
        SignatureAlgorithms(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, SignatureAlgorithms> byId = new HashMap<Long, SignatureAlgorithms>(2);
        static {
            for (SignatureAlgorithms e : SignatureAlgorithms.values())
                byId.put(e.id(), e);
        }
        public static SignatureAlgorithms byId(long id) { return byId.get(id); }
    }

    public enum BlockIdentifiers {
        PRODUCT_INFORMATION(1);

        private final long id;
        BlockIdentifiers(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, BlockIdentifiers> byId = new HashMap<Long, BlockIdentifiers>(1);
        static {
            for (BlockIdentifiers e : BlockIdentifiers.values())
                byId.put(e.id(), e);
        }
        public static BlockIdentifiers byId(long id) { return byId.get(id); }
    }

    public MozillaMar(KaitaiStream _io) {
        this(_io, null, null);
    }

    public MozillaMar(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public MozillaMar(KaitaiStream _io, KaitaiStruct _parent, MozillaMar _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.magic = this._io.readBytes(4);
        if (!(Arrays.equals(magic(), new byte[] { 77, 65, 82, 49 }))) {
            throw new KaitaiStream.ValidationNotEqualError(new byte[] { 77, 65, 82, 49 }, magic(), _io(), "/seq/0");
        }
        this.ofsIndex = this._io.readU4be();
        this.fileSize = this._io.readU8be();
        this.lenSignatures = this._io.readU4be();
        this.signatures = new ArrayList<Signature>();
        for (int i = 0; i < lenSignatures(); i++) {
            this.signatures.add(new Signature(this._io, this, _root));
        }
        this.lenAdditionalSections = this._io.readU4be();
        this.additionalSections = new ArrayList<AdditionalSection>();
        for (int i = 0; i < lenAdditionalSections(); i++) {
            this.additionalSections.add(new AdditionalSection(this._io, this, _root));
        }
    }
    public static class MarIndex extends KaitaiStruct {
        public static MarIndex fromFile(String fileName) throws IOException {
            return new MarIndex(new ByteBufferKaitaiStream(fileName));
        }

        public MarIndex(KaitaiStream _io) {
            this(_io, null, null);
        }

        public MarIndex(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public MarIndex(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenIndex = this._io.readU4be();
            this._raw_indexEntries = this._io.readBytes(lenIndex());
            KaitaiStream _io__raw_indexEntries = new ByteBufferKaitaiStream(_raw_indexEntries);
            this.indexEntries = new IndexEntries(_io__raw_indexEntries, this, _root);
        }
        private long lenIndex;
        private IndexEntries indexEntries;
        private MozillaMar _root;
        private MozillaMar _parent;
        private byte[] _raw_indexEntries;
        public long lenIndex() { return lenIndex; }
        public IndexEntries indexEntries() { return indexEntries; }
        public MozillaMar _root() { return _root; }
        public MozillaMar _parent() { return _parent; }
        public byte[] _raw_indexEntries() { return _raw_indexEntries; }
    }
    public static class IndexEntries extends KaitaiStruct {
        public static IndexEntries fromFile(String fileName) throws IOException {
            return new IndexEntries(new ByteBufferKaitaiStream(fileName));
        }

        public IndexEntries(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntries(KaitaiStream _io, MozillaMar.MarIndex _parent) {
            this(_io, _parent, null);
        }

        public IndexEntries(KaitaiStream _io, MozillaMar.MarIndex _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.indexEntry = new ArrayList<IndexEntry>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.indexEntry.add(new IndexEntry(this._io, this, _root));
                    i++;
                }
            }
        }
        private ArrayList<IndexEntry> indexEntry;
        private MozillaMar _root;
        private MozillaMar.MarIndex _parent;
        public ArrayList<IndexEntry> indexEntry() { return indexEntry; }
        public MozillaMar _root() { return _root; }
        public MozillaMar.MarIndex _parent() { return _parent; }
    }
    public static class Signature extends KaitaiStruct {
        public static Signature fromFile(String fileName) throws IOException {
            return new Signature(new ByteBufferKaitaiStream(fileName));
        }

        public Signature(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Signature(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public Signature(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.algorithm = MozillaMar.SignatureAlgorithms.byId(this._io.readU4be());
            this.lenSignature = this._io.readU4be();
            this.signature = this._io.readBytes(lenSignature());
        }
        private SignatureAlgorithms algorithm;
        private long lenSignature;
        private byte[] signature;
        private MozillaMar _root;
        private MozillaMar _parent;
        public SignatureAlgorithms algorithm() { return algorithm; }
        public long lenSignature() { return lenSignature; }
        public byte[] signature() { return signature; }
        public MozillaMar _root() { return _root; }
        public MozillaMar _parent() { return _parent; }
    }
    public static class ProductInformationBlock extends KaitaiStruct {
        public static ProductInformationBlock fromFile(String fileName) throws IOException {
            return new ProductInformationBlock(new ByteBufferKaitaiStream(fileName));
        }

        public ProductInformationBlock(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ProductInformationBlock(KaitaiStream _io, MozillaMar.AdditionalSection _parent) {
            this(_io, _parent, null);
        }

        public ProductInformationBlock(KaitaiStream _io, MozillaMar.AdditionalSection _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.marChannelName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(64), (byte) 0, false), Charset.forName("UTF-8"));
            this.productVersion = new String(KaitaiStream.bytesTerminate(this._io.readBytes(32), (byte) 0, false), Charset.forName("UTF-8"));
        }
        private String marChannelName;
        private String productVersion;
        private MozillaMar _root;
        private MozillaMar.AdditionalSection _parent;
        public String marChannelName() { return marChannelName; }
        public String productVersion() { return productVersion; }
        public MozillaMar _root() { return _root; }
        public MozillaMar.AdditionalSection _parent() { return _parent; }
    }
    public static class IndexEntry extends KaitaiStruct {
        public static IndexEntry fromFile(String fileName) throws IOException {
            return new IndexEntry(new ByteBufferKaitaiStream(fileName));
        }

        public IndexEntry(KaitaiStream _io) {
            this(_io, null, null);
        }

        public IndexEntry(KaitaiStream _io, MozillaMar.IndexEntries _parent) {
            this(_io, _parent, null);
        }

        public IndexEntry(KaitaiStream _io, MozillaMar.IndexEntries _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.ofsContent = this._io.readU4be();
            this.lenContent = this._io.readU4be();
            this.flags = this._io.readU4be();
            this.fileName = new String(this._io.readBytesTerm((byte) 0, false, true, true), Charset.forName("UTF-8"));
        }
        private byte[] body;
        public byte[] body() {
            if (this.body != null)
                return this.body;
            KaitaiStream io = _root()._io();
            long _pos = io.pos();
            io.seek(ofsContent());
            this.body = io.readBytes(lenContent());
            io.seek(_pos);
            return this.body;
        }
        private long ofsContent;
        private long lenContent;
        private long flags;
        private String fileName;
        private MozillaMar _root;
        private MozillaMar.IndexEntries _parent;
        public long ofsContent() { return ofsContent; }
        public long lenContent() { return lenContent; }

        /**
         * File permission bits (in standard unix-style format).
         */
        public long flags() { return flags; }
        public String fileName() { return fileName; }
        public MozillaMar _root() { return _root; }
        public MozillaMar.IndexEntries _parent() { return _parent; }
    }
    public static class AdditionalSection extends KaitaiStruct {
        public static AdditionalSection fromFile(String fileName) throws IOException {
            return new AdditionalSection(new ByteBufferKaitaiStream(fileName));
        }

        public AdditionalSection(KaitaiStream _io) {
            this(_io, null, null);
        }

        public AdditionalSection(KaitaiStream _io, MozillaMar _parent) {
            this(_io, _parent, null);
        }

        public AdditionalSection(KaitaiStream _io, MozillaMar _parent, MozillaMar _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lenBlock = this._io.readU4be();
            this.blockIdentifier = MozillaMar.BlockIdentifiers.byId(this._io.readU4be());
            {
                BlockIdentifiers on = blockIdentifier();
                if (on != null) {
                    switch (blockIdentifier()) {
                    case PRODUCT_INFORMATION: {
                        this._raw_bytes = this._io.readBytes(((lenBlock() - 4) - 4));
                        KaitaiStream _io__raw_bytes = new ByteBufferKaitaiStream(_raw_bytes);
                        this.bytes = new ProductInformationBlock(_io__raw_bytes, this, _root);
                        break;
                    }
                    default: {
                        this.bytes = this._io.readBytes(((lenBlock() - 4) - 4));
                        break;
                    }
                    }
                } else {
                    this.bytes = this._io.readBytes(((lenBlock() - 4) - 4));
                }
            }
        }
        private long lenBlock;
        private BlockIdentifiers blockIdentifier;
        private Object bytes;
        private MozillaMar _root;
        private MozillaMar _parent;
        private byte[] _raw_bytes;
        public long lenBlock() { return lenBlock; }
        public BlockIdentifiers blockIdentifier() { return blockIdentifier; }
        public Object bytes() { return bytes; }
        public MozillaMar _root() { return _root; }
        public MozillaMar _parent() { return _parent; }
        public byte[] _raw_bytes() { return _raw_bytes; }
    }
    private MarIndex index;
    public MarIndex index() {
        if (this.index != null)
            return this.index;
        long _pos = this._io.pos();
        this._io.seek(ofsIndex());
        this.index = new MarIndex(this._io, this, _root);
        this._io.seek(_pos);
        return this.index;
    }
    private byte[] magic;
    private long ofsIndex;
    private long fileSize;
    private long lenSignatures;
    private ArrayList<Signature> signatures;
    private long lenAdditionalSections;
    private ArrayList<AdditionalSection> additionalSections;
    private MozillaMar _root;
    private KaitaiStruct _parent;
    public byte[] magic() { return magic; }
    public long ofsIndex() { return ofsIndex; }
    public long fileSize() { return fileSize; }
    public long lenSignatures() { return lenSignatures; }
    public ArrayList<Signature> signatures() { return signatures; }
    public long lenAdditionalSections() { return lenAdditionalSections; }
    public ArrayList<AdditionalSection> additionalSections() { return additionalSections; }
    public MozillaMar _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
