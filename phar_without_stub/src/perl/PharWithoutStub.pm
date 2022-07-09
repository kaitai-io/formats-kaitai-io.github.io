# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use PhpSerializedValue;

########################################################################
package PharWithoutStub;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $SIGNATURE_TYPE_MD5 = 1;
our $SIGNATURE_TYPE_SHA1 = 2;
our $SIGNATURE_TYPE_SHA256 = 4;
our $SIGNATURE_TYPE_SHA512 = 8;
our $SIGNATURE_TYPE_OPENSSL = 16;

sub new {
    my ($class, $_io, $_parent, $_root) = @_;
    my $self = IO::KaitaiStruct::Struct->new($_io);

    bless $self, $class;
    $self->{_parent} = $_parent;
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{manifest} = PharWithoutStub::Manifest->new($self->{_io}, $self, $self->{_root});
    $self->{files} = ();
    my $n_files = $self->manifest()->num_files();
    for (my $i = 0; $i < $n_files; $i++) {
        push @{$self->{files}}, $self->{_io}->read_bytes(@{$self->manifest()->file_entries()}[$i]->len_data_compressed());
    }
    if ($self->manifest()->flags()->has_signature()) {
        $self->{_raw_signature} = $self->{_io}->read_bytes_full();
        my $io__raw_signature = IO::KaitaiStruct::Stream->new($self->{_raw_signature});
        $self->{signature} = PharWithoutStub::Signature->new($io__raw_signature, $self, $self->{_root});
    }
}

sub manifest {
    my ($self) = @_;
    return $self->{manifest};
}

sub files {
    my ($self) = @_;
    return $self->{files};
}

sub signature {
    my ($self) = @_;
    return $self->{signature};
}

sub _raw_signature {
    my ($self) = @_;
    return $self->{_raw_signature};
}

########################################################################
package PharWithoutStub::SerializedValue;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{raw} = $self->{_io}->read_bytes_full();
}

sub parsed {
    my ($self) = @_;
    return $self->{parsed} if ($self->{parsed});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{parsed} = PhpSerializedValue->new($self->{_io});
    $self->{_io}->seek($_pos);
    return $self->{parsed};
}

sub raw {
    my ($self) = @_;
    return $self->{raw};
}

########################################################################
package PharWithoutStub::Signature;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{data} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - 8));
    $self->{type} = $self->{_io}->read_u4le();
    $self->{magic} = $self->{_io}->read_bytes(4);
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

########################################################################
package PharWithoutStub::FileFlags;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u4le();
}

sub permissions {
    my ($self) = @_;
    return $self->{permissions} if ($self->{permissions});
    $self->{permissions} = ($self->value() & 511);
    return $self->{permissions};
}

sub zlib_compressed {
    my ($self) = @_;
    return $self->{zlib_compressed} if ($self->{zlib_compressed});
    $self->{zlib_compressed} = ($self->value() & 4096) != 0;
    return $self->{zlib_compressed};
}

sub bzip2_compressed {
    my ($self) = @_;
    return $self->{bzip2_compressed} if ($self->{bzip2_compressed});
    $self->{bzip2_compressed} = ($self->value() & 8192) != 0;
    return $self->{bzip2_compressed};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package PharWithoutStub::ApiVersion;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{release} = $self->{_io}->read_bits_int_be(4);
    $self->{major} = $self->{_io}->read_bits_int_be(4);
    $self->{minor} = $self->{_io}->read_bits_int_be(4);
    $self->{unused} = $self->{_io}->read_bits_int_be(4);
}

sub release {
    my ($self) = @_;
    return $self->{release};
}

sub major {
    my ($self) = @_;
    return $self->{major};
}

sub minor {
    my ($self) = @_;
    return $self->{minor};
}

sub unused {
    my ($self) = @_;
    return $self->{unused};
}

########################################################################
package PharWithoutStub::GlobalFlags;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{value} = $self->{_io}->read_u4le();
}

sub any_zlib_compressed {
    my ($self) = @_;
    return $self->{any_zlib_compressed} if ($self->{any_zlib_compressed});
    $self->{any_zlib_compressed} = ($self->value() & 4096) != 0;
    return $self->{any_zlib_compressed};
}

