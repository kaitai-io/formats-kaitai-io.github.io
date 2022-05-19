// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mcap.h"
#include "kaitai/exceptions.h"

mcap_t::mcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = this;
    m_header_magic = 0;
    m_records = 0;
    m_footer_magic = 0;
    m_footer = 0;
    m__io__raw_footer = 0;
    f_footer = false;
    f_ofs_footer = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::_read() {
    m_header_magic = new magic_t(m__io, this, m__root);
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        record_t* _;
        do {
            _ = new record_t(m__io, this, m__root);
            m_records->push_back(_);
            i++;
        } while (!(_->op() == mcap_t::OPCODE_FOOTER));
    }
    m_footer_magic = new magic_t(m__io, this, m__root);
}

mcap_t::~mcap_t() {
    _clean_up();
}

void mcap_t::_clean_up() {
    if (m_header_magic) {
        delete m_header_magic; m_header_magic = 0;
    }
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
    if (m_footer_magic) {
        delete m_footer_magic; m_footer_magic = 0;
    }
    if (f_footer) {
        if (m__io__raw_footer) {
            delete m__io__raw_footer; m__io__raw_footer = 0;
        }
        if (m_footer) {
            delete m_footer; m_footer = 0;
        }
    }
}

mcap_t::prefixed_str_t::prefixed_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::prefixed_str_t::_read() {
    m_len_str = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_str()), std::string("UTF-8"));
}

mcap_t::prefixed_str_t::~prefixed_str_t() {
    _clean_up();
}

void mcap_t::prefixed_str_t::_clean_up() {
}

mcap_t::chunk_t::chunk_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_compression = 0;
    m__io__raw_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::chunk_t::_read() {
    m_message_start_time = m__io->read_u8le();
    m_message_end_time = m__io->read_u8le();
    m_uncompressed_size = m__io->read_u8le();
    m_uncompressed_crc32 = m__io->read_u4le();
    m_compression = new prefixed_str_t(m__io, this, m__root);
    m_len_records = m__io->read_u8le();
    n_records = true;
    {
        std::string on = compression()->str();
        if (on == std::string("")) {
            n_records = false;
            m__raw_records = m__io->read_bytes(len_records());
            m__io__raw_records = new kaitai::kstream(m__raw_records);
            m_records = new records_t(m__io__raw_records, this, m__root);
        }
        else {
            m__raw_records = m__io->read_bytes(len_records());
        }
    }
}

mcap_t::chunk_t::~chunk_t() {
    _clean_up();
}

void mcap_t::chunk_t::_clean_up() {
    if (m_compression) {
        delete m_compression; m_compression = 0;
    }
    if (!n_records) {
        if (m__io__raw_records) {
            delete m__io__raw_records; m__io__raw_records = 0;
        }
        if (m_records) {
            delete m_records; m_records = 0;
        }
    }
}

mcap_t::data_end_t::data_end_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::data_end_t::_read() {
    m_data_section_crc32 = m__io->read_u4le();
}

mcap_t::data_end_t::~data_end_t() {
    _clean_up();
}

void mcap_t::data_end_t::_clean_up() {
}

mcap_t::channel_t::channel_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_topic = 0;
    m_message_encoding = 0;
    m_metadata = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::channel_t::_read() {
    m_id = m__io->read_u2le();
    m_schema_id = m__io->read_u2le();
    m_topic = new prefixed_str_t(m__io, this, m__root);
    m_message_encoding = new prefixed_str_t(m__io, this, m__root);
    m_metadata = new map_str_str_t(m__io, this, m__root);
}

mcap_t::channel_t::~channel_t() {
    _clean_up();
}

void mcap_t::channel_t::_clean_up() {
    if (m_topic) {
        delete m_topic; m_topic = 0;
    }
    if (m_message_encoding) {
        delete m_message_encoding; m_message_encoding = 0;
    }
    if (m_metadata) {
        delete m_metadata; m_metadata = 0;
    }
}

