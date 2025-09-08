# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package Mcap;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $OPCODE_HEADER = 1;
our $OPCODE_FOOTER = 2;
our $OPCODE_SCHEMA = 3;
our $OPCODE_CHANNEL = 4;
our $OPCODE_MESSAGE = 5;
our $OPCODE_CHUNK = 6;
our $OPCODE_MESSAGE_INDEX = 7;
our $OPCODE_CHUNK_INDEX = 8;
our $OPCODE_ATTACHMENT = 9;
our $OPCODE_ATTACHMENT_INDEX = 10;
our $OPCODE_STATISTICS = 11;
our $OPCODE_METADATA = 12;
our $OPCODE_METADATA_INDEX = 13;
our $OPCODE_SUMMARY_OFFSET = 14;
our $OPCODE_DATA_END = 15;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{header_magic} = Mcap::Magic->new($self->{_io}, $self, $self->{_root});
    $self->{records} = [];
    {
        my $_it;
        do {
            $_it = Mcap::Record->new($self->{_io}, $self, $self->{_root});
            push @{$self->{records}}, $_it;
        } until ($_it->op() == $Mcap::OPCODE_FOOTER);
    }
    $self->{footer_magic} = Mcap::Magic->new($self->{_io}, $self, $self->{_root});
}

sub footer {
    my ($self) = @_;
    return $self->{footer} if ($self->{footer});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_footer());
    $self->{_raw_footer} = $self->{_io}->read_bytes_full();
    my $io__raw_footer = IO::KaitaiStruct::Stream->new($self->{_raw_footer});
    $self->{footer} = Mcap::Record->new($io__raw_footer, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{footer};
}

sub ofs_footer {
    my ($self) = @_;
    return $self->{ofs_footer} if ($self->{ofs_footer});
    $self->{ofs_footer} = ((($self->_io()->size() - 1) - 8) - 20) - 8;
    return $self->{ofs_footer};
}

sub header_magic {
    my ($self) = @_;
    return $self->{header_magic};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

sub footer_magic {
    my ($self) = @_;
    return $self->{footer_magic};
}

sub _raw_footer {
    my ($self) = @_;
    return $self->{_raw_footer};
}

########################################################################
package Mcap::Attachment;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{log_time} = $self->{_io}->read_u8le();
    $self->{create_time} = $self->{_io}->read_u8le();
    $self->{name} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{content_type} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{len_data} = $self->{_io}->read_u8le();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
    if ($self->crc32_input_end() >= 0) {
        $self->{invoke_crc32_input_end} = $self->{_io}->read_bytes(0);
    }
    $self->{crc32} = $self->{_io}->read_u4le();
}

sub crc32_input {
    my ($self) = @_;
    return $self->{crc32_input} if ($self->{crc32_input});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{crc32_input} = $self->{_io}->read_bytes($self->crc32_input_end());
    $self->{_io}->seek($_pos);
    return $self->{crc32_input};
}

sub crc32_input_end {
    my ($self) = @_;
    return $self->{crc32_input_end} if ($self->{crc32_input_end});
    $self->{crc32_input_end} = $self->_io()->pos();
    return $self->{crc32_input_end};
}

sub log_time {
    my ($self) = @_;
    return $self->{log_time};
}

