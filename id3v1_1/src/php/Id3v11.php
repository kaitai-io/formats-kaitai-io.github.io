<?php
// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

/**
 * ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
 * tag is appended to the end of file and spans exactly 128 bytes.
 * 
 * This type is supposed to be used on full .mp3 files, seeking to
 * proper position automatically. If you're interesting in parsing only
 * the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
 */

namespace {
    class Id3v11 extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Kaitai\Struct\Struct $_parent = null, ?\Id3v11 $_root = null) {
            parent::__construct($_io, $_parent, $_root === null ? $this : $_root);
            $this->_read();
        }

        private function _read() {
        }
        protected $_m_id3v1Tag;
        public function id3v1Tag() {
            if ($this->_m_id3v1Tag !== null)
                return $this->_m_id3v1Tag;
            $_pos = $this->_io->pos();
            $this->_io->seek($this->_io()->size() - 128);
            $this->_m_id3v1Tag = new \Id3v11\Id3V11Tag($this->_io, $this, $this->_root);
            $this->_io->seek($_pos);
            return $this->_m_id3v1Tag;
        }
    }
}

/**
 * ID3v1.1 tag itself, a fixed size 128 byte structure. Contains
 * several metadata fields as fixed-size strings.
 * 
 * Note that string encoding is not specified by standard, so real
 * encoding used would vary a lot from one implementation to
 * another. Most Windows-based applications tend to use "ANSI"
 * (i.e. locale-dependent encoding, usually one byte per
 * character). Some embedded applications allow selection of
 * charset.
 */

namespace Id3v11 {
    class Id3V11Tag extends \Kaitai\Struct\Struct {
        public function __construct(\Kaitai\Struct\Stream $_io, ?\Id3v11 $_parent = null, ?\Id3v11 $_root = null) {
            parent::__construct($_io, $_parent, $_root);
            $this->_read();
        }

        private function _read() {
            $this->_m_magic = $this->_io->readBytes(3);
            if (!($this->_m_magic == "\x54\x41\x47")) {
                throw new \Kaitai\Struct\Error\ValidationNotEqualError("\x54\x41\x47", $this->_m_magic, $this->_io, "/types/id3_v1_1_tag/seq/0");
            }
            $this->_m_title = $this->_io->readBytes(30);
            $this->_m_artist = $this->_io->readBytes(30);
            $this->_m_album = $this->_io->readBytes(30);
            $this->_m_year = \Kaitai\Struct\Stream::bytesToStr($this->_io->readBytes(4), "ASCII");
            $this->_m_comment = $this->_io->readBytes(30);
            $this->_m_genre = $this->_io->readU1();
        }
        protected $_m_magic;
        protected $_m_title;
        protected $_m_artist;
        protected $_m_album;
        protected $_m_year;
        protected $_m_comment;
        protected $_m_genre;
        public function magic() { return $this->_m_magic; }

        /**
         * Song title
         */
        public function title() { return $this->_m_title; }

        /**
         * Artist name
         */
        public function artist() { return $this->_m_artist; }

        /**
         * Album title
         */
        public function album() { return $this->_m_album; }

        /**
         * Year of release
         */
        public function year() { return $this->_m_year; }

        /**
         * Arbitary comment
         */
        public function comment() { return $this->_m_comment; }
        public function genre() { return $this->_m_genre; }
    }
}

