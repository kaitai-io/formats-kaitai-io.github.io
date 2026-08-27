# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package Zchunk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHECKSUM_TYPES_SHA1 = 0;
our $CHECKSUM_TYPES_SHA256 = 1;
our $CHECKSUM_TYPES_SHA512 = 2;
our $CHECKSUM_TYPES_SHA512_128 = 3;

our $COMPRESSION_TYPES_NONE = 0;
our $COMPRESSION_TYPES_ZSTD = 2;

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

    $self->{lead} = Zchunk::HeaderLead->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header_rest} = $self->{_io}->read_bytes($self->lead()->len_header_rest()->value());
    my $io__raw_header_rest = IO::KaitaiStruct::Stream->new($self->{_raw_header_rest});
    $self->{header_rest} = Zchunk::HeaderWithoutLead->new($io__raw_header_rest, $self, $self->{_root});
    $self->{dict} = $self->{_io}->read_bytes($self->header_rest()->index()->len_dict()->value());
    if (!($self->lead()->is_detached_header())) {
        $self->{chunks} = [];
        my $n_chunks = scalar(@{$self->header_rest()->index()->chunks_metadata()});
        for (my $i = 0; $i < $n_chunks; $i++) {
            push @{$self->{chunks}}, $self->{_io}->read_bytes(@{$self->header_rest()->index()->chunks_metadata()}[$i]->len_chunk()->value());
        }
    }
}

sub lead {
    my ($self) = @_;
    return $self->{lead};
}

sub header_rest {
    my ($self) = @_;
    return $self->{header_rest};
}

sub dict {
    my ($self) = @_;
    return $self->{dict};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

sub _raw_header_rest {
    my ($self) = @_;
    return $self->{_raw_header_rest};
}

########################################################################
package Zchunk::ChecksumType;

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

    $self->{raw} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{raw};
    }
}

sub len_checksum {
    my ($self) = @_;
    return $self->{len_checksum} if ($self->{len_checksum});
    $self->{len_checksum} = ($self->value() == $Zchunk::CHECKSUM_TYPES_SHA1 ? 20 : ($self->value() == $Zchunk::CHECKSUM_TYPES_SHA256 ? 32 : ($self->value() == $Zchunk::CHECKSUM_TYPES_SHA512 ? 64 : ($self->value() == $Zchunk::CHECKSUM_TYPES_SHA512_128 ? 16 : 0))));
    return $self->{len_checksum};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = $self->raw()->value();
    return $self->{value};
}

sub raw {
    my ($self) = @_;
    return $self->{raw};
}

########################################################################
package Zchunk::Chunk;

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

    if ($self->has_data_streams()) {
        $self->{chunk_stream} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    }
    $self->{chunk_checksum} = $self->{_io}->read_bytes($self->len_checksum());
    if ($self->has_uncompressed_source()) {
        $self->{uncompressed_chunk_checksum} = $self->{_io}->read_bytes($self->len_checksum());
    }
    $self->{len_chunk} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{len_uncompressed_chunk} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
}

sub chunk_stream {
    my ($self) = @_;
    return $self->{chunk_stream};
}

sub chunk_checksum {
    my ($self) = @_;
    return $self->{chunk_checksum};
}

sub uncompressed_chunk_checksum {
    my ($self) = @_;
    return $self->{uncompressed_chunk_checksum};
}

sub len_chunk {
    my ($self) = @_;
    return $self->{len_chunk};
}

sub len_uncompressed_chunk {
    my ($self) = @_;
    return $self->{len_uncompressed_chunk};
}

sub len_checksum {
    my ($self) = @_;
    return $self->{len_checksum};
}

sub has_data_streams {
    my ($self) = @_;
    return $self->{has_data_streams};
}

sub has_uncompressed_source {
    my ($self) = @_;
    return $self->{has_uncompressed_source};
}

########################################################################
package Zchunk::CompressedInteger;

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

    $self->{groups} = [];
    {
        my $_it;
        do {
            $_it = Zchunk::CompressedInteger::Group->new($self->{_io}, $self, $self->{_root});
            push @{$self->{groups}}, $_it;
        } until ($_it->is_last());
    }
}

