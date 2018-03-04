// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "png.h"



png_t::png_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    _read();
}

void png_t::_read() {
    m_magic = m__io->ensure_fixed_contents(std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8));
    m_ihdr_len = m__io->ensure_fixed_contents(std::string("\x00\x00\x00\x0D", 4));
    m_ihdr_type = m__io->ensure_fixed_contents(std::string("\x49\x48\x44\x52", 4));
    m_ihdr = new ihdr_chunk_t(m__io, this, m__root);
    m_ihdr_crc = m__io->read_bytes(4);
    m_chunks = new std::vector<chunk_t*>();
    {
        int i = 0;
        chunk_t* _;
        do {
            _ = new chunk_t(m__io, this, m__root);
            m_chunks->push_back(_);
            i++;
        } while (!( ((_->type() == (std::string("IEND"))) || (_io()->is_eof())) ));
    }
}

png_t::~png_t() {
    delete m_ihdr;
    for (std::vector<chunk_t*>::iterator it = m_chunks->begin(); it != m_chunks->end(); ++it) {
        delete *it;
    }
    delete m_chunks;
}

png_t::rgb_t::rgb_t(kaitai::kstream* p__io, png_t::plte_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::rgb_t::_read() {
    m_r = m__io->read_u1();
    m_g = m__io->read_u1();
    m_b = m__io->read_u1();
}

png_t::rgb_t::~rgb_t() {
}

png_t::chunk_t::chunk_t(kaitai::kstream* p__io, png_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::chunk_t::_read() {
    m_len = m__io->read_u4be();
    m_type = kaitai::kstream::bytes_to_str(m__io->read_bytes(4), std::string("UTF-8"));
    n_body = true;
    {
        std::string on = type();
        if (on == std::string("iTXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new international_text_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("gAMA")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new gama_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("tIME")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new time_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("PLTE")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new plte_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("bKGD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new bkgd_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("pHYs")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new phys_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("tEXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new text_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("cHRM")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new chrm_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("sRGB")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new srgb_chunk_t(m__io__raw_body, this, m__root);
        }
        else if (on == std::string("zTXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = new kaitai::kstream(m__raw_body);
            m_body = new compressed_text_chunk_t(m__io__raw_body, this, m__root);
        }
        else {
            m__raw_body = m__io->read_bytes(len());
        }
    }
    m_crc = m__io->read_bytes(4);
}

png_t::chunk_t::~chunk_t() {
    if (!n_body) {
        delete m__io__raw_body;
        delete m_body;
    }
}

png_t::bkgd_indexed_t::bkgd_indexed_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::bkgd_indexed_t::_read() {
    m_palette_index = m__io->read_u1();
}

png_t::bkgd_indexed_t::~bkgd_indexed_t() {
}

png_t::point_t::point_t(kaitai::kstream* p__io, png_t::chrm_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_x = false;
    f_y = false;
    _read();
}

void png_t::point_t::_read() {
    m_x_int = m__io->read_u4be();
    m_y_int = m__io->read_u4be();
}

png_t::point_t::~point_t() {
}

double png_t::point_t::x() {
    if (f_x)
        return m_x;
    m_x = (x_int() / 100000.0);
    f_x = true;
    return m_x;
}

double png_t::point_t::y() {
    if (f_y)
        return m_y;
    m_y = (y_int() / 100000.0);
    f_y = true;
    return m_y;
}

png_t::bkgd_greyscale_t::bkgd_greyscale_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::bkgd_greyscale_t::_read() {
    m_value = m__io->read_u2be();
}

png_t::bkgd_greyscale_t::~bkgd_greyscale_t() {
}

png_t::chrm_chunk_t::chrm_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::chrm_chunk_t::_read() {
    m_white_point = new point_t(m__io, this, m__root);
    m_red = new point_t(m__io, this, m__root);
    m_green = new point_t(m__io, this, m__root);
    m_blue = new point_t(m__io, this, m__root);
}

png_t::chrm_chunk_t::~chrm_chunk_t() {
    delete m_white_point;
    delete m_red;
    delete m_green;
    delete m_blue;
}

png_t::ihdr_chunk_t::ihdr_chunk_t(kaitai::kstream* p__io, png_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::ihdr_chunk_t::_read() {
    m_width = m__io->read_u4be();
    m_height = m__io->read_u4be();
    m_bit_depth = m__io->read_u1();
    m_color_type = static_cast<png_t::color_type_t>(m__io->read_u1());
    m_compression_method = m__io->read_u1();
    m_filter_method = m__io->read_u1();
    m_interlace_method = m__io->read_u1();
}

png_t::ihdr_chunk_t::~ihdr_chunk_t() {
}

png_t::plte_chunk_t::plte_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::plte_chunk_t::_read() {
    m_entries = new std::vector<rgb_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new rgb_t(m__io, this, m__root));
            i++;
        }
    }
}

png_t::plte_chunk_t::~plte_chunk_t() {
    for (std::vector<rgb_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
        delete *it;
    }
    delete m_entries;
}

png_t::srgb_chunk_t::srgb_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::srgb_chunk_t::_read() {
    m_render_intent = static_cast<png_t::srgb_chunk_t::intent_t>(m__io->read_u1());
}

png_t::srgb_chunk_t::~srgb_chunk_t() {
}

png_t::compressed_text_chunk_t::compressed_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::compressed_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_compression_method = m__io->read_u1();
    m__raw_text_datastream = m__io->read_bytes_full();
    m_text_datastream = kaitai::kstream::process_zlib(m__raw_text_datastream);
}

png_t::compressed_text_chunk_t::~compressed_text_chunk_t() {
}

png_t::bkgd_truecolor_t::bkgd_truecolor_t(kaitai::kstream* p__io, png_t::bkgd_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::bkgd_truecolor_t::_read() {
    m_red = m__io->read_u2be();
    m_green = m__io->read_u2be();
    m_blue = m__io->read_u2be();
}

png_t::bkgd_truecolor_t::~bkgd_truecolor_t() {
}

png_t::gama_chunk_t::gama_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_gamma_ratio = false;
    _read();
}

void png_t::gama_chunk_t::_read() {
    m_gamma_int = m__io->read_u4be();
}

png_t::gama_chunk_t::~gama_chunk_t() {
}

double png_t::gama_chunk_t::gamma_ratio() {
    if (f_gamma_ratio)
        return m_gamma_ratio;
    m_gamma_ratio = (100000.0 / gamma_int());
    f_gamma_ratio = true;
    return m_gamma_ratio;
}

png_t::bkgd_chunk_t::bkgd_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::bkgd_chunk_t::_read() {
    n_bkgd = true;
    switch (_root()->ihdr()->color_type()) {
    case COLOR_TYPE_GREYSCALE_ALPHA: {
        n_bkgd = false;
        m_bkgd = new bkgd_greyscale_t(m__io, this, m__root);
        break;
    }
    case COLOR_TYPE_INDEXED: {
        n_bkgd = false;
        m_bkgd = new bkgd_indexed_t(m__io, this, m__root);
        break;
    }
    case COLOR_TYPE_GREYSCALE: {
        n_bkgd = false;
        m_bkgd = new bkgd_greyscale_t(m__io, this, m__root);
        break;
    }
    case COLOR_TYPE_TRUECOLOR_ALPHA: {
        n_bkgd = false;
        m_bkgd = new bkgd_truecolor_t(m__io, this, m__root);
        break;
    }
    case COLOR_TYPE_TRUECOLOR: {
        n_bkgd = false;
        m_bkgd = new bkgd_truecolor_t(m__io, this, m__root);
        break;
    }
    }
}

png_t::bkgd_chunk_t::~bkgd_chunk_t() {
    if (!n_bkgd) {
        delete m_bkgd;
    }
}

png_t::phys_chunk_t::phys_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::phys_chunk_t::_read() {
    m_pixels_per_unit_x = m__io->read_u4be();
    m_pixels_per_unit_y = m__io->read_u4be();
    m_unit = static_cast<png_t::phys_unit_t>(m__io->read_u1());
}

png_t::phys_chunk_t::~phys_chunk_t() {
}

png_t::international_text_chunk_t::international_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::international_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_compression_flag = m__io->read_u1();
    m_compression_method = m__io->read_u1();
    m_language_tag = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    m_translated_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

png_t::international_text_chunk_t::~international_text_chunk_t() {
}

png_t::text_chunk_t::text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("iso8859-1"));
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("iso8859-1"));
}

png_t::text_chunk_t::~text_chunk_t() {
}

png_t::time_chunk_t::time_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::time_chunk_t::_read() {
    m_year = m__io->read_u2be();
    m_month = m__io->read_u1();
    m_day = m__io->read_u1();
    m_hour = m__io->read_u1();
    m_minute = m__io->read_u1();
    m_second = m__io->read_u1();
}

png_t::time_chunk_t::~time_chunk_t() {
}
