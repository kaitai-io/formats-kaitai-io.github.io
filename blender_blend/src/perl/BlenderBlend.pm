# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use Encode;

########################################################################
package BlenderBlend;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $PTR_SIZE_BITS_64 = 45;
our $PTR_SIZE_BITS_32 = 95;

our $ENDIAN_BE = 86;
our $ENDIAN_LE = 118;

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

    $self->{hdr} = BlenderBlend::Header->new($self->{_io}, $self, $self->{_root});
    $self->{blocks} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{blocks}}, BlenderBlend::FileBlock->new($self->{_io}, $self, $self->{_root});
    }
}

sub hdr {
    my ($self) = @_;
    return $self->{hdr};
}

sub blocks {
    my ($self) = @_;
    return $self->{blocks};
}

########################################################################
package BlenderBlend::Header;

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

    $self->{magic} = $self->{_io}->ensure_fixed_contents(pack('C*', (66, 76, 69, 78, 68, 69, 82)));
    $self->{ptr_size_id} = $self->{_io}->read_u1();
    $self->{endian} = $self->{_io}->read_u1();
    $self->{version} = Encode::decode("ASCII", $self->{_io}->read_bytes(3));
}

sub psize {
    my ($self) = @_;
    return $self->{psize} if ($self->{psize});
    $self->{psize} = ($self->ptr_size_id() == $PTR_SIZE_BITS_64 ? 8 : 4);
    return $self->{psize};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub ptr_size_id {
    my ($self) = @_;
    return $self->{ptr_size_id};
}

sub endian {
    my ($self) = @_;
    return $self->{endian};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

########################################################################
package BlenderBlend::FileBlock;

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

    $self->{code} = Encode::decode("ASCII", $self->{_io}->read_bytes(4));
    $self->{size} = $self->{_io}->read_u4le();
    $self->{mem_addr} = $self->{_io}->read_bytes($self->_root()->hdr()->psize());
    $self->{sdna_index} = $self->{_io}->read_u4le();
    $self->{count} = $self->{_io}->read_u4le();
    $self->{body} = $self->{_io}->read_bytes($self->size());
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

sub mem_addr {
    my ($self) = @_;
    return $self->{mem_addr};
}

sub sdna_index {
    my ($self) = @_;
    return $self->{sdna_index};
}

sub count {
    my ($self) = @_;
    return $self->{count};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

1;
