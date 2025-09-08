// This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

#include "mcap.h"
#include "kaitai/exceptions.h"
const std::set<mcap_t::opcode_t> mcap_t::_values_opcode_t{
    mcap_t::OPCODE_HEADER,
    mcap_t::OPCODE_FOOTER,
    mcap_t::OPCODE_SCHEMA,
    mcap_t::OPCODE_CHANNEL,
    mcap_t::OPCODE_MESSAGE,
    mcap_t::OPCODE_CHUNK,
    mcap_t::OPCODE_MESSAGE_INDEX,
    mcap_t::OPCODE_CHUNK_INDEX,
    mcap_t::OPCODE_ATTACHMENT,
    mcap_t::OPCODE_ATTACHMENT_INDEX,
    mcap_t::OPCODE_STATISTICS,
    mcap_t::OPCODE_METADATA,
    mcap_t::OPCODE_METADATA_INDEX,
    mcap_t::OPCODE_SUMMARY_OFFSET,
    mcap_t::OPCODE_DATA_END,
};
bool mcap_t::_is_defined_opcode_t(mcap_t::opcode_t v) {
    return mcap_t::_values_opcode_t.find(v) != mcap_t::_values_opcode_t.end();
}

mcap_t::mcap_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root ? p__root : this;
    m_header_magic = nullptr;
    m_records = nullptr;
    m_footer_magic = nullptr;
    m_footer = nullptr;
    m__io__raw_footer = nullptr;
    f_footer = false;
    f_ofs_footer = false;
    _read();
}

void mcap_t::_read() {
    m_header_magic = std::unique_ptr<magic_t>(new magic_t(m__io, this, m__root));
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        record_t* _;
        do {
            _ = new record_t(m__io, this, m__root);
            m_records->push_back(std::move(std::unique_ptr<record_t>(_)));
            i++;
        } while (!(_->op() == mcap_t::OPCODE_FOOTER));
    }
    m_footer_magic = std::unique_ptr<magic_t>(new magic_t(m__io, this, m__root));
}

mcap_t::~mcap_t() {
    _clean_up();
}

void mcap_t::_clean_up() {
    if (f_footer) {
    }
}

mcap_t::attachment_t::attachment_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_content_type = nullptr;
    f_crc32_input = false;
    f_crc32_input_end = false;
    _read();
}

void mcap_t::attachment_t::_read() {
    m_log_time = m__io->read_u8le();
    m_create_time = m__io->read_u8le();
    m_name = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_content_type = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
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
    if (!n_invoke_crc32_input_end) {
    }
    if (f_crc32_input) {
    }
}

std::string mcap_t::attachment_t::crc32_input() {
    if (f_crc32_input)
        return m_crc32_input;
    f_crc32_input = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(0);
    m_crc32_input = m__io->read_bytes(crc32_input_end());
    m__io->seek(_pos);
    return m_crc32_input;
}

int32_t mcap_t::attachment_t::crc32_input_end() {
    if (f_crc32_input_end)
        return m_crc32_input_end;
    f_crc32_input_end = true;
    m_crc32_input_end = _io()->pos();
    return m_crc32_input_end;
}

mcap_t::attachment_index_t::attachment_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_content_type = nullptr;
    m_attachment = nullptr;
    m__io__raw_attachment = nullptr;
    f_attachment = false;
    _read();
}

void mcap_t::attachment_index_t::_read() {
    m_ofs_attachment = m__io->read_u8le();
    m_len_attachment = m__io->read_u8le();
    m_log_time = m__io->read_u8le();
    m_create_time = m__io->read_u8le();
    m_data_size = m__io->read_u8le();
    m_name = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_content_type = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
}

mcap_t::attachment_index_t::~attachment_index_t() {
    _clean_up();
}

void mcap_t::attachment_index_t::_clean_up() {
    if (f_attachment) {
    }
}

mcap_t::record_t* mcap_t::attachment_index_t::attachment() {
    if (f_attachment)
        return m_attachment.get();
    f_attachment = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_attachment());
    m__raw_attachment = io->read_bytes(len_attachment());
    m__io__raw_attachment = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_attachment));
    m_attachment = std::unique_ptr<record_t>(new record_t(m__io__raw_attachment.get(), this, m__root));
    io->seek(_pos);
    return m_attachment.get();
}

mcap_t::channel_t::channel_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_topic = nullptr;
    m_message_encoding = nullptr;
    m_metadata = nullptr;
    _read();
}

void mcap_t::channel_t::_read() {
    m_id = m__io->read_u2le();
    m_schema_id = m__io->read_u2le();
    m_topic = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_message_encoding = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_metadata = std::unique_ptr<map_str_str_t>(new map_str_str_t(m__io, this, m__root));
}

