// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.util.List;
import java.nio.charset.StandardCharsets;


/**
 * Direct Internet Message Encapsulation (DIME)
 * is an old Microsoft specification for sending and receiving
 * SOAP messages along with additional attachments,
 * like binary files, XML fragments, and even other
 * SOAP messages, using standard transport protocols like HTTP.
 * 
 * Sample file: `curl -LO
 * https://github.com/kaitai-io/kaitai_struct_formats/files/5894723/scanner_withoptions.dump.gz
 * && gunzip scanner_withoptions.dump.gz`
 * @see <a href="https://datatracker.ietf.org/doc/html/draft-nielsen-dime-02">Source</a>
 * @see <a href="https://learn.microsoft.com/en-us/archive/msdn-magazine/2002/december/sending-files-attachments-and-soap-messages-via-dime">Source</a>
 * @see <a href="http://imrannazar.com/Parsing-the-DIME-Message-Format">Source</a>
 */
public class DimeMessage extends KaitaiStruct {
    public static DimeMessage fromFile(String fileName) throws IOException {
        return new DimeMessage(new ByteBufferKaitaiStream(fileName));
    }

    public enum TypeFormats {
        UNCHANGED(0),
        MEDIA_TYPE(1),
        ABSOLUTE_URI(2),
        UNKNOWN(3),
        NONE(4);

        private final long id;
        TypeFormats(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, TypeFormats> byId = new HashMap<Long, TypeFormats>(5);
        static {
            for (TypeFormats e : TypeFormats.values())
                byId.put(e.id(), e);
        }
        public static TypeFormats byId(long id) { return byId.get(id); }
    }

    public DimeMessage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DimeMessage(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public DimeMessage(KaitaiStream _io, KaitaiStruct _parent, DimeMessage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                this.records.add(new Record(this._io, this, _root));
                i++;
            }
        }
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    /**
     * one element of the option field
     */
    public static class OptionElement extends KaitaiStruct {
        public static OptionElement fromFile(String fileName) throws IOException {
            return new OptionElement(new ByteBufferKaitaiStream(fileName));
        }

        public OptionElement(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionElement(KaitaiStream _io, DimeMessage.OptionField _parent) {
            this(_io, _parent, null);
        }

        public OptionElement(KaitaiStream _io, DimeMessage.OptionField _parent, DimeMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.elementFormat = this._io.readU2be();
            this.lenElement = this._io.readU2be();
            this.elementData = this._io.readBytes(lenElement());
        }

        public void _fetchInstances() {
        }
        private int elementFormat;
        private int lenElement;
        private byte[] elementData;
        private DimeMessage _root;
        private DimeMessage.OptionField _parent;
        public int elementFormat() { return elementFormat; }
        public int lenElement() { return lenElement; }
        public byte[] elementData() { return elementData; }
        public DimeMessage _root() { return _root; }
        public DimeMessage.OptionField _parent() { return _parent; }
    }

    /**
     * the option field of the record
     */
    public static class OptionField extends KaitaiStruct {
        public static OptionField fromFile(String fileName) throws IOException {
            return new OptionField(new ByteBufferKaitaiStream(fileName));
        }

        public OptionField(KaitaiStream _io) {
            this(_io, null, null);
        }

        public OptionField(KaitaiStream _io, DimeMessage.Record _parent) {
            this(_io, _parent, null);
        }

        public OptionField(KaitaiStream _io, DimeMessage.Record _parent, DimeMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.optionElements = new ArrayList<OptionElement>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    this.optionElements.add(new OptionElement(this._io, this, _root));
                    i++;
                }
            }
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.optionElements.size(); i++) {
                this.optionElements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }
        private List<OptionElement> optionElements;
        private DimeMessage _root;
        private DimeMessage.Record _parent;
        public List<OptionElement> optionElements() { return optionElements; }
        public DimeMessage _root() { return _root; }
        public DimeMessage.Record _parent() { return _parent; }
    }

    /**
     * padding to the next 4-byte boundary
     */
    public static class Padding extends KaitaiStruct {
        public static Padding fromFile(String fileName) throws IOException {
            return new Padding(new ByteBufferKaitaiStream(fileName));
        }

        public Padding(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Padding(KaitaiStream _io, DimeMessage.Record _parent) {
            this(_io, _parent, null);
        }

        public Padding(KaitaiStream _io, DimeMessage.Record _parent, DimeMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.boundaryPadding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 4));
        }

