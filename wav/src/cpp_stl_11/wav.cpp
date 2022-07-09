// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "wav.h"
#include "kaitai/exceptions.h"

wav_t::wav_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_chunk = nullptr;
    m_subchunks = nullptr;
    m_parent_chunk_data = nullptr;
    f_subchunks = false;
    f_parent_chunk_data = false;
    f_is_form_type_wave = false;
    f_is_riff_chunk = false;
    f_chunk_id = false;
    f_form_type = false;
    _read();
}

void wav_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io, this, m__root));
}

wav_t::~wav_t() {
    _clean_up();
}

void wav_t::_clean_up() {
    if (f_subchunks && !n_subchunks) {
    }
    if (f_parent_chunk_data && !n_parent_chunk_data) {
    }
}

wav_t::sample_type_t::sample_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::sample_type_t::_read() {
    m_sample = m__io->read_u2le();
}

wav_t::sample_type_t::~sample_type_t() {
    _clean_up();
}

void wav_t::sample_type_t::_clean_up() {
}

wav_t::format_chunk_type_t::format_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_channel_mask_and_subformat = nullptr;
    f_is_extensible = false;
    f_is_basic_pcm = false;
    f_is_basic_float = false;
    f_is_cb_size_meaningful = false;
    _read();
}

void wav_t::format_chunk_type_t::_read() {
    m_w_format_tag = static_cast<wav_t::w_format_tag_type_t>(m__io->read_u2le());
    m_n_channels = m__io->read_u2le();
    m_n_samples_per_sec = m__io->read_u4le();
    m_n_avg_bytes_per_sec = m__io->read_u4le();
    m_n_block_align = m__io->read_u2le();
    m_w_bits_per_sample = m__io->read_u2le();
    n_cb_size = true;
    if (!(is_basic_pcm())) {
        n_cb_size = false;
        m_cb_size = m__io->read_u2le();
    }
    n_w_valid_bits_per_sample = true;
    if (is_cb_size_meaningful()) {
        n_w_valid_bits_per_sample = false;
        m_w_valid_bits_per_sample = m__io->read_u2le();
    }
    n_channel_mask_and_subformat = true;
    if (is_extensible()) {
        n_channel_mask_and_subformat = false;
        m_channel_mask_and_subformat = std::unique_ptr<channel_mask_and_subformat_type_t>(new channel_mask_and_subformat_type_t(m__io, this, m__root));
    }
}

wav_t::format_chunk_type_t::~format_chunk_type_t() {
    _clean_up();
}

void wav_t::format_chunk_type_t::_clean_up() {
    if (!n_cb_size) {
    }
    if (!n_w_valid_bits_per_sample) {
    }
    if (!n_channel_mask_and_subformat) {
    }
}

bool wav_t::format_chunk_type_t::is_extensible() {
    if (f_is_extensible)
        return m_is_extensible;
    m_is_extensible = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_EXTENSIBLE;
    f_is_extensible = true;
    return m_is_extensible;
}

bool wav_t::format_chunk_type_t::is_basic_pcm() {
    if (f_is_basic_pcm)
        return m_is_basic_pcm;
    m_is_basic_pcm = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_PCM;
    f_is_basic_pcm = true;
    return m_is_basic_pcm;
}

bool wav_t::format_chunk_type_t::is_basic_float() {
    if (f_is_basic_float)
        return m_is_basic_float;
    m_is_basic_float = w_format_tag() == wav_t::W_FORMAT_TAG_TYPE_IEEE_FLOAT;
    f_is_basic_float = true;
    return m_is_basic_float;
}

bool wav_t::format_chunk_type_t::is_cb_size_meaningful() {
    if (f_is_cb_size_meaningful)
        return m_is_cb_size_meaningful;
    m_is_cb_size_meaningful =  ((!(is_basic_pcm())) && (cb_size() != 0)) ;
    f_is_cb_size_meaningful = true;
    return m_is_cb_size_meaningful;
}

wav_t::pmx_chunk_type_t::pmx_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::pmx_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

wav_t::pmx_chunk_type_t::~pmx_chunk_type_t() {
    _clean_up();
}

void wav_t::pmx_chunk_type_t::_clean_up() {
}

wav_t::fact_chunk_type_t::fact_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::fact_chunk_type_t::_read() {
    m_num_samples_per_channel = m__io->read_u4le();
}

wav_t::fact_chunk_type_t::~fact_chunk_type_t() {
    _clean_up();
}

void wav_t::fact_chunk_type_t::_clean_up() {
}

wav_t::guid_type_t::guid_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::guid_type_t::_read() {
    m_data1 = m__io->read_u4le();
    m_data2 = m__io->read_u2le();
    m_data3 = m__io->read_u2le();
    m_data4 = m__io->read_u4be();
    m_data4a = m__io->read_u4be();
}

