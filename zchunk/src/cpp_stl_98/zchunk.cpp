// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "zchunk.h"
#include "kaitai/exceptions.h"
std::set<zchunk_t::checksum_types_t> zchunk_t::_build_values_checksum_types_t() {
    std::set<zchunk_t::checksum_types_t> _t;
    _t.insert(zchunk_t::CHECKSUM_TYPES_SHA1);
    _t.insert(zchunk_t::CHECKSUM_TYPES_SHA256);
    _t.insert(zchunk_t::CHECKSUM_TYPES_SHA512);
    _t.insert(zchunk_t::CHECKSUM_TYPES_SHA512_128);
    return _t;
}
const std::set<zchunk_t::checksum_types_t> zchunk_t::_values_checksum_types_t = zchunk_t::_build_values_checksum_types_t();
bool zchunk_t::_is_defined_checksum_types_t(zchunk_t::checksum_types_t v) {
    return zchunk_t::_values_checksum_types_t.find(v) != zchunk_t::_values_checksum_types_t.end();
}
std::set<zchunk_t::compression_types_t> zchunk_t::_build_values_compression_types_t() {
    std::set<zchunk_t::compression_types_t> _t;
    _t.insert(zchunk_t::COMPRESSION_TYPES_NONE);
    _t.insert(zchunk_t::COMPRESSION_TYPES_ZSTD);
    return _t;
}
const std::set<zchunk_t::compression_types_t> zchunk_t::_values_compression_types_t = zchunk_t::_build_values_compression_types_t();
bool zchunk_t::_is_defined_compression_types_t(zchunk_t::compression_types_t v) {
    return zchunk_t::_values_compression_types_t.find(v) != zchunk_t::_values_compression_types_t.end();
}

zchunk_t::zchunk_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_lead = 0;
    m_header_rest = 0;
    m__io__raw_header_rest = 0;
    m_chunks = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::_read() {
    m_lead = new header_lead_t(m__io, this, m__root);
    m__raw_header_rest = m__io->read_bytes(lead()->len_header_rest()->value());
    m__io__raw_header_rest = new kaitai::kstream(m__raw_header_rest);
    m_header_rest = new header_without_lead_t(m__io__raw_header_rest, this, m__root);
    m_dict = m__io->read_bytes(header_rest()->index()->len_dict()->value());
    n_chunks = true;
    if (!(lead()->is_detached_header())) {
        n_chunks = false;
        m_chunks = new std::vector<std::string>();
        const int l_chunks = header_rest()->index()->chunks_metadata()->size();
        for (int i = 0; i < l_chunks; i++) {
            m_chunks->push_back(m__io->read_bytes(header_rest()->index()->chunks_metadata()->at(i)->len_chunk()->value()));
        }
    }
}

zchunk_t::~zchunk_t() {
    _clean_up();
}

void zchunk_t::_clean_up() {
    if (m_lead) {
        delete m_lead; m_lead = 0;
    }
    if (m__io__raw_header_rest) {
        delete m__io__raw_header_rest; m__io__raw_header_rest = 0;
    }
    if (m_header_rest) {
        delete m_header_rest; m_header_rest = 0;
    }
    if (!n_chunks) {
        if (m_chunks) {
            delete m_chunks; m_chunks = 0;
        }
    }
}

zchunk_t::checksum_type_t::checksum_type_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_raw = 0;
    f_len_checksum = false;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::checksum_type_t::_read() {
    m_raw = new compressed_integer_t(m__io, this, m__root);
    {
        compressed_integer_t* _ = m_raw;
        if (!(len_checksum() != 0)) {
            throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_raw, m__io, std::string("/types/checksum_type/seq/0"));
        }
    }
}

zchunk_t::checksum_type_t::~checksum_type_t() {
    _clean_up();
}

void zchunk_t::checksum_type_t::_clean_up() {
    if (m_raw) {
        delete m_raw; m_raw = 0;
    }
}