mcap_t::message_index_t::message_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = 0;
    m__io__raw_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::message_index_t::_read() {
    m_channel_id = m__io->read_u2le();
    m_len_records = m__io->read_u4le();
    m__raw_records = m__io->read_bytes(len_records());
    m__io__raw_records = new kaitai::kstream(m__raw_records);
    m_records = new message_index_entries_t(m__io__raw_records, this, m__root);
}

mcap_t::message_index_t::~message_index_t() {
    _clean_up();
}

void mcap_t::message_index_t::_clean_up() {
    if (m__io__raw_records) {
        delete m__io__raw_records; m__io__raw_records = 0;
    }
    if (m_records) {
        delete m_records; m_records = 0;
    }
}

mcap_t::message_index_t::message_index_entry_t::message_index_entry_t(kaitai::kstream* p__io, mcap_t::message_index_t::message_index_entries_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::message_index_t::message_index_entry_t::_read() {
    m_log_time = m__io->read_u8le();
    m_offset = m__io->read_u8le();
}

mcap_t::message_index_t::message_index_entry_t::~message_index_entry_t() {
    _clean_up();
}

void mcap_t::message_index_t::message_index_entry_t::_clean_up() {
}

mcap_t::message_index_t::message_index_entries_t::message_index_entries_t(kaitai::kstream* p__io, mcap_t::message_index_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::message_index_t::message_index_entries_t::_read() {
    m_entries = new std::vector<message_index_entry_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new message_index_entry_t(m__io, this, m__root));
            i++;
        }
    }
}

mcap_t::message_index_t::message_index_entries_t::~message_index_entries_t() {
    _clean_up();
}

