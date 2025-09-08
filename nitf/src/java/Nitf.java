// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.StandardCharsets;
import java.util.Arrays;
import java.util.List;


/**
 * The NITF (National Image Transition Format) format is a file format developed by the U.S. Government for
 * storing imagery, e.g. from satellites.
 * 
 * According to the [foreword of the specification](https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf):
 * > The National Imagery Transmission Format Standard (NITFS) is the suite of standards for formatting digital
 * > imagery and imagery-related products and exchanging them among members of the Intelligence Community (IC) as
 * > defined by the Executive Order 12333, and other United States Government departments and agencies."
 * 
 * This implementation is set to version format (`file_version`) of 02.10 and `standard_type` of `BF01`.
 * It was implemented by [River Loop Security](https://www.riverloopsecurity.com/).
 * @see <a href="https://web.archive.org/web/20181105050336/https://www.gwg.nga.mil/ntb/baseline/docs/2500c/2500C.pdf">Source</a>
 */
public class Nitf extends KaitaiStruct {
    public static Nitf fromFile(String fileName) throws IOException {
        return new Nitf(new ByteBufferKaitaiStream(fileName));
    }

    public Nitf(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Nitf(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Nitf(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.header = new Header(this._io, this, _root);
        this.imageSegments = new ArrayList<ImageSegment>();
        for (int i = 0; i < Long.parseLong(header().numImageSegments(), 10); i++) {
            this.imageSegments.add(new ImageSegment(this._io, this, _root, i));
        }
        this.graphicsSegments = new ArrayList<GraphicsSegment>();
        for (int i = 0; i < Long.parseLong(header().numGraphicsSegments(), 10); i++) {
            this.graphicsSegments.add(new GraphicsSegment(this._io, this, _root, i));
        }
        this.textSegments = new ArrayList<TextSegment>();
        for (int i = 0; i < Long.parseLong(header().numTextFiles(), 10); i++) {
            this.textSegments.add(new TextSegment(this._io, this, _root, i));
        }
        this.dataExtensionSegments = new ArrayList<DataExtensionSegment>();
        for (int i = 0; i < Long.parseLong(header().numDataExtension(), 10); i++) {
            this.dataExtensionSegments.add(new DataExtensionSegment(this._io, this, _root, i));
        }
        this.reservedExtensionSegments = new ArrayList<ReservedExtensionSegment>();
        for (int i = 0; i < Long.parseLong(header().numReservedExtension(), 10); i++) {
            this.reservedExtensionSegments.add(new ReservedExtensionSegment(this._io, this, _root, i));
        }
    }

    public void _fetchInstances() {
        this.header._fetchInstances();
        for (int i = 0; i < this.imageSegments.size(); i++) {
            this.imageSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.graphicsSegments.size(); i++) {
            this.graphicsSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.textSegments.size(); i++) {
            this.textSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.dataExtensionSegments.size(); i++) {
            this.dataExtensionSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
        for (int i = 0; i < this.reservedExtensionSegments.size(); i++) {
            this.reservedExtensionSegments.get(((Number) (i)).intValue())._fetchInstances();
        }
    }
    public static class BandInfo extends KaitaiStruct {
        public static BandInfo fromFile(String fileName) throws IOException {
            return new BandInfo(new ByteBufferKaitaiStream(fileName));
        }

        public BandInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public BandInfo(KaitaiStream _io, Nitf.ImageSubHeader _parent) {
            this(_io, _parent, null);
        }

        public BandInfo(KaitaiStream _io, Nitf.ImageSubHeader _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.representation = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.subcategory = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.imgFilterCondition = this._io.readBytes(1);
            if (!(Arrays.equals(this.imgFilterCondition, new byte[] { 78 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78 }, this.imgFilterCondition, this._io, "/types/band_info/seq/2");
            }
            this.imgFilterCode = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.numLuts = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            if (Long.parseLong(numLuts(), 10) != 0) {
                this.numLutEntries = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            }
            this.luts = new ArrayList<byte[]>();
            for (int i = 0; i < Long.parseLong(numLuts(), 10); i++) {
                this.luts.add(this._io.readBytes(Long.parseLong(numLutEntries(), 10)));
            }
        }

        public void _fetchInstances() {
            if (Long.parseLong(numLuts(), 10) != 0) {
            }
            for (int i = 0; i < this.luts.size(); i++) {
            }
        }
        private String representation;
        private String subcategory;
        private byte[] imgFilterCondition;
        private String imgFilterCode;
        private String numLuts;
        private String numLutEntries;
        private List<byte[]> luts;
        private Nitf _root;
        private Nitf.ImageSubHeader _parent;

        /**
         * Indicates processing required to display the nth band of image w.r.t. the general image type recorded by IREP field
         */
        public String representation() { return representation; }
        public String subcategory() { return subcategory; }
        public byte[] imgFilterCondition() { return imgFilterCondition; }

        /**
         * Reserved
         */
        public String imgFilterCode() { return imgFilterCode; }
        public String numLuts() { return numLuts; }

        /**
         * Number of entries in each of the LUTs for the nth image band
         */
        public String numLutEntries() { return numLutEntries; }
        public List<byte[]> luts() { return luts; }
        public Nitf _root() { return _root; }
        public Nitf.ImageSubHeader _parent() { return _parent; }
    }
    public static class Clasnfo extends KaitaiStruct {
        public static Clasnfo fromFile(String fileName) throws IOException {
            return new Clasnfo(new ByteBufferKaitaiStream(fileName));
        }

        public Clasnfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Clasnfo(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Clasnfo(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.securityClass = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.securitySystem = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.codewords = new String(this._io.readBytes(11), StandardCharsets.UTF_8);
            this.controlAndHandling = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.releaseability = new String(this._io.readBytes(20), StandardCharsets.UTF_8);
            this.declassType = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.declassDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.declassExemption = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.downgrade = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.downgradeDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.classText = new String(this._io.readBytes(43), StandardCharsets.UTF_8);
            this.classAuthorityType = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.classAuthority = new String(this._io.readBytes(40), StandardCharsets.UTF_8);
            this.classReason = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.sourceDate = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.controlNumber = new String(this._io.readBytes(15), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String securityClass;
        private String securitySystem;
        private String codewords;
        private String controlAndHandling;
        private String releaseability;
        private String declassType;
        private String declassDate;
        private String declassExemption;
        private String downgrade;
        private String downgradeDate;
        private String classText;
        private String classAuthorityType;
        private String classAuthority;
        private String classReason;
        private String sourceDate;
        private String controlNumber;
        private Nitf _root;
        private KaitaiStruct _parent;
        public String securityClass() { return securityClass; }
        public String securitySystem() { return securitySystem; }
        public String codewords() { return codewords; }
        public String controlAndHandling() { return controlAndHandling; }
        public String releaseability() { return releaseability; }
        public String declassType() { return declassType; }
        public String declassDate() { return declassDate; }
        public String declassExemption() { return declassExemption; }
        public String downgrade() { return downgrade; }
        public String downgradeDate() { return downgradeDate; }
        public String classText() { return classText; }
        public String classAuthorityType() { return classAuthorityType; }
        public String classAuthority() { return classAuthority; }
        public String classReason() { return classReason; }
        public String sourceDate() { return sourceDate; }
        public String controlNumber() { return controlNumber; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class DataExtensionSegment extends KaitaiStruct {

        public DataExtensionSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public DataExtensionSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public DataExtensionSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            KaitaiStream _io_dataSubHeader = this._io.substream(Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSubheader(), 10));
            this.dataSubHeader = new DataSubHeader(_io_dataSubHeader, this, _root);
            this.dataDataField = this._io.readBytes(Long.parseLong(_parent().header().ldnfo().get(((Number) (idx())).intValue()).lengthDataExtensionSegment(), 10));
        }

        public void _fetchInstances() {
            this.dataSubHeader._fetchInstances();
        }
        private DataSubHeader dataSubHeader;
        private byte[] dataDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public DataSubHeader dataSubHeader() { return dataSubHeader; }
        public byte[] dataDataField() { return dataDataField; }
        public int idx() { return idx; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class DataSubHeader extends KaitaiStruct {
        public static DataSubHeader fromFile(String fileName) throws IOException {
            return new DataSubHeader(new ByteBufferKaitaiStream(fileName));
        }

        public DataSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeader(KaitaiStream _io, Nitf.DataExtensionSegment _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeader(KaitaiStream _io, Nitf.DataExtensionSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            if (treOfl()) {
                this.overflowedHeaderType = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            }
            if (treOfl()) {
                this.dataItemOverflowed = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.desshf = new String(this._io.readBytes(Long.parseLong(desDefinedSubheaderFieldsLen(), 10)), StandardCharsets.UTF_8);
            this.desDefinedDataField = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            if (treOfl()) {
            }
            if (treOfl()) {
            }
        }
        private Boolean treOfl;
        public Boolean treOfl() {
            if (this.treOfl != null)
                return this.treOfl;
            this.treOfl = desBase().desid().equals("TRE_OVERFLOW");
            return this.treOfl;
        }
        private DataSubHeaderBase desBase;
        private String overflowedHeaderType;
        private String dataItemOverflowed;
        private String desDefinedSubheaderFieldsLen;
        private String desshf;
        private String desDefinedDataField;
        private Nitf _root;
        private Nitf.DataExtensionSegment _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public String overflowedHeaderType() { return overflowedHeaderType; }
        public String dataItemOverflowed() { return dataItemOverflowed; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }
        public String desshf() { return desshf; }
        public String desDefinedDataField() { return desDefinedDataField; }
        public Nitf _root() { return _root; }
        public Nitf.DataExtensionSegment _parent() { return _parent; }
    }
    public static class DataSubHeaderBase extends KaitaiStruct {
        public static DataSubHeaderBase fromFile(String fileName) throws IOException {
            return new DataSubHeaderBase(new ByteBufferKaitaiStream(fileName));
        }

        public DataSubHeaderBase(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderBase(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderBase(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.filePartTypeDe = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeDe, new byte[] { 68, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 68, 69 }, this.filePartTypeDe, this._io, "/types/data_sub_header_base/seq/0");
            }
            this.desid = new String(this._io.readBytes(25), StandardCharsets.UTF_8);
            this.dataDefinitionVersion = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.declasnfo = new Clasnfo(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.declasnfo._fetchInstances();
        }
        private byte[] filePartTypeDe;
        private String desid;
        private String dataDefinitionVersion;
        private Clasnfo declasnfo;
        private Nitf _root;
        private KaitaiStruct _parent;

        /**
         * File Part Type desigantor for Data Extension
         */
        public byte[] filePartTypeDe() { return filePartTypeDe; }
        public String desid() { return desid; }
        public String dataDefinitionVersion() { return dataDefinitionVersion; }
        public Clasnfo declasnfo() { return declasnfo; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }

    /**
     * Streaming file Header Data Extension Segment Subheader
     */
    public static class DataSubHeaderStreaming extends KaitaiStruct {
        public static DataSubHeaderStreaming fromFile(String fileName) throws IOException {
            return new DataSubHeaderStreaming(new ByteBufferKaitaiStream(fileName));
        }

        public DataSubHeaderStreaming(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderStreaming(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderStreaming(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.sfhL1 = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
            this.sfhDelim1 = this._io.readU4be();
            this.sfhDr = new ArrayList<Integer>();
            for (int i = 0; i < Long.parseLong(sfhL1(), 10); i++) {
                this.sfhDr.add(this._io.readU1());
            }
            this.sfhDelim2 = this._io.readU4be();
            this.sfhL2 = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            for (int i = 0; i < this.sfhDr.size(); i++) {
            }
        }
        private DataSubHeaderBase desBase;
        private String desDefinedSubheaderFieldsLen;
        private String sfhL1;
        private long sfhDelim1;
        private List<Integer> sfhDr;
        private long sfhDelim2;
        private String sfhL2;
        private Nitf _root;
        private KaitaiStruct _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }

        /**
         * SFH Length 1: number of bytes in sfh_dr field
         */
        public String sfhL1() { return sfhL1; }

        /**
         * Shall contain the value 0x0A6E1D97.
         */
        public long sfhDelim1() { return sfhDelim1; }
        public List<Integer> sfhDr() { return sfhDr; }

        /**
         * Shall contain the value 0x0ECA14BF.
         */
        public long sfhDelim2() { return sfhDelim2; }

        /**
         * A repeat of sfh_l1.
         */
        public String sfhL2() { return sfhL2; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class DataSubHeaderTre extends KaitaiStruct {
        public static DataSubHeaderTre fromFile(String fileName) throws IOException {
            return new DataSubHeaderTre(new ByteBufferKaitaiStream(fileName));
        }

        public DataSubHeaderTre(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DataSubHeaderTre(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DataSubHeaderTre(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.desBase = new DataSubHeaderBase(this._io, this, _root);
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this.overflowedHeaderType = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
                this.dataItemOverflowed = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            this.desDefinedSubheaderFieldsLen = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.desDefinedDataField = new String(this._io.readBytes(Long.parseLong(desDefinedSubheaderFieldsLen(), 10)), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
            this.desBase._fetchInstances();
            if (desBase().desid().equals("TRE_OVERFLOW")) {
            }
            if (desBase().desid().equals("TRE_OVERFLOW")) {
            }
        }
        private DataSubHeaderBase desBase;
        private String overflowedHeaderType;
        private String dataItemOverflowed;
        private String desDefinedSubheaderFieldsLen;
        private String desDefinedDataField;
        private Nitf _root;
        private KaitaiStruct _parent;
        public DataSubHeaderBase desBase() { return desBase; }
        public String overflowedHeaderType() { return overflowedHeaderType; }
        public String dataItemOverflowed() { return dataItemOverflowed; }
        public String desDefinedSubheaderFieldsLen() { return desDefinedSubheaderFieldsLen; }
        public String desDefinedDataField() { return desDefinedDataField; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class DateTime extends KaitaiStruct {
        public static DateTime fromFile(String fileName) throws IOException {
            return new DateTime(new ByteBufferKaitaiStream(fileName));
        }

        public DateTime(KaitaiStream _io) {
            this(_io, null, null);
        }

        public DateTime(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public DateTime(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this._unnamed0 = new String(this._io.readBytes(14), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String _unnamed0;
        private Nitf _root;
        private KaitaiStruct _parent;

        /**
         * UTC time of image acquisition in the format CCYYMMDDhhmmss: CC century, YY last two digits of the year, MM month, DD day, hh hour, mm minute, ss second
         */
        public String _unnamed0() { return _unnamed0; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Encrypt extends KaitaiStruct {
        public static Encrypt fromFile(String fileName) throws IOException {
            return new Encrypt(new ByteBufferKaitaiStream(fileName));
        }

        public Encrypt(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Encrypt(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Encrypt(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this._unnamed0 = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String _unnamed0;
        private Nitf _root;
        private KaitaiStruct _parent;
        public String _unnamed0() { return _unnamed0; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class GraphicSubHeader extends KaitaiStruct {
        public static GraphicSubHeader fromFile(String fileName) throws IOException {
            return new GraphicSubHeader(new ByteBufferKaitaiStream(fileName));
        }

        public GraphicSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public GraphicSubHeader(KaitaiStream _io, Nitf.GraphicsSegment _parent) {
            this(_io, _parent, null);
        }

        public GraphicSubHeader(KaitaiStream _io, Nitf.GraphicsSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.filePartTypeSy = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeSy, new byte[] { 83, 89 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 83, 89 }, this.filePartTypeSy, this._io, "/types/graphic_sub_header/seq/0");
            }
            this.graphicId = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.graphicName = new String(this._io.readBytes(20), StandardCharsets.UTF_8);
            this.graphicClassification = new Clasnfo(this._io, this, _root);
            this.encryption = new Encrypt(this._io, this, _root);
            this.graphicType = this._io.readBytes(1);
            if (!(Arrays.equals(this.graphicType, new byte[] { 67 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 67 }, this.graphicType, this._io, "/types/graphic_sub_header/seq/5");
            }
            this.reserved1 = new String(this._io.readBytes(13), StandardCharsets.UTF_8);
            this.graphicDisplayLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.graphicAttachmentLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.graphicLocation = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.firstGraphicBoundLoc = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.graphicColor = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.secondGraphicBoundLoc = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.reserved2 = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.graphicsExtendedSubHeader = new TreHeader(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.graphicClassification._fetchInstances();
            this.encryption._fetchInstances();
            this.graphicsExtendedSubHeader._fetchInstances();
        }
        private byte[] filePartTypeSy;
        private String graphicId;
        private String graphicName;
        private Clasnfo graphicClassification;
        private Encrypt encryption;
        private byte[] graphicType;
        private String reserved1;
        private String graphicDisplayLevel;
        private String graphicAttachmentLevel;
        private String graphicLocation;
        private String firstGraphicBoundLoc;
        private String graphicColor;
        private String secondGraphicBoundLoc;
        private String reserved2;
        private TreHeader graphicsExtendedSubHeader;
        private Nitf _root;
        private Nitf.GraphicsSegment _parent;
        public byte[] filePartTypeSy() { return filePartTypeSy; }
        public String graphicId() { return graphicId; }
        public String graphicName() { return graphicName; }
        public Clasnfo graphicClassification() { return graphicClassification; }
        public Encrypt encryption() { return encryption; }
        public byte[] graphicType() { return graphicType; }

        /**
         * Reserved
         */
        public String reserved1() { return reserved1; }
        public String graphicDisplayLevel() { return graphicDisplayLevel; }
        public String graphicAttachmentLevel() { return graphicAttachmentLevel; }
        public String graphicLocation() { return graphicLocation; }
        public String firstGraphicBoundLoc() { return firstGraphicBoundLoc; }
        public String graphicColor() { return graphicColor; }
        public String secondGraphicBoundLoc() { return secondGraphicBoundLoc; }

        /**
         * Reserved
         */
        public String reserved2() { return reserved2; }
        public TreHeader graphicsExtendedSubHeader() { return graphicsExtendedSubHeader; }
        public Nitf _root() { return _root; }
        public Nitf.GraphicsSegment _parent() { return _parent; }
    }
    public static class GraphicsSegment extends KaitaiStruct {

        public GraphicsSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public GraphicsSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public GraphicsSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            this.graphicSubHeader = new GraphicSubHeader(this._io, this, _root);
            this.graphicDataField = this._io.readBytes(Long.parseLong(_parent().header().lnnfo().get(((Number) (idx())).intValue()).lengthGraphicSegment(), 10));
        }

        public void _fetchInstances() {
            this.graphicSubHeader._fetchInstances();
        }
        private GraphicSubHeader graphicSubHeader;
        private byte[] graphicDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public GraphicSubHeader graphicSubHeader() { return graphicSubHeader; }
        public byte[] graphicDataField() { return graphicDataField; }
        public int idx() { return idx; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Nitf _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Nitf _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.fileProfileName = this._io.readBytes(4);
            if (!(Arrays.equals(this.fileProfileName, new byte[] { 78, 73, 84, 70 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 78, 73, 84, 70 }, this.fileProfileName, this._io, "/types/header/seq/0");
            }
            this.fileVersion = this._io.readBytes(5);
            if (!(Arrays.equals(this.fileVersion, new byte[] { 48, 50, 46, 49, 48 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 48, 50, 46, 49, 48 }, this.fileVersion, this._io, "/types/header/seq/1");
            }
            this.complexityLevel = this._io.readBytes(2);
            this.standardType = this._io.readBytes(4);
            if (!(Arrays.equals(this.standardType, new byte[] { 66, 70, 48, 49 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 66, 70, 48, 49 }, this.standardType, this._io, "/types/header/seq/3");
            }
            this.originatingStationId = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.fileDateTime = new DateTime(this._io, this, _root);
            this.fileTitle = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.fileSecurity = new Clasnfo(this._io, this, _root);
            this.fileCopyNumber = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.fileNumOfCopys = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.encryption = new Encrypt(this._io, this, _root);
            this.fileBgColor = this._io.readBytes(3);
            this.originatorName = new String(this._io.readBytes(24), StandardCharsets.UTF_8);
            this.originatorPhone = new String(this._io.readBytes(18), StandardCharsets.UTF_8);
            this.fileLength = new String(this._io.readBytes(12), StandardCharsets.UTF_8);
            this.fileHeaderLength = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.numImageSegments = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.linfo = new ArrayList<LengthImageInfo>();
            for (int i = 0; i < Long.parseLong(numImageSegments(), 10); i++) {
                this.linfo.add(new LengthImageInfo(this._io, this, _root));
            }
            this.numGraphicsSegments = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.lnnfo = new ArrayList<LengthGraphicInfo>();
            for (int i = 0; i < Long.parseLong(numGraphicsSegments(), 10); i++) {
                this.lnnfo.add(new LengthGraphicInfo(this._io, this, _root));
            }
            this.reservedNumx = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.numTextFiles = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.ltnfo = new ArrayList<LengthTextInfo>();
            for (int i = 0; i < Long.parseLong(numTextFiles(), 10); i++) {
                this.ltnfo.add(new LengthTextInfo(this._io, this, _root));
            }
            this.numDataExtension = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.ldnfo = new ArrayList<LengthDataInfo>();
            for (int i = 0; i < Long.parseLong(numDataExtension(), 10); i++) {
                this.ldnfo.add(new LengthDataInfo(this._io, this, _root));
            }
            this.numReservedExtension = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.lrnfo = new ArrayList<LengthReservedInfo>();
            for (int i = 0; i < Long.parseLong(numReservedExtension(), 10); i++) {
                this.lrnfo.add(new LengthReservedInfo(this._io, this, _root));
            }
            this.userDefinedHeader = new TreHeader(this._io, this, _root);
            this.extendedHeader = new TreHeader(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.fileDateTime._fetchInstances();
            this.fileSecurity._fetchInstances();
            this.encryption._fetchInstances();
            for (int i = 0; i < this.linfo.size(); i++) {
                this.linfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.lnnfo.size(); i++) {
                this.lnnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.ltnfo.size(); i++) {
                this.ltnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.ldnfo.size(); i++) {
                this.ldnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            for (int i = 0; i < this.lrnfo.size(); i++) {
                this.lrnfo.get(((Number) (i)).intValue())._fetchInstances();
            }
            this.userDefinedHeader._fetchInstances();
            this.extendedHeader._fetchInstances();
        }
        private byte[] fileProfileName;
        private byte[] fileVersion;
        private byte[] complexityLevel;
        private byte[] standardType;
        private String originatingStationId;
        private DateTime fileDateTime;
        private String fileTitle;
        private Clasnfo fileSecurity;
        private String fileCopyNumber;
        private String fileNumOfCopys;
        private Encrypt encryption;
        private byte[] fileBgColor;
        private String originatorName;
        private String originatorPhone;
        private String fileLength;
        private String fileHeaderLength;
        private String numImageSegments;
        private List<LengthImageInfo> linfo;
        private String numGraphicsSegments;
        private List<LengthGraphicInfo> lnnfo;
        private String reservedNumx;
        private String numTextFiles;
        private List<LengthTextInfo> ltnfo;
        private String numDataExtension;
        private List<LengthDataInfo> ldnfo;
        private String numReservedExtension;
        private List<LengthReservedInfo> lrnfo;
        private TreHeader userDefinedHeader;
        private TreHeader extendedHeader;
        private Nitf _root;
        private Nitf _parent;
        public byte[] fileProfileName() { return fileProfileName; }
        public byte[] fileVersion() { return fileVersion; }
        public byte[] complexityLevel() { return complexityLevel; }

        /**
         * Value of BF01 indicates the file is formatted using ISO/IEC IS 12087-5.
         */
        public byte[] standardType() { return standardType; }
        public String originatingStationId() { return originatingStationId; }
        public DateTime fileDateTime() { return fileDateTime; }
        public String fileTitle() { return fileTitle; }
        public Clasnfo fileSecurity() { return fileSecurity; }
        public String fileCopyNumber() { return fileCopyNumber; }
        public String fileNumOfCopys() { return fileNumOfCopys; }
        public Encrypt encryption() { return encryption; }
        public byte[] fileBgColor() { return fileBgColor; }
        public String originatorName() { return originatorName; }
        public String originatorPhone() { return originatorPhone; }
        public String fileLength() { return fileLength; }
        public String fileHeaderLength() { return fileHeaderLength; }
        public String numImageSegments() { return numImageSegments; }
        public List<LengthImageInfo> linfo() { return linfo; }
        public String numGraphicsSegments() { return numGraphicsSegments; }
        public List<LengthGraphicInfo> lnnfo() { return lnnfo; }
        public String reservedNumx() { return reservedNumx; }
        public String numTextFiles() { return numTextFiles; }
        public List<LengthTextInfo> ltnfo() { return ltnfo; }
        public String numDataExtension() { return numDataExtension; }
        public List<LengthDataInfo> ldnfo() { return ldnfo; }
        public String numReservedExtension() { return numReservedExtension; }
        public List<LengthReservedInfo> lrnfo() { return lrnfo; }
        public TreHeader userDefinedHeader() { return userDefinedHeader; }
        public TreHeader extendedHeader() { return extendedHeader; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class ImageComment extends KaitaiStruct {
        public static ImageComment fromFile(String fileName) throws IOException {
            return new ImageComment(new ByteBufferKaitaiStream(fileName));
        }

        public ImageComment(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageComment(KaitaiStream _io, Nitf.ImageSubHeader _parent) {
            this(_io, _parent, null);
        }

        public ImageComment(KaitaiStream _io, Nitf.ImageSubHeader _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this._unnamed0 = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String _unnamed0;
        private Nitf _root;
        private Nitf.ImageSubHeader _parent;
        public String _unnamed0() { return _unnamed0; }
        public Nitf _root() { return _root; }
        public Nitf.ImageSubHeader _parent() { return _parent; }
    }
    public static class ImageDataMask extends KaitaiStruct {
        public static ImageDataMask fromFile(String fileName) throws IOException {
            return new ImageDataMask(new ByteBufferKaitaiStream(fileName));
        }

        public ImageDataMask(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageDataMask(KaitaiStream _io, Nitf.ImageSegment _parent) {
            this(_io, _parent, null);
        }

        public ImageDataMask(KaitaiStream _io, Nitf.ImageSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.blockedImgDataOffset = this._io.readU4be();
            this.bmrlnth = this._io.readU2be();
            this.tmrlnth = this._io.readU2be();
            this.tpxcdlnth = this._io.readU2be();
            this.tpxcd = this._io.readBytes(tpxcdSize());
            if (hasBmr()) {
                this.bmrbnd = new ArrayList<Long>();
                for (int i = 0; i < bmrtmrCount(); i++) {
                    this.bmrbnd.add(this._io.readU4be());
                }
            }
            if (hasTmr()) {
                this.tmrbnd = new ArrayList<Long>();
                for (int i = 0; i < bmrtmrCount(); i++) {
                    this.tmrbnd.add(this._io.readU4be());
                }
            }
        }

        public void _fetchInstances() {
            if (hasBmr()) {
                for (int i = 0; i < this.bmrbnd.size(); i++) {
                }
            }
            if (hasTmr()) {
                for (int i = 0; i < this.tmrbnd.size(); i++) {
                }
            }
        }
        private Integer bmrbndSize;
        public Integer bmrbndSize() {
            if (this.bmrbndSize != null)
                return this.bmrbndSize;
            this.bmrbndSize = ((Number) ((hasBmr() ? bmrtmrCount() * 4 : 0))).intValue();
            return this.bmrbndSize;
        }
        private Integer bmrtmrCount;
        public Integer bmrtmrCount() {
            if (this.bmrtmrCount != null)
                return this.bmrtmrCount;
            this.bmrtmrCount = ((Number) ((Long.parseLong(_parent().imageSubHeader().numBlocksPerRow(), 10) * Long.parseLong(_parent().imageSubHeader().numBlocksPerCol(), 10)) * (!_parent().imageSubHeader().imgMode().equals("S") ? 1 : (Long.parseLong(_parent().imageSubHeader().numBands(), 10) != 0 ? Long.parseLong(_parent().imageSubHeader().numBands(), 10) : Long.parseLong(_parent().imageSubHeader().numMultispectralBands(), 10))))).intValue();
            return this.bmrtmrCount;
        }
        private Boolean hasBmr;
        public Boolean hasBmr() {
            if (this.hasBmr != null)
                return this.hasBmr;
            this.hasBmr = bmrlnth() != 0;
            return this.hasBmr;
        }
        private Boolean hasTmr;
        public Boolean hasTmr() {
            if (this.hasTmr != null)
                return this.hasTmr;
            this.hasTmr = tmrlnth() != 0;
            return this.hasTmr;
        }
        private Integer tmrbndSize;
        public Integer tmrbndSize() {
            if (this.tmrbndSize != null)
                return this.tmrbndSize;
            this.tmrbndSize = ((Number) ((hasTmr() ? bmrtmrCount() * 4 : 0))).intValue();
            return this.tmrbndSize;
        }
        private Integer totalSize;
        public Integer totalSize() {
            if (this.totalSize != null)
                return this.totalSize;
            this.totalSize = ((Number) ((((((4 + 2) + 2) + 2) + tpxcdSize()) + bmrbndSize()) + tmrbndSize())).intValue();
            return this.totalSize;
        }
        private Integer tpxcdSize;
        public Integer tpxcdSize() {
            if (this.tpxcdSize != null)
                return this.tpxcdSize;
            this.tpxcdSize = ((Number) ((KaitaiStream.mod(tpxcdlnth(), 8) == 0 ? tpxcdlnth() : tpxcdlnth() + (8 - KaitaiStream.mod(tpxcdlnth(), 8))) / 8)).intValue();
            return this.tpxcdSize;
        }
        private long blockedImgDataOffset;
        private int bmrlnth;
        private int tmrlnth;
        private int tpxcdlnth;
        private byte[] tpxcd;
        private List<Long> bmrbnd;
        private List<Long> tmrbnd;
        private Nitf _root;
        private Nitf.ImageSegment _parent;
        public long blockedImgDataOffset() { return blockedImgDataOffset; }

        /**
         * Block Mask Record Length
         */
        public int bmrlnth() { return bmrlnth; }

        /**
         * Pad Pixel Mask Record Length
         */
        public int tmrlnth() { return tmrlnth; }

        /**
         * Pad Output Pixel Code Length
         */
        public int tpxcdlnth() { return tpxcdlnth; }

        /**
         * Pad Output Pixel Code
         */
        public byte[] tpxcd() { return tpxcd; }

        /**
         * Block n, Band m Offset
         */
        public List<Long> bmrbnd() { return bmrbnd; }

        /**
         * Pad Pixel n, Band m
         */
        public List<Long> tmrbnd() { return tmrbnd; }
        public Nitf _root() { return _root; }
        public Nitf.ImageSegment _parent() { return _parent; }
    }
    public static class ImageSegment extends KaitaiStruct {

        public ImageSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public ImageSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public ImageSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            this.imageSubHeader = new ImageSubHeader(this._io, this, _root);
            if (hasMask()) {
                this.imageDataMask = new ImageDataMask(this._io, this, _root);
            }
            if (hasMask()) {
                this.imageDataField = this._io.readBytes(Long.parseLong(_parent().header().linfo().get(((Number) (idx())).intValue()).lengthImageSegment(), 10) - imageDataMask().totalSize());
            }
        }

        public void _fetchInstances() {
            this.imageSubHeader._fetchInstances();
            if (hasMask()) {
                this.imageDataMask._fetchInstances();
            }
            if (hasMask()) {
            }
        }
        private Boolean hasMask;
        public Boolean hasMask() {
            if (this.hasMask != null)
                return this.hasMask;
            this.hasMask = imageSubHeader().imgCompression().substring(0, 2).equals("MM");
            return this.hasMask;
        }
        private ImageSubHeader imageSubHeader;
        private ImageDataMask imageDataMask;
        private byte[] imageDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public ImageSubHeader imageSubHeader() { return imageSubHeader; }
        public ImageDataMask imageDataMask() { return imageDataMask; }
        public byte[] imageDataField() { return imageDataField; }
        public int idx() { return idx; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class ImageSubHeader extends KaitaiStruct {
        public static ImageSubHeader fromFile(String fileName) throws IOException {
            return new ImageSubHeader(new ByteBufferKaitaiStream(fileName));
        }

        public ImageSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ImageSubHeader(KaitaiStream _io, Nitf.ImageSegment _parent) {
            this(_io, _parent, null);
        }

        public ImageSubHeader(KaitaiStream _io, Nitf.ImageSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.filePartType = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartType, new byte[] { 73, 77 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 73, 77 }, this.filePartType, this._io, "/types/image_sub_header/seq/0");
            }
            this.imageId1 = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.imageDateTime = new DateTime(this._io, this, _root);
            this.targetId = new String(this._io.readBytes(17), StandardCharsets.UTF_8);
            this.imageId2 = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.imageSecurityClassification = new Clasnfo(this._io, this, _root);
            this.encryption = new Encrypt(this._io, this, _root);
            this.imageSource = new String(this._io.readBytes(42), StandardCharsets.UTF_8);
            this.numSigRows = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.numSigCols = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.pixelValueType = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.imageRepresentation = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.imageCategory = new String(this._io.readBytes(8), StandardCharsets.UTF_8);
            this.actualBitsPerPixelPerBand = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.pixelJustification = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imageCoordinateRep = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imageGeoLoc = new String(this._io.readBytes(60), StandardCharsets.UTF_8);
            this.numImgComments = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imgComments = new ArrayList<ImageComment>();
            for (int i = 0; i < Long.parseLong(numImgComments(), 10); i++) {
                this.imgComments.add(new ImageComment(this._io, this, _root));
            }
            this.imgCompression = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.compressionRateCode = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numBands = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            if (Long.parseLong(numBands(), 10) == 0) {
                this.numMultispectralBands = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            }
            this.bands = new ArrayList<BandInfo>();
            for (int i = 0; i < (Long.parseLong(numBands(), 10) != 0 ? Long.parseLong(numBands(), 10) : Long.parseLong(numMultispectralBands(), 10)); i++) {
                this.bands.add(new BandInfo(this._io, this, _root));
            }
            this.imgSyncCode = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.imgMode = new String(this._io.readBytes(1), StandardCharsets.UTF_8);
            this.numBlocksPerRow = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numBlocksPerCol = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBlockHorz = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBlockVert = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.numPixelsPerBand = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.imgDisplayLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.attachmentLevel = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.imgLocation = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
            this.imgMagnification = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.userDefImgDataLen = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
                this.userDefOverflow = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                this.userDefImgData = new ArrayList<Integer>();
                for (int i = 0; i < Long.parseLong(userDefImgDataLen(), 10) - 3; i++) {
                    this.userDefImgData.add(this._io.readU1());
                }
            }
            this.imageExtendedSubHeader = new TreHeader(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.imageDateTime._fetchInstances();
            this.imageSecurityClassification._fetchInstances();
            this.encryption._fetchInstances();
            for (int i = 0; i < this.imgComments.size(); i++) {
                this.imgComments.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (Long.parseLong(numBands(), 10) == 0) {
            }
            for (int i = 0; i < this.bands.size(); i++) {
                this.bands.get(((Number) (i)).intValue())._fetchInstances();
            }
            if (Long.parseLong(userDefImgDataLen(), 10) != 0) {
            }
            if (Long.parseLong(userDefImgDataLen(), 10) > 2) {
                for (int i = 0; i < this.userDefImgData.size(); i++) {
                }
            }
            this.imageExtendedSubHeader._fetchInstances();
        }
        private byte[] filePartType;
        private String imageId1;
        private DateTime imageDateTime;
        private String targetId;
        private String imageId2;
        private Clasnfo imageSecurityClassification;
        private Encrypt encryption;
        private String imageSource;
        private String numSigRows;
        private String numSigCols;
        private String pixelValueType;
        private String imageRepresentation;
        private String imageCategory;
        private String actualBitsPerPixelPerBand;
        private String pixelJustification;
        private String imageCoordinateRep;
        private String imageGeoLoc;
        private String numImgComments;
        private List<ImageComment> imgComments;
        private String imgCompression;
        private String compressionRateCode;
        private String numBands;
        private String numMultispectralBands;
        private List<BandInfo> bands;
        private String imgSyncCode;
        private String imgMode;
        private String numBlocksPerRow;
        private String numBlocksPerCol;
        private String numPixelsPerBlockHorz;
        private String numPixelsPerBlockVert;
        private String numPixelsPerBand;
        private String imgDisplayLevel;
        private String attachmentLevel;
        private String imgLocation;
        private String imgMagnification;
        private String userDefImgDataLen;
        private String userDefOverflow;
        private List<Integer> userDefImgData;
        private TreHeader imageExtendedSubHeader;
        private Nitf _root;
        private Nitf.ImageSegment _parent;
        public byte[] filePartType() { return filePartType; }
        public String imageId1() { return imageId1; }
        public DateTime imageDateTime() { return imageDateTime; }
        public String targetId() { return targetId; }
        public String imageId2() { return imageId2; }
        public Clasnfo imageSecurityClassification() { return imageSecurityClassification; }
        public Encrypt encryption() { return encryption; }
        public String imageSource() { return imageSource; }

        /**
         * Total number of rows of significant pixels in the image; only rows indexed 0 to (NROWS - 1) of the image contain significant data.
         */
        public String numSigRows() { return numSigRows; }
        public String numSigCols() { return numSigCols; }
        public String pixelValueType() { return pixelValueType; }

        /**
         * MONO, RGB, RGB/LUT, MULTI, NODISPLY, NVECTOR, POLAR, VPH, YCbCr601
         */
        public String imageRepresentation() { return imageRepresentation; }

        /**
         * VIS, SL, TI, FL, RD, EO, OP, HR, HS,CP, BP, SAR, SARIQ, IR, MAP, MS, FP, MRI, XRAY, CAT, VD, PAT, LEG, DTEM, MATR, LOCG, BARO, CURRENT, DEPTH, WIND
         */
        public String imageCategory() { return imageCategory; }
        public String actualBitsPerPixelPerBand() { return actualBitsPerPixelPerBand; }
        public String pixelJustification() { return pixelJustification; }
        public String imageCoordinateRep() { return imageCoordinateRep; }
        public String imageGeoLoc() { return imageGeoLoc; }
        public String numImgComments() { return numImgComments; }
        public List<ImageComment> imgComments() { return imgComments; }
        public String imgCompression() { return imgCompression; }
        public String compressionRateCode() { return compressionRateCode; }
        public String numBands() { return numBands; }
        public String numMultispectralBands() { return numMultispectralBands; }
        public List<BandInfo> bands() { return bands; }

        /**
         * Reserved for future use.
         */
        public String imgSyncCode() { return imgSyncCode; }

        /**
         * B = Band Interleaved by Block, P = Band Interleaved by Pixel, R = Band Interleaved by Row, S = Band Sequential
         */
        public String imgMode() { return imgMode; }
        public String numBlocksPerRow() { return numBlocksPerRow; }
        public String numBlocksPerCol() { return numBlocksPerCol; }
        public String numPixelsPerBlockHorz() { return numPixelsPerBlockHorz; }
        public String numPixelsPerBlockVert() { return numPixelsPerBlockVert; }
        public String numPixelsPerBand() { return numPixelsPerBand; }
        public String imgDisplayLevel() { return imgDisplayLevel; }
        public String attachmentLevel() { return attachmentLevel; }
        public String imgLocation() { return imgLocation; }
        public String imgMagnification() { return imgMagnification; }
        public String userDefImgDataLen() { return userDefImgDataLen; }
        public String userDefOverflow() { return userDefOverflow; }
        public List<Integer> userDefImgData() { return userDefImgData; }
        public TreHeader imageExtendedSubHeader() { return imageExtendedSubHeader; }
        public Nitf _root() { return _root; }
        public Nitf.ImageSegment _parent() { return _parent; }
    }
    public static class LengthDataInfo extends KaitaiStruct {
        public static LengthDataInfo fromFile(String fileName) throws IOException {
            return new LengthDataInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LengthDataInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthDataInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthDataInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lengthDataExtensionSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthDataExtensionSegment = new String(this._io.readBytes(9), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String lengthDataExtensionSubheader;
        private String lengthDataExtensionSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthDataExtensionSubheader() { return lengthDataExtensionSubheader; }
        public String lengthDataExtensionSegment() { return lengthDataExtensionSegment; }
        public Nitf _root() { return _root; }
        public Nitf.Header _parent() { return _parent; }
    }
    public static class LengthGraphicInfo extends KaitaiStruct {
        public static LengthGraphicInfo fromFile(String fileName) throws IOException {
            return new LengthGraphicInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LengthGraphicInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthGraphicInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthGraphicInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lengthGraphicSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthGraphicSegment = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String lengthGraphicSubheader;
        private String lengthGraphicSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthGraphicSubheader() { return lengthGraphicSubheader; }
        public String lengthGraphicSegment() { return lengthGraphicSegment; }
        public Nitf _root() { return _root; }
        public Nitf.Header _parent() { return _parent; }
    }
    public static class LengthImageInfo extends KaitaiStruct {
        public static LengthImageInfo fromFile(String fileName) throws IOException {
            return new LengthImageInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LengthImageInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthImageInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthImageInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lengthImageSubheader = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.lengthImageSegment = new String(this._io.readBytes(10), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String lengthImageSubheader;
        private String lengthImageSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthImageSubheader() { return lengthImageSubheader; }
        public String lengthImageSegment() { return lengthImageSegment; }
        public Nitf _root() { return _root; }
        public Nitf.Header _parent() { return _parent; }
    }
    public static class LengthReservedInfo extends KaitaiStruct {
        public static LengthReservedInfo fromFile(String fileName) throws IOException {
            return new LengthReservedInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LengthReservedInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthReservedInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthReservedInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lengthReservedExtensionSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthReservedExtensionSegment = new String(this._io.readBytes(7), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String lengthReservedExtensionSubheader;
        private String lengthReservedExtensionSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthReservedExtensionSubheader() { return lengthReservedExtensionSubheader; }
        public String lengthReservedExtensionSegment() { return lengthReservedExtensionSegment; }
        public Nitf _root() { return _root; }
        public Nitf.Header _parent() { return _parent; }
    }
    public static class LengthTextInfo extends KaitaiStruct {
        public static LengthTextInfo fromFile(String fileName) throws IOException {
            return new LengthTextInfo(new ByteBufferKaitaiStream(fileName));
        }

        public LengthTextInfo(KaitaiStream _io) {
            this(_io, null, null);
        }

        public LengthTextInfo(KaitaiStream _io, Nitf.Header _parent) {
            this(_io, _parent, null);
        }

        public LengthTextInfo(KaitaiStream _io, Nitf.Header _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.lengthTextSubheader = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.lengthTextSegment = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String lengthTextSubheader;
        private String lengthTextSegment;
        private Nitf _root;
        private Nitf.Header _parent;
        public String lengthTextSubheader() { return lengthTextSubheader; }
        public String lengthTextSegment() { return lengthTextSegment; }
        public Nitf _root() { return _root; }
        public Nitf.Header _parent() { return _parent; }
    }
    public static class ReservedExtensionSegment extends KaitaiStruct {

        public ReservedExtensionSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public ReservedExtensionSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public ReservedExtensionSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            KaitaiStream _io_reservedSubHeader = this._io.substream(Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSubheader(), 10));
            this.reservedSubHeader = new ReservedSubHeader(_io_reservedSubHeader, this, _root);
            this.reservedDataField = this._io.readBytes(Long.parseLong(_parent().header().lrnfo().get(((Number) (idx())).intValue()).lengthReservedExtensionSegment(), 10));
        }

        public void _fetchInstances() {
            this.reservedSubHeader._fetchInstances();
        }
        private ReservedSubHeader reservedSubHeader;
        private byte[] reservedDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public ReservedSubHeader reservedSubHeader() { return reservedSubHeader; }
        public byte[] reservedDataField() { return reservedDataField; }
        public int idx() { return idx; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class ReservedSubHeader extends KaitaiStruct {
        public static ReservedSubHeader fromFile(String fileName) throws IOException {
            return new ReservedSubHeader(new ByteBufferKaitaiStream(fileName));
        }

        public ReservedSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public ReservedSubHeader(KaitaiStream _io, Nitf.ReservedExtensionSegment _parent) {
            this(_io, _parent, null);
        }

        public ReservedSubHeader(KaitaiStream _io, Nitf.ReservedExtensionSegment _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.filePartTypeRe = this._io.readBytes(2);
            if (!(Arrays.equals(this.filePartTypeRe, new byte[] { 82, 69 }))) {
                throw new KaitaiStream.ValidationNotEqualError(new byte[] { 82, 69 }, this.filePartTypeRe, this._io, "/types/reserved_sub_header/seq/0");
            }
            this.resTypeId = new String(this._io.readBytes(25), StandardCharsets.UTF_8);
            this.resVersion = new String(this._io.readBytes(2), StandardCharsets.UTF_8);
            this.reclasnfo = new Clasnfo(this._io, this, _root);
            this.resUserDefinedSubheaderLength = new String(this._io.readBytes(4), StandardCharsets.UTF_8);
            this.resUserDefinedSubheaderFields = new String(this._io.readBytes(Long.parseLong(resUserDefinedSubheaderLength(), 10)), StandardCharsets.UTF_8);
            this.resUserDefinedData = new String(this._io.readBytesFull(), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
            this.reclasnfo._fetchInstances();
        }
        private byte[] filePartTypeRe;
        private String resTypeId;
        private String resVersion;
        private Clasnfo reclasnfo;
        private String resUserDefinedSubheaderLength;
        private String resUserDefinedSubheaderFields;
        private String resUserDefinedData;
        private Nitf _root;
        private Nitf.ReservedExtensionSegment _parent;
        public byte[] filePartTypeRe() { return filePartTypeRe; }
        public String resTypeId() { return resTypeId; }
        public String resVersion() { return resVersion; }
        public Clasnfo reclasnfo() { return reclasnfo; }
        public String resUserDefinedSubheaderLength() { return resUserDefinedSubheaderLength; }
        public String resUserDefinedSubheaderFields() { return resUserDefinedSubheaderFields; }
        public String resUserDefinedData() { return resUserDefinedData; }
        public Nitf _root() { return _root; }
        public Nitf.ReservedExtensionSegment _parent() { return _parent; }
    }
    public static class TextSegment extends KaitaiStruct {

        public TextSegment(KaitaiStream _io, int idx) {
            this(_io, null, null, idx);
        }

        public TextSegment(KaitaiStream _io, Nitf _parent, int idx) {
            this(_io, _parent, null, idx);
        }

        public TextSegment(KaitaiStream _io, Nitf _parent, Nitf _root, int idx) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            this.idx = idx;
            _read();
        }
        private void _read() {
            this.textSubHeader = this._io.readBytes(1);
            this.textDataField = this._io.readBytes(Long.parseLong(_parent().header().ltnfo().get(((Number) (idx())).intValue()).lengthTextSegment(), 10));
        }

        public void _fetchInstances() {
        }
        private byte[] textSubHeader;
        private byte[] textDataField;
        private int idx;
        private Nitf _root;
        private Nitf _parent;
        public byte[] textSubHeader() { return textSubHeader; }
        public byte[] textDataField() { return textDataField; }
        public int idx() { return idx; }
        public Nitf _root() { return _root; }
        public Nitf _parent() { return _parent; }
    }
    public static class TextSubHeader extends KaitaiStruct {
        public static TextSubHeader fromFile(String fileName) throws IOException {
            return new TextSubHeader(new ByteBufferKaitaiStream(fileName));
        }

        public TextSubHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TextSubHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public TextSubHeader(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.textDateTime = new String(this._io.readBytes(14), StandardCharsets.UTF_8);
            this.textTitle = new String(this._io.readBytes(80), StandardCharsets.UTF_8);
            this.textSecurityClass = new Clasnfo(this._io, this, _root);
            this.encryp = new Encrypt(this._io, this, _root);
            this.textFormat = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            this.textExtendedSubHeader = new TreHeader(this._io, this, _root);
        }

        public void _fetchInstances() {
            this.textSecurityClass._fetchInstances();
            this.encryp._fetchInstances();
            this.textExtendedSubHeader._fetchInstances();
        }
        private String textDateTime;
        private String textTitle;
        private Clasnfo textSecurityClass;
        private Encrypt encryp;
        private String textFormat;
        private TreHeader textExtendedSubHeader;
        private Nitf _root;
        private KaitaiStruct _parent;
        public String textDateTime() { return textDateTime; }
        public String textTitle() { return textTitle; }
        public Clasnfo textSecurityClass() { return textSecurityClass; }
        public Encrypt encryp() { return encryp; }

        /**
         * MTF (USMTF see MIL-STD-6040), STA (indicates BCS), UT1 (indicates ECS), U8S
         */
        public String textFormat() { return textFormat; }
        public TreHeader textExtendedSubHeader() { return textExtendedSubHeader; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class Tre extends KaitaiStruct {
        public static Tre fromFile(String fileName) throws IOException {
            return new Tre(new ByteBufferKaitaiStream(fileName));
        }

        public Tre(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Tre(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public Tre(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.extensionTypeId = new String(this._io.readBytes(6), StandardCharsets.UTF_8);
            this.edataLength = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            this.edata = new String(this._io.readBytes(Long.parseLong(edataLength(), 10)), StandardCharsets.UTF_8);
        }

        public void _fetchInstances() {
        }
        private String extensionTypeId;
        private String edataLength;
        private String edata;
        private Nitf _root;
        private KaitaiStruct _parent;

        /**
         * RETAG or CETAG
         */
        public String extensionTypeId() { return extensionTypeId; }

        /**
         * REL or CEL
         */
        public String edataLength() { return edataLength; }

        /**
         * REDATA or CEDATA
         */
        public String edata() { return edata; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class TreHeader extends KaitaiStruct {
        public static TreHeader fromFile(String fileName) throws IOException {
            return new TreHeader(new ByteBufferKaitaiStream(fileName));
        }

        public TreHeader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public TreHeader(KaitaiStream _io, KaitaiStruct _parent) {
            this(_io, _parent, null);
        }

        public TreHeader(KaitaiStream _io, KaitaiStruct _parent, Nitf _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.headerDataLength = new String(this._io.readBytes(5), StandardCharsets.UTF_8);
            if (Long.parseLong(headerDataLength(), 10) != 0) {
                this.headerOverflow = new String(this._io.readBytes(3), StandardCharsets.UTF_8);
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                this.headerData = new ArrayList<Integer>();
                for (int i = 0; i < Long.parseLong(headerDataLength(), 10) - 3; i++) {
                    this.headerData.add(this._io.readU1());
                }
            }
        }

        public void _fetchInstances() {
            if (Long.parseLong(headerDataLength(), 10) != 0) {
            }
            if (Long.parseLong(headerDataLength(), 10) > 2) {
                for (int i = 0; i < this.headerData.size(); i++) {
                }
            }
        }
        private String headerDataLength;
        private String headerOverflow;
        private List<Integer> headerData;
        private Nitf _root;
        private KaitaiStruct _parent;
        public String headerDataLength() { return headerDataLength; }
        public String headerOverflow() { return headerOverflow; }
        public List<Integer> headerData() { return headerData; }
        public Nitf _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    private Header header;
    private List<ImageSegment> imageSegments;
    private List<GraphicsSegment> graphicsSegments;
    private List<TextSegment> textSegments;
    private List<DataExtensionSegment> dataExtensionSegments;
    private List<ReservedExtensionSegment> reservedExtensionSegments;
    private Nitf _root;
    private KaitaiStruct _parent;
    public Header header() { return header; }
    public List<ImageSegment> imageSegments() { return imageSegments; }
    public List<GraphicsSegment> graphicsSegments() { return graphicsSegments; }
    public List<TextSegment> textSegments() { return textSegments; }
    public List<DataExtensionSegment> dataExtensionSegments() { return dataExtensionSegments; }
    public List<ReservedExtensionSegment> reservedExtensionSegments() { return reservedExtensionSegments; }
    public Nitf _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