int8_t zchunk_t::checksum_type_t::len_checksum() {
    if (f_len_checksum)
        return m_len_checksum;
    f_len_checksum = true;
    m_len_checksum = ((value() == zchunk_t::CHECKSUM_TYPES_SHA1) ? (20) : (((value() == zchunk_t::CHECKSUM_TYPES_SHA256) ? (32) : (((value() == zchunk_t::CHECKSUM_TYPES_SHA512) ? (64) : (((value() == zchunk_t::CHECKSUM_TYPES_SHA512_128) ? (16) : (0))))))));
    return m_len_checksum;
}

zchunk_t::checksum_types_t zchunk_t::checksum_type_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = static_cast<zchunk_t::checksum_types_t>(raw()->value());
    return m_value;
}

zchunk_t::chunk_t::chunk_t(uint32_t p_len_checksum, bool p_has_data_streams, bool p_has_uncompressed_source, kaitai::kstream* p__io, zchunk_t::index_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_len_checksum = p_len_checksum;
    m_has_data_streams = p_has_data_streams;
    m_has_uncompressed_source = p_has_uncompressed_source;
    m_chunk_stream = 0;
    m_len_chunk = 0;
    m_len_uncompressed_chunk = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::chunk_t::_read() {
    n_chunk_stream = true;
    if (has_data_streams()) {
        n_chunk_stream = false;
        m_chunk_stream = new compressed_integer_t(m__io, this, m__root);
    }
    m_chunk_checksum = m__io->read_bytes(len_checksum());
    n_uncompressed_chunk_checksum = true;
    if (has_uncompressed_source()) {
        n_uncompressed_chunk_checksum = false;
        m_uncompressed_chunk_checksum = m__io->read_bytes(len_checksum());
    }
    m_len_chunk = new compressed_integer_t(m__io, this, m__root);
    m_len_uncompressed_chunk = new compressed_integer_t(m__io, this, m__root);
}

zchunk_t::chunk_t::~chunk_t() {
    _clean_up();
}

void zchunk_t::chunk_t::_clean_up() {
    if (!n_chunk_stream) {
        if (m_chunk_stream) {
            delete m_chunk_stream; m_chunk_stream = 0;
        }
    }
    if (!n_uncompressed_chunk_checksum) {
    }
    if (m_len_chunk) {
        delete m_len_chunk; m_len_chunk = 0;
    }
    if (m_len_uncompressed_chunk) {
        delete m_len_uncompressed_chunk; m_len_uncompressed_chunk = 0;
    }
}

zchunk_t::compressed_integer_t::compressed_integer_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_groups = 0;
    f_len = false;
    f_value = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::compressed_integer_t::_read() {
    m_groups = new std::vector<group_t*>();
    {
        int i = 0;
        group_t* _;
        do {
            _ = new group_t(i, m__io, this, m__root);
            m_groups->push_back(_);
            i++;
        } while (!(_->is_last()));
    }
}

zchunk_t::compressed_integer_t::~compressed_integer_t() {
    _clean_up();
}

void zchunk_t::compressed_integer_t::_clean_up() {
    if (m_groups) {
        for (std::vector<group_t*>::iterator it = m_groups->begin(); it != m_groups->end(); ++it) {
            delete *it;
        }
        delete m_groups; m_groups = 0;
    }
}

zchunk_t::compressed_integer_t::group_t::group_t(int32_t p_idx, kaitai::kstream* p__io, zchunk_t::compressed_integer_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_idx = p_idx;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::compressed_integer_t::group_t::_read() {
    m_is_last = m__io->read_bits_int_be(1);
    if (!(m_is_last == ((idx() == 9) ? (true) : (is_last())))) {
        throw kaitai::validation_not_equal_error<bool>(((idx() == 9) ? (true) : (is_last())), m_is_last, m__io, std::string("/types/compressed_integer/types/group/seq/0"));
    }
    m_value = m__io->read_bits_int_be(7);
    if (!(m_value <= static_cast<uint64_t>(((idx() == 9) ? (1) : (127))))) {
        throw kaitai::validation_greater_than_error<uint64_t>(static_cast<uint64_t>(((idx() == 9) ? (1) : (127))), m_value, m__io, std::string("/types/compressed_integer/types/group/seq/1"));
    }
}

zchunk_t::compressed_integer_t::group_t::~group_t() {
    _clean_up();
}

void zchunk_t::compressed_integer_t::group_t::_clean_up() {
}

int32_t zchunk_t::compressed_integer_t::len() {
    if (f_len)
        return m_len;
    f_len = true;
    m_len = groups()->size();
    return m_len;
}

uint64_t zchunk_t::compressed_integer_t::value() {
    if (f_value)
        return m_value;
    f_value = true;
    m_value = static_cast<uint64_t>(((((((((groups()->at(0)->value() | ((len() >= 2) ? (groups()->at(1)->value() << 7) : (0))) | ((len() >= 3) ? (groups()->at(2)->value() << 14) : (0))) | ((len() >= 4) ? (groups()->at(3)->value() << 21) : (0))) | ((len() >= 5) ? (groups()->at(4)->value() << 28) : (0))) | ((len() >= 6) ? (groups()->at(5)->value() << 35) : (0))) | ((len() >= 7) ? (groups()->at(6)->value() << 42) : (0))) | ((len() >= 8) ? (groups()->at(7)->value() << 49) : (0))) | ((len() >= 9) ? (groups()->at(8)->value() << 56) : (0))) | ((len() >= 10) ? (groups()->at(9)->value() << 63) : (0)));
    return m_value;
}

zchunk_t::header_lead_t::header_lead_t(kaitai::kstream* p__io, zchunk_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_overall_checksum_type = 0;
    m_len_header_rest = 0;
    f_is_detached_header = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::header_lead_t::_read() {
    m_magic = m__io->read_bytes(5);
    if (!( ((m_magic == std::string("\x00\x5A\x43\x4B\x31", 5)) || (m_magic == std::string("\x00\x5A\x48\x52\x31", 5))) )) {
        throw kaitai::validation_not_any_of_error<std::string>(m_magic, m__io, std::string("/types/header_lead/seq/0"));
    }
    m_overall_checksum_type = new checksum_type_t(m__io, this, m__root);
    m_len_header_rest = new compressed_integer_t(m__io, this, m__root);
    m_header_checksum = m__io->read_bytes(overall_checksum_type()->len_checksum());
}

zchunk_t::header_lead_t::~header_lead_t() {
    _clean_up();
}

void zchunk_t::header_lead_t::_clean_up() {
    if (m_overall_checksum_type) {
        delete m_overall_checksum_type; m_overall_checksum_type = 0;
    }
    if (m_len_header_rest) {
        delete m_len_header_rest; m_len_header_rest = 0;
    }
}

bool zchunk_t::header_lead_t::is_detached_header() {
    if (f_is_detached_header)
        return m_is_detached_header;
    f_is_detached_header = true;
    m_is_detached_header = magic().at(2) == 72;
    return m_is_detached_header;
}

zchunk_t::header_without_lead_t::header_without_lead_t(kaitai::kstream* p__io, zchunk_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_preface = 0;
    m_len_index = 0;
    m_index = 0;
    m__io__raw_index = 0;
    m_num_signatures = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::header_without_lead_t::_read() {
    m_preface = new preface_t(m__io, this, m__root);
    m_len_index = new compressed_integer_t(m__io, this, m__root);
    m__raw_index = m__io->read_bytes(len_index()->value());
    m__io__raw_index = new kaitai::kstream(m__raw_index);
    m_index = new index_t(m__io__raw_index, this, m__root);
    m_num_signatures = new compressed_integer_t(m__io, this, m__root);
    {
        compressed_integer_t* _ = m_num_signatures;
        if (!(_->value() == 0)) {
            throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_num_signatures, m__io, std::string("/types/header_without_lead/seq/3"));
        }
    }
}

zchunk_t::header_without_lead_t::~header_without_lead_t() {
    _clean_up();
}

void zchunk_t::header_without_lead_t::_clean_up() {
    if (m_preface) {
        delete m_preface; m_preface = 0;
    }
    if (m_len_index) {
        delete m_len_index; m_len_index = 0;
    }
    if (m__io__raw_index) {
        delete m__io__raw_index; m__io__raw_index = 0;
    }
    if (m_index) {
        delete m_index; m_index = 0;
    }
    if (m_num_signatures) {
        delete m_num_signatures; m_num_signatures = 0;
    }
}

zchunk_t::index_t::index_t(kaitai::kstream* p__io, zchunk_t::header_without_lead_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_chunk_checksum_type = 0;
    m_num_chunks = 0;
    m_dict_stream = 0;
    m_len_dict = 0;
    m_len_uncompressed_dict = 0;
    m_chunks_metadata = 0;
    f_num_data_chunks = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::index_t::_read() {
    m_chunk_checksum_type = new checksum_type_t(m__io, this, m__root);
    m_num_chunks = new compressed_integer_t(m__io, this, m__root);
    {
        compressed_integer_t* _ = m_num_chunks;
        if (!(_->value() >= 1)) {
            throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_num_chunks, m__io, std::string("/types/index/seq/1"));
        }
    }
    n_dict_stream = true;
    if (_parent()->preface()->has_data_streams()) {
        n_dict_stream = false;
        m_dict_stream = new compressed_integer_t(m__io, this, m__root);
        {
            compressed_integer_t* _ = m_dict_stream;
            if (!(_->value() == 0)) {
                throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_dict_stream, m__io, std::string("/types/index/seq/2"));
            }
        }
    }
    m_dict_checksum = m__io->read_bytes(chunk_checksum_type()->len_checksum());
    n_uncompressed_dict_checksum = true;
    if (_parent()->preface()->has_uncompressed_source()) {
        n_uncompressed_dict_checksum = false;
        m_uncompressed_dict_checksum = m__io->read_bytes(chunk_checksum_type()->len_checksum());
    }
    m_len_dict = new compressed_integer_t(m__io, this, m__root);
    m_len_uncompressed_dict = new compressed_integer_t(m__io, this, m__root);
    m_chunks_metadata = new std::vector<chunk_t*>();
    const int l_chunks_metadata = num_data_chunks();
    for (int i = 0; i < l_chunks_metadata; i++) {
        m_chunks_metadata->push_back(new chunk_t(chunk_checksum_type()->len_checksum(), _parent()->preface()->has_data_streams(), _parent()->preface()->has_uncompressed_source(), m__io, this, m__root));
    }
}

zchunk_t::index_t::~index_t() {
    _clean_up();
}

void zchunk_t::index_t::_clean_up() {
    if (m_chunk_checksum_type) {
        delete m_chunk_checksum_type; m_chunk_checksum_type = 0;
    }
    if (m_num_chunks) {
        delete m_num_chunks; m_num_chunks = 0;
    }
    if (!n_dict_stream) {
        if (m_dict_stream) {
            delete m_dict_stream; m_dict_stream = 0;
        }
    }
    if (!n_uncompressed_dict_checksum) {
    }
    if (m_len_dict) {
        delete m_len_dict; m_len_dict = 0;
    }
    if (m_len_uncompressed_dict) {
        delete m_len_uncompressed_dict; m_len_uncompressed_dict = 0;
    }
    if (m_chunks_metadata) {
        for (std::vector<chunk_t*>::iterator it = m_chunks_metadata->begin(); it != m_chunks_metadata->end(); ++it) {
            delete *it;
        }
        delete m_chunks_metadata; m_chunks_metadata = 0;
    }
}

int32_t zchunk_t::index_t::num_data_chunks() {
    if (f_num_data_chunks)
        return m_num_data_chunks;
    f_num_data_chunks = true;
    m_num_data_chunks = num_chunks()->value() - 1;
    return m_num_data_chunks;
}

zchunk_t::optional_element_t::optional_element_t(kaitai::kstream* p__io, zchunk_t::preface_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_element_id = 0;
    m_len_data = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::optional_element_t::_read() {
    m_element_id = new compressed_integer_t(m__io, this, m__root);
    m_len_data = new compressed_integer_t(m__io, this, m__root);
    m_data = m__io->read_bytes(len_data()->value());
}

zchunk_t::optional_element_t::~optional_element_t() {
    _clean_up();
}

void zchunk_t::optional_element_t::_clean_up() {
    if (m_element_id) {
        delete m_element_id; m_element_id = 0;
    }
    if (m_len_data) {
        delete m_len_data; m_len_data = 0;
    }
}

zchunk_t::preface_t::preface_t(kaitai::kstream* p__io, zchunk_t::header_without_lead_t* p__parent, zchunk_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_flags = 0;
    m_compression_type_int = 0;
    m_num_optional_elements = 0;
    m_optional_elements = 0;
    f_compression_type = false;
    f_has_data_streams = false;
    f_has_optional_elements = false;
    f_has_uncompressed_source = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void zchunk_t::preface_t::_read() {
    m_data_checksum = m__io->read_bytes(_root()->lead()->overall_checksum_type()->len_checksum());
    m_flags = new compressed_integer_t(m__io, this, m__root);
    {
        compressed_integer_t* _ = m_flags;
        if (!(_->value() <= 7)) {
            throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_flags, m__io, std::string("/types/preface/seq/1"));
        }
    }
    m_compression_type_int = new compressed_integer_t(m__io, this, m__root);
    {
        compressed_integer_t* _ = m_compression_type_int;
        if (!( ((_->value() == zchunk_t::COMPRESSION_TYPES_NONE) || (_->value() == zchunk_t::COMPRESSION_TYPES_ZSTD)) )) {
            throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_compression_type_int, m__io, std::string("/types/preface/seq/2"));
        }
    }
    n_num_optional_elements = true;
    if (has_optional_elements()) {
        n_num_optional_elements = false;
        m_num_optional_elements = new compressed_integer_t(m__io, this, m__root);
        {
            compressed_integer_t* _ = m_num_optional_elements;
            if (!(_->value() >= 1)) {
                throw kaitai::validation_expr_error<zchunk_t::compressed_integer_t*>(m_num_optional_elements, m__io, std::string("/types/preface/seq/3"));
            }
        }
    }
    n_optional_elements = true;
    if (has_optional_elements()) {
        n_optional_elements = false;
        m_optional_elements = new std::vector<optional_element_t*>();
        const int l_optional_elements = num_optional_elements()->value();
        for (int i = 0; i < l_optional_elements; i++) {
            m_optional_elements->push_back(new optional_element_t(m__io, this, m__root));
        }
    }
}

zchunk_t::preface_t::~preface_t() {
    _clean_up();
}

void zchunk_t::preface_t::_clean_up() {
    if (m_flags) {
        delete m_flags; m_flags = 0;
    }
    if (m_compression_type_int) {
        delete m_compression_type_int; m_compression_type_int = 0;
    }
    if (!n_num_optional_elements) {
        if (m_num_optional_elements) {
            delete m_num_optional_elements; m_num_optional_elements = 0;
        }
    }
    if (!n_optional_elements) {
        if (m_optional_elements) {
            for (std::vector<optional_element_t*>::iterator it = m_optional_elements->begin(); it != m_optional_elements->end(); ++it) {
                delete *it;
            }
            delete m_optional_elements; m_optional_elements = 0;
        }
    }
}

zchunk_t::compression_types_t zchunk_t::preface_t::compression_type() {
    if (f_compression_type)
        return m_compression_type;
    f_compression_type = true;
    m_compression_type = static_cast<zchunk_t::compression_types_t>(compression_type_int()->value());
    return m_compression_type;
}

bool zchunk_t::preface_t::has_data_streams() {
    if (f_has_data_streams)
        return m_has_data_streams;
    f_has_data_streams = true;
    m_has_data_streams = (flags()->value() & 1) != 0;
    return m_has_data_streams;
}

bool zchunk_t::preface_t::has_optional_elements() {
    if (f_has_optional_elements)
        return m_has_optional_elements;
    f_has_optional_elements = true;
    m_has_optional_elements = (flags()->value() & 2) != 0;
    return m_has_optional_elements;
}

bool zchunk_t::preface_t::has_uncompressed_source() {
    if (f_has_uncompressed_source)
        return m_has_uncompressed_source;
    f_has_uncompressed_source = true;
    m_has_uncompressed_source = (flags()->value() & 4) != 0;
    return m_has_uncompressed_source;
}