wav_t::guid_type_t::~guid_type_t() {
    _clean_up();
}

void wav_t::guid_type_t::_clean_up() {
}

wav_t::ixml_chunk_type_t::ixml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::ixml_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

wav_t::ixml_chunk_type_t::~ixml_chunk_type_t() {
    _clean_up();
}

void wav_t::ixml_chunk_type_t::_clean_up() {
}

wav_t::info_chunk_type_t::info_chunk_type_t(kaitai::kstream* p__io, wav_t::list_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_data = false;
    _read();
}

void wav_t::info_chunk_type_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io, this, m__root));
}

wav_t::info_chunk_type_t::~info_chunk_type_t() {
    _clean_up();
}

void wav_t::info_chunk_type_t::_clean_up() {
    if (f_chunk_data) {
    }
}

std::string wav_t::info_chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data;
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_chunk_data = kaitai::kstream::bytes_to_str(io->read_bytes_term(0, false, true, true), std::string("ASCII"));
    io->seek(_pos);
    f_chunk_data = true;
    return m_chunk_data;
}

wav_t::cue_point_type_t::cue_point_type_t(kaitai::kstream* p__io, wav_t::cue_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::cue_point_type_t::_read() {
    m_dw_name = m__io->read_u4le();
    m_dw_position = m__io->read_u4le();
    m_fcc_chunk = m__io->read_u4le();
    m_dw_chunk_start = m__io->read_u4le();
    m_dw_block_start = m__io->read_u4le();
    m_dw_sample_offset = m__io->read_u4le();
}

wav_t::cue_point_type_t::~cue_point_type_t() {
    _clean_up();
}

void wav_t::cue_point_type_t::_clean_up() {
}

wav_t::data_chunk_type_t::data_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::data_chunk_type_t::_read() {
    m_data = m__io->read_bytes_full();
}

wav_t::data_chunk_type_t::~data_chunk_type_t() {
    _clean_up();
}

void wav_t::data_chunk_type_t::_clean_up() {
}

wav_t::samples_type_t::samples_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::samples_type_t::_read() {
    m_samples = m__io->read_u4le();
}

wav_t::samples_type_t::~samples_type_t() {
    _clean_up();
}

void wav_t::samples_type_t::_clean_up() {
}

wav_t::channel_mask_and_subformat_type_t::channel_mask_and_subformat_type_t(kaitai::kstream* p__io, wav_t::format_chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_dw_channel_mask = nullptr;
    m_subformat = nullptr;
    _read();
}

void wav_t::channel_mask_and_subformat_type_t::_read() {
    m_dw_channel_mask = std::unique_ptr<channel_mask_type_t>(new channel_mask_type_t(m__io, this, m__root));
    m_subformat = std::unique_ptr<guid_type_t>(new guid_type_t(m__io, this, m__root));
}

wav_t::channel_mask_and_subformat_type_t::~channel_mask_and_subformat_type_t() {
    _clean_up();
}

void wav_t::channel_mask_and_subformat_type_t::_clean_up() {
}

wav_t::cue_chunk_type_t::cue_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_cue_points = nullptr;
    _read();
}

void wav_t::cue_chunk_type_t::_read() {
    m_dw_cue_points = m__io->read_u4le();
    m_cue_points = std::unique_ptr<std::vector<std::unique_ptr<cue_point_type_t>>>(new std::vector<std::unique_ptr<cue_point_type_t>>());
    const int l_cue_points = dw_cue_points();
    for (int i = 0; i < l_cue_points; i++) {
        m_cue_points->push_back(std::move(std::unique_ptr<cue_point_type_t>(new cue_point_type_t(m__io, this, m__root))));
    }
}

wav_t::cue_chunk_type_t::~cue_chunk_type_t() {
    _clean_up();
}

void wav_t::cue_chunk_type_t::_clean_up() {
}

wav_t::list_chunk_type_t::list_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_parent_chunk_data = nullptr;
    m_subchunks = nullptr;
    f_form_type = false;
    f_subchunks = false;
    _read();
}

void wav_t::list_chunk_type_t::_read() {
    m_parent_chunk_data = std::unique_ptr<riff_t::parent_chunk_data_t>(new riff_t::parent_chunk_data_t(m__io, this, m__root));
}

wav_t::list_chunk_type_t::~list_chunk_type_t() {
    _clean_up();
}

void wav_t::list_chunk_type_t::_clean_up() {
    if (f_subchunks) {
    }
}

wav_t::fourcc_t wav_t::list_chunk_type_t::form_type() {
    if (f_form_type)
        return m_form_type;
    m_form_type = static_cast<wav_t::fourcc_t>(parent_chunk_data()->form_type());
    f_form_type = true;
    return m_form_type;
}