void mcap_t::message_index_t::message_index_entries_t::_clean_up() {
    if (m_entries) {
        for (std::vector<message_index_entry_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

mcap_t::statistics_t::statistics_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_channel_message_counts = 0;
    m__io__raw_channel_message_counts = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::statistics_t::_read() {
    m_message_count = m__io->read_u8le();
    m_schema_count = m__io->read_u2le();
    m_channel_count = m__io->read_u4le();
    m_attachment_count = m__io->read_u4le();
    m_metadata_count = m__io->read_u4le();
    m_chunk_count = m__io->read_u4le();
    m_message_start_time = m__io->read_u8le();
    m_message_end_time = m__io->read_u8le();
    m_len_channel_message_counts = m__io->read_u4le();
    m__raw_channel_message_counts = m__io->read_bytes(len_channel_message_counts());
    m__io__raw_channel_message_counts = new kaitai::kstream(m__raw_channel_message_counts);
    m_channel_message_counts = new channel_message_counts_t(m__io__raw_channel_message_counts, this, m__root);
}

mcap_t::statistics_t::~statistics_t() {
    _clean_up();
}

void mcap_t::statistics_t::_clean_up() {
    if (m__io__raw_channel_message_counts) {
        delete m__io__raw_channel_message_counts; m__io__raw_channel_message_counts = 0;
    }
    if (m_channel_message_counts) {
        delete m_channel_message_counts; m_channel_message_counts = 0;
    }
}

mcap_t::statistics_t::channel_message_counts_t::channel_message_counts_t(kaitai::kstream* p__io, mcap_t::statistics_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::statistics_t::channel_message_counts_t::_read() {
    m_entries = new std::vector<channel_message_count_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new channel_message_count_t(m__io, this, m__root));
            i++;
        }
    }
}

mcap_t::statistics_t::channel_message_counts_t::~channel_message_counts_t() {
    _clean_up();
}

void mcap_t::statistics_t::channel_message_counts_t::_clean_up() {
    if (m_entries) {
        for (std::vector<channel_message_count_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

mcap_t::statistics_t::channel_message_count_t::channel_message_count_t(kaitai::kstream* p__io, mcap_t::statistics_t::channel_message_counts_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::statistics_t::channel_message_count_t::_read() {
    m_channel_id = m__io->read_u2le();
    m_message_count = m__io->read_u8le();
}

mcap_t::statistics_t::channel_message_count_t::~channel_message_count_t() {
    _clean_up();
}

void mcap_t::statistics_t::channel_message_count_t::_clean_up() {
}

mcap_t::attachment_index_t::attachment_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_content_type = 0;
    m_attachment = 0;
    m__io__raw_attachment = 0;
    f_attachment = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::attachment_index_t::_read() {
    m_ofs_attachment = m__io->read_u8le();
    m_len_attachment = m__io->read_u8le();
    m_log_time = m__io->read_u8le();
    m_create_time = m__io->read_u8le();
    m_data_size = m__io->read_u8le();
    m_name = new prefixed_str_t(m__io, this, m__root);
    m_content_type = new prefixed_str_t(m__io, this, m__root);
}

mcap_t::attachment_index_t::~attachment_index_t() {
    _clean_up();
}

void mcap_t::attachment_index_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (m_content_type) {
        delete m_content_type; m_content_type = 0;
    }
    if (f_attachment) {
        if (m__io__raw_attachment) {
            delete m__io__raw_attachment; m__io__raw_attachment = 0;
        }
        if (m_attachment) {
            delete m_attachment; m_attachment = 0;
        }
    }
}

mcap_t::record_t* mcap_t::attachment_index_t::attachment() {
    if (f_attachment)
        return m_attachment;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_attachment());
    m__raw_attachment = io->read_bytes(len_attachment());
    m__io__raw_attachment = new kaitai::kstream(m__raw_attachment);
    m_attachment = new record_t(m__io__raw_attachment, this, m__root);
    io->seek(_pos);
    f_attachment = true;
    return m_attachment;
}

mcap_t::schema_t::schema_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_encoding = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::schema_t::_read() {
    m_id = m__io->read_u2le();
    m_name = new prefixed_str_t(m__io, this, m__root);
    m_encoding = new prefixed_str_t(m__io, this, m__root);
    m_len_data = m__io->read_u4le();
    m_data = m__io->read_bytes(len_data());
}

mcap_t::schema_t::~schema_t() {
    _clean_up();
}

void mcap_t::schema_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (m_encoding) {
        delete m_encoding; m_encoding = 0;
    }
}

mcap_t::map_str_str_t::map_str_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;
    m__io__raw_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::map_str_str_t::_read() {
    m_len_entries = m__io->read_u4le();
    m__raw_entries = m__io->read_bytes(len_entries());
    m__io__raw_entries = new kaitai::kstream(m__raw_entries);
    m_entries = new entries_t(m__io__raw_entries, this, m__root);
}

mcap_t::map_str_str_t::~map_str_str_t() {
    _clean_up();
}

void mcap_t::map_str_str_t::_clean_up() {
    if (m__io__raw_entries) {
        delete m__io__raw_entries; m__io__raw_entries = 0;
    }
    if (m_entries) {
        delete m_entries; m_entries = 0;
    }
}

mcap_t::map_str_str_t::entries_t::entries_t(kaitai::kstream* p__io, mcap_t::map_str_str_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::map_str_str_t::entries_t::_read() {
    m_entries = new std::vector<tuple_str_str_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new tuple_str_str_t(m__io, this, m__root));
            i++;
        }
    }
}

mcap_t::map_str_str_t::entries_t::~entries_t() {
    _clean_up();
}