sub create_time {
    my ($self) = @_;
    return $self->{create_time};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub content_type {
    my ($self) = @_;
    return $self->{content_type};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub invoke_crc32_input_end {
    my ($self) = @_;
    return $self->{invoke_crc32_input_end};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

########################################################################
package Mcap::AttachmentIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_attachment} = $self->{_io}->read_u8le();
    $self->{len_attachment} = $self->{_io}->read_u8le();
    $self->{log_time} = $self->{_io}->read_u8le();
    $self->{create_time} = $self->{_io}->read_u8le();
    $self->{data_size} = $self->{_io}->read_u8le();
    $self->{name} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{content_type} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
}

sub attachment {
    my ($self) = @_;
    return $self->{attachment} if ($self->{attachment});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_attachment());
    $self->{_raw_attachment} = $io->read_bytes($self->len_attachment());
    my $io__raw_attachment = IO::KaitaiStruct::Stream->new($self->{_raw_attachment});
    $self->{attachment} = Mcap::Record->new($io__raw_attachment, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{attachment};
}

sub ofs_attachment {
    my ($self) = @_;
    return $self->{ofs_attachment};
}

sub len_attachment {
    my ($self) = @_;
    return $self->{len_attachment};
}

sub log_time {
    my ($self) = @_;
    return $self->{log_time};
}

sub create_time {
    my ($self) = @_;
    return $self->{create_time};
}

sub data_size {
    my ($self) = @_;
    return $self->{data_size};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub content_type {
    my ($self) = @_;
    return $self->{content_type};
}

sub _raw_attachment {
    my ($self) = @_;
    return $self->{_raw_attachment};
}

########################################################################
package Mcap::Channel;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{id} = $self->{_io}->read_u2le();
    $self->{schema_id} = $self->{_io}->read_u2le();
    $self->{topic} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{message_encoding} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{metadata} = Mcap::MapStrStr->new($self->{_io}, $self, $self->{_root});
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub schema_id {
    my ($self) = @_;
    return $self->{schema_id};
}

sub topic {
    my ($self) = @_;
    return $self->{topic};
}

sub message_encoding {
    my ($self) = @_;
    return $self->{message_encoding};
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

########################################################################
package Mcap::Chunk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{message_start_time} = $self->{_io}->read_u8le();
    $self->{message_end_time} = $self->{_io}->read_u8le();
    $self->{uncompressed_size} = $self->{_io}->read_u8le();
    $self->{uncompressed_crc32} = $self->{_io}->read_u4le();
    $self->{compression} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{len_records} = $self->{_io}->read_u8le();
    my $_on = $self->compression()->str();
    if ($_on eq "") {
        $self->{_raw_records} = $self->{_io}->read_bytes($self->len_records());
        my $io__raw_records = IO::KaitaiStruct::Stream->new($self->{_raw_records});
        $self->{records} = Mcap::Records->new($io__raw_records, $self, $self->{_root});
    }
    else {
        $self->{records} = $self->{_io}->read_bytes($self->len_records());
    }
}

sub message_start_time {
    my ($self) = @_;
    return $self->{message_start_time};
}

sub message_end_time {
    my ($self) = @_;
    return $self->{message_end_time};
}

sub uncompressed_size {
    my ($self) = @_;
    return $self->{uncompressed_size};
}

sub uncompressed_crc32 {
    my ($self) = @_;
    return $self->{uncompressed_crc32};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub len_records {
    my ($self) = @_;
    return $self->{len_records};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

sub _raw_records {
    my ($self) = @_;
    return $self->{_raw_records};
}

########################################################################
package Mcap::ChunkIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{message_start_time} = $self->{_io}->read_u8le();
    $self->{message_end_time} = $self->{_io}->read_u8le();
    $self->{ofs_chunk} = $self->{_io}->read_u8le();
    $self->{len_chunk} = $self->{_io}->read_u8le();
    $self->{len_message_index_offsets} = $self->{_io}->read_u4le();
    $self->{_raw_message_index_offsets} = $self->{_io}->read_bytes($self->len_message_index_offsets());
    my $io__raw_message_index_offsets = IO::KaitaiStruct::Stream->new($self->{_raw_message_index_offsets});
    $self->{message_index_offsets} = Mcap::ChunkIndex::MessageIndexOffsets->new($io__raw_message_index_offsets, $self, $self->{_root});
    $self->{message_index_length} = $self->{_io}->read_u8le();
    $self->{compression} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{compressed_size} = $self->{_io}->read_u8le();
    $self->{uncompressed_size} = $self->{_io}->read_u8le();
}

sub chunk {
    my ($self) = @_;
    return $self->{chunk} if ($self->{chunk});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_chunk());
    $self->{_raw_chunk} = $io->read_bytes($self->len_chunk());
    my $io__raw_chunk = IO::KaitaiStruct::Stream->new($self->{_raw_chunk});
    $self->{chunk} = Mcap::Record->new($io__raw_chunk, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{chunk};
}

sub message_start_time {
    my ($self) = @_;
    return $self->{message_start_time};
}

sub message_end_time {
    my ($self) = @_;
    return $self->{message_end_time};
}

sub ofs_chunk {
    my ($self) = @_;
    return $self->{ofs_chunk};
}

sub len_chunk {
    my ($self) = @_;
    return $self->{len_chunk};
}

sub len_message_index_offsets {
    my ($self) = @_;
    return $self->{len_message_index_offsets};
}

sub message_index_offsets {
    my ($self) = @_;
    return $self->{message_index_offsets};
}

sub message_index_length {
    my ($self) = @_;
    return $self->{message_index_length};
}

sub compression {
    my ($self) = @_;
    return $self->{compression};
}

sub compressed_size {
    my ($self) = @_;
    return $self->{compressed_size};
}

sub uncompressed_size {
    my ($self) = @_;
    return $self->{uncompressed_size};
}

sub _raw_message_index_offsets {
    my ($self) = @_;
    return $self->{_raw_message_index_offsets};
}

sub _raw_chunk {
    my ($self) = @_;
    return $self->{_raw_chunk};
}

########################################################################
package Mcap::ChunkIndex::MessageIndexOffset;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{channel_id} = $self->{_io}->read_u2le();
    $self->{offset} = $self->{_io}->read_u8le();
}

sub channel_id {
    my ($self) = @_;
    return $self->{channel_id};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package Mcap::ChunkIndex::MessageIndexOffsets;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Mcap::ChunkIndex::MessageIndexOffset->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Mcap::DataEnd;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{data_section_crc32} = $self->{_io}->read_u4le();
}

sub data_section_crc32 {
    my ($self) = @_;
    return $self->{data_section_crc32};
}

########################################################################
package Mcap::Footer;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_summary_section} = $self->{_io}->read_u8le();
    $self->{ofs_summary_offset_section} = $self->{_io}->read_u8le();
    $self->{summary_crc32} = $self->{_io}->read_u4le();
}