mcap_t::channel_t::~channel_t() {
    _clean_up();
}

void mcap_t::channel_t::_clean_up() {
}

mcap_t::chunk_t::chunk_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_compression = nullptr;
    m__io__raw_records = nullptr;
    _read();
}

void mcap_t::chunk_t::_read() {
    m_message_start_time = m__io->read_u8le();
    m_message_end_time = m__io->read_u8le();
    m_uncompressed_size = m__io->read_u8le();
    m_uncompressed_crc32 = m__io->read_u4le();
    m_compression = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_len_records = m__io->read_u8le();
    n_records = true;
    {
        std::string on = compression()->str();
        if (on == std::string("")) {
            n_records = false;
            m__raw_records = m__io->read_bytes(len_records());
            m__io__raw_records = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_records));
            m_records = std::unique_ptr<records_t>(new records_t(m__io__raw_records.get(), this, m__root));
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
    if (!n_records) {
    }
}

mcap_t::chunk_index_t::chunk_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_message_index_offsets = nullptr;
    m__io__raw_message_index_offsets = nullptr;
    m_compression = nullptr;
    m_chunk = nullptr;
    m__io__raw_chunk = nullptr;
    f_chunk = false;
    _read();
}

void mcap_t::chunk_index_t::_read() {
    m_message_start_time = m__io->read_u8le();
    m_message_end_time = m__io->read_u8le();
    m_ofs_chunk = m__io->read_u8le();
    m_len_chunk = m__io->read_u8le();
    m_len_message_index_offsets = m__io->read_u4le();
    m__raw_message_index_offsets = m__io->read_bytes(len_message_index_offsets());
    m__io__raw_message_index_offsets = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_message_index_offsets));
    m_message_index_offsets = std::unique_ptr<message_index_offsets_t>(new message_index_offsets_t(m__io__raw_message_index_offsets.get(), this, m__root));
    m_message_index_length = m__io->read_u8le();
    m_compression = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_compressed_size = m__io->read_u8le();
    m_uncompressed_size = m__io->read_u8le();
}

mcap_t::chunk_index_t::~chunk_index_t() {
    _clean_up();
}

void mcap_t::chunk_index_t::_clean_up() {
    if (f_chunk) {
    }
}

mcap_t::chunk_index_t::message_index_offset_t::message_index_offset_t(kaitai::kstream* p__io, mcap_t::chunk_index_t::message_index_offsets_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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
    m_entries = nullptr;
    _read();
}

void mcap_t::chunk_index_t::message_index_offsets_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<message_index_offset_t>>>(new std::vector<std::unique_ptr<message_index_offset_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<message_index_offset_t>(new message_index_offset_t(m__io, this, m__root))));
            i++;
        }
    }
}

mcap_t::chunk_index_t::message_index_offsets_t::~message_index_offsets_t() {
    _clean_up();
}

void mcap_t::chunk_index_t::message_index_offsets_t::_clean_up() {
}

mcap_t::record_t* mcap_t::chunk_index_t::chunk() {
    if (f_chunk)
        return m_chunk.get();
    f_chunk = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_chunk());
    m__raw_chunk = io->read_bytes(len_chunk());
    m__io__raw_chunk = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_chunk));
    m_chunk = std::unique_ptr<record_t>(new record_t(m__io__raw_chunk.get(), this, m__root));
    io->seek(_pos);
    return m_chunk.get();
}

mcap_t::data_end_t::data_end_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mcap_t::data_end_t::_read() {
    m_data_section_crc32 = m__io->read_u4le();
}

mcap_t::data_end_t::~data_end_t() {
    _clean_up();
}

void mcap_t::data_end_t::_clean_up() {
}

mcap_t::footer_t::footer_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_summary_offset_section = nullptr;
    m__io__raw_summary_offset_section = nullptr;
    m_summary_section = nullptr;
    m__io__raw_summary_section = nullptr;
    f_ofs_summary_crc32_input = false;
    f_summary_crc32_input = false;
    f_summary_offset_section = false;
    f_summary_section = false;
    _read();
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
    if (f_summary_crc32_input) {
    }
    if (f_summary_offset_section && !n_summary_offset_section) {
    }
    if (f_summary_section && !n_summary_section) {
    }
}

int32_t mcap_t::footer_t::ofs_summary_crc32_input() {
    if (f_ofs_summary_crc32_input)
        return m_ofs_summary_crc32_input;
    f_ofs_summary_crc32_input = true;
    m_ofs_summary_crc32_input = ((ofs_summary_section() != 0) ? (ofs_summary_section()) : (_root()->ofs_footer()));
    return m_ofs_summary_crc32_input;
}