sub any_bzip2_compressed {
    my ($self) = @_;
    return $self->{any_bzip2_compressed} if ($self->{any_bzip2_compressed});
    $self->{any_bzip2_compressed} = ($self->value() & 8192) != 0;
    return $self->{any_bzip2_compressed};
}

sub has_signature {
    my ($self) = @_;
    return $self->{has_signature} if ($self->{has_signature});
    $self->{has_signature} = ($self->value() & 65536) != 0;
    return $self->{has_signature};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

########################################################################
package PharWithoutStub::Manifest;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_manifest} = $self->{_io}->read_u4le();
    $self->{num_files} = $self->{_io}->read_u4le();
    $self->{api_version} = PharWithoutStub::ApiVersion->new($self->{_io}, $self, $self->{_root});
    $self->{flags} = PharWithoutStub::GlobalFlags->new($self->{_io}, $self, $self->{_root});
    $self->{len_alias} = $self->{_io}->read_u4le();
    $self->{alias} = $self->{_io}->read_bytes($self->len_alias());
    $self->{len_metadata} = $self->{_io}->read_u4le();
    if ($self->len_metadata() != 0) {
        $self->{_raw_metadata} = $self->{_io}->read_bytes($self->len_metadata());
        my $io__raw_metadata = IO::KaitaiStruct::Stream->new($self->{_raw_metadata});
        $self->{metadata} = PharWithoutStub::SerializedValue->new($io__raw_metadata, $self, $self->{_root});
    }
    $self->{file_entries} = ();
    my $n_file_entries = $self->num_files();
    for (my $i = 0; $i < $n_file_entries; $i++) {
        push @{$self->{file_entries}}, PharWithoutStub::FileEntry->new($self->{_io}, $self, $self->{_root});
    }
}

sub len_manifest {
    my ($self) = @_;
    return $self->{len_manifest};
}

sub num_files {
    my ($self) = @_;
    return $self->{num_files};
}

sub api_version {
    my ($self) = @_;
    return $self->{api_version};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub len_alias {
    my ($self) = @_;
    return $self->{len_alias};
}

sub alias {
    my ($self) = @_;
    return $self->{alias};
}

sub len_metadata {
    my ($self) = @_;
    return $self->{len_metadata};
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

sub file_entries {
    my ($self) = @_;
    return $self->{file_entries};
}

sub _raw_metadata {
    my ($self) = @_;
    return $self->{_raw_metadata};
}

########################################################################
package PharWithoutStub::FileEntry;

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
    $self->{_root} = $_root || $self;;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{len_filename} = $self->{_io}->read_u4le();
    $self->{filename} = $self->{_io}->read_bytes($self->len_filename());
    $self->{len_data_uncompressed} = $self->{_io}->read_u4le();
    $self->{timestamp} = $self->{_io}->read_u4le();
    $self->{len_data_compressed} = $self->{_io}->read_u4le();
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{flags} = PharWithoutStub::FileFlags->new($self->{_io}, $self, $self->{_root});
    $self->{len_metadata} = $self->{_io}->read_u4le();
    if ($self->len_metadata() != 0) {
        $self->{_raw_metadata} = $self->{_io}->read_bytes($self->len_metadata());
        my $io__raw_metadata = IO::KaitaiStruct::Stream->new($self->{_raw_metadata});
        $self->{metadata} = PharWithoutStub::SerializedValue->new($io__raw_metadata, $self, $self->{_root});
    }
}

sub len_filename {
    my ($self) = @_;
    return $self->{len_filename};
}

sub filename {
    my ($self) = @_;
    return $self->{filename};
}

sub len_data_uncompressed {
    my ($self) = @_;
    return $self->{len_data_uncompressed};
}

sub timestamp {
    my ($self) = @_;
    return $self->{timestamp};
}

sub len_data_compressed {
    my ($self) = @_;
    return $self->{len_data_compressed};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub len_metadata {
    my ($self) = @_;
    return $self->{len_metadata};
}

sub metadata {
    my ($self) = @_;
    return $self->{metadata};
}

sub _raw_metadata {
    my ($self) = @_;
    return $self->{_raw_metadata};
}

1;