void mcap_t::map_str_str_t::entries_t::_clean_up() {
    if (m_entries) {
        for (std::vector<tuple_str_str_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

mcap_t::summary_offset_t::summary_offset_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_group = 0;
    m__io__raw_group = 0;
    f_group = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::summary_offset_t::_read() {
    m_group_opcode = static_cast<mcap_t::opcode_t>(m__io->read_u1());
    m_ofs_group = m__io->read_u8le();
    m_len_group = m__io->read_u8le();
}

mcap_t::summary_offset_t::~summary_offset_t() {
    _clean_up();
}

void mcap_t::summary_offset_t::_clean_up() {
    if (f_group) {
        if (m__io__raw_group) {
            delete m__io__raw_group; m__io__raw_group = 0;
        }
        if (m_group) {
            delete m_group; m_group = 0;
        }
    }
}

mcap_t::records_t* mcap_t::summary_offset_t::group() {
    if (f_group)
        return m_group;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_group());
    m__raw_group = io->read_bytes(len_group());
    m__io__raw_group = new kaitai::kstream(m__raw_group);
    m_group = new records_t(m__io__raw_group, this, m__root);
    io->seek(_pos);
    f_group = true;
    return m_group;
}

mcap_t::attachment_t::attachment_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_content_type = 0;
    f_crc32_input_end = false;
    f_crc32_input = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::attachment_t::_read() {
    m_log_time = m__io->read_u8le();
    m_create_time = m__io->read_u8le();
    m_name = new prefixed_str_t(m__io, this, m__root);
    m_content_type = new prefixed_str_t(m__io, this, m__root);
    m_len_data = m__io->read_u8le();
    m_data = m__io->read_bytes(len_data());
    n_invoke_crc32_input_end = true;
    if (crc32_input_end() >= 0) {
        n_invoke_crc32_input_end = false;
        m_invoke_crc32_input_end = m__io->read_bytes(0);
    }
    m_crc32 = m__io->read_u4le();
}

mcap_t::attachment_t::~attachment_t() {
    _clean_up();
}

void mcap_t::attachment_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (m_content_type) {
        delete m_content_type; m_content_type = 0;
    }
    if (!n_invoke_crc32_input_end) {
    }
    if (f_crc32_input) {
    }
}

int32_t mcap_t::attachment_t::crc32_input_end() {
    if (f_crc32_input_end)
        return m_crc32_input_end;
    m_crc32_input_end = _io()->pos();
    f_crc32_input_end = true;
    return m_crc32_input_end;
}

std::string mcap_t::attachment_t::crc32_input() {
    if (f_crc32_input)
        return m_crc32_input;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_crc32_input = m__io->read_bytes(crc32_input_end());
    m__io->seek(_pos);
    f_crc32_input = true;
    return m_crc32_input;
}

mcap_t::metadata_t::metadata_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_metadata = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::metadata_t::_read() {
    m_name = new prefixed_str_t(m__io, this, m__root);
    m_metadata = new map_str_str_t(m__io, this, m__root);
}

mcap_t::metadata_t::~metadata_t() {
    _clean_up();
}

void mcap_t::metadata_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (m_metadata) {
        delete m_metadata; m_metadata = 0;
    }
}

mcap_t::header_t::header_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_profile = 0;
    m_library = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::header_t::_read() {
    m_profile = new prefixed_str_t(m__io, this, m__root);
    m_library = new prefixed_str_t(m__io, this, m__root);
}

mcap_t::header_t::~header_t() {
    _clean_up();
}

void mcap_t::header_t::_clean_up() {
    if (m_profile) {
        delete m_profile; m_profile = 0;
    }
    if (m_library) {
        delete m_library; m_library = 0;
    }
}

mcap_t::message_t::message_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::message_t::_read() {
    m_channel_id = m__io->read_u2le();
    m_sequence = m__io->read_u4le();
    m_log_time = m__io->read_u8le();
    m_publish_time = m__io->read_u8le();
    m_data = m__io->read_bytes_full();
}

mcap_t::message_t::~message_t() {
    _clean_up();
}

void mcap_t::message_t::_clean_up() {
}

