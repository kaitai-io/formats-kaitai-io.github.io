// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "gimp_brush.h"
#include "kaitai/exceptions.h"

gimp_brush_t::gimp_brush_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header = nullptr;
    m__io__raw_header = nullptr;
    f_len_body = false;
    f_body = false;
    _read();
}

void gimp_brush_t::_read() {
    m_len_header = m__io->read_u4be();
    m__raw_header = m__io->read_bytes((len_header() - 4));
    m__io__raw_header = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_header));
    m_header = std::unique_ptr<header_t>(new header_t(m__io__raw_header.get(), this, m__root));
}

gimp_brush_t::~gimp_brush_t() {
    _clean_up();
}

void gimp_brush_t::_clean_up() {
    if (f_body) {
    }
}

gimp_brush_t::header_t::header_t(kaitai::kstream* p__io, gimp_brush_t* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void gimp_brush_t::header_t::_read() {
    m_version = m__io->read_u4be();
    if (!(version() == 2)) {
        throw kaitai::validation_not_equal_error<uint32_t>(2, version(), _io(), std::string("/types/header/seq/0"));
    }
    m_width = m__io->read_u4be();
    if (!(width() >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, width(), _io(), std::string("/types/header/seq/1"));
    }
    if (!(width() <= 10000)) {
        throw kaitai::validation_greater_than_error<uint32_t>(10000, width(), _io(), std::string("/types/header/seq/1"));
    }
    m_height = m__io->read_u4be();
    if (!(height() >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, height(), _io(), std::string("/types/header/seq/2"));
    }
    if (!(height() <= 10000)) {
        throw kaitai::validation_greater_than_error<uint32_t>(10000, height(), _io(), std::string("/types/header/seq/2"));
    }
    m_bytes_per_pixel = static_cast<gimp_brush_t::color_depth_t>(m__io->read_u4be());
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x47\x49\x4D\x50", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x47\x49\x4D\x50", 4), magic(), _io(), std::string("/types/header/seq/4"));
    }
    m_spacing = m__io->read_u4be();
    m_brush_name = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes_full(), 0, false), std::string("UTF-8"));
}

gimp_brush_t::header_t::~header_t() {
    _clean_up();
}

void gimp_brush_t::header_t::_clean_up() {
}

gimp_brush_t::bitmap_t::bitmap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_rows = nullptr;
    _read();
}

void gimp_brush_t::bitmap_t::_read() {
    m_rows = std::unique_ptr<std::vector<std::unique_ptr<row_t>>>(new std::vector<std::unique_ptr<row_t>>());
    const int l_rows = _root()->header()->height();
    for (int i = 0; i < l_rows; i++) {
        m_rows->push_back(std::move(std::unique_ptr<row_t>(new row_t(m__io, this, m__root))));
    }
}

gimp_brush_t::bitmap_t::~bitmap_t() {
    _clean_up();
}

void gimp_brush_t::bitmap_t::_clean_up() {
}

gimp_brush_t::row_t::row_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_pixels = nullptr;
    _read();
}

void gimp_brush_t::row_t::_read() {
    m_pixels = std::unique_ptr<std::vector<std::unique_ptr<kaitai::kstruct>>>(new std::vector<std::unique_ptr<kaitai::kstruct>>());
    const int l_pixels = _root()->header()->width();
    for (int i = 0; i < l_pixels; i++) {
        switch (_root()->header()->bytes_per_pixel()) {
        case gimp_brush_t::COLOR_DEPTH_GRAYSCALE: {
            m_pixels->push_back(std::move(std::unique_ptr<pixel_gray_t>(new pixel_gray_t(m__io, this, m__root))));
            break;
        }
        case gimp_brush_t::COLOR_DEPTH_RGBA: {
            m_pixels->push_back(std::move(std::unique_ptr<pixel_rgba_t>(new pixel_rgba_t(m__io, this, m__root))));
            break;
        }
        }
    }
}

gimp_brush_t::row_t::~row_t() {
    _clean_up();
}

void gimp_brush_t::row_t::_clean_up() {
}

gimp_brush_t::row_t::pixel_gray_t::pixel_gray_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_red = false;
    f_green = false;
    f_blue = false;
    f_alpha = false;
    _read();
}

void gimp_brush_t::row_t::pixel_gray_t::_read() {
    m_gray = m__io->read_u1();
}

gimp_brush_t::row_t::pixel_gray_t::~pixel_gray_t() {
    _clean_up();
}

void gimp_brush_t::row_t::pixel_gray_t::_clean_up() {
}

int8_t gimp_brush_t::row_t::pixel_gray_t::red() {
    if (f_red)
        return m_red;
    m_red = 0;
    f_red = true;
    return m_red;
}

int8_t gimp_brush_t::row_t::pixel_gray_t::green() {
    if (f_green)
        return m_green;
    m_green = 0;
    f_green = true;
    return m_green;
}

int8_t gimp_brush_t::row_t::pixel_gray_t::blue() {
    if (f_blue)
        return m_blue;
    m_blue = 0;
    f_blue = true;
    return m_blue;
}

uint8_t gimp_brush_t::row_t::pixel_gray_t::alpha() {
    if (f_alpha)
        return m_alpha;
    m_alpha = gray();
    f_alpha = true;
    return m_alpha;
}

gimp_brush_t::row_t::pixel_rgba_t::pixel_rgba_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, gimp_brush_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

int32_t gimp_brush_t::len_body() {
    if (f_len_body)
        return m_len_body;
    m_len_body = ((header()->width() * header()->height()) * header()->bytes_per_pixel());
    f_len_body = true;
    return m_len_body;
}

std::string gimp_brush_t::body() {
    if (f_body)
        return m_body;
    std::streampos _pos = m__io->pos();
    m__io->seek(len_header());
    m_body = m__io->read_bytes(len_body());
    m__io->seek(_pos);
    f_body = true;
    return m_body;
}
