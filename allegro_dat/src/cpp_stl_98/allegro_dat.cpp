// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "allegro_dat.h"
#include "kaitai/exceptions.h"

allegro_dat_t::allegro_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_objects = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::_read() {
    m_pack_magic = static_cast<allegro_dat_t::pack_enum_t>(m__io->read_u4be());
    m_dat_magic = m__io->read_bytes(4);
    if (!(dat_magic() == std::string("\x41\x4C\x4C\x2E", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x4C\x4C\x2E", 4), dat_magic(), _io(), std::string("/seq/1"));
    }
    m_num_objects = m__io->read_u4be();
    int l_objects = num_objects();
    m_objects = new std::vector<dat_object_t*>();
    m_objects->reserve(l_objects);
    for (int i = 0; i < l_objects; i++) {
        m_objects->push_back(new dat_object_t(m__io, this, m__root));
    }
}

allegro_dat_t::~allegro_dat_t() {
    _clean_up();
}

void allegro_dat_t::_clean_up() {
    if (m_objects) {
        for (std::vector<dat_object_t*>::iterator it = m_objects->begin(); it != m_objects->end(); ++it) {
            delete *it;
        }
        delete m_objects; m_objects = 0;
    }
}

allegro_dat_t::dat_font_16_t::dat_font_16_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_16_t::_read() {
    int l_chars = 95;
    m_chars = new std::vector<std::string>();
    m_chars->reserve(l_chars);
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(m__io->read_bytes(16));
    }
}

allegro_dat_t::dat_font_16_t::~dat_font_16_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_16_t::_clean_up() {
    if (m_chars) {
        delete m_chars; m_chars = 0;
    }
}

allegro_dat_t::dat_bitmap_t::dat_bitmap_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_bitmap_t::_read() {
    m_bits_per_pixel = m__io->read_s2be();
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_image = m__io->read_bytes_full();
}

allegro_dat_t::dat_bitmap_t::~dat_bitmap_t() {
    _clean_up();
}

void allegro_dat_t::dat_bitmap_t::_clean_up() {
}

allegro_dat_t::dat_font_t::dat_font_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_t::_read() {
    m_font_size = m__io->read_s2be();
    n_body = true;
    switch (font_size()) {
    case 8: {
        n_body = false;
        m_body = new dat_font_8_t(m__io, this, m__root);
        break;
    }
    case 16: {
        n_body = false;
        m_body = new dat_font_16_t(m__io, this, m__root);
        break;
    }
    case 0: {
        n_body = false;
        m_body = new dat_font_3_9_t(m__io, this, m__root);
        break;
    }
    }
}

allegro_dat_t::dat_font_t::~dat_font_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_t::_clean_up() {
    if (!n_body) {
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

allegro_dat_t::dat_font_8_t::dat_font_8_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_8_t::_read() {
    int l_chars = 95;
    m_chars = new std::vector<std::string>();
    m_chars->reserve(l_chars);
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(m__io->read_bytes(8));
    }
}

allegro_dat_t::dat_font_8_t::~dat_font_8_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_8_t::_clean_up() {
    if (m_chars) {
        delete m_chars; m_chars = 0;
    }
}

allegro_dat_t::dat_object_t::dat_object_t(kaitai::kstream* p__io, allegro_dat_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_properties = 0;
    m__io__raw_body = 0;
    f_type = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_object_t::_read() {
    m_properties = new std::vector<property_t*>();
    {
        int i = 0;
        property_t* _;
        do {
            _ = new property_t(m__io, this, m__root);
            m_properties->push_back(_);
            i++;
        } while (!(!(_->is_valid())));
    }
    m_len_compressed = m__io->read_s4be();
    m_len_uncompressed = m__io->read_s4be();
    n_body = true;
    {
        std::string on = type();
        if (on == std::string("BMP ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_compressed());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dat_bitmap_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("RLE ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_compressed());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dat_rle_sprite_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("FONT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_compressed());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new dat_font_t(m__io__raw_body, this, m__root);
        }
        else {
            m__raw_body = m__io->read_bytes(len_compressed());
        }
    }
}

allegro_dat_t::dat_object_t::~dat_object_t() {
    _clean_up();
}

void allegro_dat_t::dat_object_t::_clean_up() {
    if (m_properties) {
        for (std::vector<property_t*>::iterator it = m_properties->begin(); it != m_properties->end(); ++it) {
            delete *it;
        }
        delete m_properties; m_properties = 0;
    }
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

std::string allegro_dat_t::dat_object_t::type() {
    if (f_type)
        return m_type;
    m_type = properties()->back()->magic();
    f_type = true;
    return m_type;
}

allegro_dat_t::dat_font_3_9_t::dat_font_3_9_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ranges = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_3_9_t::_read() {
    m_num_ranges = m__io->read_s2be();
    int l_ranges = num_ranges();
    m_ranges = new std::vector<range_t*>();
    m_ranges->reserve(l_ranges);
    for (int i = 0; i < l_ranges; i++) {
        m_ranges->push_back(new range_t(m__io, this, m__root));
    }
}

allegro_dat_t::dat_font_3_9_t::~dat_font_3_9_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::_clean_up() {
    if (m_ranges) {
        for (std::vector<range_t*>::iterator it = m_ranges->begin(); it != m_ranges->end(); ++it) {
            delete *it;
        }
        delete m_ranges; m_ranges = 0;
    }
}

allegro_dat_t::dat_font_3_9_t::range_t::range_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_3_9_t::range_t::_read() {
    m_mono = m__io->read_u1();
    m_start_char = m__io->read_u4be();
    m_end_char = m__io->read_u4be();
    int l_chars = ((end_char() - start_char()) + 1);
    m_chars = new std::vector<font_char_t*>();
    m_chars->reserve(l_chars);
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(new font_char_t(m__io, this, m__root));
    }
}

allegro_dat_t::dat_font_3_9_t::range_t::~range_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::range_t::_clean_up() {
    if (m_chars) {
        for (std::vector<font_char_t*>::iterator it = m_chars->begin(); it != m_chars->end(); ++it) {
            delete *it;
        }
        delete m_chars; m_chars = 0;
    }
}

allegro_dat_t::dat_font_3_9_t::font_char_t::font_char_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t::range_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_font_3_9_t::font_char_t::_read() {
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_body = m__io->read_bytes((width() * height()));
}

allegro_dat_t::dat_font_3_9_t::font_char_t::~font_char_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::font_char_t::_clean_up() {
}

allegro_dat_t::property_t::property_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_valid = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::property_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    n_type = true;
    if (is_valid()) {
        n_type = false;
        m_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    }
    n_len_body = true;
    if (is_valid()) {
        n_len_body = false;
        m_len_body = m__io->read_u4be();
    }
    n_body = true;
    if (is_valid()) {
        n_body = false;
        m_body = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_body()), std::string("UTF-8"));
    }
}

allegro_dat_t::property_t::~property_t() {
    _clean_up();
}

void allegro_dat_t::property_t::_clean_up() {
    if (!n_type) {
    }
    if (!n_len_body) {
    }
    if (!n_body) {
    }
}

bool allegro_dat_t::property_t::is_valid() {
    if (f_is_valid)
        return m_is_valid;
    m_is_valid = magic() == (std::string("prop"));
    f_is_valid = true;
    return m_is_valid;
}

allegro_dat_t::dat_rle_sprite_t::dat_rle_sprite_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void allegro_dat_t::dat_rle_sprite_t::_read() {
    m_bits_per_pixel = m__io->read_s2be();
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_len_image = m__io->read_u4be();
    m_image = m__io->read_bytes_full();
}

allegro_dat_t::dat_rle_sprite_t::~dat_rle_sprite_t() {
    _clean_up();
}

void allegro_dat_t::dat_rle_sprite_t::_clean_up() {
}