        public void _fetchInstances() {
        }
        private byte[] boundaryPadding;
        private DimeMessage _root;
        private DimeMessage.Record _parent;
        public byte[] boundaryPadding() { return boundaryPadding; }
        public DimeMessage _root() { return _root; }
        public DimeMessage.Record _parent() { return _parent; }
    }

    /**
     * each individual fragment of the message
     */
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Record(KaitaiStream _io, DimeMessage _parent) {
            this(_io, _parent, null);
        }

        public Record(KaitaiStream _io, DimeMessage _parent, DimeMessage _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.version = this._io.readBitsIntBe(5);
            this.isFirstRecord = this._io.readBitsIntBe(1) != 0;
            this.isLastRecord = this._io.readBitsIntBe(1) != 0;
            this.isChunkRecord = this._io.readBitsIntBe(1) != 0;
            this.typeFormat = DimeMessage.TypeFormats.byId(this._io.readBitsIntBe(4));
            this.reserved = this._io.readBitsIntBe(4);
            this.lenOptions = this._io.readU2be();
            this.lenId = this._io.readU2be();
            this.lenType = this._io.readU2be();
            this.lenData = this._io.readU4be();
            KaitaiStream _io_options = this._io.substream(lenOptions());
            this.options = new OptionField(_io_options, this, _root);
            this.optionsPadding = new Padding(this._io, this, _root);
            this.id = new String(this._io.readBytes(lenId()), StandardCharsets.US_ASCII);
            this.idPadding = new Padding(this._io, this, _root);
            this.type = new String(this._io.readBytes(lenType()), StandardCharsets.US_ASCII);
            this.typePadding = new Padding(this._io, this, _root);
            this.data = this._io.readBytes(lenData());
            this.dataPadding = new Padding(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.options._fetchInstances();
            this.optionsPadding._fetchInstances();
            this.idPadding._fetchInstances();
            this.typePadding._fetchInstances();
            this.dataPadding._fetchInstances();
        }
        private long version;
        private boolean isFirstRecord;
        private boolean isLastRecord;
        private boolean isChunkRecord;
        private TypeFormats typeFormat;
        private long reserved;
        private int lenOptions;
        private int lenId;
        private int lenType;
        private long lenData;
        private OptionField options;
        private Padding optionsPadding;
        private String id;
        private Padding idPadding;
        private String type;
        private Padding typePadding;
        private byte[] data;
        private Padding dataPadding;
        private DimeMessage _root;
        private DimeMessage _parent;

        /**
         * DIME format version (always 1)
         */
        public long version() { return version; }

        /**
         * Set if this is the first record in the message
         */
        public boolean isFirstRecord() { return isFirstRecord; }

        /**
         * Set if this is the last record in the message
         */
        public boolean isLastRecord() { return isLastRecord; }

        /**
         * Set if the file contained in this record is chunked into multiple records
         */
        public boolean isChunkRecord() { return isChunkRecord; }

        /**
         * Indicates the structure and format of the value of the TYPE field
         */
        public TypeFormats typeFormat() { return typeFormat; }

        /**
         * Reserved for future use
         */
        public long reserved() { return reserved; }

        /**
         * Length of the Options field
         */
        public int lenOptions() { return lenOptions; }

        /**
         * Length of the ID field
         */
        public int lenId() { return lenId; }

        /**
         * Length of the Type field
         */
        public int lenType() { return lenType; }

        /**
         * Length of the Data field
         */
        public long lenData() { return lenData; }
        public OptionField options() { return options; }
        public Padding optionsPadding() { return optionsPadding; }

        /**
         * Unique identifier of the file (set in the first record of file)
         */
        public String id() { return id; }
        public Padding idPadding() { return idPadding; }

        /**
         * Specified type in the format set with type_format
         */
        public String type() { return type; }
        public Padding typePadding() { return typePadding; }

        /**
         * The file data
         */
        public byte[] data() { return data; }
        public Padding dataPadding() { return dataPadding; }
        public DimeMessage _root() { return _root; }
        public DimeMessage _parent() { return _parent; }
    }
    private List<Record> records;
    private DimeMessage _root;
    private KaitaiStruct _parent;
    public List<Record> records() { return records; }
    public DimeMessage _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
