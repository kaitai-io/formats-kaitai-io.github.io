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

class Id3v11 extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Kaitai\Struct\Struct $parent = null, \Id3v11 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
    }
    protected $_m_id3v1Tag;
    public function id3v1Tag() {
        if ($this->_m_id3v1Tag !== null)
            return $this->_m_id3v1Tag;
        $_pos = $this->_io->pos();
        $this->_io->seek(($this->_io()->size() - 128));
        $this->_m_id3v1Tag = new \Id3v11\Id3V11Tag($this->_io, $this, $this->_root);
        $this->_io->seek($_pos);
        return $this->_m_id3v1Tag;
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

namespace \Id3v11;

class Id3V11Tag extends \Kaitai\Struct\Struct {
    public function __construct(\Kaitai\Struct\Stream $io, \Id3v11 $parent = null, \Id3v11 $root = null) {
        parent::__construct($io, $parent, $root);
        $this->_read();
    }

    private function _read() {
        $this->_m_magic = $this->_io->ensureFixedContents("\x54\x41\x47");
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

namespace \Id3v11\Id3V11Tag;

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
}
