#ifndef ID3V1_1_H_
#define ID3V1_1_H_

// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "kaitai/kaitaistruct.h"

#include <stdint.h>

#if KAITAI_STRUCT_VERSION < 7000L
#error "Incompatible Kaitai Struct C++/STL API: version 0.7 or later is required"
#endif

/**
 * ID3v1.1 tag is a method to store simple metadata in .mp3 files. The
 * tag is appended to the end of file and spans exactly 128 bytes.
 * 
 * This type is supposed to be used on full .mp3 files, seeking to
 * proper position automatically. If you're interesting in parsing only
 * the tag itself, please use `id3v1_1::id3_v1_1_tag` subtype.
 * \sa Source
 */

class id3v1_1_t : public kaitai::kstruct {

public:
    class id3_v1_1_tag_t;

    id3v1_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent = 0, id3v1_1_t* p__root = 0);

private:
    void _read();

public:
    ~id3v1_1_t();

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

    class id3_v1_1_tag_t : public kaitai::kstruct {

    public:

        enum genre_enum_t {
            GENRE_ENUM_BLUES = 0,
            GENRE_ENUM_CLASSIC_ROCK = 1,
            GENRE_ENUM_COUNTRY = 2,
            GENRE_ENUM_DANCE = 3,
            GENRE_ENUM_DISCO = 4,
            GENRE_ENUM_FUNK = 5,
            GENRE_ENUM_GRUNGE = 6,
            GENRE_ENUM_HIP_HOP = 7,
            GENRE_ENUM_JAZZ = 8,
            GENRE_ENUM_METAL = 9,
            GENRE_ENUM_NEW_AGE = 10,
            GENRE_ENUM_OLDIES = 11,
            GENRE_ENUM_OTHER = 12,
            GENRE_ENUM_POP = 13,
            GENRE_ENUM_RNB = 14,
            GENRE_ENUM_RAP = 15,
            GENRE_ENUM_REGGAE = 16,
            GENRE_ENUM_ROCK = 17,
            GENRE_ENUM_TECHNO = 18,
            GENRE_ENUM_INDUSTRIAL = 19,
            GENRE_ENUM_ALTERNATIVE = 20,
            GENRE_ENUM_SKA = 21,
            GENRE_ENUM_DEATH_METAL = 22,
            GENRE_ENUM_PRANKS = 23,
            GENRE_ENUM_SOUNDTRACK = 24,
            GENRE_ENUM_EURO_TECHNO = 25,
            GENRE_ENUM_AMBIENT = 26,
            GENRE_ENUM_TRIP_HOP = 27,
            GENRE_ENUM_VOCAL = 28,
            GENRE_ENUM_JAZZ_FUNK = 29,
            GENRE_ENUM_FUSION = 30,
            GENRE_ENUM_TRANCE = 31,
            GENRE_ENUM_CLASSICAL = 32,
            GENRE_ENUM_INSTRUMENTAL = 33,
            GENRE_ENUM_ACID = 34,
            GENRE_ENUM_HOUSE = 35,
            GENRE_ENUM_GAME = 36,
            GENRE_ENUM_SOUND_CLIP = 37,
            GENRE_ENUM_GOSPEL = 38,
            GENRE_ENUM_NOISE = 39,
            GENRE_ENUM_ALTERNROCK = 40,
            GENRE_ENUM_BASS = 41,
            GENRE_ENUM_SOUL = 42,
            GENRE_ENUM_PUNK = 43,
            GENRE_ENUM_SPACE = 44,
            GENRE_ENUM_MEDITATIVE = 45,
            GENRE_ENUM_INSTRUMENTAL_POP = 46,
            GENRE_ENUM_INSTRUMENTAL_ROCK = 47,
            GENRE_ENUM_ETHNIC = 48,
            GENRE_ENUM_GOTHIC = 49,
            GENRE_ENUM_DARKWAVE = 50,
            GENRE_ENUM_TECHNO_INDUSTRIAL = 51,
            GENRE_ENUM_ELECTRONIC = 52,
            GENRE_ENUM_POP_FOLK = 53,
            GENRE_ENUM_EURODANCE = 54,
            GENRE_ENUM_DREAM = 55,
            GENRE_ENUM_SOUTHERN_ROCK = 56,
            GENRE_ENUM_COMEDY = 57,
            GENRE_ENUM_CULT = 58,
            GENRE_ENUM_GANGSTA = 59,
            GENRE_ENUM_TOP_40 = 60,
            GENRE_ENUM_CHRISTIAN_RAP = 61,
            GENRE_ENUM_POP_FUNK = 62,
            GENRE_ENUM_JUNGLE = 63,
            GENRE_ENUM_NATIVE_AMERICAN = 64,
            GENRE_ENUM_CABARET = 65,
            GENRE_ENUM_NEW_WAVE = 66,
            GENRE_ENUM_PSYCHADELIC = 67,
            GENRE_ENUM_RAVE = 68,
            GENRE_ENUM_SHOWTUNES = 69,
            GENRE_ENUM_TRAILER = 70,
            GENRE_ENUM_LO_FI = 71,
            GENRE_ENUM_TRIBAL = 72,
            GENRE_ENUM_ACID_PUNK = 73,
            GENRE_ENUM_ACID_JAZZ = 74,
            GENRE_ENUM_POLKA = 75,
            GENRE_ENUM_RETRO = 76,
            GENRE_ENUM_MUSICAL = 77,
            GENRE_ENUM_ROCK_N_ROLL = 78,
            GENRE_ENUM_HARD_ROCK = 79,
            GENRE_ENUM_FOLK = 80,
            GENRE_ENUM_FOLK_ROCK = 81,
            GENRE_ENUM_NATIONAL_FOLK = 82,
            GENRE_ENUM_SWING = 83,
            GENRE_ENUM_FAST_FUSION = 84,
            GENRE_ENUM_BEBOB = 85,
            GENRE_ENUM_LATIN = 86,
            GENRE_ENUM_REVIVAL = 87,
            GENRE_ENUM_CELTIC = 88,
            GENRE_ENUM_BLUEGRASS = 89,
            GENRE_ENUM_AVANTGARDE = 90,
            GENRE_ENUM_GOTHIC_ROCK = 91,
            GENRE_ENUM_PROGRESSIVE_ROCK = 92,
            GENRE_ENUM_PSYCHEDELIC_ROCK = 93,
            GENRE_ENUM_SYMPHONIC_ROCK = 94,
            GENRE_ENUM_SLOW_ROCK = 95,
            GENRE_ENUM_BIG_BAND = 96,
            GENRE_ENUM_CHORUS = 97,
            GENRE_ENUM_EASY_LISTENING = 98,
            GENRE_ENUM_ACOUSTIC = 99,
            GENRE_ENUM_HUMOUR = 100,
            GENRE_ENUM_SPEECH = 101,
            GENRE_ENUM_CHANSON = 102,
            GENRE_ENUM_OPERA = 103,
            GENRE_ENUM_CHAMBER_MUSIC = 104,
            GENRE_ENUM_SONATA = 105,
            GENRE_ENUM_SYMPHONY = 106,
            GENRE_ENUM_BOOTY_BASS = 107,
            GENRE_ENUM_PRIMUS = 108,
            GENRE_ENUM_PORN_GROOVE = 109,
            GENRE_ENUM_SATIRE = 110,
            GENRE_ENUM_SLOW_JAM = 111,
            GENRE_ENUM_CLUB = 112,
            GENRE_ENUM_TANGO = 113,
            GENRE_ENUM_SAMBA = 114,
            GENRE_ENUM_FOLKLORE = 115,
            GENRE_ENUM_BALLAD = 116,
            GENRE_ENUM_POWER_BALLAD = 117,
            GENRE_ENUM_RHYTHMIC_SOUL = 118,
            GENRE_ENUM_FREESTYLE = 119,
            GENRE_ENUM_DUET = 120,
            GENRE_ENUM_PUNK_ROCK = 121,
            GENRE_ENUM_DRUM_SOLO = 122,
            GENRE_ENUM_A_CAPELLA = 123,
            GENRE_ENUM_EURO_HOUSE = 124,
            GENRE_ENUM_DANCE_HALL = 125
        };

        id3_v1_1_tag_t(kaitai::kstream* p__io, id3v1_1_t* p__parent = 0, id3v1_1_t* p__root = 0);

    private:
        void _read();

    public:
        ~id3_v1_1_tag_t();

    private:
        std::string m_magic;
        std::string m_title;
        std::string m_artist;
        std::string m_album;
        std::string m_year;
        std::string m_comment;
        genre_enum_t m_genre;
        id3v1_1_t* m__root;
        id3v1_1_t* m__parent;

    public:
        std::string magic() const { return m_magic; }

        /**
         * Song title
         */
        std::string title() const { return m_title; }

        /**
         * Artist name
         */
        std::string artist() const { return m_artist; }

        /**
         * Album title
         */
        std::string album() const { return m_album; }

        /**
         * Year of release
         */
        std::string year() const { return m_year; }

        /**
         * Arbitary comment
         */
        std::string comment() const { return m_comment; }
        genre_enum_t genre() const { return m_genre; }
        id3v1_1_t* _root() const { return m__root; }
        id3v1_1_t* _parent() const { return m__parent; }
    };

private:
    bool f_id3v1_tag;
    id3_v1_1_tag_t* m_id3v1_tag;

public:
    id3_v1_1_tag_t* id3v1_tag();

private:
    id3v1_1_t* m__root;
    kaitai::kstruct* m__parent;

public:
    id3v1_1_t* _root() const { return m__root; }
    kaitai::kstruct* _parent() const { return m__parent; }
};

#endif  // ID3V1_1_H_