mcap_t::tuple_str_str_t::tuple_str_str_t(kaitai::kstream* p__io, mcap_t::map_str_str_t::entries_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = 0;
    m_value = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::tuple_str_str_t::_read() {
    m_key = new prefixed_str_t(m__io, this, m__root);
    m_value = new prefixed_str_t(m__io, this, m__root);
}

mcap_t::tuple_str_str_t::~tuple_str_str_t() {
    _clean_up();
}

void mcap_t::tuple_str_str_t::_clean_up() {
    if (m_key) {
        delete m_key; m_key = 0;
    }
    if (m_value) {
        delete m_value; m_value = 0;
    }
}

mcap_t::metadata_index_t::metadata_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = 0;
    m_metadata = 0;
    m__io__raw_metadata = 0;
    f_metadata = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::metadata_index_t::_read() {
    m_ofs_metadata = m__io->read_u8le();
    m_len_metadata = m__io->read_u8le();
    m_name = new prefixed_str_t(m__io, this, m__root);
}

mcap_t::metadata_index_t::~metadata_index_t() {
    _clean_up();
}

void mcap_t::metadata_index_t::_clean_up() {
    if (m_name) {
        delete m_name; m_name = 0;
    }
    if (f_metadata) {
        if (m__io__raw_metadata) {
            delete m__io__raw_metadata; m__io__raw_metadata = 0;
        }
        if (m_metadata) {
            delete m_metadata; m_metadata = 0;
        }
    }
}

mcap_t::record_t* mcap_t::metadata_index_t::metadata() {
    if (f_metadata)
        return m_metadata;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_metadata());
    m__raw_metadata = io->read_bytes(len_metadata());
    m__io__raw_metadata = new kaitai::kstream(m__raw_metadata);
    m_metadata = new record_t(m__io__raw_metadata, this, m__root);
    io->seek(_pos);
    f_metadata = true;
    return m_metadata;
}

mcap_t::magic_t::magic_t(kaitai::kstream* p__io, mcap_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::magic_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(magic() == std::string("\x89\x4D\x43\x41\x50\x30\x0D\x0A", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x89\x4D\x43\x41\x50\x30\x0D\x0A", 8), magic(), _io(), std::string("/types/magic/seq/0"));
    }
}

mcap_t::magic_t::~magic_t() {
    _clean_up();
}

void mcap_t::magic_t::_clean_up() {
}

mcap_t::records_t::records_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::records_t::_read() {
    m_records = new std::vector<record_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(new record_t(m__io, this, m__root));
            i++;
        }
    }
}

mcap_t::records_t::~records_t() {
    _clean_up();
}

void mcap_t::records_t::_clean_up() {
    if (m_records) {
        for (std::vector<record_t*>::iterator it = m_records->begin(); it != m_records->end(); ++it) {
            delete *it;
        }
        delete m_records; m_records = 0;
    }
}

mcap_t::footer_t::footer_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_summary_section = 0;
    m__io__raw_summary_section = 0;
    m_summary_offset_section = 0;
    m__io__raw_summary_offset_section = 0;
    f_summary_section = false;
    f_summary_offset_section = false;
    f_ofs_summary_crc32_input = false;
    f_summary_crc32_input = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::footer_t::_read() {
    m_ofs_summary_section = m__io->read_u8le();
    m_ofs_summary_offset_section = m__io->read_u8le();
    m_summary_crc32 = m__io->read_u4le();
}

mcap_t::footer_t::~footer_t() {
    _clean_up();
}

void mcap_t::footer_t::_clean_up() {
    if (f_summary_section && !n_summary_section) {
        if (m__io__raw_summary_section) {
            delete m__io__raw_summary_section; m__io__raw_summary_section = 0;
        }
        if (m_summary_section) {
            delete m_summary_section; m_summary_section = 0;
        }
    }
    if (f_summary_offset_section && !n_summary_offset_section) {
        if (m__io__raw_summary_offset_section) {
            delete m__io__raw_summary_offset_section; m__io__raw_summary_offset_section = 0;
        }
        if (m_summary_offset_section) {
            delete m_summary_offset_section; m_summary_offset_section = 0;
        }
    }
    if (f_summary_crc32_input) {
    }
}