sub ofs_summary_crc32_input {
    my ($self) = @_;
    return $self->{ofs_summary_crc32_input} if ($self->{ofs_summary_crc32_input});
    $self->{ofs_summary_crc32_input} = ($self->ofs_summary_section() != 0 ? $self->ofs_summary_section() : $self->_root()->ofs_footer());
    return $self->{ofs_summary_crc32_input};
}

sub summary_crc32_input {
    my ($self) = @_;
    return $self->{summary_crc32_input} if ($self->{summary_crc32_input});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_summary_crc32_input());
    $self->{summary_crc32_input} = $io->read_bytes((($self->_root()->_io()->size() - $self->ofs_summary_crc32_input()) - 8) - 4);
    $io->seek($_pos);
    return $self->{summary_crc32_input};
}

sub summary_offset_section {
    my ($self) = @_;
    return $self->{summary_offset_section} if ($self->{summary_offset_section});
    if ($self->ofs_summary_offset_section() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_summary_offset_section());
        $self->{_raw_summary_offset_section} = $io->read_bytes($self->_root()->ofs_footer() - $self->ofs_summary_offset_section());
        my $io__raw_summary_offset_section = IO::KaitaiStruct::Stream->new($self->{_raw_summary_offset_section});
        $self->{summary_offset_section} = Mcap::Records->new($io__raw_summary_offset_section, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{summary_offset_section};
}

sub summary_section {
    my ($self) = @_;
    return $self->{summary_section} if ($self->{summary_section});
    if ($self->ofs_summary_section() != 0) {
        my $io = $self->_root()->_io();
        my $_pos = $io->pos();
        $io->seek($self->ofs_summary_section());
        $self->{_raw_summary_section} = $io->read_bytes(($self->ofs_summary_offset_section() != 0 ? $self->ofs_summary_offset_section() : $self->_root()->ofs_footer()) - $self->ofs_summary_section());
        my $io__raw_summary_section = IO::KaitaiStruct::Stream->new($self->{_raw_summary_section});
        $self->{summary_section} = Mcap::Records->new($io__raw_summary_section, $self, $self->{_root});
        $io->seek($_pos);
    }
    return $self->{summary_section};
}

sub ofs_summary_section {
    my ($self) = @_;
    return $self->{ofs_summary_section};
}

sub ofs_summary_offset_section {
    my ($self) = @_;
    return $self->{ofs_summary_offset_section};
}

sub summary_crc32 {
    my ($self) = @_;
    return $self->{summary_crc32};
}

sub _raw_summary_offset_section {
    my ($self) = @_;
    return $self->{_raw_summary_offset_section};
}

sub _raw_summary_section {
    my ($self) = @_;
    return $self->{_raw_summary_section};
}

########################################################################
package Mcap::Header;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{profile} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{library} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
}

sub profile {
    my ($self) = @_;
    return $self->{profile};
}

sub library {
    my ($self) = @_;
    return $self->{library};
}

########################################################################
package Mcap::Magic;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(8);
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

########################################################################
package Mcap::MapStrStr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_entries} = $self->{_io}->read_u4le();
    $self->{_raw_entries} = $self->{_io}->read_bytes($self->len_entries());
    my $io__raw_entries = IO::KaitaiStruct::Stream->new($self->{_raw_entries});
    $self->{entries} = Mcap::MapStrStr::Entries->new($io__raw_entries, $self, $self->{_root});
}

