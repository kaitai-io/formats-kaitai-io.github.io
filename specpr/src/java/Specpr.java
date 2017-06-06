// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.Map;
import java.util.HashMap;
import java.util.ArrayList;
import java.nio.charset.Charset;


/**
 * Specpr records are fixed format, 1536 bytes/record. Record number
 * counting starts at 0. Binary data are in IEEE format real numbers
 * and non-byte swapped integers (compatiible with all Sun
 * Microsystems, and Hewlett Packard workstations (Intel and some DEC
 * machines are byte swapped relative to Suns and HPs). Each record may
 * contain different information according to the following scheme.
 * 
 * You can get some library of spectra from
 * ftp://ftpext.cr.usgs.gov/pub/cr/co/denver/speclab/pub/spectral.library/splib06.library/
 */
public class Specpr extends KaitaiStruct {
    public static Specpr fromFile(String fileName) throws IOException {
        return new Specpr(new KaitaiStream(fileName));
    }

    public enum RecordType {
        DATA_INITIAL(0),
        TEXT_INITIAL(1),
        DATA_CONTINUATION(2),
        TEXT_CONTINUATION(3);

        private final long id;
        RecordType(long id) { this.id = id; }
        public long id() { return id; }
        private static final Map<Long, RecordType> byId = new HashMap<Long, RecordType>(4);
        static {
            for (RecordType e : RecordType.values())
                byId.put(e.id(), e);
        }
        public static RecordType byId(long id) { return byId.get(id); }
    }

    public Specpr(KaitaiStream _io) {
        super(_io);
        this._root = this;
        _init();
    }

    public Specpr(KaitaiStream _io, KaitaiStruct _parent) {
        super(_io);
        this._parent = _parent;
        this._root = this;
        _init();
    }

    public Specpr(KaitaiStream _io, KaitaiStruct _parent, Specpr _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root;
        _init();
    }

    private void _init() {
        _read();
    }
    private void _read() {
        this.records = new ArrayList<Record>();
        while (!this._io.isEof()) {
            this.records.add(new Record(this._io, this, _root));
        }
    }
    public static class DataInitial extends KaitaiStruct {
        public static DataInitial fromFile(String fileName) throws IOException {
            return new DataInitial(new KaitaiStream(fileName));
        }