namespace Id3v11\Id3V11Tag {
    class GenreEnum {
        const BLUES = 0;
        const CLASSIC_ROCK = 1;
        const COUNTRY = 2;
        const DANCE = 3;
        const DISCO = 4;
        const FUNK = 5;
        const GRUNGE = 6;
        const HIP_HOP = 7;
        const JAZZ = 8;
        const METAL = 9;
        const NEW_AGE = 10;
        const OLDIES = 11;
        const OTHER = 12;
        const POP = 13;
        const RNB = 14;
        const RAP = 15;
        const REGGAE = 16;
        const ROCK = 17;
        const TECHNO = 18;
        const INDUSTRIAL = 19;
        const ALTERNATIVE = 20;
        const SKA = 21;
        const DEATH_METAL = 22;
        const PRANKS = 23;
        const SOUNDTRACK = 24;
        const EURO_TECHNO = 25;
        const AMBIENT = 26;
        const TRIP_HOP = 27;
        const VOCAL = 28;
        const JAZZ_FUNK = 29;
        const FUSION = 30;
        const TRANCE = 31;
        const CLASSICAL = 32;
        const INSTRUMENTAL = 33;
        const ACID = 34;
        const HOUSE = 35;
        const GAME = 36;
        const SOUND_CLIP = 37;
        const GOSPEL = 38;
        const NOISE = 39;
        const ALTERNROCK = 40;
        const BASS = 41;
        const SOUL = 42;
        const PUNK = 43;
        const SPACE = 44;
        const MEDITATIVE = 45;
        const INSTRUMENTAL_POP = 46;
        const INSTRUMENTAL_ROCK = 47;
        const ETHNIC = 48;
        const GOTHIC = 49;
        const DARKWAVE = 50;
        const TECHNO_INDUSTRIAL = 51;
        const ELECTRONIC = 52;
        const POP_FOLK = 53;
        const EURODANCE = 54;
        const DREAM = 55;
        const SOUTHERN_ROCK = 56;
        const COMEDY = 57;
        const CULT = 58;
        const GANGSTA = 59;
        const TOP_40 = 60;
        const CHRISTIAN_RAP = 61;
        const POP_FUNK = 62;
        const JUNGLE = 63;
        const NATIVE_AMERICAN = 64;
        const CABARET = 65;
        const NEW_WAVE = 66;
        const PSYCHADELIC = 67;
        const RAVE = 68;
        const SHOWTUNES = 69;
        const TRAILER = 70;
        const LO_FI = 71;
        const TRIBAL = 72;
        const ACID_PUNK = 73;
        const ACID_JAZZ = 74;
        const POLKA = 75;
        const RETRO = 76;
        const MUSICAL = 77;
        const ROCK_N_ROLL = 78;
        const HARD_ROCK = 79;
        const FOLK = 80;
        const FOLK_ROCK = 81;
        const NATIONAL_FOLK = 82;
        const SWING = 83;
        const FAST_FUSION = 84;
        const BEBOB = 85;
        const LATIN = 86;
        const REVIVAL = 87;
        const CELTIC = 88;
        const BLUEGRASS = 89;
        const AVANTGARDE = 90;
        const GOTHIC_ROCK = 91;
        const PROGRESSIVE_ROCK = 92;
        const PSYCHEDELIC_ROCK = 93;
        const SYMPHONIC_ROCK = 94;
        const SLOW_ROCK = 95;
        const BIG_BAND = 96;
        const CHORUS = 97;
        const EASY_LISTENING = 98;
        const ACOUSTIC = 99;
        const HUMOUR = 100;
        const SPEECH = 101;
        const CHANSON = 102;
        const OPERA = 103;
        const CHAMBER_MUSIC = 104;
        const SONATA = 105;
        const SYMPHONY = 106;
        const BOOTY_BASS = 107;
        const PRIMUS = 108;
        const PORN_GROOVE = 109;
        const SATIRE = 110;
        const SLOW_JAM = 111;
        const CLUB = 112;
        const TANGO = 113;
        const SAMBA = 114;
        const FOLKLORE = 115;
        const BALLAD = 116;
        const POWER_BALLAD = 117;
        const RHYTHMIC_SOUL = 118;
        const FREESTYLE = 119;
        const DUET = 120;
        const PUNK_ROCK = 121;
        const DRUM_SOLO = 122;
        const A_CAPELLA = 123;
        const EURO_HOUSE = 124;
        const DANCE_HALL = 125;

        private const _VALUES = [0 => true, 1 => true, 2 => true, 3 => true, 4 => true, 5 => true, 6 => true, 7 => true, 8 => true, 9 => true, 10 => true, 11 => true, 12 => true, 13 => true, 14 => true, 15 => true, 16 => true, 17 => true, 18 => true, 19 => true, 20 => true, 21 => true, 22 => true, 23 => true, 24 => true, 25 => true, 26 => true, 27 => true, 28 => true, 29 => true, 30 => true, 31 => true, 32 => true, 33 => true, 34 => true, 35 => true, 36 => true, 37 => true, 38 => true, 39 => true, 40 => true, 41 => true, 42 => true, 43 => true, 44 => true, 45 => true, 46 => true, 47 => true, 48 => true, 49 => true, 50 => true, 51 => true, 52 => true, 53 => true, 54 => true, 55 => true, 56 => true, 57 => true, 58 => true, 59 => true, 60 => true, 61 => true, 62 => true, 63 => true, 64 => true, 65 => true, 66 => true, 67 => true, 68 => true, 69 => true, 70 => true, 71 => true, 72 => true, 73 => true, 74 => true, 75 => true, 76 => true, 77 => true, 78 => true, 79 => true, 80 => true, 81 => true, 82 => true, 83 => true, 84 => true, 85 => true, 86 => true, 87 => true, 88 => true, 89 => true, 90 => true, 91 => true, 92 => true, 93 => true, 94 => true, 95 => true, 96 => true, 97 => true, 98 => true, 99 => true, 100 => true, 101 => true, 102 => true, 103 => true, 104 => true, 105 => true, 106 => true, 107 => true, 108 => true, 109 => true, 110 => true, 111 => true, 112 => true, 113 => true, 114 => true, 115 => true, 116 => true, 117 => true, 118 => true, 119 => true, 120 => true, 121 => true, 122 => true, 123 => true, 124 => true, 125 => true];

        public static function isDefined(int $v): bool {
            return isset(self::_VALUES[$v]);
        }
    }
}