std::string mcap_t::footer_t::summary_crc32_input() {
    if (f_summary_crc32_input)
        return m_summary_crc32_input;
    f_summary_crc32_input = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_summary_crc32_input());
    m_summary_crc32_input = io->read_bytes(((_root()->_io()->size() - ofs_summary_crc32_input()) - 8) - 4);
    io->seek(_pos);
    return m_summary_crc32_input;
}

mcap_t::records_t* mcap_t::footer_t::summary_offset_section() {
    if (f_summary_offset_section)
        return m_summary_offset_section.get();
    f_summary_offset_section = true;
    n_summary_offset_section = true;
    if (ofs_summary_offset_section() != 0) {
        n_summary_offset_section = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_summary_offset_section());
        m__raw_summary_offset_section = io->read_bytes(_root()->ofs_footer() - ofs_summary_offset_section());
        m__io__raw_summary_offset_section = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_summary_offset_section));
        m_summary_offset_section = std::unique_ptr<records_t>(new records_t(m__io__raw_summary_offset_section.get(), this, m__root));
        io->seek(_pos);
    }
    return m_summary_offset_section.get();
}

mcap_t::records_t* mcap_t::footer_t::summary_section() {
    if (f_summary_section)
        return m_summary_section.get();
    f_summary_section = true;
    n_summary_section = true;
    if (ofs_summary_section() != 0) {
        n_summary_section = false;
        kaitai::kstream *io = _root()->_io();
        std::streampos _pos = io->pos();
        io->seek(ofs_summary_section());
        m__raw_summary_section = io->read_bytes(((ofs_summary_offset_section() != 0) ? (ofs_summary_offset_section()) : (_root()->ofs_footer())) - ofs_summary_section());
        m__io__raw_summary_section = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_summary_section));
        m_summary_section = std::unique_ptr<records_t>(new records_t(m__io__raw_summary_section.get(), this, m__root));
        io->seek(_pos);
    }
    return m_summary_section.get();
}

mcap_t::header_t::header_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_profile = nullptr;
    m_library = nullptr;
    _read();
}

void mcap_t::header_t::_read() {
    m_profile = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_library = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
}

mcap_t::header_t::~header_t() {
    _clean_up();
}

void mcap_t::header_t::_clean_up() {
}

mcap_t::magic_t::magic_t(kaitai::kstream* p__io, mcap_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mcap_t::magic_t::_read() {
    m_magic = m__io->read_bytes(8);
    if (!(m_magic == std::string("\x89\x4D\x43\x41\x50\x30\x0D\x0A", 8))) {
        throw kaitai::validation_not_equal_error<std::string>(std::string("\x89\x4D\x43\x41\x50\x30\x0D\x0A", 8), m_magic, m__io, std::string("/types/magic/seq/0"));
    }
}

mcap_t::magic_t::~magic_t() {
    _clean_up();
}

void mcap_t::magic_t::_clean_up() {
}

mcap_t::map_str_str_t::map_str_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    m__io__raw_entries = nullptr;
    _read();
}

void mcap_t::map_str_str_t::_read() {
    m_len_entries = m__io->read_u4le();
    m__raw_entries = m__io->read_bytes(len_entries());
    m__io__raw_entries = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_entries));
    m_entries = std::unique_ptr<entries_t>(new entries_t(m__io__raw_entries.get(), this, m__root));
}

mcap_t::map_str_str_t::~map_str_str_t() {
    _clean_up();
}

void mcap_t::map_str_str_t::_clean_up() {
}

mcap_t::map_str_str_t::entries_t::entries_t(kaitai::kstream* p__io, mcap_t::map_str_str_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void mcap_t::map_str_str_t::entries_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<tuple_str_str_t>>>(new std::vector<std::unique_ptr<tuple_str_str_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<tuple_str_str_t>(new tuple_str_str_t(m__io, this, m__root))));
            i++;
        }
    }
}

mcap_t::map_str_str_t::entries_t::~entries_t() {
    _clean_up();
}

void mcap_t::map_str_str_t::entries_t::_clean_up() {
}

mcap_t::message_t::message_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

mcap_t::message_index_t::message_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = nullptr;
    m__io__raw_records = nullptr;
    _read();
}

void mcap_t::message_index_t::_read() {
    m_channel_id = m__io->read_u2le();
    m_len_records = m__io->read_u4le();
    m__raw_records = m__io->read_bytes(len_records());
    m__io__raw_records = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_records));
    m_records = std::unique_ptr<message_index_entries_t>(new message_index_entries_t(m__io__raw_records.get(), this, m__root));
}

