// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "id3v1_1.h"
#include "kaitai/exceptions.h"

id3v1_1_t::id3v1_1_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_id3v1_tag = 0;
    f_id3v1_tag = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void id3v1_1_t::_read() {
}

id3v1_1_t::~id3v1_1_t() {
    _clean_up();
}

void id3v1_1_t::_clean_up() {
    if (f_id3v1_tag) {
        if (m_id3v1_tag) {
            delete m_id3v1_tag; m_id3v1_tag = 0;
        }
    }
}
std::set<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t> id3v1_1_t::id3_v1_1_tag_t::_build_values_genre_enum_t() {
    std::set<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t> _t;
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BLUES);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLASSIC_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_COUNTRY);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DANCE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DISCO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FUNK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GRUNGE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HIP_HOP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JAZZ);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_METAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NEW_AGE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OLDIES);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OTHER);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RNB);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RAP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_REGGAE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TECHNO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INDUSTRIAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ALTERNATIVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SKA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DEATH_METAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PRANKS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUNDTRACK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURO_TECHNO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_AMBIENT);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRIP_HOP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_VOCAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JAZZ_FUNK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FUSION);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRANCE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLASSICAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HOUSE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GAME);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUND_CLIP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOSPEL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NOISE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ALTERNROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BASS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PUNK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SPACE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_MEDITATIVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL_POP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_INSTRUMENTAL_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ETHNIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOTHIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DARKWAVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TECHNO_INDUSTRIAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ELECTRONIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP_FOLK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURODANCE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DREAM);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SOUTHERN_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_COMEDY);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CULT);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GANGSTA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TOP_40);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHRISTIAN_RAP);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POP_FUNK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_JUNGLE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NATIVE_AMERICAN);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CABARET);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NEW_WAVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PSYCHADELIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RAVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SHOWTUNES);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRAILER);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_LO_FI);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TRIBAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID_PUNK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACID_JAZZ);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POLKA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RETRO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_MUSICAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ROCK_N_ROLL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HARD_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLK_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_NATIONAL_FOLK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SWING);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FAST_FUSION);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BEBOB);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_LATIN);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_REVIVAL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CELTIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BLUEGRASS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_AVANTGARDE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_GOTHIC_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PROGRESSIVE_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PSYCHEDELIC_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SYMPHONIC_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SLOW_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BIG_BAND);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHORUS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EASY_LISTENING);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_ACOUSTIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_HUMOUR);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SPEECH);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHANSON);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_OPERA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CHAMBER_MUSIC);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SONATA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SYMPHONY);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BOOTY_BASS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PRIMUS);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PORN_GROOVE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SATIRE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SLOW_JAM);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_CLUB);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_TANGO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_SAMBA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FOLKLORE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_BALLAD);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_POWER_BALLAD);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_RHYTHMIC_SOUL);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_FREESTYLE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DUET);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_PUNK_ROCK);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DRUM_SOLO);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_A_CAPELLA);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_EURO_HOUSE);
    _t.insert(id3v1_1_t::id3_v1_1_tag_t::GENRE_ENUM_DANCE_HALL);
    return _t;
}
const std::set<id3v1_1_t::id3_v1_1_tag_t::genre_enum_t> id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t = id3v1_1_t::id3_v1_1_tag_t::_build_values_genre_enum_t();
bool id3v1_1_t::id3_v1_1_tag_t::_is_defined_genre_enum_t(id3v1_1_t::id3_v1_1_tag_t::genre_enum_t v) {
    return id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t.find(v) != id3v1_1_t::id3_v1_1_tag_t::_values_genre_enum_t.end();
}

id3v1_1_t::id3_v1_1_tag_t::id3_v1_1_tag_t(kaitai::kstream* p__io, id3v1_1_t* p__parent, id3v1_1_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
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
        return m_id3v1_tag;
    f_id3v1_tag = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(_io()->size() - 128);
    m_id3v1_tag = new id3_v1_1_tag_t(m__io, this, m__root);
    m__io->seek(_pos);
    return m_id3v1_tag;
}
