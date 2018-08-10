// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

import io.kaitai.struct.ByteBufferKaitaiStream;
import io.kaitai.struct.KaitaiStruct;
import io.kaitai.struct.KaitaiStream;
import java.io.IOException;
import java.util.ArrayList;
import java.nio.charset.Charset;
import java.util.Map;
import java.util.HashMap;


/**
 * @see <a href="http://sid.ethz.ch/debian/milkytracker/milkytracker-0.90.85%2Bdfsg/resources/reference/xm-form.txt
 * ftp://ftp.modland.com/pub/documents/format_documentation/FastTracker%202%20v2.04%20(.xm).html
 * ">Source</a>
 */
public class Xm extends KaitaiStruct {
    public static Xm fromFile(String fileName) throws IOException {
        return new Xm(new ByteBufferKaitaiStream(fileName));
    }

    public Xm(KaitaiStream _io) {
        this(_io, null, null);
    }

    public Xm(KaitaiStream _io, KaitaiStruct _parent) {
        this(_io, _parent, null);
    }

    public Xm(KaitaiStream _io, KaitaiStruct _parent, Xm _root) {
        super(_io);
        this._parent = _parent;
        this._root = _root == null ? this : _root;
        _read();
    }
    private void _read() {
        this.preheader = new Preheader(this._io, this, _root);
        this._raw_header = this._io.readBytes((preheader().headerSize() - 4));
        KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
        this.header = new Header(_io__raw_header, this, _root);
        patterns = new ArrayList<Pattern>((int) (header().numberOfPatterns()));
        for (int i = 0; i < header().numberOfPatterns(); i++) {
            this.patterns.add(new Pattern(this._io, this, _root));
        }
        instruments = new ArrayList<Instrument>((int) (header().numberOfInstruments()));
        for (int i = 0; i < header().numberOfInstruments(); i++) {
            this.instruments.add(new Instrument(this._io, this, _root));
        }
    }
    public static class Preheader extends KaitaiStruct {
        public static Preheader fromFile(String fileName) throws IOException {
            return new Preheader(new ByteBufferKaitaiStream(fileName));
        }

        public Preheader(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Preheader(KaitaiStream _io, Xm _parent) {
            this(_io, _parent, null);
        }

        public Preheader(KaitaiStream _io, Xm _parent, Xm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.signature0 = this._io.ensureFixedContents(new byte[] { 69, 120, 116, 101, 110, 100, 101, 100, 32, 77, 111, 100, 117, 108, 101, 58, 32 });
            this.moduleName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(20), (byte) 0, false), Charset.forName("utf-8"));
            this.signature1 = this._io.ensureFixedContents(new byte[] { 26 });
            this.trackerName = new String(KaitaiStream.bytesTerminate(this._io.readBytes(20), (byte) 0, false), Charset.forName("utf-8"));
            this.versionNumber = new Version(this._io, this, _root);
            this.headerSize = this._io.readU4le();
        }
        public static class Version extends KaitaiStruct {
            public static Version fromFile(String fileName) throws IOException {
                return new Version(new ByteBufferKaitaiStream(fileName));
            }

            public Version(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Version(KaitaiStream _io, Xm.Preheader _parent) {
                this(_io, _parent, null);
            }

            public Version(KaitaiStream _io, Xm.Preheader _parent, Xm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.minor = this._io.readU1();
                this.major = this._io.readU1();
            }
            private Integer value;
            public Integer value() {
                if (this.value != null)
                    return this.value;
                int _tmp = (int) (((major() << 8) | minor()));
                this.value = _tmp;
                return this.value;
            }
            private int minor;
            private int major;
            private Xm _root;
            private Xm.Preheader _parent;

            /**
             * currently 0x04
             */
            public int minor() { return minor; }

            /**
             * currently 0x01
             */
            public int major() { return major; }
            public Xm _root() { return _root; }
            public Xm.Preheader _parent() { return _parent; }
        }
        private byte[] signature0;
        private String moduleName;
        private byte[] signature1;
        private String trackerName;
        private Version versionNumber;
        private long headerSize;
        private Xm _root;
        private Xm _parent;
        public byte[] signature0() { return signature0; }