mcap_t::records_t* mcap_t::footer_t::summary_section() {
    if (f_summary_section)
        return m_summary_section;
    n_summary_section = true;
    if (ofs_summary_section() != 0) {
        n_summary_section = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_summary_section());
        m__raw_summary_section = io->read_bytes((((ofs_summary_offset_section() != 0) ? (ofs_summary_offset_section()) : (_root()->ofs_footer())) - ofs_summary_section()));
        m__io__raw_summary_section = new kaitai::kstream(m__raw_summary_section);
        m_summary_section = new records_t(m__io__raw_summary_section, this, m__root);
        io->seek(_pos);
        f_summary_section = true;
    }
    return m_summary_section;
}

mcap_t::records_t* mcap_t::footer_t::summary_offset_section() {
    if (f_summary_offset_section)
        return m_summary_offset_section;
    n_summary_offset_section = true;
    if (ofs_summary_offset_section() != 0) {
        n_summary_offset_section = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_summary_offset_section());
        m__raw_summary_offset_section = io->read_bytes((_root()->ofs_footer() - ofs_summary_offset_section()));
        m__io__raw_summary_offset_section = new kaitai::kstream(m__raw_summary_offset_section);
        m_summary_offset_section = new records_t(m__io__raw_summary_offset_section, this, m__root);
        io->seek(_pos);
        f_summary_offset_section = true;
    }
    return m_summary_offset_section;
}

int32_t mcap_t::footer_t::ofs_summary_crc32_input() {
    if (f_ofs_summary_crc32_input)
        return m_ofs_summary_crc32_input;
    m_ofs_summary_crc32_input = ((ofs_summary_section() != 0) ? (ofs_summary_section()) : (_root()->ofs_footer()));
    f_ofs_summary_crc32_input = true;
    return m_ofs_summary_crc32_input;
}

std::string mcap_t::footer_t::summary_crc32_input() {
    if (f_summary_crc32_input)
        return m_summary_crc32_input;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_summary_crc32_input());
    m_summary_crc32_input = io->read_bytes((((_root()->_io()->size() - ofs_summary_crc32_input()) - 8) - 4));
    io->seek(_pos);
    f_summary_crc32_input = true;
    return m_summary_crc32_input;
}

mcap_t::record_t::record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::record_t::_read() {
    m_op = static_cast<mcap_t::opcode_t>(m__io->read_u1());
    m_len_body = m__io->read_u8le();
    n_body = true;
    switch (op()) {
    case mcap_t::OPCODE_MESSAGE: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new message_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_METADATA_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new metadata_index_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_CHUNK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new chunk_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_SCHEMA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new schema_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_CHUNK_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new chunk_index_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_DATA_END: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new data_end_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_ATTACHMENT_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new attachment_index_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_STATISTICS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new statistics_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_MESSAGE_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new message_index_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_CHANNEL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new channel_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_METADATA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new metadata_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_ATTACHMENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new attachment_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_HEADER: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new header_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_FOOTER: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new footer_t(m__io__raw_body, this, m__root);
        break;
    }
    case mcap_t::OPCODE_SUMMARY_OFFSET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = new kaitai::kstream(m__raw_body);
        m_body = new summary_offset_t(m__io__raw_body, this, m__root);
        break;
    }
    default: {
        m__raw_body = m__io->read_bytes(len_body());
        break;
    }
    }
}

mcap_t::record_t::~record_t() {
    _clean_up();
}

void mcap_t::record_t::_clean_up() {
    if (!n_body) {
        if (m__io__raw_body) {
            delete m__io__raw_body; m__io__raw_body = 0;
        }
        if (m_body) {
            delete m_body; m_body = 0;
        }
    }
}