sub len {
    my ($self) = @_;
    return $self->{len} if ($self->{len});
    $self->{len} = scalar(@{$self->groups()});
    return $self->{len};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = (((((((((@{$self->groups()}[0]->value() | ($self->len() >= 2 ? @{$self->groups()}[1]->value() << 7 : 0)) | ($self->len() >= 3 ? @{$self->groups()}[2]->value() << 14 : 0)) | ($self->len() >= 4 ? @{$self->groups()}[3]->value() << 21 : 0)) | ($self->len() >= 5 ? @{$self->groups()}[4]->value() << 28 : 0)) | ($self->len() >= 6 ? @{$self->groups()}[5]->value() << 35 : 0)) | ($self->len() >= 7 ? @{$self->groups()}[6]->value() << 42 : 0)) | ($self->len() >= 8 ? @{$self->groups()}[7]->value() << 49 : 0)) | ($self->len() >= 9 ? @{$self->groups()}[8]->value() << 56 : 0)) | ($self->len() >= 10 ? @{$self->groups()}[9]->value() << 63 : 0));
    return $self->{value};
}

sub groups {
    my ($self) = @_;
    return $self->{groups};
}

########################################################################
package Zchunk::CompressedInteger::Group;

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

    $self->{is_last} = $self->{_io}->read_bits_int_be(1);
    $self->{value} = $self->{_io}->read_bits_int_be(7);
}

sub is_last {
    my ($self) = @_;
    return $self->{is_last};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub idx {
    my ($self) = @_;
    return $self->{idx};
}

########################################################################
package Zchunk::HeaderLead;

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

    $self->{magic} = $self->{_io}->read_bytes(5);
    $self->{overall_checksum_type} = Zchunk::ChecksumType->new($self->{_io}, $self, $self->{_root});
    $self->{len_header_rest} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{header_checksum} = $self->{_io}->read_bytes($self->overall_checksum_type()->len_checksum());
}

sub is_detached_header {
    my ($self) = @_;
    return $self->{is_detached_header} if ($self->{is_detached_header});
    $self->{is_detached_header} = unpack('C', substr($self->magic(), 2, 1)) == 72;
    return $self->{is_detached_header};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub overall_checksum_type {
    my ($self) = @_;
    return $self->{overall_checksum_type};
}

sub len_header_rest {
    my ($self) = @_;
    return $self->{len_header_rest};
}

sub header_checksum {
    my ($self) = @_;
    return $self->{header_checksum};
}

########################################################################
package Zchunk::HeaderWithoutLead;

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

    $self->{preface} = Zchunk::Preface->new($self->{_io}, $self, $self->{_root});
    $self->{len_index} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_index} = $self->{_io}->read_bytes($self->len_index()->value());
    my $io__raw_index = IO::KaitaiStruct::Stream->new($self->{_raw_index});
    $self->{index} = Zchunk::Index->new($io__raw_index, $self, $self->{_root});
    $self->{num_signatures} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{num_signatures};
    }
}

sub preface {
    my ($self) = @_;
    return $self->{preface};
}

sub len_index {
    my ($self) = @_;
    return $self->{len_index};
}

sub index {
    my ($self) = @_;
    return $self->{index};
}

sub num_signatures {
    my ($self) = @_;
    return $self->{num_signatures};
}

sub _raw_index {
    my ($self) = @_;
    return $self->{_raw_index};
}