sub len_entries {
    my ($self) = @_;
    return $self->{len_entries};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

sub _raw_entries {
    my ($self) = @_;
    return $self->{_raw_entries};
}

########################################################################
package Mcap::MapStrStr::Entries;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Mcap::TupleStrStr->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Mcap::Message;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{channel_id} = $self->{_io}->read_u2le();
    $self->{sequence} = $self->{_io}->read_u4le();
    $self->{log_time} = $self->{_io}->read_u8le();
    $self->{publish_time} = $self->{_io}->read_u8le();
    $self->{data} = $self->{_io}->read_bytes_full();
}

sub channel_id {
    my ($self) = @_;
    return $self->{channel_id};
}

sub sequence {
    my ($self) = @_;
    return $self->{sequence};
}

sub log_time {
    my ($self) = @_;
    return $self->{log_time};
}

sub publish_time {
    my ($self) = @_;
    return $self->{publish_time};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Mcap::MessageIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{channel_id} = $self->{_io}->read_u2le();
    $self->{len_records} = $self->{_io}->read_u4le();
    $self->{_raw_records} = $self->{_io}->read_bytes($self->len_records());
    my $io__raw_records = IO::KaitaiStruct::Stream->new($self->{_raw_records});
    $self->{records} = Mcap::MessageIndex::MessageIndexEntries->new($io__raw_records, $self, $self->{_root});
}

sub channel_id {
    my ($self) = @_;
    return $self->{channel_id};
}

sub len_records {
    my ($self) = @_;
    return $self->{len_records};
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

sub _raw_records {
    my ($self) = @_;
    return $self->{_raw_records};
}

########################################################################
package Mcap::MessageIndex::MessageIndexEntries;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Mcap::MessageIndex::MessageIndexEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Mcap::MessageIndex::MessageIndexEntry;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{log_time} = $self->{_io}->read_u8le();
    $self->{offset} = $self->{_io}->read_u8le();
}

sub log_time {
    my ($self) = @_;
    return $self->{log_time};
}

sub offset {
    my ($self) = @_;
    return $self->{offset};
}

########################################################################
package Mcap::Metadata;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{name} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{metadata} = Mcap::MapStrStr->new($self->{_io}, $self, $self->{_root});
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

########################################################################
package Mcap::MetadataIndex;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{ofs_metadata} = $self->{_io}->read_u8le();
    $self->{len_metadata} = $self->{_io}->read_u8le();
    $self->{name} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata} if ($self->{metadata});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_metadata());
    $self->{_raw_metadata} = $io->read_bytes($self->len_metadata());
    my $io__raw_metadata = IO::KaitaiStruct::Stream->new($self->{_raw_metadata});
    $self->{metadata} = Mcap::Record->new($io__raw_metadata, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{metadata};
}

sub ofs_metadata {
    my ($self) = @_;
    return $self->{ofs_metadata};
}

sub len_metadata {
    my ($self) = @_;
    return $self->{len_metadata};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub _raw_metadata {
    my ($self) = @_;
    return $self->{_raw_metadata};
}

########################################################################
package Mcap::PrefixedStr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_str} = $self->{_io}->read_u4le();
    $self->{str} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->len_str()));
}

sub len_str {
    my ($self) = @_;
    return $self->{len_str};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

########################################################################
package Mcap::Record;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{op} = $self->{_io}->read_u1();
    $self->{len_body} = $self->{_io}->read_u8le();
    my $_on = $self->op();
    if ($_on == $Mcap::OPCODE_ATTACHMENT) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Attachment->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_ATTACHMENT_INDEX) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::AttachmentIndex->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_CHANNEL) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Channel->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_CHUNK) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Chunk->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_CHUNK_INDEX) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::ChunkIndex->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_DATA_END) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::DataEnd->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_FOOTER) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Footer->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_HEADER) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Header->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_MESSAGE) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Message->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_MESSAGE_INDEX) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::MessageIndex->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_METADATA) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Metadata->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_METADATA_INDEX) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::MetadataIndex->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_SCHEMA) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Schema->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_STATISTICS) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::Statistics->new($io__raw_body, $self, $self->{_root});
    }
    elsif ($_on == $Mcap::OPCODE_SUMMARY_OFFSET) {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = Mcap::SummaryOffset->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
}

