# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.011_000;
use Encode;

########################################################################
package AndroidOpenglShadersCache;

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
    $self->{_root} = $_root || $self;

    $self->_read();

    return $self;
}

sub _read {
    my ($self) = @_;

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{crc32} = $self->{_io}->read_u4le();
    $self->{_raw_contents} = $self->{_io}->read_bytes_full();
    my $io__raw_contents = IO::KaitaiStruct::Stream->new($self->{_raw_contents});
    $self->{contents} = AndroidOpenglShadersCache::Cache->new($io__raw_contents, $self, $self->{_root});
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub crc32 {
    my ($self) = @_;
    return $self->{crc32};
}

sub contents {
    my ($self) = @_;
    return $self->{contents};
}

sub _raw_contents {
    my ($self) = @_;
    return $self->{_raw_contents};
}

########################################################################
package AndroidOpenglShadersCache::Alignment;

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

    $self->{alignment} = $self->{_io}->read_bytes($self->_io()->pos() + 3 & ~3 - $self->_io()->pos());
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

########################################################################
package AndroidOpenglShadersCache::Cache;

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
    $self->{version} = $self->{_io}->read_u4le();
    $self->{device_version} = $self->{_io}->read_u4le();
    $self->{num_entries} = $self->{_io}->read_u4le();
    if ($self->version() >= 3) {
        $self->{build_id} = AndroidOpenglShadersCache::PrefixedString->new($self->{_io}, $self, $self->{_root});
    }
    $self->{entries} = [];
    my $n_entries = $self->num_entries();
    for (my $i = 0; $i < $n_entries; $i++) {
        push @{$self->{entries}}, AndroidOpenglShadersCache::Cache::Entry->new($self->{_io}, $self, $self->{_root});
    }
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub device_version {
    my ($self) = @_;
    return $self->{device_version};
}

sub num_entries {
    my ($self) = @_;
    return $self->{num_entries};
}

sub build_id {
    my ($self) = @_;
    return $self->{build_id};
}

sub entries {
    my ($self) = @_;
    return $self->{entries};
}

########################################################################
package AndroidOpenglShadersCache::Cache::Entry;

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

    $self->{len_key} = $self->{_io}->read_u4le();
    $self->{len_value} = $self->{_io}->read_u4le();
    $self->{key} = $self->{_io}->read_bytes($self->len_key());
    $self->{value} = $self->{_io}->read_bytes($self->len_value());
    $self->{alignment} = AndroidOpenglShadersCache::Alignment->new($self->{_io}, $self, $self->{_root});
}

sub len_key {
    my ($self) = @_;
    return $self->{len_key};
}

sub len_value {
    my ($self) = @_;
    return $self->{len_value};
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

########################################################################
package AndroidOpenglShadersCache::PrefixedString;

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
    $self->{str} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes($self->len_str()), 0, 0));
    $self->{alignment} = AndroidOpenglShadersCache::Alignment->new($self->{_io}, $self, $self->{_root});
}

sub len_str {
    my ($self) = @_;
    return $self->{len_str};
}

sub str {
    my ($self) = @_;
    return $self->{str};
}

sub alignment {
    my ($self) = @_;
    return $self->{alignment};
}

1;
