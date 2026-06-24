// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "png.h"
#include "kaitai/exceptions.h"
const std::set<png_t::blend_op_values_t> png_t::_values_blend_op_values_t{
    png_t::BLEND_OP_VALUES_SOURCE,
    png_t::BLEND_OP_VALUES_OVER,
};
bool png_t::_is_defined_blend_op_values_t(png_t::blend_op_values_t v) {
    return png_t::_values_blend_op_values_t.find(v) != png_t::_values_blend_op_values_t.end();
}
const std::set<png_t::color_type_t> png_t::_values_color_type_t{
    png_t::COLOR_TYPE_GREYSCALE,
    png_t::COLOR_TYPE_TRUECOLOR,
    png_t::COLOR_TYPE_INDEXED,
    png_t::COLOR_TYPE_GREYSCALE_ALPHA,
    png_t::COLOR_TYPE_TRUECOLOR_ALPHA,
};
bool png_t::_is_defined_color_type_t(png_t::color_type_t v) {
    return png_t::_values_color_type_t.find(v) != png_t::_values_color_type_t.end();
}
const std::set<png_t::compression_methods_t> png_t::_values_compression_methods_t{
    png_t::COMPRESSION_METHODS_ZLIB,
};
bool png_t::_is_defined_compression_methods_t(png_t::compression_methods_t v) {
    return png_t::_values_compression_methods_t.find(v) != png_t::_values_compression_methods_t.end();
}
const std::set<png_t::dispose_op_values_t> png_t::_values_dispose_op_values_t{
    png_t::DISPOSE_OP_VALUES_NONE,
    png_t::DISPOSE_OP_VALUES_BACKGROUND,
    png_t::DISPOSE_OP_VALUES_PREVIOUS,
};
bool png_t::_is_defined_dispose_op_values_t(png_t::dispose_op_values_t v) {
    return png_t::_values_dispose_op_values_t.find(v) != png_t::_values_dispose_op_values_t.end();
}
const std::set<png_t::filter_method_t> png_t::_values_filter_method_t{
    png_t::FILTER_METHOD_BASE,
};
bool png_t::_is_defined_filter_method_t(png_t::filter_method_t v) {
    return png_t::_values_filter_method_t.find(v) != png_t::_values_filter_method_t.end();
}
const std::set<png_t::interlace_method_t> png_t::_values_interlace_method_t{
    png_t::INTERLACE_METHOD_NONE,
    png_t::INTERLACE_METHOD_ADAM7,
};
bool png_t::_is_defined_interlace_method_t(png_t::interlace_method_t v) {
    return png_t::_values_interlace_method_t.find(v) != png_t::_values_interlace_method_t.end();
}
const std::set<png_t::phys_unit_t> png_t::_values_phys_unit_t{
    png_t::PHYS_UNIT_UNKNOWN,
    png_t::PHYS_UNIT_METER,
};
bool png_t::_is_defined_phys_unit_t(png_t::phys_unit_t v) {
    return png_t::_values_phys_unit_t.find(v) != png_t::_values_phys_unit_t.end();
}

png_t::png_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_ihdr = nullptr;
    m_chunks = nullptr;
    _read();
}