mcap_t::message_index_t::~message_index_t() {
    _clean_up();
}

void mcap_t::message_index_t::_clean_up() {
}

mcap_t::message_index_t::message_index_entries_t::message_index_entries_t(kaitai::kstream* p__io, mcap_t::message_index_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void mcap_t::message_index_t::message_index_entries_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<message_index_entry_t>>>(new std::vector<std::unique_ptr<message_index_entry_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<message_index_entry_t>(new message_index_entry_t(m__io, this, m__root))));
            i++;
        }
    }
}

mcap_t::message_index_t::message_index_entries_t::~message_index_entries_t() {
    _clean_up();
}

void mcap_t::message_index_t::message_index_entries_t::_clean_up() {
}

mcap_t::message_index_t::message_index_entry_t::message_index_entry_t(kaitai::kstream* p__io, mcap_t::message_index_t::message_index_entries_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

mcap_t::metadata_t::metadata_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_metadata = nullptr;
    _read();
}

void mcap_t::metadata_t::_read() {
    m_name = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_metadata = std::unique_ptr<map_str_str_t>(new map_str_str_t(m__io, this, m__root));
}

mcap_t::metadata_t::~metadata_t() {
    _clean_up();
}

void mcap_t::metadata_t::_clean_up() {
}

mcap_t::metadata_index_t::metadata_index_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_metadata = nullptr;
    m__io__raw_metadata = nullptr;
    f_metadata = false;
    _read();
}

void mcap_t::metadata_index_t::_read() {
    m_ofs_metadata = m__io->read_u8le();
    m_len_metadata = m__io->read_u8le();
    m_name = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
}

mcap_t::metadata_index_t::~metadata_index_t() {
    _clean_up();
}

void mcap_t::metadata_index_t::_clean_up() {
    if (f_metadata) {
    }
}

mcap_t::record_t* mcap_t::metadata_index_t::metadata() {
    if (f_metadata)
        return m_metadata.get();
    f_metadata = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_metadata());
    m__raw_metadata = io->read_bytes(len_metadata());
    m__io__raw_metadata = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_metadata));
    m_metadata = std::unique_ptr<record_t>(new record_t(m__io__raw_metadata.get(), this, m__root));
    io->seek(_pos);
    return m_metadata.get();
}

mcap_t::prefixed_str_t::prefixed_str_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
}

void mcap_t::prefixed_str_t::_read() {
    m_len_str = m__io->read_u4le();
    m_str = kaitai::kstream::bytes_to_str(m__io->read_bytes(len_str()), "UTF-8");
}

mcap_t::prefixed_str_t::~prefixed_str_t() {
    _clean_up();
}

void mcap_t::prefixed_str_t::_clean_up() {
}

mcap_t::record_t::record_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m__io__raw_body = nullptr;
    _read();
}