########################################################################
package Zchunk::Index;

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

    $self->{chunk_checksum_type} = Zchunk::ChecksumType->new($self->{_io}, $self, $self->{_root});
    $self->{num_chunks} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{num_chunks};
    }
    if ($self->_parent()->preface()->has_data_streams()) {
        $self->{dict_stream} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
        {
            my $_it = $self->{dict_stream};
        }
    }
    $self->{dict_checksum} = $self->{_io}->read_bytes($self->chunk_checksum_type()->len_checksum());
    if ($self->_parent()->preface()->has_uncompressed_source()) {
        $self->{uncompressed_dict_checksum} = $self->{_io}->read_bytes($self->chunk_checksum_type()->len_checksum());
    }
    $self->{len_dict} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{len_uncompressed_dict} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{chunks_metadata} = [];
    my $n_chunks_metadata = $self->num_data_chunks();
    for (my $i = 0; $i < $n_chunks_metadata; $i++) {
        push @{$self->{chunks_metadata}}, Zchunk::Chunk->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_data_chunks {
    my ($self) = @_;
    return $self->{num_data_chunks} if ($self->{num_data_chunks});
    $self->{num_data_chunks} = $self->num_chunks()->value() - 1;
    return $self->{num_data_chunks};
}

sub chunk_checksum_type {
    my ($self) = @_;
    return $self->{chunk_checksum_type};
}

sub num_chunks {
    my ($self) = @_;
    return $self->{num_chunks};
}

sub dict_stream {
    my ($self) = @_;
    return $self->{dict_stream};
}

sub dict_checksum {
    my ($self) = @_;
    return $self->{dict_checksum};
}

sub uncompressed_dict_checksum {
    my ($self) = @_;
    return $self->{uncompressed_dict_checksum};
}

sub len_dict {
    my ($self) = @_;
    return $self->{len_dict};
}

sub len_uncompressed_dict {
    my ($self) = @_;
    return $self->{len_uncompressed_dict};
}

sub chunks_metadata {
    my ($self) = @_;
    return $self->{chunks_metadata};
}

########################################################################
package Zchunk::OptionalElement;

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

    $self->{element_id} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{len_data} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    $self->{data} = $self->{_io}->read_bytes($self->len_data()->value());
}

sub element_id {
    my ($self) = @_;
    return $self->{element_id};
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
package Zchunk::Preface;

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

    $self->{data_checksum} = $self->{_io}->read_bytes($self->_root()->lead()->overall_checksum_type()->len_checksum());
    $self->{flags} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{flags};
    }
    $self->{compression_type_int} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
    {
        my $_it = $self->{compression_type_int};
    }
    if ($self->has_optional_elements()) {
        $self->{num_optional_elements} = Zchunk::CompressedInteger->new($self->{_io}, $self, $self->{_root});
        {
            my $_it = $self->{num_optional_elements};
        }
    }
    if ($self->has_optional_elements()) {
        $self->{optional_elements} = [];
        my $n_optional_elements = $self->num_optional_elements()->value();
        for (my $i = 0; $i < $n_optional_elements; $i++) {
            push @{$self->{optional_elements}}, Zchunk::OptionalElement->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub compression_type {
    my ($self) = @_;
    return $self->{compression_type} if ($self->{compression_type});
    $self->{compression_type} = $self->compression_type_int()->value();
    return $self->{compression_type};
}

sub has_data_streams {
    my ($self) = @_;
    return $self->{has_data_streams} if ($self->{has_data_streams});
    $self->{has_data_streams} = ($self->flags()->value() & 1) != 0;
    return $self->{has_data_streams};
}

sub has_optional_elements {
    my ($self) = @_;
    return $self->{has_optional_elements} if ($self->{has_optional_elements});
    $self->{has_optional_elements} = ($self->flags()->value() & 2) != 0;
    return $self->{has_optional_elements};
}

sub has_uncompressed_source {
    my ($self) = @_;
    return $self->{has_uncompressed_source} if ($self->{has_uncompressed_source});
    $self->{has_uncompressed_source} = ($self->flags()->value() & 4) != 0;
    return $self->{has_uncompressed_source};
}

sub data_checksum {
    my ($self) = @_;
    return $self->{data_checksum};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub compression_type_int {
    my ($self) = @_;
    return $self->{compression_type_int};
}

sub num_optional_elements {
    my ($self) = @_;
    return $self->{num_optional_elements};
}

sub optional_elements {
    my ($self) = @_;
    return $self->{optional_elements};
}

1;
