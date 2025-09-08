// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v1_1.h"
#include "kaitai/exceptions.h"

id3v1_1_t::id3v1_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_id3v1_tag = nullptr;
    f_id3v1_tag = false;
    _read();
}

void id3v1_1_t::_read() {
}

id3v1_1_t::~id3v1_1_t() {
    _clean_up();
}

void id3v1_1_t::_clean_up() {
    if (f_id3v1_tag) {
    }
}
const std::set<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t> id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t{
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BLUES,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLASSIC_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_COUNTRY,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DANCE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DISCO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FUNK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GRUNGE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HIP_HOP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JAZZ,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_METAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NEW_AGE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OLDIES,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OTHER,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RNB,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RAP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_REGGAE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TECHNO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INDUSTRIAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ALTERNATIVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SKA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DEATH_METAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PRANKS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUNDTRACK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURO_TECHNO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_AMBIENT,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRIP_HOP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_VOCAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JAZZ_FUNK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FUSION,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRANCE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLASSICAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HOUSE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GAME,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUND_CLIP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOSPEL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NOISE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ALTERNROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BASS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PUNK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SPACE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_MEDITATIVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL_POP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ETHNIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOTHIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DARKWAVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TECHNO_INDUSTRIAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ELECTRONIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP_FOLK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURODANCE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DREAM,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUTHERN_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_COMEDY,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CULT,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GANGSTA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TOP_40,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHRISTIAN_RAP,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP_FUNK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JUNGLE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NATIVE_AMERICAN,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CABARET,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NEW_WAVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PSYCHADELIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RAVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SHOWTUNES,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRAILER,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_LO_FI,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRIBAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID_PUNK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID_JAZZ,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POLKA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RETRO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_MUSICAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ROCK_N_ROLL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HARD_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLK_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NATIONAL_FOLK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SWING,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FAST_FUSION,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BEBOB,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_LATIN,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_REVIVAL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CELTIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BLUEGRASS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_AVANTGARDE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOTHIC_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PROGRESSIVE_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PSYCHEDELIC_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SYMPHONIC_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SLOW_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BIG_BAND,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHORUS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EASY_LISTENING,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACOUSTIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HUMOUR,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SPEECH,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHANSON,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OPERA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHAMBER_MUSIC,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SONATA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SYMPHONY,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BOOTY_BASS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PRIMUS,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PORN_GROOVE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SATIRE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SLOW_JAM,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLUB,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TANGO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SAMBA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLKLORE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BALLAD,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POWER_BALLAD,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RHYTHMIC_SOUL,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FREESTYLE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DUET,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PUNK_ROCK,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DRUM_SOLO,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_A_CAPELLA,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURO_HOUSE,
    id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DANCE_HALL,
};
bool id3v1_1_t::id3_v1_1_tag_t::_is_defined_genre_enum_t(id3v1_1_t::id3_v1_1_tag_t::genre_enum_t v) {
    return id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t.find(v) != id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t.end();
}

id3v1_1_t::id3_v1_1_tag_t::id3_v1_1_tag_t(kaitai::kstream* p__io, id3v1_1_t* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void id3v1_1_t::id3_v1_1_tag_t::_read() {
    m_magic = m__io->read_bytes(3);
    if (!(m_magic == std::string("\x54\x41\x47", 3))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x54\x41\x47", 3), m_magic, m__io, std::string("/types/id3_v1_1_tag/seq/0"));
    }
    m_title = m__io->read_bytes(30);
    m_artist = m__io->read_bytes(30);
    m_album = m__io->read_bytes(30);
    m_year = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "ASCII");
    m_comment = m__io->read_bytes(30);
    m_genre = static_cast<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t>(m__io->read_u1());
}

id3v1_1_t::id3_v1_1_tag_t::~id3_v1_1_tag_t() {
    _clean_up();
}

void id3v1_1_t::id3_v1_1_tag_t::_clean_up() {
}

id3v1_1_t::id3_v1_1_tag_t* id3v1_1_t::id3v1_tag() {
    if (f_id3v1_tag)
        return m_id3v1_tag.get();
    f_id3v1_tag = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_io()->size() - 128);
    m_id3v1_tag = std::unique_ptr<id3_v1_1_tag_t>(new id3_v1_1_tag_t(m__io, this, m__root));
    m__io->seek(_pos);
    return m_id3v1_tag.get();
}
