# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Compress::Zlib;
use Encode;

########################################################################
package Xar;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $CHECKSUM_ALGORITHMS_APPLE_NONE = 0;
our $CHECKSUM_ALGORITHMS_APPLE_SHA1 = 1;
our $CHECKSUM_ALGORITHMS_APPLE_MD5 = 2;
our $CHECKSUM_ALGORITHMS_APPLE_SHA256 = 3;
our $CHECKSUM_ALGORITHMS_APPLE_SHA512 = 4;

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

    $self->{header_prefix} = Xar::FileHeaderPrefix->new($self->{_io}, $self, $self->{_root});
    $self->{_raw_header} = $self->{_io}->read_bytes($self->header_prefix()->len_header() - 6);
    my $io__raw_header = IO::KaitaiStruct::Stream->new($self->{_raw_header});
    $self->{header} = Xar::FileHeader->new($io__raw_header, $self, $self->{_root});
    $self->{_raw__raw_toc} = $self->{_io}->read_bytes($self->header()->len_toc_compressed());
    $self->{_raw_toc} = Compress::Zlib::uncompress($self->{_raw__raw_toc});
    my $io__raw_toc = IO::KaitaiStruct::Stream->new($self->{_raw_toc});
    $self->{toc} = Xar::TocType->new($io__raw_toc, $self, $self->{_root});
}

sub checksum_algorithm_other {
    my ($self) = @_;
    return $self->{checksum_algorithm_other} if ($self->{checksum_algorithm_other});
    $self->{checksum_algorithm_other} = 3;
    return $self->{checksum_algorithm_other};
}

sub header_prefix {
    my ($self) = @_;
    return $self->{header_prefix};
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub toc {
    my ($self) = @_;
    return $self->{toc};
}

sub _raw_header {
    my ($self) = @_;
    return $self->{_raw_header};
}

sub _raw_toc {
    my ($self) = @_;
    return $self->{_raw_toc};
}

sub _raw__raw_toc {
    my ($self) = @_;
    return $self->{_raw__raw_toc};
}

########################################################################
package Xar::FileHeader;

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

    $self->{version} = $self->{_io}->read_u2be();
    $self->{len_toc_compressed} = $self->{_io}->read_u8be();
    $self->{toc_length_uncompressed} = $self->{_io}->read_u8be();
    $self->{checksum_algorithm_int} = $self->{_io}->read_u4be();
    if ($self->has_checksum_alg_name()) {
        $self->{checksum_alg_name} = Encode::decode("UTF-8", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes_full(), 0, 0));
        {
            my $_it = $self->{checksum_alg_name};
        }
    }
}

sub checksum_algorithm_name {
    my ($self) = @_;
    return $self->{checksum_algorithm_name} if ($self->{checksum_algorithm_name});
    $self->{checksum_algorithm_name} = ($self->has_checksum_alg_name() ? $self->checksum_alg_name() : ($self->checksum_algorithm_int() == $Xar::CHECKSUM_ALGORITHMS_APPLE_NONE ? "none" : ($self->checksum_algorithm_int() == $Xar::CHECKSUM_ALGORITHMS_APPLE_SHA1 ? "sha1" : ($self->checksum_algorithm_int() == $Xar::CHECKSUM_ALGORITHMS_APPLE_MD5 ? "md5" : ($self->checksum_algorithm_int() == $Xar::CHECKSUM_ALGORITHMS_APPLE_SHA256 ? "sha256" : ($self->checksum_algorithm_int() == $Xar::CHECKSUM_ALGORITHMS_APPLE_SHA512 ? "sha512" : ""))))));
    return $self->{checksum_algorithm_name};
}

sub has_checksum_alg_name {
    my ($self) = @_;
    return $self->{has_checksum_alg_name} if ($self->{has_checksum_alg_name});
    $self->{has_checksum_alg_name} =  (($self->checksum_algorithm_int() == $self->_root()->checksum_algorithm_other()) && ($self->len_header() >= 32) && ($self->len_header() % 4 == 0)) ;
    return $self->{has_checksum_alg_name};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header} if ($self->{len_header});
    $self->{len_header} = $self->_root()->header_prefix()->len_header();
    return $self->{len_header};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub len_toc_compressed {
    my ($self) = @_;
    return $self->{len_toc_compressed};
}

sub toc_length_uncompressed {
    my ($self) = @_;
    return $self->{toc_length_uncompressed};
}

sub checksum_algorithm_int {
    my ($self) = @_;
    return $self->{checksum_algorithm_int};
}

sub checksum_alg_name {
    my ($self) = @_;
    return $self->{checksum_alg_name};
}

########################################################################
package Xar::FileHeaderPrefix;

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
    $self->{len_header} = $self->{_io}->read_u2be();
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub len_header {
    my ($self) = @_;
    return $self->{len_header};
}

########################################################################
package Xar::TocType;

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

    $self->{xml_string} = Encode::decode("UTF-8", $self->{_io}->read_bytes_full());
}

sub xml_string {
    my ($self) = @_;
    return $self->{xml_string};
}

1;