        /**
         * Module name, padded with zeroes
         */
        public String moduleName() { return moduleName; }
        public byte[] signature1() { return signature1; }

        /**
         * Tracker name
         */
        public String trackerName() { return trackerName; }

        /**
         * Format versions below [0x01, 0x04] have a LOT of differences. Check this field!
         */
        public Version versionNumber() { return versionNumber; }

        /**
         * Header size << Calculated FROM THIS OFFSET, not from the beginning of the file! >>
         */
        public long headerSize() { return headerSize; }
        public Xm _root() { return _root; }
        public Xm _parent() { return _parent; }
    }
    public static class Pattern extends KaitaiStruct {
        public static Pattern fromFile(String fileName) throws IOException {
            return new Pattern(new ByteBufferKaitaiStream(fileName));
        }

        public Pattern(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Pattern(KaitaiStream _io, Xm _parent) {
            this(_io, _parent, null);
        }

        public Pattern(KaitaiStream _io, Xm _parent, Xm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.header = new Header(this._io, this, _root);
            this.packedData = this._io.readBytes(header().main().packedPatternDataSize());
        }
        public static class Header extends KaitaiStruct {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }

            public Header(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Header(KaitaiStream _io, Xm.Pattern _parent) {
                this(_io, _parent, null);
            }

            public Header(KaitaiStream _io, Xm.Pattern _parent, Xm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.headerLength = this._io.readU4le();
                this._raw_main = this._io.readBytes((headerLength() - 4));
                KaitaiStream _io__raw_main = new ByteBufferKaitaiStream(_raw_main);
                this.main = new HeaderMain(_io__raw_main, this, _root);
            }
            public static class HeaderMain extends KaitaiStruct {
                public static HeaderMain fromFile(String fileName) throws IOException {
                    return new HeaderMain(new ByteBufferKaitaiStream(fileName));
                }

                public HeaderMain(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public HeaderMain(KaitaiStream _io, Xm.Pattern.Header _parent) {
                    this(_io, _parent, null);
                }

                public HeaderMain(KaitaiStream _io, Xm.Pattern.Header _parent, Xm _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.packingType = this._io.readU1();
                    switch (_root.preheader().versionNumber().value()) {
                    case 258: {
                        this.numberOfRowsRaw = (int) (this._io.readU1());
                        break;
                    }
                    default: {
                        this.numberOfRowsRaw = this._io.readU2le();
                        break;
                    }
                    }
                    this.packedPatternDataSize = this._io.readU2le();
                }
                private Integer numberOfRows;
                public Integer numberOfRows() {
                    if (this.numberOfRows != null)
                        return this.numberOfRows;
                    int _tmp = (int) ((numberOfRowsRaw() + (_root.preheader().versionNumber().value() == 258 ? 1 : 0)));
                    this.numberOfRows = _tmp;
                    return this.numberOfRows;
                }
                private int packingType;
                private int numberOfRowsRaw;
                private int packedPatternDataSize;
                private Xm _root;
                private Xm.Pattern.Header _parent;

                /**
                 * Packing type (always 0)
                 */
                public int packingType() { return packingType; }

                /**
                 * Number of rows in pattern (1..256)
                 */
                public int numberOfRowsRaw() { return numberOfRowsRaw; }

                /**
                 * Packed pattern data size
                 */
                public int packedPatternDataSize() { return packedPatternDataSize; }
                public Xm _root() { return _root; }
                public Xm.Pattern.Header _parent() { return _parent; }
            }
            private long headerLength;
            private HeaderMain main;
            private Xm _root;
            private Xm.Pattern _parent;
            private byte[] _raw_main;

            /**
             * Pattern header length
             */
            public long headerLength() { return headerLength; }
            public HeaderMain main() { return main; }
            public Xm _root() { return _root; }
            public Xm.Pattern _parent() { return _parent; }
            public byte[] _raw_main() { return _raw_main; }
        }
        private Header header;
        private byte[] packedData;
        private Xm _root;
        private Xm _parent;
        public Header header() { return header; }
        public byte[] packedData() { return packedData; }
        public Xm _root() { return _root; }
        public Xm _parent() { return _parent; }
    }
    public static class Flags extends KaitaiStruct {
        public static Flags fromFile(String fileName) throws IOException {
            return new Flags(new ByteBufferKaitaiStream(fileName));
        }

        public Flags(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Flags(KaitaiStream _io, Xm.Header _parent) {
            this(_io, _parent, null);
        }

        public Flags(KaitaiStream _io, Xm.Header _parent, Xm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.reserved = this._io.readBitsInt(15);
            this.freqTableType = this._io.readBitsInt(1) != 0;
        }
        private long reserved;
        private boolean freqTableType;
        private Xm _root;
        private Xm.Header _parent;
        public long reserved() { return reserved; }

        /**
         * 0 = Amiga frequency table (see below); 1 = Linear frequency table
         */
        public boolean freqTableType() { return freqTableType; }
        public Xm _root() { return _root; }
        public Xm.Header _parent() { return _parent; }
    }
    public static class Header extends KaitaiStruct {
        public static Header fromFile(String fileName) throws IOException {
            return new Header(new ByteBufferKaitaiStream(fileName));
        }

        public Header(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Header(KaitaiStream _io, Xm _parent) {
            this(_io, _parent, null);
        }

        public Header(KaitaiStream _io, Xm _parent, Xm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.songLength = this._io.readU2le();
            this.restartPosition = this._io.readU2le();
            this.numberOfChannels = this._io.readU2le();
            this.numberOfPatterns = this._io.readU2le();
            this.numberOfInstruments = this._io.readU2le();
            this.flags = new Flags(this._io, this, _root);
            this.defaultTempo = this._io.readU2le();
            this.defaultBpm = this._io.readU2le();
            patternOrderTable = new ArrayList<Integer>((int) (256));
            for (int i = 0; i < 256; i++) {
                this.patternOrderTable.add(this._io.readU1());
            }
        }
        private int songLength;
        private int restartPosition;
        private int numberOfChannels;
        private int numberOfPatterns;
        private int numberOfInstruments;
        private Flags flags;
        private int defaultTempo;
        private int defaultBpm;
        private ArrayList<Integer> patternOrderTable;
        private Xm _root;
        private Xm _parent;

        /**
         * Song length (in pattern order table)
         */
        public int songLength() { return songLength; }
        public int restartPosition() { return restartPosition; }

        /**
         * (2,4,6,8,10,...,32)
         */
        public int numberOfChannels() { return numberOfChannels; }

        /**
         * (max 256)
         */
        public int numberOfPatterns() { return numberOfPatterns; }

        /**
         * (max 128)
         */
        public int numberOfInstruments() { return numberOfInstruments; }
        public Flags flags() { return flags; }
        public int defaultTempo() { return defaultTempo; }
        public int defaultBpm() { return defaultBpm; }

        /**
         * max 256
         */
        public ArrayList<Integer> patternOrderTable() { return patternOrderTable; }
        public Xm _root() { return _root; }
        public Xm _parent() { return _parent; }
    }
    public static class Instrument extends KaitaiStruct {
        public static Instrument fromFile(String fileName) throws IOException {
            return new Instrument(new ByteBufferKaitaiStream(fileName));
        }

        public Instrument(KaitaiStream _io) {
            this(_io, null, null);
        }

        public Instrument(KaitaiStream _io, Xm _parent) {
            this(_io, _parent, null);
        }

        public Instrument(KaitaiStream _io, Xm _parent, Xm _root) {
            super(_io);
            this._parent = _parent;
            this._root = _root;
            _read();
        }
        private void _read() {
            this.headerSize = this._io.readU4le();
            this._raw_header = this._io.readBytes((headerSize() - 4));
            KaitaiStream _io__raw_header = new ByteBufferKaitaiStream(_raw_header);
            this.header = new Header(_io__raw_header, this, _root);
            samplesHeaders = new ArrayList<SampleHeader>((int) (header().numberOfSamples()));
            for (int i = 0; i < header().numberOfSamples(); i++) {
                this.samplesHeaders.add(new SampleHeader(this._io, this, _root));
            }
            samples = new ArrayList<SamplesData>((int) (header().numberOfSamples()));
            for (int i = 0; i < header().numberOfSamples(); i++) {
                this.samples.add(new SamplesData(this._io, this, _root, i));
            }
        }
        public static class Header extends KaitaiStruct {
            public static Header fromFile(String fileName) throws IOException {
                return new Header(new ByteBufferKaitaiStream(fileName));
            }

            public Header(KaitaiStream _io) {
                this(_io, null, null);
            }

            public Header(KaitaiStream _io, Xm.Instrument _parent) {
                this(_io, _parent, null);
            }

            public Header(KaitaiStream _io, Xm.Instrument _parent, Xm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(22), (byte) 0, false), Charset.forName("utf-8"));
                this.type = this._io.readU1();
                this.numberOfSamples = this._io.readU2le();
                if (numberOfSamples() > 0) {
                    this.extraHeader = new ExtraHeader(this._io, this, _root);
                }
            }
            private String name;
            private int type;
            private int numberOfSamples;
            private ExtraHeader extraHeader;
            private Xm _root;
            private Xm.Instrument _parent;
            public String name() { return name; }

            /**
             * Usually zero, but this seems pretty random, don't assume it's zero
             */
            public int type() { return type; }
            public int numberOfSamples() { return numberOfSamples; }
            public ExtraHeader extraHeader() { return extraHeader; }
            public Xm _root() { return _root; }
            public Xm.Instrument _parent() { return _parent; }
        }
        public static class ExtraHeader extends KaitaiStruct {
            public static ExtraHeader fromFile(String fileName) throws IOException {
                return new ExtraHeader(new ByteBufferKaitaiStream(fileName));
            }

            public enum Type {
                TRUE(0),
                SUSTAIN(1),
                LOOP(2);

                private final long id;
                Type(long id) { this.id = id; }
                public long id() { return id; }
                private static final Map<Long, Type> byId = new HashMap<Long, Type>(3);
                static {
                    for (Type e : Type.values())
                        byId.put(e.id(), e);
                }
                public static Type byId(long id) { return byId.get(id); }
            }

            public ExtraHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public ExtraHeader(KaitaiStream _io, Xm.Instrument.Header _parent) {
                this(_io, _parent, null);
            }

            public ExtraHeader(KaitaiStream _io, Xm.Instrument.Header _parent, Xm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.sampleHeaderSize = this._io.readU4le();
                sampleNumberForAllNotes = new ArrayList<Integer>((int) (96));
                for (int i = 0; i < 96; i++) {
                    this.sampleNumberForAllNotes.add(this._io.readU1());
                }
                pointsForVolumeEnvelope = new ArrayList<EnvelopePoint>((int) (12));
                for (int i = 0; i < 12; i++) {
                    this.pointsForVolumeEnvelope.add(new EnvelopePoint(this._io, this, _root));
                }
                pointsForPanningEnvelope = new ArrayList<EnvelopePoint>((int) (12));
                for (int i = 0; i < 12; i++) {
                    this.pointsForPanningEnvelope.add(new EnvelopePoint(this._io, this, _root));
                }
                this.numberOfVolumePoints = this._io.readU1();
                this.numberOfPanningPoints = this._io.readU1();
                this.volumeSustainPoint = this._io.readU1();
                this.volumeLoopStartPoint = this._io.readU1();
                this.volumeLoopEndPoint = this._io.readU1();
                this.panningSustainPoint = this._io.readU1();
                this.panningLoopStartPoint = this._io.readU1();
                this.panningLoopEndPoint = this._io.readU1();
                this.volumeType = Type.byId(this._io.readU1());
                this.panningType = Type.byId(this._io.readU1());
                this.vibratoType = this._io.readU1();
                this.vibratoSweep = this._io.readU1();
                this.vibratoDepth = this._io.readU1();
                this.vibratoRate = this._io.readU1();
                this.volumeFadeout = this._io.readU2le();
                this.reserved = this._io.readU2le();
            }

            /**
             * Envelope frame-counters work in range 0..FFFFh (0..65535 dec).
             * BUT! FT2 only itself supports only range 0..FFh (0..255 dec).
             * Some other trackers (like SoundTracker for Unix), however, can use the full range 0..FFFF, so it should be supported.
             * !!TIP: This is also a good way to detect if the module has been made with FT2 or not. (In case the tracker name is brain- deadly left unchanged!)
             * Of course it does not help if all instruments have the values inside FT2 supported range.
             * The value-field of the envelope point is ranged between 00..3Fh (0..64 dec).
             */
            public static class EnvelopePoint extends KaitaiStruct {
                public static EnvelopePoint fromFile(String fileName) throws IOException {
                    return new EnvelopePoint(new ByteBufferKaitaiStream(fileName));
                }

                public EnvelopePoint(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public EnvelopePoint(KaitaiStream _io, Xm.Instrument.ExtraHeader _parent) {
                    this(_io, _parent, null);
                }

                public EnvelopePoint(KaitaiStream _io, Xm.Instrument.ExtraHeader _parent, Xm _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.x = this._io.readU2le();
                    this.y = this._io.readU2le();
                }
                private int x;
                private int y;
                private Xm _root;
                private Xm.Instrument.ExtraHeader _parent;

                /**
                 * Frame number of the point
                 */
                public int x() { return x; }

                /**
                 * Value of the point
                 */
                public int y() { return y; }
                public Xm _root() { return _root; }
                public Xm.Instrument.ExtraHeader _parent() { return _parent; }
            }
            private long sampleHeaderSize;
            private ArrayList<Integer> sampleNumberForAllNotes;
            private ArrayList<EnvelopePoint> pointsForVolumeEnvelope;
            private ArrayList<EnvelopePoint> pointsForPanningEnvelope;
            private int numberOfVolumePoints;
            private int numberOfPanningPoints;
            private int volumeSustainPoint;
            private int volumeLoopStartPoint;
            private int volumeLoopEndPoint;
            private int panningSustainPoint;
            private int panningLoopStartPoint;
            private int panningLoopEndPoint;
            private Type volumeType;
            private Type panningType;
            private int vibratoType;
            private int vibratoSweep;
            private int vibratoDepth;
            private int vibratoRate;
            private int volumeFadeout;
            private int reserved;
            private Xm _root;
            private Xm.Instrument.Header _parent;
            public long sampleHeaderSize() { return sampleHeaderSize; }
            public ArrayList<Integer> sampleNumberForAllNotes() { return sampleNumberForAllNotes; }
            public ArrayList<EnvelopePoint> pointsForVolumeEnvelope() { return pointsForVolumeEnvelope; }
            public ArrayList<EnvelopePoint> pointsForPanningEnvelope() { return pointsForPanningEnvelope; }
            public int numberOfVolumePoints() { return numberOfVolumePoints; }
            public int numberOfPanningPoints() { return numberOfPanningPoints; }
            public int volumeSustainPoint() { return volumeSustainPoint; }
            public int volumeLoopStartPoint() { return volumeLoopStartPoint; }
            public int volumeLoopEndPoint() { return volumeLoopEndPoint; }
            public int panningSustainPoint() { return panningSustainPoint; }
            public int panningLoopStartPoint() { return panningLoopStartPoint; }
            public int panningLoopEndPoint() { return panningLoopEndPoint; }
            public Type volumeType() { return volumeType; }
            public Type panningType() { return panningType; }
            public int vibratoType() { return vibratoType; }
            public int vibratoSweep() { return vibratoSweep; }
            public int vibratoDepth() { return vibratoDepth; }
            public int vibratoRate() { return vibratoRate; }
            public int volumeFadeout() { return volumeFadeout; }
            public int reserved() { return reserved; }
            public Xm _root() { return _root; }
            public Xm.Instrument.Header _parent() { return _parent; }
        }

        /**
         * The saved data uses simple delta-encoding to achieve better compression ratios (when compressed with pkzip, etc.)
         * Pseudocode for converting the delta-coded data to normal data,
         * old = 0;
         * for i in range(data_len):
         *   new = sample[i] + old;
         *   sample[i] = new;
         *   old = new;
         */
        public static class SamplesData extends KaitaiStruct {

            public SamplesData(KaitaiStream _io, int index) {
                this(_io, null, null, index);
            }

            public SamplesData(KaitaiStream _io, Xm.Instrument _parent, int index) {
                this(_io, _parent, null, index);
            }

            public SamplesData(KaitaiStream _io, Xm.Instrument _parent, Xm _root, int index) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                this.index = index;
                _read();
            }
            private void _read() {
                samplesData = new ArrayList<Integer>((int) (_parent().samplesHeaders().get((int) index()).sampleLength()));
                for (int i = 0; i < _parent().samplesHeaders().get((int) index()).sampleLength(); i++) {
                    {
                        boolean on = _parent().samplesHeaders().get((int) index()).type().isSampleData16Bit();
                        if (on == true) {
                            this.samplesData.add(this._io.readU2le());
                        }
                        else if (on == false) {
                            this.samplesData.add((int) (this._io.readU1()));
                        }
                    }
                }
            }
            private ArrayList<Integer> samplesData;
            private int index;
            private Xm _root;
            private Xm.Instrument _parent;
            public ArrayList<Integer> samplesData() { return samplesData; }
            public int index() { return index; }
            public Xm _root() { return _root; }
            public Xm.Instrument _parent() { return _parent; }
        }
        public static class SampleHeader extends KaitaiStruct {
            public static SampleHeader fromFile(String fileName) throws IOException {
                return new SampleHeader(new ByteBufferKaitaiStream(fileName));
            }

            public SampleHeader(KaitaiStream _io) {
                this(_io, null, null);
            }

            public SampleHeader(KaitaiStream _io, Xm.Instrument _parent) {
                this(_io, _parent, null);
            }

            public SampleHeader(KaitaiStream _io, Xm.Instrument _parent, Xm _root) {
                super(_io);
                this._parent = _parent;
                this._root = _root;
                _read();
            }
            private void _read() {
                this.sampleLength = this._io.readU4le();
                this.sampleLoopStart = this._io.readU4le();
                this.sampleLoopLength = this._io.readU4le();
                this.volume = this._io.readU1();
                this.fineTune = this._io.readS1();
                this.type = new LoopType(this._io, this, _root);
                this.panning = this._io.readU1();
                this.relativeNoteNumber = this._io.readS1();
                this.reserved = this._io.readU1();
                this.name = new String(KaitaiStream.bytesTerminate(this._io.readBytes(22), (byte) 0, false), Charset.forName("utf-8"));
            }
            public static class LoopType extends KaitaiStruct {
                public static LoopType fromFile(String fileName) throws IOException {
                    return new LoopType(new ByteBufferKaitaiStream(fileName));
                }

                public enum LoopType {
                    NONE(0),
                    FORWARD(1),
                    PING_PONG(2);

                    private final long id;
                    LoopType(long id) { this.id = id; }
                    public long id() { return id; }
                    private static final Map<Long, LoopType> byId = new HashMap<Long, LoopType>(3);
                    static {
                        for (LoopType e : LoopType.values())
                            byId.put(e.id(), e);
                    }
                    public static LoopType byId(long id) { return byId.get(id); }
                }

                public LoopType(KaitaiStream _io) {
                    this(_io, null, null);
                }

                public LoopType(KaitaiStream _io, Xm.Instrument.SampleHeader _parent) {
                    this(_io, _parent, null);
                }

                public LoopType(KaitaiStream _io, Xm.Instrument.SampleHeader _parent, Xm _root) {
                    super(_io);
                    this._parent = _parent;
                    this._root = _root;
                    _read();
                }
                private void _read() {
                    this.reserved0 = this._io.readBitsInt(3);
                    this.isSampleData16Bit = this._io.readBitsInt(1) != 0;
                    this.reserved1 = this._io.readBitsInt(2);
                    this.loopType = LoopType.byId(this._io.readBitsInt(2));
                }
                private long reserved0;
                private boolean isSampleData16Bit;
                private long reserved1;
                private LoopType loopType;
                private Xm _root;
                private Xm.Instrument.SampleHeader _parent;
                public long reserved0() { return reserved0; }
                public boolean isSampleData16Bit() { return isSampleData16Bit; }
                public long reserved1() { return reserved1; }
                public LoopType loopType() { return loopType; }
                public Xm _root() { return _root; }
                public Xm.Instrument.SampleHeader _parent() { return _parent; }
            }
            private long sampleLength;
            private long sampleLoopStart;
            private long sampleLoopLength;
            private int volume;
            private byte fineTune;
            private LoopType type;
            private int panning;
            private byte relativeNoteNumber;
            private int reserved;
            private String name;
            private Xm _root;
            private Xm.Instrument _parent;
            public long sampleLength() { return sampleLength; }
            public long sampleLoopStart() { return sampleLoopStart; }
            public long sampleLoopLength() { return sampleLoopLength; }
            public int volume() { return volume; }

            /**
             * -16..+15
             */
            public byte fineTune() { return fineTune; }
            public LoopType type() { return type; }

            /**
             * (0-255)
             */
            public int panning() { return panning; }
            public byte relativeNoteNumber() { return relativeNoteNumber; }
            public int reserved() { return reserved; }
            public String name() { return name; }
            public Xm _root() { return _root; }
            public Xm.Instrument _parent() { return _parent; }
        }
        private long headerSize;
        private Header header;
        private ArrayList<SampleHeader> samplesHeaders;
        private ArrayList<SamplesData> samples;
        private Xm _root;
        private Xm _parent;
        private byte[] _raw_header;

        /**
         * Instrument size << header that is >>
         * << "Instrument Size" field tends to be more than the actual size of the structure documented here (it includes also the extended instrument sample header above). So remember to check it and skip the additional bytes before the first sample header >>
         */
        public long headerSize() { return headerSize; }
        public Header header() { return header; }
        public ArrayList<SampleHeader> samplesHeaders() { return samplesHeaders; }
        public ArrayList<SamplesData> samples() { return samples; }
        public Xm _root() { return _root; }
        public Xm _parent() { return _parent; }
        public byte[] _raw_header() { return _raw_header; }
    }
    private Preheader preheader;
    private Header header;
    private ArrayList<Pattern> patterns;
    private ArrayList<Instrument> instruments;
    private Xm _root;
    private KaitaiStruct _parent;
    private byte[] _raw_header;
    public Preheader preheader() { return preheader; }
    public Header header() { return header; }
    public ArrayList<Pattern> patterns() { return patterns; }
    public ArrayList<Instrument> instruments() { return instruments; }
    public Xm _root() { return _root; }
    public KaitaiStruct _parent() { return _parent; }
    public byte[] _raw_header() { return _raw_header; }
}