sub op {
    my ($self) = @_;
    return $self->{op};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package Mcap::Records;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{records} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{records}}, Mcap::Record->new($self->{_io}, $self, $self->{_root});
    }
}

sub records {
    my ($self) = @_;
    return $self->{records};
}

########################################################################
package Mcap::Schema;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{id} = $self->{_io}->read_u2le();
    $self->{name} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{encoding} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{len_data} = $self->{_io}->read_u4le();
    $self->{data} = $self->{_io}->read_bytes($self->len_data());
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub encoding {
    my ($self) = @_;
    return $self->{encoding};
}

sub len_data {
    my ($self) = @_;
    return $self->{len_data};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

########################################################################
package Mcap::Statistics;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{message_count} = $self->{_io}->read_u8le();
    $self->{schema_count} = $self->{_io}->read_u2le();
    $self->{channel_count} = $self->{_io}->read_u4le();
    $self->{attachment_count} = $self->{_io}->read_u4le();
    $self->{metadata_count} = $self->{_io}->read_u4le();
    $self->{chunk_count} = $self->{_io}->read_u4le();
    $self->{message_start_time} = $self->{_io}->read_u8le();
    $self->{message_end_time} = $self->{_io}->read_u8le();
    $self->{len_channel_message_counts} = $self->{_io}->read_u4le();
    $self->{_raw_channel_message_counts} = $self->{_io}->read_bytes($self->len_channel_message_counts());
    my $io__raw_channel_message_counts = IO::KaitaiStruct::Stream->new($self->{_raw_channel_message_counts});
    $self->{channel_message_counts} = Mcap::Statistics::ChannelMessageCounts->new($io__raw_channel_message_counts, $self, $self->{_root});
}

sub message_count {
    my ($self) = @_;
    return $self->{message_count};
}

sub schema_count {
    my ($self) = @_;
    return $self->{schema_count};
}

sub channel_count {
    my ($self) = @_;
    return $self->{channel_count};
}

sub attachment_count {
    my ($self) = @_;
    return $self->{attachment_count};
}

sub metadata_count {
    my ($self) = @_;
    return $self->{metadata_count};
}

sub chunk_count {
    my ($self) = @_;
    return $self->{chunk_count};
}

sub message_start_time {
    my ($self) = @_;
    return $self->{message_start_time};
}

sub message_end_time {
    my ($self) = @_;
    return $self->{message_end_time};
}

sub len_channel_message_counts {
    my ($self) = @_;
    return $self->{len_channel_message_counts};
}

sub channel_message_counts {
    my ($self) = @_;
    return $self->{channel_message_counts};
}

sub _raw_channel_message_counts {
    my ($self) = @_;
    return $self->{_raw_channel_message_counts};
}

########################################################################
package Mcap::Statistics::ChannelMessageCount;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{channel_id} = $self->{_io}->read_u2le();
    $self->{message_count} = $self->{_io}->read_u8le();
}

sub channel_id {
    my ($self) = @_;
    return $self->{channel_id};
}

sub message_count {
    my ($self) = @_;
    return $self->{message_count};
}

########################################################################
package Mcap::Statistics::ChannelMessageCounts;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{entries} = [];
    while (!$self->{_io}->is_eof()) {
        push @{$self->{entries}}, Mcap::Statistics::ChannelMessageCount->new($self->{_io}, $self, $self->{_root});
    }
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package Mcap::SummaryOffset;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{group_opcode} = $self->{_io}->read_u1();
    $self->{ofs_group} = $self->{_io}->read_u8le();
    $self->{len_group} = $self->{_io}->read_u8le();
}

sub group {
    my ($self) = @_;
    return $self->{group} if ($self->{group});
    my $io = $self->_root()->_io();
    my $_pos = $io->pos();
    $io->seek($self->ofs_group());
    $self->{_raw_group} = $io->read_bytes($self->len_group());
    my $io__raw_group = IO::KaitaiStruct::Stream->new($self->{_raw_group});
    $self->{group} = Mcap::Records->new($io__raw_group, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{group};
}

sub group_opcode {
    my ($self) = @_;
    return $self->{group_opcode};
}

sub ofs_group {
    my ($self) = @_;
    return $self->{ofs_group};
}

sub len_group {
    my ($self) = @_;
    return $self->{len_group};
}

sub _raw_group {
    my ($self) = @_;
    return $self->{_raw_group};
}

########################################################################
package Mcap::TupleStrStr;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{key} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
    $self->{value} = Mcap::PrefixedStr->new($self->{_io}, $self, $self->{_root});
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
