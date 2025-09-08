// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "allegro_dat.h"
#include "kaitai/exceptions.h"
const std::set<allegro_dat_t::pack_enum_t> allegro_dat_t::_values_pack_enum_t{
    allegro_dat_t::PACK_ENUM_UNPACKED,
};
bool allegro_dat_t::_is_defined_pack_enum_t(allegro_dat_t::pack_enum_t v) {
    return allegro_dat_t::_values_pack_enum_t.find(v) != allegro_dat_t::_values_pack_enum_t.end();
}

allegro_dat_t::allegro_dat_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_objects = nullptr;
    _read();
}

void allegro_dat_t::_read() {
    m_pack_magic = static_cast<allegro_dat_t::pack_enum_t>(m__io->read_u4be());
    m_dat_magic = m__io->read_bytes(4);
    if (!(m_dat_magic == std::string("\x41\x4C\x4C\x2E", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x4C\x4C\x2E", 4), m_dat_magic, m__io, std::string("/seq/1"));
    }
    m_num_objects = m__io->read_u4be();
    m_objects = std::unique_ptr<std::vector<std::unique_ptr<dat_object_t>>>(new std::vector<std::unique_ptr<dat_object_t>>());
    const int l_objects = num_objects();
    for (int i = 0; i < l_objects; i++) {
        m_objects->push_back(std::move(std::unique_ptr<dat_object_t>(new dat_object_t(m__io, this, m__root))));
    }
}

allegro_dat_t::~allegro_dat_t() {
    _clean_up();
}

void allegro_dat_t::_clean_up() {
}

allegro_dat_t::dat_bitmap_t::dat_bitmap_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    _read();
}

void allegro_dat_t::dat_font_t::_read() {
    m_font_size = m__io->read_s2be();
    n_body = true;
    switch (font_size()) {
    case 0: {
        n_body = false;
        m_body = std::unique_ptr<dat_font_3_9_t>(new dat_font_3_9_t(m__io, this, m__root));
        break;
    }
    case 16: {
        n_body = false;
        m_body = std::unique_ptr<dat_font_16_t>(new dat_font_16_t(m__io, this, m__root));
        break;
    }
    case 8: {
        n_body = false;
        m_body = std::unique_ptr<dat_font_8_t>(new dat_font_8_t(m__io, this, m__root));
        break;
    }
    }
}

allegro_dat_t::dat_font_t::~dat_font_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_t::_clean_up() {
    if (!n_body) {
    }
}

allegro_dat_t::dat_font_16_t::dat_font_16_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = nullptr;
    _read();
}

void allegro_dat_t::dat_font_16_t::_read() {
    m_chars = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_chars = 95;
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(std::move(m__io->read_bytes(16)));
    }
}

allegro_dat_t::dat_font_16_t::~dat_font_16_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_16_t::_clean_up() {
}

allegro_dat_t::dat_font_3_9_t::dat_font_3_9_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_ranges = nullptr;
    _read();
}

void allegro_dat_t::dat_font_3_9_t::_read() {
    m_num_ranges = m__io->read_s2be();
    m_ranges = std::unique_ptr<std::vector<std::unique_ptr<range_t>>>(new std::vector<std::unique_ptr<range_t>>());
    const int l_ranges = num_ranges();
    for (int i = 0; i < l_ranges; i++) {
        m_ranges->push_back(std::move(std::unique_ptr<range_t>(new range_t(m__io, this, m__root))));
    }
}

allegro_dat_t::dat_font_3_9_t::~dat_font_3_9_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::_clean_up() {
}

allegro_dat_t::dat_font_3_9_t::font_char_t::font_char_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t::range_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void allegro_dat_t::dat_font_3_9_t::font_char_t::_read() {
    m_width = m__io->read_u2be();
    m_height = m__io->read_u2be();
    m_body = m__io->read_bytes(width() * height());
}

allegro_dat_t::dat_font_3_9_t::font_char_t::~font_char_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::font_char_t::_clean_up() {
}

allegro_dat_t::dat_font_3_9_t::range_t::range_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_3_9_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = nullptr;
    _read();
}

void allegro_dat_t::dat_font_3_9_t::range_t::_read() {
    m_mono = m__io->read_u1();
    m_start_char = m__io->read_u4be();
    m_end_char = m__io->read_u4be();
    m_chars = std::unique_ptr<std::vector<std::unique_ptr<font_char_t>>>(new std::vector<std::unique_ptr<font_char_t>>());
    const int l_chars = (end_char() - start_char()) + 1;
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(std::move(std::unique_ptr<font_char_t>(new font_char_t(m__io, this, m__root))));
    }
}

allegro_dat_t::dat_font_3_9_t::range_t::~range_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_3_9_t::range_t::_clean_up() {
}

allegro_dat_t::dat_font_8_t::dat_font_8_t(kaitai::kstream* p__io, allegro_dat_t::dat_font_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chars = nullptr;
    _read();
}

void allegro_dat_t::dat_font_8_t::_read() {
    m_chars = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    const int l_chars = 95;
    for (int i = 0; i < l_chars; i++) {
        m_chars->push_back(std::move(m__io->read_bytes(8)));
    }
}

allegro_dat_t::dat_font_8_t::~dat_font_8_t() {
    _clean_up();
}

void allegro_dat_t::dat_font_8_t::_clean_up() {
}

allegro_dat_t::dat_object_t::dat_object_t(kaitai::kstream* p__io, allegro_dat_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_properties = nullptr;
    m__io__raw_body = nullptr;
    f_type = false;
    _read();
}

void allegro_dat_t::dat_object_t::_read() {
    m_properties = std::unique_ptr<std::vector<std::unique_ptr<property_t>>>(new std::vector<std::unique_ptr<property_t>>());
    {
        int i = 0;
        property_t* _;
        do {
            _ = new property_t(m__io, this, m__root);
            m_properties->push_back(std::move(std::unique_ptr<property_t>(_)));
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
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<dat_bitmap_t>(new dat_bitmap_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("FONT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_compressed());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<dat_font_t>(new dat_font_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("RLE ")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len_compressed());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<dat_rle_sprite_t>(new dat_rle_sprite_t(m__io__raw_body.get(), this, m__root));
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
    if (!n_body) {
    }
}

std::string allegro_dat_t::dat_object_t::type() {
    if (f_type)
        return m_type;
    f_type = true;
    m_type = properties()->back()->magic();
    return m_type;
}

allegro_dat_t::dat_rle_sprite_t::dat_rle_sprite_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

allegro_dat_t::property_t::property_t(kaitai::kstream* p__io, allegro_dat_t::dat_object_t* p__parent, allegro_dat_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_is_valid = false;
    _read();
}

void allegro_dat_t::property_t::_read() {
    m_magic = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "UTF-8");
    n_type = true;
    if (is_valid()) {
        n_type = false;
        m_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), "UTF-8");
    }
    n_len_body = true;
    if (is_valid()) {
        n_len_body = false;
        m_len_body = m__io->read_u4be();
    }
    n_body = true;
    if (is_valid()) {
        n_body = false;
        m_body = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_body()), "UTF-8");
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
    f_is_valid = true;
    m_is_valid = magic() == std::string("prop");
    return m_is_valid;
}