std::vector<std::unique_ptr<wav_t::info_chunk_type_t>>* wav_t::list_chunk_type_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<info_chunk_type_t>>>(new std::vector<std::unique_ptr<info_chunk_type_t>>());
    {
        int i = 0;
        while (!io->is_eof()) {
            switch (form_type()) {
            case wav_t::FOURCC_INFO: {
                m_subchunks->push_back(std::move(std::unique_ptr<info_chunk_type_t>(new info_chunk_type_t(io, this, m__root))));
                break;
            }
            }
            i++;
        }
    }
    io->seek(_pos);
    f_subchunks = true;
    return m_subchunks.get();
}

wav_t::channel_mask_type_t::channel_mask_type_t(kaitai::kstream* p__io, wav_t::channel_mask_and_subformat_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::channel_mask_type_t::_read() {
    m_front_right_of_center = m__io->read_bits_int_be(1);
    m_front_left_of_center = m__io->read_bits_int_be(1);
    m_back_right = m__io->read_bits_int_be(1);
    m_back_left = m__io->read_bits_int_be(1);
    m_low_frequency = m__io->read_bits_int_be(1);
    m_front_center = m__io->read_bits_int_be(1);
    m_front_right = m__io->read_bits_int_be(1);
    m_front_left = m__io->read_bits_int_be(1);
    m_top_center = m__io->read_bits_int_be(1);
    m_side_right = m__io->read_bits_int_be(1);
    m_side_left = m__io->read_bits_int_be(1);
    m_back_center = m__io->read_bits_int_be(1);
    m_top_back_left = m__io->read_bits_int_be(1);
    m_top_front_right = m__io->read_bits_int_be(1);
    m_top_front_center = m__io->read_bits_int_be(1);
    m_top_front_left = m__io->read_bits_int_be(1);
    m_unused1 = m__io->read_bits_int_be(6);
    m_top_back_right = m__io->read_bits_int_be(1);
    m_top_back_center = m__io->read_bits_int_be(1);
    m_unused2 = m__io->read_bits_int_be(8);
}

wav_t::channel_mask_type_t::~channel_mask_type_t() {
    _clean_up();
}

void wav_t::channel_mask_type_t::_clean_up() {
}

wav_t::afsp_chunk_type_t::afsp_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_info_records = nullptr;
    _read();
}

void wav_t::afsp_chunk_type_t::_read() {
    m_magic = m__io->read_bytes(4);
    if (!(magic() == std::string("\x41\x46\x73\x70", 4))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x41\x46\x73\x70", 4), magic(), _io(), std::string("/types/afsp_chunk_type/seq/0"));
    }
    m_info_records = std::unique_ptr<std::vector<std::string>>(new std::vector<std::string>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_info_records->push_back(std::move(kaitai::kstream::bytes_to_str(m__io->read_bytes_term(0, false, true, true), std::string("ASCII"))));
            i++;
        }
    }
}

wav_t::afsp_chunk_type_t::~afsp_chunk_type_t() {
    _clean_up();
}

void wav_t::afsp_chunk_type_t::_clean_up() {
}

wav_t::axml_chunk_type_t::axml_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::axml_chunk_type_t::_read() {
    m_data = kaitai::kstream::bytes_to_str(m__io->read_bytes_full(), std::string("UTF-8"));
}

wav_t::axml_chunk_type_t::~axml_chunk_type_t() {
    _clean_up();
}

void wav_t::axml_chunk_type_t::_clean_up() {
}

wav_t::chunk_type_t::chunk_type_t(kaitai::kstream* p__io, wav_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk = nullptr;
    f_chunk_id = false;
    f_chunk_data = false;
    _read();
}

void wav_t::chunk_type_t::_read() {
    m_chunk = std::unique_ptr<riff_t::chunk_t>(new riff_t::chunk_t(m__io, this, m__root));
}

wav_t::chunk_type_t::~chunk_type_t() {
    _clean_up();
}

void wav_t::chunk_type_t::_clean_up() {
    if (f_chunk_data && !n_chunk_data) {
    }
}

wav_t::fourcc_t wav_t::chunk_type_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    m_chunk_id = static_cast<wav_t::fourcc_t>(chunk()->id());
    f_chunk_id = true;
    return m_chunk_id;
}