mcap_t::chunk_index_t::chunk_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_message_index_offsets = 0;
    m__io__raw_message_index_offsets = 0;
    m_compression = 0;
    m_chunk = 0;
    m__io__raw_chunk = 0;
    f_chunk = false;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::chunk_index_t::_read() {
    m_message_start_time = m__io->read_u8le();
    m_message_end_time = m__io->read_u8le();
    m_ofs_chunk = m__io->read_u8le();
    m_len_chunk = m__io->read_u8le();
    m_len_message_index_offsets = m__io->read_u4le();
    m__raw_message_index_offsets = m__io->read_bytes(len_message_index_offsets());
    m__io__raw_message_index_offsets = new kaitai::kstream(m__raw_message_index_offsets);
    m_message_index_offsets = new message_index_offsets_t(m__io__raw_message_index_offsets, this, m__root);
    m_message_index_length = m__io->read_u8le();
    m_compression = new prefixed_str_t(m__io, this, m__root);
    m_compressed_size = m__io->read_u8le();
    m_uncompressed_size = m__io->read_u8le();
}

mcap_t::chunk_index_t::~chunk_index_t() {
    _clean_up();
}

void mcap_t::chunk_index_t::_clean_up() {
    if (m__io__raw_message_index_offsets) {
        delete m__io__raw_message_index_offsets; m__io__raw_message_index_offsets = 0;
    }
    if (m_message_index_offsets) {
        delete m_message_index_offsets; m_message_index_offsets = 0;
    }
    if (m_compression) {
        delete m_compression; m_compression = 0;
    }
    if (f_chunk) {
        if (m__io__raw_chunk) {
            delete m__io__raw_chunk; m__io__raw_chunk = 0;
        }
        if (m_chunk) {
            delete m_chunk; m_chunk = 0;
        }
    }
}

mcap_t::chunk_index_t::message_index_offset_t::message_index_offset_t(kaitai::kstream* p__io, mcap_t::chunk_index_t::message_index_offsets_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::chunk_index_t::message_index_offset_t::_read() {
    m_channel_id = m__io->read_u2le();
    m_offset = m__io->read_u8le();
}

mcap_t::chunk_index_t::message_index_offset_t::~message_index_offset_t() {
    _clean_up();
}

void mcap_t::chunk_index_t::message_index_offset_t::_clean_up() {
}

mcap_t::chunk_index_t::message_index_offsets_t::message_index_offsets_t(kaitai::kstream* p__io, mcap_t::chunk_index_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = 0;

    try {
        _read();
    } catch(...) {
        _clean_up();
        throw;
    }
}

void mcap_t::chunk_index_t::message_index_offsets_t::_read() {
    m_entries = new std::vector<message_index_offset_t*>();
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(new message_index_offset_t(m__io, this, m__root));
            i++;
        }
    }
}

mcap_t::chunk_index_t::message_index_offsets_t::~message_index_offsets_t() {
    _clean_up();
}

void mcap_t::chunk_index_t::message_index_offsets_t::_clean_up() {
    if (m_entries) {
        for (std::vector<message_index_offset_t*>::iterator it = m_entries->begin(); it != m_entries->end(); ++it) {
            delete *it;
        }
        delete m_entries; m_entries = 0;
    }
}

mcap_t::record_t* mcap_t::chunk_index_t::chunk() {
    if (f_chunk)
        return m_chunk;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_chunk());
    m__raw_chunk = io->read_bytes(len_chunk());
    m__io__raw_chunk = new kaitai::kstream(m__raw_chunk);
    m_chunk = new record_t(m__io__raw_chunk, this, m__root);
    io->seek(_pos);
    f_chunk = true;
    return m_chunk;
}

mcap_t::record_t* mcap_t::footer() {
    if (f_footer)
        return m_footer;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_footer());
    m__raw_footer = m__io->read_bytes_full();
    m__io__raw_footer = new kaitai::kstream(m__raw_footer);
    m_footer = new record_t(m__io__raw_footer, this, m__root);
    m__io->seek(_pos);
    f_footer = true;
    return m_footer;
}

int32_t mcap_t::ofs_footer() {
    if (f_ofs_footer)
        return m_ofs_footer;
    m_ofs_footer = ((((_io()->size() - 1) - 8) - 20) - 8);
    f_ofs_footer = true;
    return m_ofs_footer;
}