        public DataInitial(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public DataInitial(KaitaiStream _io, Specpr.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public DataInitial(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.ids = new Identifiers(this._io, this, _root);
            this.iscta = new CoarseTimestamp(this._io, this, _root);
            this.isctb = new CoarseTimestamp(this._io, this, _root);
            this.jdatea = this._io.readS4be();
            this.jdateb = this._io.readS4be();
            this.istb = new CoarseTimestamp(this._io, this, _root);
            this.isra = this._io.readS4be();
            this.isdec = this._io.readS4be();
            this.itchan = this._io.readS4be();
            this.irmas = this._io.readS4be();
            this.revs = this._io.readS4be();
            iband = new ArrayList<Integer>((int) (2));
            for (int i = 0; i < 2; i++) {
                this.iband.add(this._io.readS4be());
            }
            this.irwav = this._io.readS4be();
            this.irespt = this._io.readS4be();
            this.irecno = this._io.readS4be();
            this.itpntr = this._io.readS4be();
            this.ihist = new String(KaitaiStream.bytesStripRight(this._io.readBytes(60), (byte) 32), Charset.forName("ascii"));
            mhist = new ArrayList<String>((int) (4));
            for (int i = 0; i < 4; i++) {
                this.mhist.add(new String(this._io.readBytes(74), Charset.forName("ascii")));
            }
            this.nruns = this._io.readS4be();
            this.siangl = new IllumAngle(this._io, this, _root);
            this.seangl = new IllumAngle(this._io, this, _root);
            this.sphase = this._io.readS4be();
            this.iwtrns = this._io.readS4be();
            this.itimch = this._io.readS4be();
            this.xnrm = this._io.readF4be();
            this.scatim = this._io.readF4be();
            this.timint = this._io.readF4be();
            this.tempd = this._io.readF4be();
            data = new ArrayList<Float>((int) (256));
            for (int i = 0; i < 256; i++) {
                this.data.add(this._io.readF4be());
            }
        }
        private Double phaseAngleArcsec;

        /**
         * The phase angle between iangl and eangl in seconds
         */
        public Double phaseAngleArcsec() {
            if (this.phaseAngleArcsec != null)
                return this.phaseAngleArcsec;
            double _tmp = (double) ((sphase() / 1500));
            this.phaseAngleArcsec = _tmp;
            return this.phaseAngleArcsec;
        }
        private Identifiers ids;
        private CoarseTimestamp iscta;
        private CoarseTimestamp isctb;
        private int jdatea;
        private int jdateb;
        private CoarseTimestamp istb;
        private int isra;
        private int isdec;
        private int itchan;
        private int irmas;
        private int revs;
        private ArrayList<Integer> iband;
        private int irwav;
        private int irespt;
        private int irecno;
        private int itpntr;
        private String ihist;
        private ArrayList<String> mhist;
        private int nruns;
        private IllumAngle siangl;
        private IllumAngle seangl;
        private int sphase;
        private int iwtrns;
        private int itimch;
        private float xnrm;
        private float scatim;
        private float timint;
        private float tempd;
        private ArrayList<Float> data;
        private Specpr _root;
        private Specpr.Record _parent;
        public Identifiers ids() { return ids; }

        /**
         * Civil or Universal time when data was last processed
         */
        public CoarseTimestamp iscta() { return iscta; }

        /**
         * Civil or Universal time at the start of the spectral run
         */
        public CoarseTimestamp isctb() { return isctb; }

        /**
         * Date when data was last processed. Stored as integer*4 Julian Day number *10
         */
        public int jdatea() { return jdatea; }

        /**
         * Date when the spectral run began. Stored as integer*4 Julian Day number *10
         */
        public int jdateb() { return jdateb; }

        /**
         * Siderial time when the spectral run started. See flag #05.
         */
        public CoarseTimestamp istb() { return istb; }

        /**
         * Right ascension coordinates of an astronomical  object, or longitude on a planetary surface (integer*4 numbers in seconds *1000) (RA in RA seconds, Longitude in arc-seconds) See flag #06.
         */
        public int isra() { return isra; }

        /**
         * Declination coordinates of an astronomical object, or latitude on a planetary surface (integer*4 number in arc-seconds *1000). See flag #06.
         */
        public int isdec() { return isdec; }

        /**
         * Total number of channels in the spectrum (integer*4 value from 1 to 4852)
         */
        public int itchan() { return itchan; }

        /**
         * The equivalent atmospheric thickness through which the observation was obtained (=1.0 overhead scaled: airmass*1000; integer*4).
         */
        public int irmas() { return irmas; }

        /**
         * The number of independent spectral scans which were added to make the spectrum (integer*4 number).
         */
        public int revs() { return revs; }

        /**
         * The channel numbers which define the band normalization (scaling to unity). (integers*4).
         */
        public ArrayList<Integer> iband() { return iband; }

        /**
         * The record number within the file where the wavelengths are found (integer*4).
         */
        public int irwav() { return irwav; }

        /**
         * The record pointer to where the resolution can be found (or horizontal error bar) (integer*4).
         */
        public int irespt() { return irespt; }

        /**
         * The record number within the file where the data is located (integer*4 number).
         */
        public int irecno() { return irecno; }

        /**
         * Text data record pointer. This pointer points to a data record where additional text describing the data may be found.  (32 bit integer)
         */
        public int itpntr() { return itpntr; }

        /**
         * The program automatic 60 character history.
         */
        public String ihist() { return ihist; }

        /**
         * Manual history. Program automatic for large history requirements.
         */
        public ArrayList<String> mhist() { return mhist; }

        /**
         * The number of independent spectral runs which were summed or averaged to make this spectrum (integer*4).
         */
        public int nruns() { return nruns; }

        /**
         * The angle of incidence of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public IllumAngle siangl() { return siangl; }

        /**
         * The angle of emission of illuminating radiation
         *       integrating sphere = 2000000000
         *       Geometric albedo   = 2000000001
         */
        public IllumAngle seangl() { return seangl; }

        /**
         * The phase angle between iangl and eangl (Integer*4 number, in arc-seconds*1500). (180 degrees=972000000; -180 deg <= phase <= 180 deg)
         *       integrating sphere = 2000000000
         */
        public int sphase() { return sphase; }

        /**
         * Weighted number of runs (the number of runs of the spectrum with the minimum runs which was used in processing this spectrum, integer*4).
         */
        public int iwtrns() { return iwtrns; }

        /**
         * The time observed in the sample beam for each half chop in milliseconds (for chopping spectrometers only). (integer*4)
         */
        public int itimch() { return itimch; }

        /**
         * The band normalization factor. For data scaled to 1.0, multiply by this number to recover photometric level (32 bit real number).
         */
        public float xnrm() { return xnrm; }

        /**
         * The time it takes to make one scan of the entire spectrum in seconds (32 bit real number).
         */
        public float scatim() { return scatim; }

        /**
         * Total integration time (usually=scatime * nruns) (32 bit real number).
         */
        public float timint() { return timint; }

        /**
         * Temperature in degrees Kelvin (32 bit real number).
         */
        public float tempd() { return tempd; }

        /**
         * The spectral data (256 channels of 32 bit real data numbers).
         */
        public ArrayList<Float> data() { return data; }
        public Specpr _root() { return _root; }
        public Specpr.Record _parent() { return _parent; }
    }
    public static class CoarseTimestamp extends KaitaiStruct {
        public static CoarseTimestamp fromFile(String fileName) throws IOException {
            return new CoarseTimestamp(new KaitaiStream(fileName));
        }

        public CoarseTimestamp(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public CoarseTimestamp(KaitaiStream _io, Specpr.DataInitial _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public CoarseTimestamp(KaitaiStream _io, Specpr.DataInitial _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.scaledSeconds = this._io.readS4be();
        }
        private Double seconds;
        public Double seconds() {
            if (this.seconds != null)
                return this.seconds;
            double _tmp = (double) ((scaledSeconds() * 24000));
            this.seconds = _tmp;
            return this.seconds;
        }
        private int scaledSeconds;
        private Specpr _root;
        private Specpr.DataInitial _parent;
        public int scaledSeconds() { return scaledSeconds; }
        public Specpr _root() { return _root; }
        public Specpr.DataInitial _parent() { return _parent; }
    }

    /**
     * it is big endian
     */
    public static class Icflag extends KaitaiStruct {
        public static Icflag fromFile(String fileName) throws IOException {
            return new Icflag(new KaitaiStream(fileName));
        }

        public Icflag(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Icflag(KaitaiStream _io, Specpr.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Icflag(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.reserved = this._io.readBitsInt(26);
            this.isctbType = this._io.readBitsInt(1) != 0;
            this.isctaType = this._io.readBitsInt(1) != 0;
            this.coordinateMode = this._io.readBitsInt(1) != 0;
            this.errors = this._io.readBitsInt(1) != 0;
            this.text = this._io.readBitsInt(1) != 0;
            this.continuation = this._io.readBitsInt(1) != 0;
        }
        private RecordType type;
        public RecordType type() {
            if (this.type != null)
                return this.type;
            this.type = Specpr.RecordType.byId((((text() ? 1 : 0) * 1) + ((continuation() ? 1 : 0) * 2)));
            return this.type;
        }
        private long reserved;
        private boolean isctbType;
        private boolean isctaType;
        private boolean coordinateMode;
        private boolean errors;
        private boolean text;
        private boolean continuation;
        private Specpr _root;
        private Specpr.Record _parent;
        public long reserved() { return reserved; }

        /**
         * =0 ctb is civil time
         * =1 ctb is universal time
         */
        public boolean isctbType() { return isctbType; }

        /**
         * =0 cta is civil time
         * =1 cta is universal time
         */
        public boolean isctaType() { return isctaType; }

        /**
         * RA, Dec / Long., Lat flag
         * =0 the array "ira" and "idec" corresponds to the right ascension and declination of an astronomical object.
         * =1 the array "ira" and "idec" correspond to the longitude and latitude of a spot on a planetary surface.
         */
        public boolean coordinateMode() { return coordinateMode; }

        /**
         * flag to indicate whether or not the data for the error bar (1 sigma standard deviation of the mean) is in the next record set. =0: no errors, =1: errors in next record set.
         */
        public boolean errors() { return errors; }

        /**
         * =0 the data in the array "data" is data
         * =1 the data in the array "data" is ascii text as is most of the header info.
         */
        public boolean text() { return text; }

        /**
         * =0 first record of a spectrum consists of: header then 256 data channels
         * =1 continuation data record consisting of:
         *   # bit flags followed by 1532 bytes of
         *   # real data (bit 1=0) (383 channels)
         *   # or 1532 bytes of text (bit 1=1).
         *   # A maximum of 12 continuation records
         *   # are allowed for a total of 4852
         *   # channels (limited by arrays of 4864)
         *   # or 19860 characters of text (bit 1=1).
         */
        public boolean continuation() { return continuation; }
        public Specpr _root() { return _root; }
        public Specpr.Record _parent() { return _parent; }
    }
    public static class DataContinuation extends KaitaiStruct {
        public static DataContinuation fromFile(String fileName) throws IOException {
            return new DataContinuation(new KaitaiStream(fileName));
        }

        public DataContinuation(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public DataContinuation(KaitaiStream _io, Specpr.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public DataContinuation(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            cdata = new ArrayList<Float>((int) (383));
            for (int i = 0; i < 383; i++) {
                this.cdata.add(this._io.readF4be());
            }
        }
        private ArrayList<Float> cdata;
        private Specpr _root;
        private Specpr.Record _parent;

        /**
         * The continuation of the data values (383 channels of 32 bit real numbers).
         */
        public ArrayList<Float> cdata() { return cdata; }
        public Specpr _root() { return _root; }
        public Specpr.Record _parent() { return _parent; }
    }
    public static class Identifiers extends KaitaiStruct {
        public static Identifiers fromFile(String fileName) throws IOException {
            return new Identifiers(new KaitaiStream(fileName));
        }

        public Identifiers(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Identifiers(KaitaiStream _io, KaitaiStruct _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Identifiers(KaitaiStream _io, KaitaiStruct _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.ititle = new String(KaitaiStream.bytesStripRight(this._io.readBytes(40), (byte) 32), Charset.forName("ascii"));
            this.usernm = new String(this._io.readBytes(8), Charset.forName("ascii"));
        }
        private String ititle;
        private String usernm;
        private Specpr _root;
        private KaitaiStruct _parent;

        /**
         * Title which describes the data
         */
        public String ititle() { return ititle; }

        /**
         * The name of the user who created the data record
         */
        public String usernm() { return usernm; }
        public Specpr _root() { return _root; }
        public KaitaiStruct _parent() { return _parent; }
    }
    public static class IllumAngle extends KaitaiStruct {
        public static IllumAngle fromFile(String fileName) throws IOException {
            return new IllumAngle(new KaitaiStream(fileName));
        }

        public IllumAngle(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public IllumAngle(KaitaiStream _io, Specpr.DataInitial _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public IllumAngle(KaitaiStream _io, Specpr.DataInitial _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.angl = this._io.readS4be();
        }
        private Integer secondsTotal;
        public Integer secondsTotal() {
            if (this.secondsTotal != null)
                return this.secondsTotal;
            int _tmp = (int) ((angl() / 6000));
            this.secondsTotal = _tmp;
            return this.secondsTotal;
        }
        private Integer minutesTotal;
        public Integer minutesTotal() {
            if (this.minutesTotal != null)
                return this.minutesTotal;
            int _tmp = (int) ((secondsTotal() / 60));
            this.minutesTotal = _tmp;
            return this.minutesTotal;
        }
        private Integer degreesTotal;
        public Integer degreesTotal() {
            if (this.degreesTotal != null)
                return this.degreesTotal;
            int _tmp = (int) ((minutesTotal() / 60));
            this.degreesTotal = _tmp;
            return this.degreesTotal;
        }
        private int angl;
        private Specpr _root;
        private Specpr.DataInitial _parent;

        /**
         * (Integer*4 number, in arc-seconds*6000). (90 degrees=1944000000; -90 deg <= angle <= 90 deg)
         */
        public int angl() { return angl; }
        public Specpr _root() { return _root; }
        public Specpr.DataInitial _parent() { return _parent; }
    }
    public static class TextInitial extends KaitaiStruct {
        public static TextInitial fromFile(String fileName) throws IOException {
            return new TextInitial(new KaitaiStream(fileName));
        }

        public TextInitial(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public TextInitial(KaitaiStream _io, Specpr.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public TextInitial(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.ids = new Identifiers(this._io, this, _root);
            this.itxtpt = this._io.readU4be();
            this.itxtch = this._io.readS4be();
            this.itext = new String(this._io.readBytes(1476), Charset.forName("ascii"));
        }
        private Identifiers ids;
        private long itxtpt;
        private int itxtch;
        private String itext;
        private Specpr _root;
        private Specpr.Record _parent;
        public Identifiers ids() { return ids; }

        /**
         * Text data record pointer. This pointer points  to a data record where additional text may be may be found.
         */
        public long itxtpt() { return itxtpt; }

        /**
         * The number of text characters (maximum= 19860).
         */
        public int itxtch() { return itxtch; }

        /**
         * 1476 characters of text.  Text has embedded newlines so the number of lines available is limited only by the number of characters available.
         */
        public String itext() { return itext; }
        public Specpr _root() { return _root; }
        public Specpr.Record _parent() { return _parent; }
    }
    public static class Record extends KaitaiStruct {
        public static Record fromFile(String fileName) throws IOException {
            return new Record(new KaitaiStream(fileName));
        }

        public Record(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public Record(KaitaiStream _io, Specpr _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public Record(KaitaiStream _io, Specpr _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.icflag = new Icflag(this._io, this, _root);
            switch (icflag().type()) {
            case DATA_INITIAL: {
                this._raw_content = this._io.readBytes((1536 - 4));
                KaitaiStream _io__raw_content = new KaitaiStream(_raw_content);
                this.content = new DataInitial(_io__raw_content, this, _root);
                break;
            }
            case DATA_CONTINUATION: {
                this._raw_content = this._io.readBytes((1536 - 4));
                KaitaiStream _io__raw_content = new KaitaiStream(_raw_content);
                this.content = new DataContinuation(_io__raw_content, this, _root);
                break;
            }
            case TEXT_CONTINUATION: {
                this._raw_content = this._io.readBytes((1536 - 4));
                KaitaiStream _io__raw_content = new KaitaiStream(_raw_content);
                this.content = new TextContinuation(_io__raw_content, this, _root);
                break;
            }
            case TEXT_INITIAL: {
                this._raw_content = this._io.readBytes((1536 - 4));
                KaitaiStream _io__raw_content = new KaitaiStream(_raw_content);
                this.content = new TextInitial(_io__raw_content, this, _root);
                break;
            }
            default: {
                this.content = this._io.readBytes((1536 - 4));
                break;
            }
            }
        }
        private Icflag icflag;
        private Object content;
        private Specpr _root;
        private Specpr _parent;
        private byte[] _raw_content;

        /**
         * Total number of bytes comprising the document.
         */
        public Icflag icflag() { return icflag; }
        public Object content() { return content; }
        public Specpr _root() { return _root; }
        public Specpr _parent() { return _parent; }
        public byte[] _raw_content() { return _raw_content; }
    }
    public static class TextContinuation extends KaitaiStruct {
        public static TextContinuation fromFile(String fileName) throws IOException {
            return new TextContinuation(new KaitaiStream(fileName));
        }

        public TextContinuation(KaitaiStream _io) {
            super(_io);
            _init();
        }

        public TextContinuation(KaitaiStream _io, Specpr.Record _parent) {
            super(_io);
            this._parent = _parent;
            _init();
        }

        public TextContinuation(KaitaiStream _io, Specpr.Record _parent, Specpr _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _init();
        }

        private void _init() {
            _read();
        }
        private void _read() {
            this.tdata = new String(this._io.readBytes(1532), Charset.forName("ascii"));
        }
        private String tdata;
        private Specpr _root;
        private Specpr.Record _parent;

        /**
         * 1532 characters of text.
         */
        public String tdata() { return tdata; }
        public Specpr _root() { return _root; }
        public Specpr.Record _parent() { return _parent; }
    }
    private ArrayList<Record> records;
    private Specpr _root;
    private KaitaiStruct _parent;
    public ArrayList<Record> records() { return records; }
    public Specpr _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
}
