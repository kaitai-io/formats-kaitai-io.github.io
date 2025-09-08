// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gimp_brush.h"
#include "kaitai/exceptions.h"
std::set<gimp_brush_t::color_depth_t> gimp_brush_t::_build_values_color_depth_t() {
    std::set<gimp_brush_t::color_depth_t> _t;
    _t.insert(gimp_brush_t::COLOR_DEPTH_GRAYSCALE);
    _t.insert(gimp_brush_t::COLOR_DEPTH_RGBA);
    return _t;
}
const std::set<gimp_brush_t::color_depth_t> gimp_brush_t::_values_color_depth_t = gimp_brush_t::_build_values_color_depth_t();
bool gimp_brush_t::_is_defined_color_depth_t(gimp_brush_t::color_depth_t v) {
    return gimp_brush_t::_values_color_depth_t.find(v) != gimp_brush_t::_values_color_depth_t.end();
}

gimp_brush_t::gimp_brush_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header = 0;
    m__io__raw_header = 0;
    f_body = false;
    f_len_body = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::_read() {
    m_len_header = m__io->read_u4be();
    m__raw_header = m__io->read_bytes(len_header() - 4);
    m__io__raw_header = new kaitai::kstream(m__raw_header);
    m_header = new header_t(m__io__raw_header, this, m__root);
}

gimp_brush_t::~gimp_brush_t() {
    _clean_up();
}

void gimp_brush_t::_clean_up() {
    if (m__io__raw_header) {
        delete m__io__raw_header; m__io__raw_header = 0;
    }
    if (m_header) {
        delete m_header; m_header = 0;
    }
    if (f_body) {
    }
}

gimp_brush_t::bitmap_t::bitmap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_rows = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::bitmap_t::_read() {
    m_rows = new std::vector<row_t*>();
    const int l_rows = _root()->header()->height();
    for (int i = 0; i < l_rows; i++) {
        m_rows->push_back(new row_t(m__io, this, m__root));
    }
}

gimp_brush_t::bitmap_t::~bitmap_t() {
    _clean_up();
}

void gimp_brush_t::bitmap_t::_clean_up() {
    if (m_rows) {
        for (std::vector<row_t*>::iterator it = m_rows->begin(); it != m_rows->end(); ++it) {
            delete *it;
        }
        delete m_rows; m_rows = 0;
    }
}

gimp_brush_t::header_t::header_t(kaitai::kstream* p__io, gimp_brush_t* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::header_t::_read() {
    m_version = m__io->read_u4be();
    if (!(m_version == 2)) {
        throw kaitai::validation_not_equal_error<uint32_t>(2, m_version, m__io, std::string("/types/header/seq/0"));
    }
    m_width = m__io->read_u4be();
    if (!(m_width >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_width, m__io, std::string("/types/header/seq/1"));
    }
    if (!(m_width <= 10000)) {
        throw kaitai::validation_greater_than_error<uint32_t>(10000, m_width, m__io, std::string("/types/header/seq/1"));
    }
    m_height = m__io->read_u4be();
    if (!(m_height >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_height, m__io, std::string("/types/header/seq/2"));
    }
    if (!(m_height <= 10000)) {
        throw kaitai::validation_greater_than_error<uint32_t>(10000, m_height, m__io, std::string("/types/header/seq/2"));
    }
    m_bytes_per_pixel = static_cast<gimp_brush_t::color_depth_t>(m__io->read_u4be());
    m_magic = m__io->read_bytes(4);
    if (!(m_magic == std::string("\x47\x49\x4D\x50", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x49\x4D\x50", 4), m_magic, m__io, std::string("/types/header/seq/4"));
    }
    m_spacing = m__io->read_u4be();
    m_brush_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), "UTF-8");
}

gimp_brush_t::header_t::~header_t() {
    _clean_up();
}

void gimp_brush_t::header_t::_clean_up() {
}

gimp_brush_t::row_t::row_t(kaitai::kstream* p__io, gimp_brush_t::bitmap_t* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pixels = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::row_t::_read() {
    m_pixels = new std::vector<kaitai::kstruct*>();
    const int l_pixels = _root()->header()->width();
    for (int i = 0; i < l_pixels; i++) {
        switch (_root()->header()->bytes_per_pixel()) {
        case gimp_brush_t::COLOR_DEPTH_GRAYSCALE: {
            m_pixels->push_back(new pixel_gray_t(m__io, this, m__root));
            break;
        }
        case gimp_brush_t::COLOR_DEPTH_RGBA: {
            m_pixels->push_back(new pixel_rgba_t(m__io, this, m__root));
            break;
        }
        }
    }
}

gimp_brush_t::row_t::~row_t() {
    _clean_up();
}

void gimp_brush_t::row_t::_clean_up() {
    if (m_pixels) {
        for (std::vector<kaitai::kstruct*>::iterator it = m_pixels->begin(); it != m_pixels->end(); ++it) {
            delete *it;
        }
        delete m_pixels; m_pixels = 0;
    }
}

gimp_brush_t::row_t::pixel_gray_t::pixel_gray_t(kaitai::kstream* p__io, gimp_brush_t::row_t* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_alpha = false;
    f_blue = false;
    f_green = false;
    f_red = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::row_t::pixel_gray_t::_read() {
    m_gray = m__io->read_u1();
}

gimp_brush_t::row_t::pixel_gray_t::~pixel_gray_t() {
    _clean_up();
}

void gimp_brush_t::row_t::pixel_gray_t::_clean_up() {
}

uint8_t gimp_brush_t::row_t::pixel_gray_t::alpha() {
    if (f_alpha)
        return m_alpha;
    f_alpha = true;
    m_alpha = gray();
    return m_alpha;
}

int8_t gimp_brush_t::row_t::pixel_gray_t::blue() {
    if (f_blue)
        return m_blue;
    f_blue = true;
    m_blue = 0;
    return m_blue;
}

int8_t gimp_brush_t::row_t::pixel_gray_t::green() {
    if (f_green)
        return m_green;
    f_green = true;
    m_green = 0;
    return m_green;
}

int8_t gimp_brush_t::row_t::pixel_gray_t::red() {
    if (f_red)
        return m_red;
    f_red = true;
    m_red = 0;
    return m_red;
}

gimp_brush_t::row_t::pixel_rgba_t::pixel_rgba_t(kaitai::kstream* p__io, gimp_brush_t::row_t* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void gimp_brush_t::row_t::pixel_rgba_t::_read() {
    m_red = m__io->read_u1();
    m_green = m__io->read_u1();
    m_blue = m__io->read_u1();
    m_alpha = m__io->read_u1();
}

gimp_brush_t::row_t::pixel_rgba_t::~pixel_rgba_t() {
    _clean_up();
}

void gimp_brush_t::row_t::pixel_rgba_t::_clean_up() {
}

std::string gimp_brush_t::body() {
    if (f_body)
        return m_body;
    f_body = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(len_header());
    m_body = m__io->read_bytes(len_body());
    m__io->seek(_pos);
    return m_body;
}

int32_t gimp_brush_t::len_body() {
    if (f_len_body)
        return m_len_body;
    f_len_body = true;
    m_len_body = (header()->width() * header()->height()) * header()->bytes_per_pixel();
    return m_len_body;
}
