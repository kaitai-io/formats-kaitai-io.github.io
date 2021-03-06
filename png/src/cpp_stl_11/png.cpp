// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "png.h"
#include "kaitai/exceptions.h"

png_t::png_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_ihdr = nullptr;
    m_chunks = nullptr;
    _read();
}

void png_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8), magic(), _io(), std::string("/seq/0"));
    }
    m_ihdr_len = m__io->read_u4be();
    if (!(ihdr_len() == 13)) {
        throw kaitai::validation_not_equal_error<uint32_t>(13, ihdr_len(), _io(), std::string("/seq/1"));
    }
    m_ihdr_type = m__io->read_bytes(4);
    if (!(ihdr_type() == std::string("\x49\x48\x44\x52", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x48\x44\x52", 4), ihdr_type(), _io(), std::string("/seq/2"));
    }
    m_ihdr = std::unique_ptr<ihdr_chunk_t>(new ihdr_chunk_t(m__io, this, m__root));
    m_ihdr_crc = m__io->read_bytes(4);
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    {
        int i = 0;
        chunk_t* _;
        do {
            _ = new chunk_t(m__io, this, m__root);
            m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(_)));
            i++;
        } while (!( ((_->type() == (std::string("IEND"))) || (_io()->is_eof())) ));
    }
}

png_t::~png_t() {
    _clean_up();
}

void png_t::_clean_up() {
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
    _clean_up();
}

void png_t::rgb_t::_clean_up() {
}

