# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
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

sub sdna_structs {
    my ($self) = @_;
    return $self->{sdna_structs} if ($self->{sdna_structs});
    $self->{sdna_structs} = @{$self->blocks()}[(scalar(@{$self->blocks()}) - 2)]->body()->structs();
    return $self->{sdna_structs};
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
package BlenderBlend::DnaStruct;

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

    $self->{idx_type} = $self->{_io}->read_u2le();
    $self->{num_fields} = $self->{_io}->read_u2le();
    $self->{fields} = ();
    my $n_fields = $self->num_fields();
    for (my $i = 0; $i < $n_fields; $i++) {
        $self->{fields}[$i] = BlenderBlend::DnaField->new($self->{_io}, $self, $self->{_root});
    }
}

sub type {
    my ($self) = @_;
    return $self->{type} if ($self->{type});
    $self->{type} = @{$self->_parent()->types()}[$self->idx_type()];
    return $self->{type};
}

sub idx_type {
    my ($self) = @_;
    return $self->{idx_type};
}

sub num_fields {
    my ($self) = @_;
    return $self->{num_fields};
}

sub fields {
    my ($self) = @_;
    return $self->{fields};
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
    $self->{len_body} = $self->{_io}->read_u4le();
    $self->{mem_addr} = $self->{_io}->read_bytes($self->_root()->hdr()->psize());
    $self->{sdna_index} = $self->{_io}->read_u4le();
    $self->{count} = $self->{_io}->read_u4le();
    my $_on = $self->code();
    if ($_on eq "DNA1") {
        $self->{_raw_body} = $self->{_io}->read_bytes($self->len_body());
        my $io__raw_body = IO::KaitaiStruct::Stream->new($self->{_raw_body});
        $self->{body} = BlenderBlend::Dna1Body->new($io__raw_body, $self, $self->{_root});
    }
    else {
        $self->{body} = $self->{_io}->read_bytes($self->len_body());
    }
}

sub sdna_struct {
    my ($self) = @_;
    return $self->{sdna_struct} if ($self->{sdna_struct});
    if ($self->sdna_index() != 0) {
        $self->{sdna_struct} = @{$self->_root()->sdna_structs()}[$self->sdna_index()];
    }
    return $self->{sdna_struct};
}

sub code {
    my ($self) = @_;
    return $self->{code};
}

sub len_body {
    my ($self) = @_;
    return $self->{len_body};
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

sub _raw_body {
    my ($self) = @_;
    return $self->{_raw_body};
}

########################################################################
package BlenderBlend::Dna1Body;

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

    $self->{id} = $self->{_io}->read_bytes(4);
    $self->{name_magic} = $self->{_io}->read_bytes(4);
    $self->{num_names} = $self->{_io}->read_u4le();
    $self->{names} = ();
    my $n_names = $self->num_names();
    for (my $i = 0; $i < $n_names; $i++) {
        $self->{names}[$i] = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
    $self->{padding_1} = $self->{_io}->read_bytes(((4 - $self->_io()->pos()) % 4));
    $self->{type_magic} = $self->{_io}->read_bytes(4);
    $self->{num_types} = $self->{_io}->read_u4le();
    $self->{types} = ();
    my $n_types = $self->num_types();
    for (my $i = 0; $i < $n_types; $i++) {
        $self->{types}[$i] = Encode::decode("UTF-8", $self->{_io}->read_bytes_term(0, 0, 1, 1));
    }
    $self->{padding_2} = $self->{_io}->read_bytes(((4 - $self->_io()->pos()) % 4));
    $self->{tlen_magic} = $self->{_io}->read_bytes(4);
    $self->{lengths} = ();
    my $n_lengths = $self->num_types();
    for (my $i = 0; $i < $n_lengths; $i++) {
        $self->{lengths}[$i] = $self->{_io}->read_u2le();
    }
    $self->{padding_3} = $self->{_io}->read_bytes(((4 - $self->_io()->pos()) % 4));
    $self->{strc_magic} = $self->{_io}->read_bytes(4);
    $self->{num_structs} = $self->{_io}->read_u4le();
    $self->{structs} = ();
    my $n_structs = $self->num_structs();
    for (my $i = 0; $i < $n_structs; $i++) {
        $self->{structs}[$i] = BlenderBlend::DnaStruct->new($self->{_io}, $self, $self->{_root});
    }
}

sub id {
    my ($self) = @_;
    return $self->{id};
}

sub name_magic {
    my ($self) = @_;
    return $self->{name_magic};
}

sub num_names {
    my ($self) = @_;
    return $self->{num_names};
}

sub names {
    my ($self) = @_;
    return $self->{names};
}

sub padding_1 {
    my ($self) = @_;
    return $self->{padding_1};
}

sub type_magic {
    my ($self) = @_;
    return $self->{type_magic};
}

sub num_types {
    my ($self) = @_;
    return $self->{num_types};
}

sub types {
    my ($self) = @_;
    return $self->{types};
}

sub padding_2 {
    my ($self) = @_;
    return $self->{padding_2};
}

sub tlen_magic {
    my ($self) = @_;
    return $self->{tlen_magic};
}

sub lengths {
    my ($self) = @_;
    return $self->{lengths};
}

sub padding_3 {
    my ($self) = @_;
    return $self->{padding_3};
}

sub strc_magic {
    my ($self) = @_;
    return $self->{strc_magic};
}

sub num_structs {
    my ($self) = @_;
    return $self->{num_structs};
}

sub structs {
    my ($self) = @_;
    return $self->{structs};
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

    $self->{magic} = $self->{_io}->read_bytes(7);
    $self->{ptr_size_id} = $self->{_io}->read_u1();
    $self->{endian} = $self->{_io}->read_u1();
    $self->{version} = Encode::decode("ASCII", $self->{_io}->read_bytes(3));
}

sub psize {
    my ($self) = @_;
    return $self->{psize} if ($self->{psize});
    $self->{psize} = ($self->ptr_size_id() == $BlenderBlend::PTR_SIZE_BITS_64 ? 8 : 4);
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
package BlenderBlend::DnaField;

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

    $self->{idx_type} = $self->{_io}->read_u2le();
    $self->{idx_name} = $self->{_io}->read_u2le();
}

sub type {
    my ($self) = @_;
    return $self->{type} if ($self->{type});
    $self->{type} = @{$self->_parent()->_parent()->types()}[$self->idx_type()];
    return $self->{type};
}

sub name {
    my ($self) = @_;
    return $self->{name} if ($self->{name});
    $self->{name} = @{$self->_parent()->_parent()->names()}[$self->idx_name()];
    return $self->{name};
}

sub idx_type {
    my ($self) = @_;
    return $self->{idx_type};
}

sub idx_name {
    my ($self) = @_;
    return $self->{idx_name};
}

1;
