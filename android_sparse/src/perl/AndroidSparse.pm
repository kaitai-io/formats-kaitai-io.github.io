# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;

########################################################################
package AndroidSparse;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHUNK_TYPES_RAW = 51905;
our $CHUNK_TYPES_FILL = 51906;
our $CHUNK_TYPES_DONT_CARE = 51907;
our $CHUNK_TYPES_CRC32 = 51908;

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

    $self->{header_prefix} = AndroidSparse::FileHeaderPrefix->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header} = $self->{_io}->read_bytes($self->header_prefix()->len_header() - 10);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = AndroidSparse::FileHeader->new($io__raw_header, $self, $self->{_root});
    $self->{chunks} = [];
    my $n_chunks = $self->header()->num_chunks();
    for (my $i = 0; $i < $n_chunks; $i++) {
        push @{$self->{chunks}}, AndroidSparse::Chunk->new($self->{_io}, $self, $self->{_root});
    }
}

sub header_prefix {
    my ($self) = @_;
    return $self->{header_prefix};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package AndroidSparse::Chunk;

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

    $self->{_raw_header} = $self->{_io}->read_bytes($self->_root()->header()->len_chunk_header());
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = AndroidSparse::Chunk::ChunkHeader->new($io__raw_header, $self, $self->{_root});
    my $_on = $self->header()->chunk_type();
    if ($_on == $AndroidSparse::CHUNK_TYPES_CRC32) {
        $self->{body} = $self->{_io}->read_u4le();
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->header()->len_body());
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

########################################################################
package AndroidSparse::Chunk::ChunkHeader;

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

    $self->{chunk_type} = $self->{_io}->read_u2le();
    $self->{reserved1} = $self->{_io}->read_u2le();
    $self->{num_body_blocks} = $self->{_io}->read_u4le();
    $self->{len_chunk} = $self->{_io}->read_u4le();
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body} if ($self->{len_body});
    $self->{len_body} = $self->len_chunk() - $self->_root()->header()->len_chunk_header();
    return $self->{len_body};
}

sub len_body_expected {
    my ($self) = @_;
    return $self->{len_body_expected} if ($self->{len_body_expected});
    $self->{len_body_expected} = ($self->chunk_type() == $AndroidSparse::CHUNK_TYPES_RAW ? $self->_root()->header()->block_size() * $self->num_body_blocks() : ($self->chunk_type() == $AndroidSparse::CHUNK_TYPES_FILL ? 4 : ($self->chunk_type() == $AndroidSparse::CHUNK_TYPES_DONT_CARE ? 0 : ($self->chunk_type() == $AndroidSparse::CHUNK_TYPES_CRC32 ? 4 : -1))));
    return $self->{len_body_expected};
}

sub chunk_type {
    my ($self) = @_;
    return $self->{chunk_type};
}

sub reserved1 {
    my ($self) = @_;
    return $self->{reserved1};
}

sub num_body_blocks {
    my ($self) = @_;
    return $self->{num_body_blocks};
}

sub len_chunk {
    my ($self) = @_;
    return $self->{len_chunk};
}

########################################################################
package AndroidSparse::FileHeader;

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

    $self->{len_chunk_header} = $self->{_io}->read_u2le();
    $self->{block_size} = $self->{_io}->read_u4le();
    {
        my $_it = $self->{block_size};
    }
    $self->{num_blocks} = $self->{_io}->read_u4le();
    $self->{num_chunks} = $self->{_io}->read_u4le();
    $self->{checksum} = $self->{_io}->read_u4le();
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header} if ($self->{len_header});
    $self->{len_header} = $self->_root()->header_prefix()->len_header();
    return $self->{len_header};
}

sub version {
    my ($self) = @_;
    return $self->{version} if ($self->{version});
    $self->{version} = $self->_root()->header_prefix()->version();
    return $self->{version};
}

sub len_chunk_header {
    my ($self) = @_;
    return $self->{len_chunk_header};
}

sub block_size {
    my ($self) = @_;
    return $self->{block_size};
}

sub num_blocks {
    my ($self) = @_;
    return $self->{num_blocks};
}

sub num_chunks {
    my ($self) = @_;
    return $self->{num_chunks};
}

sub checksum {
    my ($self) = @_;
    return $self->{checksum};
}

########################################################################
package AndroidSparse::FileHeaderPrefix;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = AndroidSparse::Version->new($self->{_io}, $self, $self->{_root});
    $self->{len_header} = $self->{_io}->read_u2le();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

########################################################################
package AndroidSparse::Version;

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

    $self->{major} = $self->{_io}->read_u2le();
    $self->{minor} = $self->{_io}->read_u2le();
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

1;