void mcap_t::record_t::_read() {
    m_op = static_cast<mcap_t::opcode_t>(m__io->read_u1());
    m_len_body = m__io->read_u8le();
    n_body = true;
    switch (op()) {
    case mcap_t::OPCODE_ATTACHMENT: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<attachment_t>(new attachment_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_ATTACHMENT_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<attachment_index_t>(new attachment_index_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_CHANNEL: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<channel_t>(new channel_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_CHUNK: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<chunk_t>(new chunk_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_CHUNK_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<chunk_index_t>(new chunk_index_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_DATA_END: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<data_end_t>(new data_end_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_FOOTER: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<footer_t>(new footer_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_HEADER: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<header_t>(new header_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_MESSAGE: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<message_t>(new message_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_MESSAGE_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<message_index_t>(new message_index_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_METADATA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<metadata_t>(new metadata_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_METADATA_INDEX: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<metadata_index_t>(new metadata_index_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_SCHEMA: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<schema_t>(new schema_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_STATISTICS: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<statistics_t>(new statistics_t(m__io__raw_body.get(), this, m__root));
        break;
    }
    case mcap_t::OPCODE_SUMMARY_OFFSET: {
        n_body = false;
        m__raw_body = m__io->read_bytes(len_body());
        m__io__raw_body = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_body));
        m_body = std::unique_ptr<summary_offset_t>(new summary_offset_t(m__io__raw_body.get(), this, m__root));
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
    }
}

mcap_t::records_t::records_t(kaitai::kstream* p__io, kaitai::kstruct* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_records = nullptr;
    _read();
}

void mcap_t::records_t::_read() {
    m_records = std::unique_ptr<std::vector<std::unique_ptr<record_t>>>(new std::vector<std::unique_ptr<record_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_records->push_back(std::move(std::unique_ptr<record_t>(new record_t(m__io, this, m__root))));
            i++;
        }
    }
}

mcap_t::records_t::~records_t() {
    _clean_up();
}

void mcap_t::records_t::_clean_up() {
}

mcap_t::schema_t::schema_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_name = nullptr;
    m_encoding = nullptr;
    _read();
}

void mcap_t::schema_t::_read() {
    m_id = m__io->read_u2le();
    m_name = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_encoding = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_len_data = m__io->read_u4le();
    m_data = m__io->read_bytes(len_data());
}

mcap_t::schema_t::~schema_t() {
    _clean_up();
}

void mcap_t::schema_t::_clean_up() {
}

mcap_t::statistics_t::statistics_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_channel_message_counts = nullptr;
    m__io__raw_channel_message_counts = nullptr;
    _read();
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
    m__io__raw_channel_message_counts = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_channel_message_counts));
    m_channel_message_counts = std::unique_ptr<channel_message_counts_t>(new channel_message_counts_t(m__io__raw_channel_message_counts.get(), this, m__root));
}

mcap_t::statistics_t::~statistics_t() {
    _clean_up();
}

void mcap_t::statistics_t::_clean_up() {
}

mcap_t::statistics_t::channel_message_count_t::channel_message_count_t(kaitai::kstream* p__io, mcap_t::statistics_t::channel_message_counts_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    _read();
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

mcap_t::statistics_t::channel_message_counts_t::channel_message_counts_t(kaitai::kstream* p__io, mcap_t::statistics_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_entries = nullptr;
    _read();
}

void mcap_t::statistics_t::channel_message_counts_t::_read() {
    m_entries = std::unique_ptr<std::vector<std::unique_ptr<channel_message_count_t>>>(new std::vector<std::unique_ptr<channel_message_count_t>>());
    {
        int i = 0;
        while (!m__io->is_eof()) {
            m_entries->push_back(std::move(std::unique_ptr<channel_message_count_t>(new channel_message_count_t(m__io, this, m__root))));
            i++;
        }
    }
}

mcap_t::statistics_t::channel_message_counts_t::~channel_message_counts_t() {
    _clean_up();
}

void mcap_t::statistics_t::channel_message_counts_t::_clean_up() {
}

mcap_t::summary_offset_t::summary_offset_t(kaitai::kstream* p__io, mcap_t::record_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_group = nullptr;
    m__io__raw_group = nullptr;
    f_group = false;
    _read();
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
    }
}

mcap_t::records_t* mcap_t::summary_offset_t::group() {
    if (f_group)
        return m_group.get();
    f_group = true;
    kaitai::kstream *io = _root()->_io();
    std::streampos _pos = io->pos();
    io->seek(ofs_group());
    m__raw_group = io->read_bytes(len_group());
    m__io__raw_group = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_group));
    m_group = std::unique_ptr<records_t>(new records_t(m__io__raw_group.get(), this, m__root));
    io->seek(_pos);
    return m_group.get();
}

mcap_t::tuple_str_str_t::tuple_str_str_t(kaitai::kstream* p__io, mcap_t::map_str_str_t::entries_t* p__parent, mcap_t* p__root) : kaitai::kstruct(p__io) {
    m__parent = p__parent;
    m__root = p__root;
    m_key = nullptr;
    m_value = nullptr;
    _read();
}

void mcap_t::tuple_str_str_t::_read() {
    m_key = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
    m_value = std::unique_ptr<prefixed_str_t>(new prefixed_str_t(m__io, this, m__root));
}

mcap_t::tuple_str_str_t::~tuple_str_str_t() {
    _clean_up();
}

void mcap_t::tuple_str_str_t::_clean_up() {
}

mcap_t::record_t* mcap_t::footer() {
    if (f_footer)
        return m_footer.get();
    f_footer = true;
    std::streampos _pos = m__io->pos();
    m__io->seek(ofs_footer());
    m__raw_footer = m__io->read_bytes_full();
    m__io__raw_footer = std::unique_ptr<kaitai::kstream>(new kaitai::kstream(m__raw_footer));
    m_footer = std::unique_ptr<record_t>(new record_t(m__io__raw_footer.get(), this, m__root));
    m__io->seek(_pos);
    return m_footer.get();
}

int32_t mcap_t::ofs_footer() {
    if (f_ofs_footer)
        return m_ofs_footer;
    f_ofs_footer = true;
    m_ofs_footer = (((_io()->size() - 1) - 8) - 20) - 8;
    return m_ofs_footer;
}