kaitai::kstruct* wav_t::chunk_type_t::chunk_data() {
    if (f_chunk_data)
        return m_chunk_data.get();
    kaitai::kstream *io = chunk()->data_slot()->_io();
    std::streampos _pos = io->pos();
    io->seek(0);
    n_chunk_data = true;
    switch (chunk_id()) {
    case wav_t::FOURCC_FACT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<fact_chunk_type_t>(new fact_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_LIST: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<list_chunk_type_t>(new list_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_FMT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<format_chunk_type_t>(new format_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_AFSP: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<afsp_chunk_type_t>(new afsp_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_BEXT: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<bext_chunk_type_t>(new bext_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_CUE: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<cue_chunk_type_t>(new cue_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_IXML: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<ixml_chunk_type_t>(new ixml_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_PMX: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<pmx_chunk_type_t>(new pmx_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_AXML: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<axml_chunk_type_t>(new axml_chunk_type_t(io, this, m__root));
        break;
    }
    case wav_t::FOURCC_DATA: {
        n_chunk_data = false;
        m_chunk_data = std::unique_ptr<data_chunk_type_t>(new data_chunk_type_t(io, this, m__root));
        break;
    }
    }
    io->seek(_pos);
    f_chunk_data = true;
    return m_chunk_data.get();
}

wav_t::bext_chunk_type_t::bext_chunk_type_t(kaitai::kstream* p__io, wav_t::chunk_type_t* p__parent, wav_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void wav_t::bext_chunk_type_t::_read() {
    m_description = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(256), 0, false), std::string("ASCII"));
    m_originator = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), std::string("ASCII"));
    m_originator_reference = kaitai::kstream::bytes_to_str(kaitai::kstream::bytes_terminate(m__io->read_bytes(32), 0, false), std::string("ASCII"));
    m_origination_date = kaitai::kstream::bytes_to_str(m__io->read_bytes(10), std::string("ASCII"));
    m_origination_time = kaitai::kstream::bytes_to_str(m__io->read_bytes(8), std::string("ASCII"));
    m_time_reference_low = m__io->read_u4le();
    m_time_reference_high = m__io->read_u4le();
    m_version = m__io->read_u2le();
    m_umid = m__io->read_bytes(64);
    m_loudness_value = m__io->read_u2le();
    m_loudness_range = m__io->read_u2le();
    m_max_true_peak_level = m__io->read_u2le();
    m_max_momentary_loudness = m__io->read_u2le();
    m_max_short_term_loudness = m__io->read_u2le();
}

wav_t::bext_chunk_type_t::~bext_chunk_type_t() {
    _clean_up();
}

void wav_t::bext_chunk_type_t::_clean_up() {
}

std::vector<std::unique_ptr<wav_t::chunk_type_t>>* wav_t::subchunks() {
    if (f_subchunks)
        return m_subchunks.get();
    n_subchunks = true;
    if (is_form_type_wave()) {
        n_subchunks = false;
        kaitai::kstream *io = parent_chunk_data()->subchunks_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_subchunks = std::unique_ptr<std::vector<std::unique_ptr<chunk_type_t>>>(new std::vector<std::unique_ptr<chunk_type_t>>());
        {
            int i = 0;
            while (!io->is_eof()) {
                m_subchunks->push_back(std::move(std::unique_ptr<chunk_type_t>(new chunk_type_t(io, this, m__root))));
                i++;
            }
        }
        io->seek(_pos);
        f_subchunks = true;
    }
    return m_subchunks.get();
}

riff_t::parent_chunk_data_t* wav_t::parent_chunk_data() {
    if (f_parent_chunk_data)
        return m_parent_chunk_data.get();
    n_parent_chunk_data = true;
    if (is_riff_chunk()) {
        n_parent_chunk_data = false;
        kaitai::kstream *io = chunk()->data_slot()->_io();
        std::streampos _pos = io->pos();
        io->seek(0);
        m_parent_chunk_data = std::unique_ptr<riff_t::parent_chunk_data_t>(new riff_t::parent_chunk_data_t(io, this, m__root));
        io->seek(_pos);
        f_parent_chunk_data = true;
    }
    return m_parent_chunk_data.get();
}

bool wav_t::is_form_type_wave() {
    if (f_is_form_type_wave)
        return m_is_form_type_wave;
    m_is_form_type_wave =  ((is_riff_chunk()) && (form_type() == wav_t::FOURCC_WAVE)) ;
    f_is_form_type_wave = true;
    return m_is_form_type_wave;
}

bool wav_t::is_riff_chunk() {
    if (f_is_riff_chunk)
        return m_is_riff_chunk;
    m_is_riff_chunk = chunk_id() == wav_t::FOURCC_RIFF;
    f_is_riff_chunk = true;
    return m_is_riff_chunk;
}

wav_t::fourcc_t wav_t::chunk_id() {
    if (f_chunk_id)
        return m_chunk_id;
    m_chunk_id = static_cast<wav_t::fourcc_t>(chunk()->id());
    f_chunk_id = true;
    return m_chunk_id;
}

wav_t::fourcc_t wav_t::form_type() {
    if (f_form_type)
        return m_form_type;
    m_form_type = static_cast<wav_t::fourcc_t>(parent_chunk_data()->form_type());
    f_form_type = true;
    return m_form_type;
}
