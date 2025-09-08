// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import io.kaitai.struct.ConsistencyError;
import java.util.Objects;
import java.util.List;
import java.nio.charset.StandardCharsets;
import java.nio.charset.Charset;


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
public class DimeMessage extends KaitaiStruct.ReadWrite {
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
    public DimeMessage() {
        this(null, null, null);
    }

    public DimeMessage(KaitaiStream _io) {
        this(_io, null, null);
    }

    public DimeMessage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent) {
        this(_io, _parent, null);
    }

    public DimeMessage(KaitaiStream _io, KaitaiStruct.ReadWrite _parent, DimeMessage _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
    }
    public void _read() {
        this.records = new ArrayList<Record>();
        {
            int i = 0;
            while (!this._io.isEof()) {
                Record _t_records = new Record(this._io, this, _root);
                try {
                    _t_records._read();
                } finally {
                    this.records.add(_t_records);
                }
                i++;
            }
        }
        _dirty = false;
    }

    public void _fetchInstances() {
        for (int i = 0; i < this.records.size(); i++) {
            this.records.get(((Number) (i)).intValue())._fetchInstances();
        }
    }

    public void _write_Seq() {
        _assertNotDirty();
        for (int i = 0; i < this.records.size(); i++) {
            if (this._io.isEof())
                throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
            this.records.get(((Number) (i)).intValue())._write_Seq(this._io);
        }
        if (!(this._io.isEof()))
            throw new ConsistencyError("records", 0, this._io.size() - this._io.pos());
    }

    public void _check() {
        for (int i = 0; i < this.records.size(); i++) {
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._root(), _root()))
                throw new ConsistencyError("records", _root(), this.records.get(((Number) (i)).intValue())._root());
            if (!Objects.equals(this.records.get(((Number) (i)).intValue())._parent(), this))
                throw new ConsistencyError("records", this, this.records.get(((Number) (i)).intValue())._parent());
        }
        _dirty = false;
    }

    /**
     * one element of the option field
     */
    public static class OptionElement extends KaitaiStruct.ReadWrite {
        public static OptionElement fromFile(String fileName) throws IOException {
            return new OptionElement(new ByteBufferKaitaiStream(fileName));
        }
        public OptionElement() {
            this(null, null, null);
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
        }
        public void _read() {
            this.elementFormat = this._io.readU2be();
            this.lenElement = this._io.readU2be();
            this.elementData = this._io.readBytes(lenElement());
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeU2be(this.elementFormat);
            this._io.writeU2be(this.lenElement);
            this._io.writeBytes(this.elementData);
        }

        public void _check() {
            if (this.elementData.length != lenElement())
                throw new ConsistencyError("element_data", lenElement(), this.elementData.length);
            _dirty = false;
        }
        private int elementFormat;
        private int lenElement;
        private byte[] elementData;
        private DimeMessage _root;
        private DimeMessage.OptionField _parent;
        public int elementFormat() { return elementFormat; }
        public void setElementFormat(int _v) { _dirty = true; elementFormat = _v; }
        public int lenElement() { return lenElement; }
        public void setLenElement(int _v) { _dirty = true; lenElement = _v; }
        public byte[] elementData() { return elementData; }
        public void setElementData(byte[] _v) { _dirty = true; elementData = _v; }
        public DimeMessage _root() { return _root; }
        public void set_root(DimeMessage _v) { _dirty = true; _root = _v; }
        public DimeMessage.OptionField _parent() { return _parent; }
        public void set_parent(DimeMessage.OptionField _v) { _dirty = true; _parent = _v; }
    }

    /**
     * the option field of the record
     */
    public static class OptionField extends KaitaiStruct.ReadWrite {
        public static OptionField fromFile(String fileName) throws IOException {
            return new OptionField(new ByteBufferKaitaiStream(fileName));
        }
        public OptionField() {
            this(null, null, null);
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
        }
        public void _read() {
            this.optionElements = new ArrayList<OptionElement>();
            {
                int i = 0;
                while (!this._io.isEof()) {
                    OptionElement _t_optionElements = new OptionElement(this._io, this, _root);
                    try {
                        _t_optionElements._read();
                    } finally {
                        this.optionElements.add(_t_optionElements);
                    }
                    i++;
                }
            }
            _dirty = false;
        }

        public void _fetchInstances() {
            for (int i = 0; i < this.optionElements.size(); i++) {
                this.optionElements.get(((Number) (i)).intValue())._fetchInstances();
            }
        }

        public void _write_Seq() {
            _assertNotDirty();
            for (int i = 0; i < this.optionElements.size(); i++) {
                if (this._io.isEof())
                    throw new ConsistencyError("option_elements", 0, this._io.size() - this._io.pos());
                this.optionElements.get(((Number) (i)).intValue())._write_Seq(this._io);
            }
            if (!(this._io.isEof()))
                throw new ConsistencyError("option_elements", 0, this._io.size() - this._io.pos());
        }

        public void _check() {
            for (int i = 0; i < this.optionElements.size(); i++) {
                if (!Objects.equals(this.optionElements.get(((Number) (i)).intValue())._root(), _root()))
                    throw new ConsistencyError("option_elements", _root(), this.optionElements.get(((Number) (i)).intValue())._root());
                if (!Objects.equals(this.optionElements.get(((Number) (i)).intValue())._parent(), this))
                    throw new ConsistencyError("option_elements", this, this.optionElements.get(((Number) (i)).intValue())._parent());
            }
            _dirty = false;
        }
        private List<OptionElement> optionElements;
        private DimeMessage _root;
        private DimeMessage.Record _parent;
        public List<OptionElement> optionElements() { return optionElements; }
        public void setOptionElements(List<OptionElement> _v) { _dirty = true; optionElements = _v; }
        public DimeMessage _root() { return _root; }
        public void set_root(DimeMessage _v) { _dirty = true; _root = _v; }
        public DimeMessage.Record _parent() { return _parent; }
        public void set_parent(DimeMessage.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * padding to the next 4-byte boundary
     */
    public static class Padding extends KaitaiStruct.ReadWrite {
        public static Padding fromFile(String fileName) throws IOException {
            return new Padding(new ByteBufferKaitaiStream(fileName));
        }
        public Padding() {
            this(null, null, null);
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
        }
        public void _read() {
            this.boundaryPadding = this._io.readBytes(KaitaiStream.mod(-(_io().pos()), 4));
            _dirty = false;
        }

        public void _fetchInstances() {
        }

        public void _write_Seq() {
            _assertNotDirty();
            if (this.boundaryPadding.length != KaitaiStream.mod(-(_io().pos()), 4))
                throw new ConsistencyError("boundary_padding", KaitaiStream.mod(-(_io().pos()), 4), this.boundaryPadding.length);
            this._io.writeBytes(this.boundaryPadding);
        }

        public void _check() {
            _dirty = false;
        }
        private byte[] boundaryPadding;
        private DimeMessage _root;
        private DimeMessage.Record _parent;
        public byte[] boundaryPadding() { return boundaryPadding; }
        public void setBoundaryPadding(byte[] _v) { _dirty = true; boundaryPadding = _v; }
        public DimeMessage _root() { return _root; }
        public void set_root(DimeMessage _v) { _dirty = true; _root = _v; }
        public DimeMessage.Record _parent() { return _parent; }
        public void set_parent(DimeMessage.Record _v) { _dirty = true; _parent = _v; }
    }

    /**
     * each individual fragment of the message
     */
    public static class Record extends KaitaiStruct.ReadWrite {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new ByteBufferKaitaiStream(fileName));
        }
        public Record() {
            this(null, null, null);
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
        }
        public void _read() {
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
            this._raw_options = this._io.readBytes(lenOptions());
            KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(this._raw_options);
            this.options = new OptionField(_io__raw_options, this, _root);
            this.options._read();
            this.optionsPadding = new Padding(this._io, this, _root);
            this.optionsPadding._read();
            this.id = new String(this._io.readBytes(lenId()), StandardCharsets.US_ASCII);
            this.idPadding = new Padding(this._io, this, _root);
            this.idPadding._read();
            this.type = new String(this._io.readBytes(lenType()), StandardCharsets.US_ASCII);
            this.typePadding = new Padding(this._io, this, _root);
            this.typePadding._read();
            this.data = this._io.readBytes(lenData());
            this.dataPadding = new Padding(this._io, this, _root);
            this.dataPadding._read();
            _dirty = false;
        }

        public void _fetchInstances() {
            this.options._fetchInstances();
            this.optionsPadding._fetchInstances();
            this.idPadding._fetchInstances();
            this.typePadding._fetchInstances();
            this.dataPadding._fetchInstances();
        }

        public void _write_Seq() {
            _assertNotDirty();
            this._io.writeBitsIntBe(5, this.version);
            this._io.writeBitsIntBe(1, (this.isFirstRecord ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isLastRecord ? 1 : 0));
            this._io.writeBitsIntBe(1, (this.isChunkRecord ? 1 : 0));
            this._io.writeBitsIntBe(4, ((Number) (this.typeFormat.id())).longValue());
            this._io.writeBitsIntBe(4, this.reserved);
            this._io.writeU2be(this.lenOptions);
            this._io.writeU2be(this.lenId);
            this._io.writeU2be(this.lenType);
            this._io.writeU4be(this.lenData);
            final KaitaiStream _io__raw_options = new ByteBufferKaitaiStream(lenOptions());
            this._io.addChildStream(_io__raw_options);
            {
                long _pos2 = this._io.pos();
                this._io.seek(this._io.pos() + (lenOptions()));
                final Record _this = this;
                _io__raw_options.setWriteBackHandler(new KaitaiStream.WriteBackHandler(_pos2) {
                    @Override
                    protected void write(KaitaiStream parent) {
                        _this._raw_options = _io__raw_options.toByteArray();
                        if (_this._raw_options.length != lenOptions())
                            throw new ConsistencyError("raw(options)", lenOptions(), _this._raw_options.length);
                        parent.writeBytes(_this._raw_options);
                    }
                });
            }
            this.options._write_Seq(_io__raw_options);
            this.optionsPadding._write_Seq(this._io);
            this._io.writeBytes((this.id).getBytes(Charset.forName("ASCII")));
            this.idPadding._write_Seq(this._io);
            this._io.writeBytes((this.type).getBytes(Charset.forName("ASCII")));
            this.typePadding._write_Seq(this._io);
            this._io.writeBytes(this.data);
            this.dataPadding._write_Seq(this._io);
        }

        public void _check() {
            if (!Objects.equals(this.options._root(), _root()))
                throw new ConsistencyError("options", _root(), this.options._root());
            if (!Objects.equals(this.options._parent(), this))
                throw new ConsistencyError("options", this, this.options._parent());
            if (!Objects.equals(this.optionsPadding._root(), _root()))
                throw new ConsistencyError("options_padding", _root(), this.optionsPadding._root());
            if (!Objects.equals(this.optionsPadding._parent(), this))
                throw new ConsistencyError("options_padding", this, this.optionsPadding._parent());
            if ((this.id).getBytes(Charset.forName("ASCII")).length != lenId())
                throw new ConsistencyError("id", lenId(), (this.id).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.idPadding._root(), _root()))
                throw new ConsistencyError("id_padding", _root(), this.idPadding._root());
            if (!Objects.equals(this.idPadding._parent(), this))
                throw new ConsistencyError("id_padding", this, this.idPadding._parent());
            if ((this.type).getBytes(Charset.forName("ASCII")).length != lenType())
                throw new ConsistencyError("type", lenType(), (this.type).getBytes(Charset.forName("ASCII")).length);
            if (!Objects.equals(this.typePadding._root(), _root()))
                throw new ConsistencyError("type_padding", _root(), this.typePadding._root());
            if (!Objects.equals(this.typePadding._parent(), this))
                throw new ConsistencyError("type_padding", this, this.typePadding._parent());
            if (this.data.length != lenData())
                throw new ConsistencyError("data", lenData(), this.data.length);
            if (!Objects.equals(this.dataPadding._root(), _root()))
                throw new ConsistencyError("data_padding", _root(), this.dataPadding._root());
            if (!Objects.equals(this.dataPadding._parent(), this))
                throw new ConsistencyError("data_padding", this, this.dataPadding._parent());
            _dirty = false;
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
        private byte[] _raw_options;

        /**
         * DIME format version (always 1)
         */
        public long version() { return version; }
        public void setVersion(long _v) { _dirty = true; version = _v; }

        /**
         * Set if this is the first record in the message
         */
        public boolean isFirstRecord() { return isFirstRecord; }
        public void setIsFirstRecord(boolean _v) { _dirty = true; isFirstRecord = _v; }

        /**
         * Set if this is the last record in the message
         */
        public boolean isLastRecord() { return isLastRecord; }
        public void setIsLastRecord(boolean _v) { _dirty = true; isLastRecord = _v; }

        /**
         * Set if the file contained in this record is chunked into multiple records
         */
        public boolean isChunkRecord() { return isChunkRecord; }
        public void setIsChunkRecord(boolean _v) { _dirty = true; isChunkRecord = _v; }

        /**
         * Indicates the structure and format of the value of the TYPE field
         */
        public TypeFormats typeFormat() { return typeFormat; }
        public void setTypeFormat(TypeFormats _v) { _dirty = true; typeFormat = _v; }

        /**
         * Reserved for future use
         */
        public long reserved() { return reserved; }
        public void setReserved(long _v) { _dirty = true; reserved = _v; }

        /**
         * Length of the Options field
         */
        public int lenOptions() { return lenOptions; }
        public void setLenOptions(int _v) { _dirty = true; lenOptions = _v; }

        /**
         * Length of the ID field
         */
        public int lenId() { return lenId; }
        public void setLenId(int _v) { _dirty = true; lenId = _v; }

        /**
         * Length of the Type field
         */
        public int lenType() { return lenType; }
        public void setLenType(int _v) { _dirty = true; lenType = _v; }

        /**
         * Length of the Data field
         */
        public long lenData() { return lenData; }
        public void setLenData(long _v) { _dirty = true; lenData = _v; }
        public OptionField options() { return options; }
        public void setOptions(OptionField _v) { _dirty = true; options = _v; }
        public Padding optionsPadding() { return optionsPadding; }
        public void setOptionsPadding(Padding _v) { _dirty = true; optionsPadding = _v; }

        /**
         * Unique identifier of the file (set in the first record of file)
         */
        public String id() { return id; }
        public void setId(String _v) { _dirty = true; id = _v; }
        public Padding idPadding() { return idPadding; }
        public void setIdPadding(Padding _v) { _dirty = true; idPadding = _v; }

        /**
         * Specified type in the format set with type_format
         */
        public String type() { return type; }
        public void setType(String _v) { _dirty = true; type = _v; }
        public Padding typePadding() { return typePadding; }
        public void setTypePadding(Padding _v) { _dirty = true; typePadding = _v; }

        /**
         * The file data
         */
        public byte[] data() { return data; }
        public void setData(byte[] _v) { _dirty = true; data = _v; }
        public Padding dataPadding() { return dataPadding; }
        public void setDataPadding(Padding _v) { _dirty = true; dataPadding = _v; }
        public DimeMessage _root() { return _root; }
        public void set_root(DimeMessage _v) { _dirty = true; _root = _v; }
        public DimeMessage _parent() { return _parent; }
        public void set_parent(DimeMessage _v) { _dirty = true; _parent = _v; }
        public byte[] _raw_options() { return _raw_options; }
        public void set_raw_Options(byte[] _v) { _dirty = true; _raw_options = _v; }
    }
    private List<Record> records;
    private DimeMessage _root;
    private KaitaiStruct.ReadWrite _parent;
    public List<Record> records() { return records; }
    public void setRecords(List<Record> _v) { _dirty = true; records = _v; }
    public DimeMessage _root() { return _root; }
    public void set_root(DimeMessage _v) { _dirty = true; _root = _v; }
    public KaitaiStruct.ReadWrite _parent() { return _parent; }
    public void set_parent(KaitaiStruct.ReadWrite _v) { _dirty = true; _parent = _v; }
}