png_t::chunk_t::chunk_t(kaitai::kstream* p__io, png_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
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
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<international_text_chunk_t>(new international_text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("gAMA")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<gama_chunk_t>(new gama_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("tIME")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<time_chunk_t>(new time_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("PLTE")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<plte_chunk_t>(new plte_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("bKGD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<bkgd_chunk_t>(new bkgd_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("pHYs")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<phys_chunk_t>(new phys_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("fdAT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<frame_data_chunk_t>(new frame_data_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("tEXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<text_chunk_t>(new text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("cHRM")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<chrm_chunk_t>(new chrm_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("acTL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<animation_control_chunk_t>(new animation_control_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("sRGB")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<srgb_chunk_t>(new srgb_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("zTXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<compressed_text_chunk_t>(new compressed_text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("fcTL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<frame_control_chunk_t>(new frame_control_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else {
            m__raw_body = m__io->read_bytes(len());
        }
    }
    m_crc = m__io->read_bytes(4);
}

png_t::chunk_t::~chunk_t() {
    _clean_up();
}

void png_t::chunk_t::_clean_up() {
    if (!n_body) {
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
    _clean_up();
}

void png_t::bkgd_indexed_t::_clean_up() {
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
    _clean_up();
}

void png_t::point_t::_clean_up() {
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
    _clean_up();
}

void png_t::bkgd_greyscale_t::_clean_up() {
}

png_t::chrm_chunk_t::chrm_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_white_point = nullptr;
    m_red = nullptr;
    m_green = nullptr;
    m_blue = nullptr;
    _read();
}

void png_t::chrm_chunk_t::_read() {
    m_white_point = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
    m_red = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
    m_green = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
    m_blue = std::unique_ptr<point_t>(new point_t(m__io, this, m__root));
}

png_t::chrm_chunk_t::~chrm_chunk_t() {
    _clean_up();
}

void png_t::chrm_chunk_t::_clean_up() {
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
    _clean_up();
}

void png_t::ihdr_chunk_t::_clean_up() {
}

png_t::plte_chunk_t::plte_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void png_t::plte_chunk_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<rgb_t>>>(new std::vector<std::unique_ptr<rgb_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<rgb_t>(new rgb_t(m__io, this, m__root))));
            i++;
        }
    }
}

png_t::plte_chunk_t::~plte_chunk_t() {
    _clean_up();
}

void png_t::plte_chunk_t::_clean_up() {
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
    _clean_up();
}

void png_t::srgb_chunk_t::_clean_up() {
}

png_t::compressed_text_chunk_t::compressed_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io_text_datastream = nullptr;
    _read();
}

void png_t::compressed_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    m__raw_text_datastream = m__io->read_bytes_full();
    m_text_datastream = kaitai::kstream::process_zlib(m__raw_text_datastream);
}

png_t::compressed_text_chunk_t::~compressed_text_chunk_t() {
    _clean_up();
}

void png_t::compressed_text_chunk_t::_clean_up() {
}

png_t::frame_data_chunk_t::frame_data_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::frame_data_chunk_t::_read() {
    m_sequence_number = m__io->read_u4be();
    m_frame_data = m__io->read_bytes_full();
}

png_t::frame_data_chunk_t::~frame_data_chunk_t() {
    _clean_up();
}

void png_t::frame_data_chunk_t::_clean_up() {
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
    _clean_up();
}

void png_t::bkgd_truecolor_t::_clean_up() {
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
    _clean_up();
}

void png_t::gama_chunk_t::_clean_up() {
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
    case png_t::COLOR_TYPE_INDEXED: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_indexed_t>(new bkgd_indexed_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR_ALPHA: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_truecolor_t>(new bkgd_truecolor_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_GREYSCALE_ALPHA: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_greyscale_t>(new bkgd_greyscale_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_truecolor_t>(new bkgd_truecolor_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_GREYSCALE: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_greyscale_t>(new bkgd_greyscale_t(m__io, this, m__root));
        break;
    }
    }
}

png_t::bkgd_chunk_t::~bkgd_chunk_t() {
    _clean_up();
}

void png_t::bkgd_chunk_t::_clean_up() {
    if (!n_bkgd) {
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
    _clean_up();
}

void png_t::phys_chunk_t::_clean_up() {
}

png_t::frame_control_chunk_t::frame_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_delay = false;
    _read();
}

void png_t::frame_control_chunk_t::_read() {
    m_sequence_number = m__io->read_u4be();
    m_width = m__io->read_u4be();
    if (!(width() >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, width(), _io(), std::string("/types/frame_control_chunk/seq/1"));
    }
    if (!(width() <= _root()->ihdr()->width())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->width(), width(), _io(), std::string("/types/frame_control_chunk/seq/1"));
    }
    m_height = m__io->read_u4be();
    if (!(height() >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, height(), _io(), std::string("/types/frame_control_chunk/seq/2"));
    }
    if (!(height() <= _root()->ihdr()->height())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->height(), height(), _io(), std::string("/types/frame_control_chunk/seq/2"));
    }
    m_x_offset = m__io->read_u4be();
    if (!(x_offset() <= (_root()->ihdr()->width() - width()))) {
        throw kaitai::validation_greater_than_error<uint32_t>((_root()->ihdr()->width() - width()), x_offset(), _io(), std::string("/types/frame_control_chunk/seq/3"));
    }
    m_y_offset = m__io->read_u4be();
    if (!(y_offset() <= (_root()->ihdr()->height() - height()))) {
        throw kaitai::validation_greater_than_error<uint32_t>((_root()->ihdr()->height() - height()), y_offset(), _io(), std::string("/types/frame_control_chunk/seq/4"));
    }
    m_delay_num = m__io->read_u2be();
    m_delay_den = m__io->read_u2be();
    m_dispose_op = static_cast<png_t::dispose_op_values_t>(m__io->read_u1());
    m_blend_op = static_cast<png_t::blend_op_values_t>(m__io->read_u1());
}

png_t::frame_control_chunk_t::~frame_control_chunk_t() {
    _clean_up();
}

void png_t::frame_control_chunk_t::_clean_up() {
}

double png_t::frame_control_chunk_t::delay() {
    if (f_delay)
        return m_delay;
    m_delay = (delay_num() / ((delay_den() == 0) ? (100.0) : (delay_den())));
    f_delay = true;
    return m_delay;
}

png_t::international_text_chunk_t::international_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::international_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_compression_flag = m__io->read_u1();
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    m_language_tag = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    m_translated_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("UTF-8"));
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

png_t::international_text_chunk_t::~international_text_chunk_t() {
    _clean_up();
}

void png_t::international_text_chunk_t::_clean_up() {
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
    _clean_up();
}

void png_t::text_chunk_t::_clean_up() {
}

png_t::animation_control_chunk_t::animation_control_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::animation_control_chunk_t::_read() {
    m_num_frames = m__io->read_u4be();
    m_num_plays = m__io->read_u4be();
}

png_t::animation_control_chunk_t::~animation_control_chunk_t() {
    _clean_up();
}

void png_t::animation_control_chunk_t::_clean_up() {
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
    _clean_up();
}

void png_t::time_chunk_t::_clean_up() {
}