void png_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(m_magic == std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x89\x50\x4E\x47\x0D\x0A\x1A\x0A", 8), m_magic, m__io, std::string("/seq/0"));
    }
    m_ihdr_len = m__io->read_u4be();
    if (!(m_ihdr_len == 13)) {
        throw kaitai::validation_not_equal_error<uint32_t>(13, m_ihdr_len, m__io, std::string("/seq/1"));
    }
    m_ihdr_type = m__io->read_bytes(4);
    if (!(m_ihdr_type == std::string("\x49\x48\x44\x52", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x49\x48\x44\x52", 4), m_ihdr_type, m__io, std::string("/seq/2"));
    }
    m_ihdr = std::unique_ptr<ihdr_chunk_t>(new ihdr_chunk_t(m__io, this, m__root));
    m_ihdr_crc = m__io->read_u4be();
    m_chunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_t>>>(new std::vector<std::unique_ptr<chunk_t>>());
    {
        int i = 0;
        chunk_t* _;
        do {
            _ = new chunk_t(m__io, this, m__root);
            m_chunks->push_back(std::move(std::unique_ptr<chunk_t>(_)));
            i++;
        } while (!( ((_->type() == std::string("IEND")) || (_io()->is_eof())) ));
    }
}

png_t::~png_t() {
    _clean_up();
}

void png_t::_clean_up() {
}

png_t::adobe_fireworks_chunk_t::adobe_fireworks_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::adobe_fireworks_chunk_t::_read() {
    m__raw_preview_data = m__io->read_bytes_full();
    m_preview_data = kaitai::kstream::process_zlib(m__raw_preview_data);
}

png_t::adobe_fireworks_chunk_t::~adobe_fireworks_chunk_t() {
    _clean_up();
}

void png_t::adobe_fireworks_chunk_t::_clean_up() {
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
const std::set<png_t::atch_chunk_t::compression_attach_methods_t> png_t::atch_chunk_t::_values_compression_attach_methods_t{
    png_t::atch_chunk_t::COMPRESSION_ATTACH_METHODS_NONE,
    png_t::atch_chunk_t::COMPRESSION_ATTACH_METHODS_ZLIB,
};
bool png_t::atch_chunk_t::_is_defined_compression_attach_methods_t(png_t::atch_chunk_t::compression_attach_methods_t v) {
    return png_t::atch_chunk_t::_values_compression_attach_methods_t.find(v) != png_t::atch_chunk_t::_values_compression_attach_methods_t.end();
}

png_t::atch_chunk_t::atch_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_data = false;
    _read();
}

void png_t::atch_chunk_t::_read() {
    m_file_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8");
    {
        std::string _ = m_file_name;
        if (!( ((_.length() != 0) && (_.substr(0, 1 - 0) != std::string("."))) )) {
            throw kaitai::validation_expr_error<std::string>(m_file_name, m__io, std::string("/types/atch_chunk/seq/0"));
        }
    }
    m_compression = static_cast<png_t::atch_chunk_t::compression_attach_methods_t>(m__io->read_u1());
    if (!png_t::atch_chunk_t::_is_defined_compression_attach_methods_t(m_compression)) {
        throw kaitai::validation_not_in_enum_error<png_t::atch_chunk_t::compression_attach_methods_t>(m_compression, m__io, std::string("/types/atch_chunk/seq/1"));
    }
    n_data_plain = true;
    if (compression() == png_t::atch_chunk_t::COMPRESSION_ATTACH_METHODS_NONE) {
        n_data_plain = false;
        m_data_plain = m__io->read_bytes_full();
    }
    n_data_zlib = true;
    if (compression() == png_t::atch_chunk_t::COMPRESSION_ATTACH_METHODS_ZLIB) {
        n_data_zlib = false;
        m__raw_data_zlib = m__io->read_bytes_full();
        m_data_zlib = kaitai::kstream::process_zlib(m__raw_data_zlib);
    }
}

png_t::atch_chunk_t::~atch_chunk_t() {
    _clean_up();
}

void png_t::atch_chunk_t::_clean_up() {
    if (!n_data_plain) {
    }
    if (!n_data_zlib) {
    }
}

std::string png_t::atch_chunk_t::data() {
    if (f_data)
        return m_data;
    f_data = true;
    m_data = ((compression() == png_t::atch_chunk_t::COMPRESSION_ATTACH_METHODS_NONE) ? (data_plain()) : (data_zlib()));
    return m_data;
}

png_t::bkgd_chunk_t::bkgd_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::bkgd_chunk_t::_read() {
    n_bkgd = true;
    switch (_root()->ihdr()->color_type()) {
    case png_t::COLOR_TYPE_GREYSCALE: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_greyscale_t>(new bkgd_greyscale_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_GREYSCALE_ALPHA: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_greyscale_t>(new bkgd_greyscale_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_INDEXED: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_indexed_t>(new bkgd_indexed_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_truecolor_t>(new bkgd_truecolor_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR_ALPHA: {
        n_bkgd = false;
        m_bkgd = std::unique_ptr<bkgd_truecolor_t>(new bkgd_truecolor_t(m__io, this, m__root));
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

png_t::chrm_chromaticity_t::chrm_chromaticity_t(kaitai::kstream* p__io, png_t::chrm_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_x = false;
    f_y = false;
    _read();
}

void png_t::chrm_chromaticity_t::_read() {
    m_x_int = m__io->read_u4be();
    m_y_int = m__io->read_u4be();
}

png_t::chrm_chromaticity_t::~chrm_chromaticity_t() {
    _clean_up();
}

void png_t::chrm_chromaticity_t::_clean_up() {
}

double png_t::chrm_chromaticity_t::x() {
    if (f_x)
        return m_x;
    f_x = true;
    m_x = x_int() / 100000.0;
    return m_x;
}

double png_t::chrm_chromaticity_t::y() {
    if (f_y)
        return m_y;
    f_y = true;
    m_y = y_int() / 100000.0;
    return m_y;
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
    m_white_point = std::unique_ptr<chrm_chromaticity_t>(new chrm_chromaticity_t(m__io, this, m__root));
    m_red = std::unique_ptr<chrm_chromaticity_t>(new chrm_chromaticity_t(m__io, this, m__root));
    m_green = std::unique_ptr<chrm_chromaticity_t>(new chrm_chromaticity_t(m__io, this, m__root));
    m_blue = std::unique_ptr<chrm_chromaticity_t>(new chrm_chromaticity_t(m__io, this, m__root));
}

png_t::chrm_chunk_t::~chrm_chunk_t() {
    _clean_up();
}

void png_t::chrm_chunk_t::_clean_up() {
}

png_t::chunk_t::chunk_t(kaitai::kstream* p__io, png_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    f_is_ancillary = false;
    f_is_private = false;
    f_is_safe_to_copy = false;
    f_reserved_bit = false;
    f_type = false;
    _read();
}

void png_t::chunk_t::_read() {
    m_len = m__io->read_u4be();
    m_type_raw = m__io->read_bytes(4);
    {
        std::string _ = m_type_raw;
        if (!( (( (( ((_.at(0) >= 65) && (_.at(0) <= 90)) ) || ( ((_.at(0) >= 97) && (_.at(0) <= 122)) )) ) && ( (( ((_.at(1) >= 65) && (_.at(1) <= 90)) ) || ( ((_.at(1) >= 97) && (_.at(1) <= 122)) )) ) && ( (( ((_.at(2) >= 65) && (_.at(2) <= 90)) ) || ( ((_.at(2) >= 97) && (_.at(2) <= 122)) )) ) && ( (( ((_.at(3) >= 65) && (_.at(3) <= 90)) ) || ( ((_.at(3) >= 97) && (_.at(3) <= 122)) )) )) )) {
            throw kaitai::validation_expr_error<std::string>(m_type_raw, m__io, std::string("/types/chunk/seq/1"));
        }
    }
    n_body = true;
    {
        std::string on = type();
        if (on == std::string("PLTE")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<plte_chunk_t>(new plte_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("acTL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<animation_control_chunk_t>(new animation_control_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("atCh")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<atch_chunk_t>(new atch_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("bKGD")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<bkgd_chunk_t>(new bkgd_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("cHRM")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<chrm_chunk_t>(new chrm_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("cICP")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<cicp_chunk_t>(new cicp_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("cLLI")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<clli_chunk_t>(new clli_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("eXIf")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<exif_chunk_t>(new exif_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("fcTL")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<frame_control_chunk_t>(new frame_control_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("fdAT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<frame_data_chunk_t>(new frame_data_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("gAMA")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<gama_chunk_t>(new gama_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("hIST")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<hist_chunk_t>(new hist_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("iCCP")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<iccp_chunk_t>(new iccp_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("iTXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<international_text_chunk_t>(new international_text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("mDCV")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<mdcv_chunk_t>(new mdcv_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("mkBS")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<adobe_fireworks_chunk_t>(new adobe_fireworks_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("mkTS")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<adobe_fireworks_chunk_t>(new adobe_fireworks_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("pHYs")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<phys_chunk_t>(new phys_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("prVW")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<adobe_fireworks_chunk_t>(new adobe_fireworks_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("sBIT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<sbit_chunk_t>(new sbit_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("sPLT")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<splt_chunk_t>(new splt_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("sRGB")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<srgb_chunk_t>(new srgb_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("skMf")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<evernote_skmf_chunk_t>(new evernote_skmf_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("skRf")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<evernote_skrf_chunk_t>(new evernote_skrf_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("tEXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<text_chunk_t>(new text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("tIME")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<time_chunk_t>(new time_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("tRNS")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<trns_chunk_t>(new trns_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else if (on == std::string("zTXt")) {
            n_body = false;
            m__raw_body = m__io->read_bytes(len());
            m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
            m_body = std::unique_ptr<compressed_text_chunk_t>(new compressed_text_chunk_t(m__io__raw_body.get(), this, m__root));
        }
        else {
            m__raw_body = m__io->read_bytes(len());
        }
    }
    m_crc = m__io->read_u4be();
}

png_t::chunk_t::~chunk_t() {
    _clean_up();
}

void png_t::chunk_t::_clean_up() {
    if (!n_body) {
    }
}

bool png_t::chunk_t::is_ancillary() {
    if (f_is_ancillary)
        return m_is_ancillary;
    f_is_ancillary = true;
    m_is_ancillary = (type_raw().at(0) & 32) != 0;
    return m_is_ancillary;
}

bool png_t::chunk_t::is_private() {
    if (f_is_private)
        return m_is_private;
    f_is_private = true;
    m_is_private = (type_raw().at(1) & 32) != 0;
    return m_is_private;
}

bool png_t::chunk_t::is_safe_to_copy() {
    if (f_is_safe_to_copy)
        return m_is_safe_to_copy;
    f_is_safe_to_copy = true;
    m_is_safe_to_copy = (type_raw().at(3) & 32) != 0;
    return m_is_safe_to_copy;
}

bool png_t::chunk_t::reserved_bit() {
    if (f_reserved_bit)
        return m_reserved_bit;
    f_reserved_bit = true;
    m_reserved_bit = (type_raw().at(2) & 32) != 0;
    return m_reserved_bit;
}

std::string png_t::chunk_t::type() {
    if (f_type)
        return m_type;
    f_type = true;
    m_type = kaitai::kstream::bytes_to_str(type_raw(), "ASCII");
    return m_type;
}

png_t::cicp_chunk_t::cicp_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::cicp_chunk_t::_read() {
    m_color_primaries = m__io->read_u1();
    m_transfer_function = m__io->read_u1();
    m_matrix_coefficients = m__io->read_u1();
    if (!(m_matrix_coefficients == 0)) {
        throw kaitai::validation_not_equal_error<uint8_t>(0, m_matrix_coefficients, m__io, std::string("/types/cicp_chunk/seq/2"));
    }
    m_video_full_range_flag = m__io->read_u1();
    if (!( ((m_video_full_range_flag == 0) || (m_video_full_range_flag == 1)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(m_video_full_range_flag, m__io, std::string("/types/cicp_chunk/seq/3"));
    }
}

png_t::cicp_chunk_t::~cicp_chunk_t() {
    _clean_up();
}

void png_t::cicp_chunk_t::_clean_up() {
}

png_t::clli_chunk_t::clli_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_max_content_light_level = false;
    f_max_frame_average_light_level = false;
    _read();
}

void png_t::clli_chunk_t::_read() {
    m_max_content_light_level_int = m__io->read_u4be();
    m_max_frame_average_light_level_int = m__io->read_u4be();
}

png_t::clli_chunk_t::~clli_chunk_t() {
    _clean_up();
}

void png_t::clli_chunk_t::_clean_up() {
}

double png_t::clli_chunk_t::max_content_light_level() {
    if (f_max_content_light_level)
        return m_max_content_light_level;
    f_max_content_light_level = true;
    m_max_content_light_level = max_content_light_level_int() * 0.0001;
    return m_max_content_light_level;
}

double png_t::clli_chunk_t::max_frame_average_light_level() {
    if (f_max_frame_average_light_level)
        return m_max_frame_average_light_level;
    f_max_frame_average_light_level = true;
    m_max_frame_average_light_level = max_frame_average_light_level_int() * 0.0001;
    return m_max_frame_average_light_level;
}

png_t::compressed_text_t::compressed_text_t(kaitai::kstream* p__io, png_t::compressed_text_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::compressed_text_t::_read() {
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "ISO-8859-1");
}

png_t::compressed_text_t::~compressed_text_t() {
    _clean_up();
}

void png_t::compressed_text_t::_clean_up() {
}

png_t::compressed_text_chunk_t::compressed_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_text = nullptr;
    m__io__raw_text = nullptr;
    _read();
}

void png_t::compressed_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ISO-8859-1");
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    if (!(m_compression_method == png_t::COMPRESSION_METHODS_ZLIB)) {
        throw kaitai::validation_not_equal_error<png_t::compression_methods_t>(png_t::COMPRESSION_METHODS_ZLIB, m_compression_method, m__io, std::string("/types/compressed_text_chunk/seq/1"));
    }
    m__raw__raw_text = m__io->read_bytes_full();
    m__raw_text = kaitai::kstream::process_zlib(m__raw__raw_text);
    m__io__raw_text = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_text));
    m_text = std::unique_ptr<compressed_text_t>(new compressed_text_t(m__io__raw_text.get(), this, m__root));
}

png_t::compressed_text_chunk_t::~compressed_text_chunk_t() {
    _clean_up();
}

void png_t::compressed_text_chunk_t::_clean_up() {
}

png_t::evernote_skmf_chunk_t::evernote_skmf_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::evernote_skmf_chunk_t::_read() {
    m_json = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

png_t::evernote_skmf_chunk_t::~evernote_skmf_chunk_t() {
    _clean_up();
}

void png_t::evernote_skmf_chunk_t::_clean_up() {
}

png_t::evernote_skrf_chunk_t::evernote_skrf_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::evernote_skrf_chunk_t::_read() {
    m_uuid = m__io->read_bytes(16);
    m_orig_img = m__io->read_bytes_full();
}

png_t::evernote_skrf_chunk_t::~evernote_skrf_chunk_t() {
    _clean_up();
}

void png_t::evernote_skrf_chunk_t::_clean_up() {
}

png_t::exif_chunk_t::exif_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_exif = nullptr;
    _read();
}

void png_t::exif_chunk_t::_read() {
    m_exif = std::unique_ptr<exif_t>(new exif_t(m__io));
}

png_t::exif_chunk_t::~exif_chunk_t() {
    _clean_up();
}

void png_t::exif_chunk_t::_clean_up() {
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
    if (!(m_width >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_width, m__io, std::string("/types/frame_control_chunk/seq/1"));
    }
    if (!(m_width <= _root()->ihdr()->width())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->width(), m_width, m__io, std::string("/types/frame_control_chunk/seq/1"));
    }
    m_height = m__io->read_u4be();
    if (!(m_height >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_height, m__io, std::string("/types/frame_control_chunk/seq/2"));
    }
    if (!(m_height <= _root()->ihdr()->height())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->height(), m_height, m__io, std::string("/types/frame_control_chunk/seq/2"));
    }
    m_x_offset = m__io->read_u4be();
    if (!(m_x_offset <= _root()->ihdr()->width() - width())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->width() - width(), m_x_offset, m__io, std::string("/types/frame_control_chunk/seq/3"));
    }
    m_y_offset = m__io->read_u4be();
    if (!(m_y_offset <= _root()->ihdr()->height() - height())) {
        throw kaitai::validation_greater_than_error<uint32_t>(_root()->ihdr()->height() - height(), m_y_offset, m__io, std::string("/types/frame_control_chunk/seq/4"));
    }
    m_delay_num = m__io->read_u2be();
    m_delay_den = m__io->read_u2be();
    m_dispose_op = static_cast<png_t::dispose_op_values_t>(m__io->read_u1());
    if (!png_t::_is_defined_dispose_op_values_t(m_dispose_op)) {
        throw kaitai::validation_not_in_enum_error<png_t::dispose_op_values_t>(m_dispose_op, m__io, std::string("/types/frame_control_chunk/seq/7"));
    }
    m_blend_op = static_cast<png_t::blend_op_values_t>(m__io->read_u1());
    if (!png_t::_is_defined_blend_op_values_t(m_blend_op)) {
        throw kaitai::validation_not_in_enum_error<png_t::blend_op_values_t>(m_blend_op, m__io, std::string("/types/frame_control_chunk/seq/8"));
    }
}

png_t::frame_control_chunk_t::~frame_control_chunk_t() {
    _clean_up();
}

void png_t::frame_control_chunk_t::_clean_up() {
}

double png_t::frame_control_chunk_t::delay() {
    if (f_delay)
        return m_delay;
    f_delay = true;
    m_delay = delay_num() / ((delay_den() == 0) ? (100.0) : (delay_den()));
    return m_delay;
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

png_t::gama_chunk_t::gama_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_gamma = false;
    f_inv_gamma = false;
    _read();
}

void png_t::gama_chunk_t::_read() {
    m_gamma_int = m__io->read_u4be();
    {
        uint32_t _ = m_gamma_int;
        if (!(_ != 0)) {
            throw kaitai::validation_expr_error<uint32_t>(m_gamma_int, m__io, std::string("/types/gama_chunk/seq/0"));
        }
    }
}

png_t::gama_chunk_t::~gama_chunk_t() {
    _clean_up();
}

void png_t::gama_chunk_t::_clean_up() {
}

double png_t::gama_chunk_t::gamma() {
    if (f_gamma)
        return m_gamma;
    f_gamma = true;
    m_gamma = gamma_int() / 100000.0;
    return m_gamma;
}

double png_t::gama_chunk_t::inv_gamma() {
    if (f_inv_gamma)
        return m_inv_gamma;
    f_inv_gamma = true;
    m_inv_gamma = 100000.0 / gamma_int();
    return m_inv_gamma;
}

png_t::hist_chunk_t::hist_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_usage_freqs = nullptr;
    _read();
}

void png_t::hist_chunk_t::_read() {
    m_usage_freqs = std::unique_ptr<std::vector<uint16_t>>(new std::vector<uint16_t>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_usage_freqs->push_back(std::move(m__io->read_u2be()));
            i++;
        }
    }
}

png_t::hist_chunk_t::~hist_chunk_t() {
    _clean_up();
}

void png_t::hist_chunk_t::_clean_up() {
}

png_t::iccp_chunk_t::iccp_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_profile = nullptr;
    m__io__raw_profile = nullptr;
    _read();
}

void png_t::iccp_chunk_t::_read() {
    m_profile_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ISO-8859-1");
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    if (!(m_compression_method == png_t::COMPRESSION_METHODS_ZLIB)) {
        throw kaitai::validation_not_equal_error<png_t::compression_methods_t>(png_t::COMPRESSION_METHODS_ZLIB, m_compression_method, m__io, std::string("/types/iccp_chunk/seq/1"));
    }
    m__raw__raw_profile = m__io->read_bytes_full();
    m__raw_profile = kaitai::kstream::process_zlib(m__raw__raw_profile);
    m__io__raw_profile = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_profile));
    m_profile = std::unique_ptr<icc_4_t>(new icc_4_t(m__io__raw_profile.get()));
}

png_t::iccp_chunk_t::~iccp_chunk_t() {
    _clean_up();
}

void png_t::iccp_chunk_t::_clean_up() {
}

png_t::ihdr_chunk_t::ihdr_chunk_t(kaitai::kstream* p__io, png_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::ihdr_chunk_t::_read() {
    m_width = m__io->read_u4be();
    if (!(m_width >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_width, m__io, std::string("/types/ihdr_chunk/seq/0"));
    }
    m_height = m__io->read_u4be();
    if (!(m_height >= 1)) {
        throw kaitai::validation_less_than_error<uint32_t>(1, m_height, m__io, std::string("/types/ihdr_chunk/seq/1"));
    }
    m_bit_depth = m__io->read_u1();
    if (!( ((m_bit_depth == 1) || (m_bit_depth == 2) || (m_bit_depth == 4) || (m_bit_depth == 8) || (m_bit_depth == 16)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(m_bit_depth, m__io, std::string("/types/ihdr_chunk/seq/2"));
    }
    m_color_type = static_cast<png_t::color_type_t>(m__io->read_u1());
    if (!png_t::_is_defined_color_type_t(m_color_type)) {
        throw kaitai::validation_not_in_enum_error<png_t::color_type_t>(m_color_type, m__io, std::string("/types/ihdr_chunk/seq/3"));
    }
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    if (!png_t::_is_defined_compression_methods_t(m_compression_method)) {
        throw kaitai::validation_not_in_enum_error<png_t::compression_methods_t>(m_compression_method, m__io, std::string("/types/ihdr_chunk/seq/4"));
    }
    m_filter_method = static_cast<png_t::filter_method_t>(m__io->read_u1());
    if (!png_t::_is_defined_filter_method_t(m_filter_method)) {
        throw kaitai::validation_not_in_enum_error<png_t::filter_method_t>(m_filter_method, m__io, std::string("/types/ihdr_chunk/seq/5"));
    }
    m_interlace_method = static_cast<png_t::interlace_method_t>(m__io->read_u1());
    if (!png_t::_is_defined_interlace_method_t(m_interlace_method)) {
        throw kaitai::validation_not_in_enum_error<png_t::interlace_method_t>(m_interlace_method, m__io, std::string("/types/ihdr_chunk/seq/6"));
    }
}

png_t::ihdr_chunk_t::~ihdr_chunk_t() {
    _clean_up();
}

void png_t::ihdr_chunk_t::_clean_up() {
}

png_t::international_text_t::international_text_t(kaitai::kstream* p__io, png_t::international_text_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::international_text_t::_read() {
    m_value = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "UTF-8");
}

png_t::international_text_t::~international_text_t() {
    _clean_up();
}

void png_t::international_text_t::_clean_up() {
}

png_t::international_text_chunk_t::international_text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_text_plain = nullptr;
    m__io__raw_text_plain = nullptr;
    m_text_zlib = nullptr;
    m__io__raw_text_zlib = nullptr;
    f_text = false;
    _read();
}

void png_t::international_text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ISO-8859-1");
    m_compression_flag = m__io->read_u1();
    if (!( ((m_compression_flag == 0) || (m_compression_flag == 1)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(m_compression_flag, m__io, std::string("/types/international_text_chunk/seq/1"));
    }
    m_compression_method = static_cast<png_t::compression_methods_t>(m__io->read_u1());
    if (!(m_compression_method == ((compression_flag() == 1) ? (png_t::COMPRESSION_METHODS_ZLIB) : (compression_method())))) {
        throw kaitai::validation_not_equal_error<png_t::compression_methods_t>(((compression_flag() == 1) ? (png_t::COMPRESSION_METHODS_ZLIB) : (compression_method())), m_compression_method, m__io, std::string("/types/international_text_chunk/seq/2"));
    }
    m_language_tag = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ASCII");
    m_translated_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "UTF-8");
    n_text_plain = true;
    if (compression_flag() == 0) {
        n_text_plain = false;
        m__raw_text_plain = m__io->read_bytes_full();
        m__io__raw_text_plain = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_text_plain));
        m_text_plain = std::unique_ptr<international_text_t>(new international_text_t(m__io__raw_text_plain.get(), this, m__root));
    }
    n_text_zlib = true;
    if (compression_flag() == 1) {
        n_text_zlib = false;
        m__raw__raw_text_zlib = m__io->read_bytes_full();
        m__raw_text_zlib = kaitai::kstream::process_zlib(m__raw__raw_text_zlib);
        m__io__raw_text_zlib = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_text_zlib));
        m_text_zlib = std::unique_ptr<international_text_t>(new international_text_t(m__io__raw_text_zlib.get(), this, m__root));
    }
}

png_t::international_text_chunk_t::~international_text_chunk_t() {
    _clean_up();
}

void png_t::international_text_chunk_t::_clean_up() {
    if (!n_text_plain) {
    }
    if (!n_text_zlib) {
    }
}

std::string png_t::international_text_chunk_t::text() {
    if (f_text)
        return m_text;
    f_text = true;
    m_text = ((compression_flag() == 0) ? (text_plain()) : (text_zlib()))->value();
    return m_text;
}

png_t::mdcv_chromaticity_t::mdcv_chromaticity_t(kaitai::kstream* p__io, png_t::mdcv_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_x = false;
    f_y = false;
    _read();
}

void png_t::mdcv_chromaticity_t::_read() {
    m_x_int = m__io->read_u2be();
    m_y_int = m__io->read_u2be();
}

png_t::mdcv_chromaticity_t::~mdcv_chromaticity_t() {
    _clean_up();
}

void png_t::mdcv_chromaticity_t::_clean_up() {
}

double png_t::mdcv_chromaticity_t::x() {
    if (f_x)
        return m_x;
    f_x = true;
    m_x = x_int() * 0.00002;
    return m_x;
}

double png_t::mdcv_chromaticity_t::y() {
    if (f_y)
        return m_y;
    f_y = true;
    m_y = y_int() * 0.00002;
    return m_y;
}

png_t::mdcv_chunk_t::mdcv_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_red = nullptr;
    m_green = nullptr;
    m_blue = nullptr;
    m_white_point = nullptr;
    f_max_luminance = false;
    f_min_luminance = false;
    _read();
}

void png_t::mdcv_chunk_t::_read() {
    m_red = std::unique_ptr<mdcv_chromaticity_t>(new mdcv_chromaticity_t(m__io, this, m__root));
    m_green = std::unique_ptr<mdcv_chromaticity_t>(new mdcv_chromaticity_t(m__io, this, m__root));
    m_blue = std::unique_ptr<mdcv_chromaticity_t>(new mdcv_chromaticity_t(m__io, this, m__root));
    m_white_point = std::unique_ptr<mdcv_chromaticity_t>(new mdcv_chromaticity_t(m__io, this, m__root));
    m_max_luminance_int = m__io->read_u4be();
    m_min_luminance_int = m__io->read_u4be();
}

png_t::mdcv_chunk_t::~mdcv_chunk_t() {
    _clean_up();
}

void png_t::mdcv_chunk_t::_clean_up() {
}

double png_t::mdcv_chunk_t::max_luminance() {
    if (f_max_luminance)
        return m_max_luminance;
    f_max_luminance = true;
    m_max_luminance = max_luminance_int() * 0.0001;
    return m_max_luminance;
}

double png_t::mdcv_chunk_t::min_luminance() {
    if (f_min_luminance)
        return m_min_luminance;
    f_min_luminance = true;
    m_min_luminance = min_luminance_int() * 0.0001;
    return m_min_luminance;
}

png_t::phys_chunk_t::phys_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_dots_per_inch_x = false;
    f_dots_per_inch_y = false;
    _read();
}

void png_t::phys_chunk_t::_read() {
    m_pixels_per_unit_x = m__io->read_u4be();
    m_pixels_per_unit_y = m__io->read_u4be();
    m_unit = static_cast<png_t::phys_unit_t>(m__io->read_u1());
    if (!png_t::_is_defined_phys_unit_t(m_unit)) {
        throw kaitai::validation_not_in_enum_error<png_t::phys_unit_t>(m_unit, m__io, std::string("/types/phys_chunk/seq/2"));
    }
}

png_t::phys_chunk_t::~phys_chunk_t() {
    _clean_up();
}

void png_t::phys_chunk_t::_clean_up() {
}

double png_t::phys_chunk_t::dots_per_inch_x() {
    if (f_dots_per_inch_x)
        return m_dots_per_inch_x;
    f_dots_per_inch_x = true;
    n_dots_per_inch_x = true;
    if (unit() == png_t::PHYS_UNIT_METER) {
        n_dots_per_inch_x = false;
        m_dots_per_inch_x = pixels_per_unit_x() * 0.0254;
    }
    return m_dots_per_inch_x;
}

double png_t::phys_chunk_t::dots_per_inch_y() {
    if (f_dots_per_inch_y)
        return m_dots_per_inch_y;
    f_dots_per_inch_y = true;
    n_dots_per_inch_y = true;
    if (unit() == png_t::PHYS_UNIT_METER) {
        n_dots_per_inch_y = false;
        m_dots_per_inch_y = pixels_per_unit_y() * 0.0254;
    }
    return m_dots_per_inch_y;
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

png_t::sbit_chunk_t::sbit_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_sample_depth = false;
    _read();
}

void png_t::sbit_chunk_t::_read() {
    n_significant_bits = true;
    switch (_root()->ihdr()->color_type()) {
    case png_t::COLOR_TYPE_GREYSCALE: {
        n_significant_bits = false;
        m_significant_bits = std::unique_ptr<sbit_greyscale_t>(new sbit_greyscale_t(false, m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_GREYSCALE_ALPHA: {
        n_significant_bits = false;
        m_significant_bits = std::unique_ptr<sbit_greyscale_t>(new sbit_greyscale_t(true, m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_INDEXED: {
        n_significant_bits = false;
        m_significant_bits = std::unique_ptr<sbit_truecolor_t>(new sbit_truecolor_t(false, m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR: {
        n_significant_bits = false;
        m_significant_bits = std::unique_ptr<sbit_truecolor_t>(new sbit_truecolor_t(false, m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR_ALPHA: {
        n_significant_bits = false;
        m_significant_bits = std::unique_ptr<sbit_truecolor_t>(new sbit_truecolor_t(true, m__io, this, m__root));
        break;
    }
    }
}

png_t::sbit_chunk_t::~sbit_chunk_t() {
    _clean_up();
}

void png_t::sbit_chunk_t::_clean_up() {
    if (!n_significant_bits) {
    }
}

uint8_t png_t::sbit_chunk_t::sample_depth() {
    if (f_sample_depth)
        return m_sample_depth;
    f_sample_depth = true;
    m_sample_depth = ((_root()->ihdr()->color_type() == png_t::COLOR_TYPE_INDEXED) ? (8) : (_root()->ihdr()->bit_depth()));
    return m_sample_depth;
}

png_t::sbit_greyscale_t::sbit_greyscale_t(bool p_has_alpha, kaitai::kstream* p__io, png_t::sbit_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_alpha = p_has_alpha;
    _read();
}

void png_t::sbit_greyscale_t::_read() {
    m_grey = m__io->read_u1();
    if (!(m_grey >= 1)) {
        throw kaitai::validation_less_than_error<uint8_t>(1, m_grey, m__io, std::string("/types/sbit_greyscale/seq/0"));
    }
    if (!(m_grey <= _parent()->sample_depth())) {
        throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_grey, m__io, std::string("/types/sbit_greyscale/seq/0"));
    }
    n_alpha = true;
    if (has_alpha()) {
        n_alpha = false;
        m_alpha = m__io->read_u1();
        if (!(m_alpha >= 1)) {
            throw kaitai::validation_less_than_error<uint8_t>(1, m_alpha, m__io, std::string("/types/sbit_greyscale/seq/1"));
        }
        if (!(m_alpha <= _parent()->sample_depth())) {
            throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_alpha, m__io, std::string("/types/sbit_greyscale/seq/1"));
        }
    }
}

png_t::sbit_greyscale_t::~sbit_greyscale_t() {
    _clean_up();
}

void png_t::sbit_greyscale_t::_clean_up() {
    if (!n_alpha) {
    }
}

png_t::sbit_truecolor_t::sbit_truecolor_t(bool p_has_alpha, kaitai::kstream* p__io, png_t::sbit_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_has_alpha = p_has_alpha;
    _read();
}

void png_t::sbit_truecolor_t::_read() {
    m_red = m__io->read_u1();
    if (!(m_red >= 1)) {
        throw kaitai::validation_less_than_error<uint8_t>(1, m_red, m__io, std::string("/types/sbit_truecolor/seq/0"));
    }
    if (!(m_red <= _parent()->sample_depth())) {
        throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_red, m__io, std::string("/types/sbit_truecolor/seq/0"));
    }
    m_green = m__io->read_u1();
    if (!(m_green >= 1)) {
        throw kaitai::validation_less_than_error<uint8_t>(1, m_green, m__io, std::string("/types/sbit_truecolor/seq/1"));
    }
    if (!(m_green <= _parent()->sample_depth())) {
        throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_green, m__io, std::string("/types/sbit_truecolor/seq/1"));
    }
    m_blue = m__io->read_u1();
    if (!(m_blue >= 1)) {
        throw kaitai::validation_less_than_error<uint8_t>(1, m_blue, m__io, std::string("/types/sbit_truecolor/seq/2"));
    }
    if (!(m_blue <= _parent()->sample_depth())) {
        throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_blue, m__io, std::string("/types/sbit_truecolor/seq/2"));
    }
    n_alpha = true;
    if (has_alpha()) {
        n_alpha = false;
        m_alpha = m__io->read_u1();
        if (!(m_alpha >= 1)) {
            throw kaitai::validation_less_than_error<uint8_t>(1, m_alpha, m__io, std::string("/types/sbit_truecolor/seq/3"));
        }
        if (!(m_alpha <= _parent()->sample_depth())) {
            throw kaitai::validation_greater_than_error<uint8_t>(_parent()->sample_depth(), m_alpha, m__io, std::string("/types/sbit_truecolor/seq/3"));
        }
    }
}

png_t::sbit_truecolor_t::~sbit_truecolor_t() {
    _clean_up();
}

void png_t::sbit_truecolor_t::_clean_up() {
    if (!n_alpha) {
    }
}

png_t::splt_chunk_t::splt_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void png_t::splt_chunk_t::_read() {
    m_palette_name = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ISO-8859-1");
    m_sample_depth = m__io->read_u1();
    if (!( ((m_sample_depth == 8) || (m_sample_depth == 16)) )) {
        throw kaitai::validation_not_any_of_error<uint8_t>(m_sample_depth, m__io, std::string("/types/splt_chunk/seq/1"));
    }
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<splt_entry_t>>>(new std::vector<std::unique_ptr<splt_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<splt_entry_t>(new splt_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

png_t::splt_chunk_t::~splt_chunk_t() {
    _clean_up();
}

void png_t::splt_chunk_t::_clean_up() {
}

png_t::splt_entry_t::splt_entry_t(kaitai::kstream* p__io, png_t::splt_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::splt_entry_t::_read() {
    switch (_parent()->sample_depth()) {
    case 8: {
        m_red = m__io->read_u1();
        break;
    }
    default: {
        m_red = m__io->read_u2be();
        break;
    }
    }
    switch (_parent()->sample_depth()) {
    case 8: {
        m_green = m__io->read_u1();
        break;
    }
    default: {
        m_green = m__io->read_u2be();
        break;
    }
    }
    switch (_parent()->sample_depth()) {
    case 8: {
        m_blue = m__io->read_u1();
        break;
    }
    default: {
        m_blue = m__io->read_u2be();
        break;
    }
    }
    switch (_parent()->sample_depth()) {
    case 8: {
        m_alpha = m__io->read_u1();
        break;
    }
    default: {
        m_alpha = m__io->read_u2be();
        break;
    }
    }
    m_freq = m__io->read_u2be();
}

png_t::splt_entry_t::~splt_entry_t() {
    _clean_up();
}

void png_t::splt_entry_t::_clean_up() {
}
const std::set<png_t::srgb_chunk_t::intent_t> png_t::srgb_chunk_t::_values_intent_t{
    png_t::srgb_chunk_t::INTENT_PERCEPTUAL,
    png_t::srgb_chunk_t::INTENT_RELATIVE_COLORIMETRIC,
    png_t::srgb_chunk_t::INTENT_SATURATION,
    png_t::srgb_chunk_t::INTENT_ABSOLUTE_COLORIMETRIC,
};
bool png_t::srgb_chunk_t::_is_defined_intent_t(png_t::srgb_chunk_t::intent_t v) {
    return png_t::srgb_chunk_t::_values_intent_t.find(v) != png_t::srgb_chunk_t::_values_intent_t.end();
}

png_t::srgb_chunk_t::srgb_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::srgb_chunk_t::_read() {
    m_render_intent = static_cast<png_t::srgb_chunk_t::intent_t>(m__io->read_u1());
    if (!png_t::srgb_chunk_t::_is_defined_intent_t(m_render_intent)) {
        throw kaitai::validation_not_in_enum_error<png_t::srgb_chunk_t::intent_t>(m_render_intent, m__io, std::string("/types/srgb_chunk/seq/0"));
    }
}

png_t::srgb_chunk_t::~srgb_chunk_t() {
    _clean_up();
}

void png_t::srgb_chunk_t::_clean_up() {
}

png_t::text_chunk_t::text_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void png_t::text_chunk_t::_read() {
    m_keyword = kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), "ISO-8859-1");
    m_text = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), "ISO-8859-1");
}

png_t::text_chunk_t::~text_chunk_t() {
    _clean_up();
}

void png_t::text_chunk_t::_clean_up() {
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

png_t::trns_chunk_t::trns_chunk_t(kaitai::kstream* p__io, png_t::chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_palette_alphas = nullptr;
    f_sample_mask = false;
    _read();
}

void png_t::trns_chunk_t::_read() {
    n_palette_alphas = true;
    if (_root()->ihdr()->color_type() == png_t::COLOR_TYPE_INDEXED) {
        n_palette_alphas = false;
        m_palette_alphas = std::unique_ptr<std::vector<uint8_t>>(new std::vector<uint8_t>());
        {
            int i = 0;
            while (!m__io->is_eof()) {
                m_palette_alphas->push_back(std::move(m__io->read_u1()));
                i++;
            }
        }
    }
    n_transparent_color = true;
    switch (_root()->ihdr()->color_type()) {
    case png_t::COLOR_TYPE_GREYSCALE: {
        n_transparent_color = false;
        m_transparent_color = std::unique_ptr<trns_greyscale_color_t>(new trns_greyscale_color_t(m__io, this, m__root));
        break;
    }
    case png_t::COLOR_TYPE_TRUECOLOR: {
        n_transparent_color = false;
        m_transparent_color = std::unique_ptr<trns_truecolor_color_t>(new trns_truecolor_color_t(m__io, this, m__root));
        break;
    }
    }
}

png_t::trns_chunk_t::~trns_chunk_t() {
    _clean_up();
}

void png_t::trns_chunk_t::_clean_up() {
    if (!n_palette_alphas) {
    }
    if (!n_transparent_color) {
    }
}

int32_t png_t::trns_chunk_t::sample_mask() {
    if (f_sample_mask)
        return m_sample_mask;
    f_sample_mask = true;
    m_sample_mask = (1 << _root()->ihdr()->bit_depth()) - 1;
    return m_sample_mask;
}

png_t::trns_greyscale_color_t::trns_greyscale_color_t(kaitai::kstream* p__io, png_t::trns_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_grey = false;
    _read();
}

void png_t::trns_greyscale_color_t::_read() {
    m_grey_raw = m__io->read_u2be();
}

png_t::trns_greyscale_color_t::~trns_greyscale_color_t() {
    _clean_up();
}

void png_t::trns_greyscale_color_t::_clean_up() {
}

int32_t png_t::trns_greyscale_color_t::grey() {
    if (f_grey)
        return m_grey;
    f_grey = true;
    m_grey = grey_raw() & _parent()->sample_mask();
    return m_grey;
}

png_t::trns_truecolor_color_t::trns_truecolor_color_t(kaitai::kstream* p__io, png_t::trns_chunk_t* p__parent, png_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    f_blue = false;
    f_green = false;
    f_red = false;
    _read();
}

void png_t::trns_truecolor_color_t::_read() {
    m_red_raw = m__io->read_u2be();
    m_green_raw = m__io->read_u2be();
    m_blue_raw = m__io->read_u2be();
}

png_t::trns_truecolor_color_t::~trns_truecolor_color_t() {
    _clean_up();
}

void png_t::trns_truecolor_color_t::_clean_up() {
}

int32_t png_t::trns_truecolor_color_t::blue() {
    if (f_blue)
        return m_blue;
    f_blue = true;
    m_blue = blue_raw() & _parent()->sample_mask();
    return m_blue;
}

int32_t png_t::trns_truecolor_color_t::green() {
    if (f_green)
        return m_green;
    f_green = true;
    m_green = green_raw() & _parent()->sample_mask();
    return m_green;
}

int32_t png_t::trns_truecolor_color_t::red() {
    if (f_red)
        return m_red;
    f_red = true;
    m_red = red_raw() & _parent()->sample_mask();
    return m_red;
}
