# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;

########################################################################
package Dcmp2;

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

    if ($self->header_parameters()->flags()->has_custom_lookup_table()) {
        $self->{custom_lookup_table} = ();
        my $n_custom_lookup_table = $self->header_parameters()->num_custom_lookup_table_entries();
        for (my $i = 0; $i < $n_custom_lookup_table; $i++) {
            $self->{custom_lookup_table}[$i] = $self->{_io}->read_bytes(2);
        }
    }
    my $_on = $self->header_parameters()->flags()->tagged();
    if ($_on == 1) {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - ($self->is_len_decompressed_odd() ? 1 : 0)));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Dcmp2::TaggedData->new($io__raw_data, $self, $self->{_root});
    }
    else {
        $self->{_raw_data} = $self->{_io}->read_bytes((($self->_io()->size() - $self->_io()->pos()) - ($self->is_len_decompressed_odd() ? 1 : 0)));
        my $io__raw_data = IO::KaitaiStruct::Stream->new($self->{_raw_data});
        $self->{data} = Dcmp2::UntaggedData->new($io__raw_data, $self, $self->{_root});
    }
    if ($self->is_len_decompressed_odd()) {
        $self->{last_byte} = $self->{_io}->read_bytes(1);
    }
}

sub header_parameters {
    my ($self) = @_;
    return $self->{header_parameters} if ($self->{header_parameters});
    my $io = $self->header_parameters_with_io()->_io();
    my $_pos = $io->pos();
    $io->seek(0);
    $self->{header_parameters} = Dcmp2::HeaderParameters->new($io, $self, $self->{_root});
    $io->seek($_pos);
    return $self->{header_parameters};
}

sub is_len_decompressed_odd {
    my ($self) = @_;
    return $self->{is_len_decompressed_odd} if ($self->{is_len_decompressed_odd});
    $self->{is_len_decompressed_odd} = ($self->len_decompressed() % 2) != 0;
    return $self->{is_len_decompressed_odd};
}

sub default_lookup_table {
    my ($self) = @_;
    return $self->{default_lookup_table} if ($self->{default_lookup_table});
    $self->{default_lookup_table} = (pack('C*', (0, 0)), pack('C*', (0, 8)), pack('C*', (78, 186)), pack('C*', (32, 110)), pack('C*', (78, 117)), pack('C*', (0, 12)), pack('C*', (0, 4)), pack('C*', (112, 0)), pack('C*', (0, 16)), pack('C*', (0, 2)), pack('C*', (72, 110)), pack('C*', (255, 252)), pack('C*', (96, 0)), pack('C*', (0, 1)), pack('C*', (72, 231)), pack('C*', (47, 46)), pack('C*', (78, 86)), pack('C*', (0, 6)), pack('C*', (78, 94)), pack('C*', (47, 0)), pack('C*', (97, 0)), pack('C*', (255, 248)), pack('C*', (47, 11)), pack('C*', (255, 255)), pack('C*', (0, 20)), pack('C*', (0, 10)), pack('C*', (0, 24)), pack('C*', (32, 95)), pack('C*', (0, 14)), pack('C*', (32, 80)), pack('C*', (63, 60)), pack('C*', (255, 244)), pack('C*', (76, 238)), pack('C*', (48, 46)), pack('C*', (103, 0)), pack('C*', (76, 223)), pack('C*', (38, 110)), pack('C*', (0, 18)), pack('C*', (0, 28)), pack('C*', (66, 103)), pack('C*', (255, 240)), pack('C*', (48, 60)), pack('C*', (47, 12)), pack('C*', (0, 3)), pack('C*', (78, 208)), pack('C*', (0, 32)), pack('C*', (112, 1)), pack('C*', (0, 22)), pack('C*', (45, 64)), pack('C*', (72, 192)), pack('C*', (32, 120)), pack('C*', (114, 0)), pack('C*', (88, 143)), pack('C*', (102, 0)), pack('C*', (79, 239)), pack('C*', (66, 167)), pack('C*', (103, 6)), pack('C*', (255, 250)), pack('C*', (85, 143)), pack('C*', (40, 110)), pack('C*', (63, 0)), pack('C*', (255, 254)), pack('C*', (47, 60)), pack('C*', (103, 4)), pack('C*', (89, 143)), pack('C*', (32, 107)), pack('C*', (0, 36)), pack('C*', (32, 31)), pack('C*', (65, 250)), pack('C*', (129, 225)), pack('C*', (102, 4)), pack('C*', (103, 8)), pack('C*', (0, 26)), pack('C*', (78, 185)), pack('C*', (80, 143)), pack('C*', (32, 46)), pack('C*', (0, 7)), pack('C*', (78, 176)), pack('C*', (255, 242)), pack('C*', (61, 64)), pack('C*', (0, 30)), pack('C*', (32, 104)), pack('C*', (102, 6)), pack('C*', (255, 246)), pack('C*', (78, 249)), pack('C*', (8, 0)), pack('C*', (12, 64)), pack('C*', (61, 124)), pack('C*', (255, 236)), pack('C*', (0, 5)), pack('C*', (32, 60)), pack('C*', (255, 232)), pack('C*', (222, 252)), pack('C*', (74, 46)), pack('C*', (0, 48)), pack('C*', (0, 40)), pack('C*', (47, 8)), pack('C*', (32, 11)), pack('C*', (96, 2)), pack('C*', (66, 110)), pack('C*', (45, 72)), pack('C*', (32, 83)), pack('C*', (32, 64)), pack('C*', (24, 0)), pack('C*', (96, 4)), pack('C*', (65, 238)), pack('C*', (47, 40)), pack('C*', (47, 1)), pack('C*', (103, 10)), pack('C*', (72, 64)), pack('C*', (32, 7)), pack('C*', (102, 8)), pack('C*', (1, 24)), pack('C*', (47, 7)), pack('C*', (48, 40)), pack('C*', (63, 46)), pack('C*', (48, 43)), pack('C*', (34, 110)), pack('C*', (47, 43)), pack('C*', (0, 44)), pack('C*', (103, 12)), pack('C*', (34, 95)), pack('C*', (96, 6)), pack('C*', (0, 255)), pack('C*', (48, 7)), pack('C*', (255, 238)), pack('C*', (83, 64)), pack('C*', (0, 64)), pack('C*', (255, 228)), pack('C*', (74, 64)), pack('C*', (102, 10)), pack('C*', (0, 15)), pack('C*', (78, 173)), pack('C*', (112, 255)), pack('C*', (34, 216)), pack('C*', (72, 107)), pack('C*', (0, 34)), pack('C*', (32, 75)), pack('C*', (103, 14)), pack('C*', (74, 174)), pack('C*', (78, 144)), pack('C*', (255, 224)), pack('C*', (255, 192)), pack('C*', (0, 42)), pack('C*', (39, 64)), pack('C*', (103, 2)), pack('C*', (81, 200)), pack('C*', (2, 182)), pack('C*', (72, 122)), pack('C*', (34, 120)), pack('C*', (176, 110)), pack('C*', (255, 230)), pack('C*', (0, 9)), pack('C*', (50, 46)), pack('C*', (62, 0)), pack('C*', (72, 65)), pack('C*', (255, 234)), pack('C*', (67, 238)), pack('C*', (78, 113)), pack('C*', (116, 0)), pack('C*', (47, 44)), pack('C*', (32, 108)), pack('C*', (0, 60)), pack('C*', (0, 38)), pack('C*', (0, 80)), pack('C*', (24, 128)), pack('C*', (48, 31)), pack('C*', (34, 0)), pack('C*', (102, 12)), pack('C*', (255, 218)), pack('C*', (0, 56)), pack('C*', (102, 2)), pack('C*', (48, 44)), pack('C*', (32, 12)), pack('C*', (45, 110)), pack('C*', (66, 64)), pack('C*', (255, 226)), pack('C*', (169, 240)), pack('C*', (255, 0)), pack('C*', (55, 124)), pack('C*', (229, 128)), pack('C*', (255, 220)), pack('C*', (72, 104)), pack('C*', (89, 79)), pack('C*', (0, 52)), pack('C*', (62, 31)), pack('C*', (96, 8)), pack('C*', (47, 6)), pack('C*', (255, 222)), pack('C*', (96, 10)), pack('C*', (112, 2)), pack('C*', (0, 50)), pack('C*', (255, 204)), pack('C*', (0, 128)), pack('C*', (34, 81)), pack('C*', (16, 31)), pack('C*', (49, 124)), pack('C*', (160, 41)), pack('C*', (255, 216)), pack('C*', (82, 64)), pack('C*', (1, 0)), pack('C*', (103, 16)), pack('C*', (160, 35)), pack('C*', (255, 206)), pack('C*', (255, 212)), pack('C*', (32, 6)), pack('C*', (72, 120)), pack('C*', (0, 46)), pack('C*', (80, 79)), pack('C*', (67, 250)), pack('C*', (103, 18)), pack('C*', (118, 0)), pack('C*', (65, 232)), pack('C*', (74, 110)), pack('C*', (32, 217)), pack('C*', (0, 90)), pack('C*', (127, 255)), pack('C*', (81, 202)), pack('C*', (0, 92)), pack('C*', (46, 0)), pack('C*', (2, 64)), pack('C*', (72, 199)), pack('C*', (103, 20)), pack('C*', (12, 128)), pack('C*', (46, 159)), pack('C*', (255, 214)), pack('C*', (128, 0)), pack('C*', (16, 0)), pack('C*', (72, 66)), pack('C*', (74, 107)), pack('C*', (255, 210)), pack('C*', (0, 72)), pack('C*', (74, 71)), pack('C*', (78, 209)), pack('C*', (32, 111)), pack('C*', (0, 65)), pack('C*', (96, 12)), pack('C*', (42, 120)), pack('C*', (66, 46)), pack('C*', (50, 0)), pack('C*', (101, 116)), pack('C*', (103, 22)), pack('C*', (0, 68)), pack('C*', (72, 109)), pack('C*', (32, 8)), pack('C*', (72, 108)), pack('C*', (11, 124)), pack('C*', (38, 64)), pack('C*', (4, 0)), pack('C*', (0, 104)), pack('C*', (32, 109)), pack('C*', (0, 13)), pack('C*', (42, 64)), pack('C*', (0, 11)), pack('C*', (0, 62)), pack('C*', (2, 32)));
    return $self->{default_lookup_table};
}

sub lookup_table {
    my ($self) = @_;
    return $self->{lookup_table} if ($self->{lookup_table});
    $self->{lookup_table} = ($self->header_parameters()->flags()->has_custom_lookup_table() ? $self->custom_lookup_table() : $self->default_lookup_table());
    return $self->{lookup_table};
}

sub custom_lookup_table {
    my ($self) = @_;
    return $self->{custom_lookup_table};
}

sub data {
    my ($self) = @_;
    return $self->{data};
}

sub last_byte {
    my ($self) = @_;
    return $self->{last_byte};
}

sub len_decompressed {
    my ($self) = @_;
    return $self->{len_decompressed};
}

sub header_parameters_with_io {
    my ($self) = @_;
    return $self->{header_parameters_with_io};
}

sub _raw_data {
    my ($self) = @_;
    return $self->{_raw_data};
}

########################################################################
package Dcmp2::HeaderParameters;

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

    $self->{unknown} = $self->{_io}->read_u2be();
    $self->{num_custom_lookup_table_entries_m1} = $self->{_io}->read_u1();
    $self->{flags} = Dcmp2::HeaderParameters::Flags->new($self->{_io}, $self, $self->{_root});
}

sub num_custom_lookup_table_entries {
    my ($self) = @_;
    return $self->{num_custom_lookup_table_entries} if ($self->{num_custom_lookup_table_entries});
    if ($self->flags()->has_custom_lookup_table()) {
        $self->{num_custom_lookup_table_entries} = ($self->num_custom_lookup_table_entries_m1() + 1);
    }
    return $self->{num_custom_lookup_table_entries};
}

sub unknown {
    my ($self) = @_;
    return $self->{unknown};
}

sub num_custom_lookup_table_entries_m1 {
    my ($self) = @_;
    return $self->{num_custom_lookup_table_entries_m1};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

########################################################################
package Dcmp2::HeaderParameters::Flags;

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

    $self->{reserved} = $self->{_io}->read_bits_int_be(6);
    $self->{tagged} = $self->{_io}->read_bits_int_be(1);
    $self->{has_custom_lookup_table} = $self->{_io}->read_bits_int_be(1);
}

sub as_int {
    my ($self) = @_;
    return $self->{as_int} if ($self->{as_int});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek(0);
    $self->{as_int} = $self->{_io}->read_u1();
    $self->{_io}->seek($_pos);
    return $self->{as_int};
}

sub reserved {
    my ($self) = @_;
    return $self->{reserved};
}

sub tagged {
    my ($self) = @_;
    return $self->{tagged};
}

sub has_custom_lookup_table {
    my ($self) = @_;
    return $self->{has_custom_lookup_table};
}

########################################################################
package Dcmp2::UntaggedData;

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

    $self->{table_references} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{table_references}}, $self->{_io}->read_u1();
    }
}

sub table_references {
    my ($self) = @_;
    return $self->{table_references};
}

########################################################################
package Dcmp2::TaggedData;

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

    $self->{chunks} = ();
    while (!$self->{_io}->is_eof()) {
        push @{$self->{chunks}}, Dcmp2::TaggedData::Chunk->new($self->{_io}, $self, $self->{_root});
    }
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

########################################################################
package Dcmp2::TaggedData::Chunk;

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

    $self->{tag} = ();
    my $n_tag = 8;
    for (my $i = 0; $i < $n_tag; $i++) {
        $self->{tag}[$i] = $self->{_io}->read_bits_int_be(1);
    }
    $self->{_io}->align_to_byte();
    $self->{_raw_units} = ();
    $self->{units} = ();
    do {
        my $_on = @{$self->tag()}[$i];
        if ($_on == 1) {
            $_ = $self->{_io}->read_u1();
            push @{$self->{units}}, $_;
        }
        else {
            $_ = $self->{_io}->read_bytes((@{$self->tag()}[$i] ? 1 : 2));
            push @{$self->{units}}, $_;
        }
    } until ( (($i >= 7) || ($self->_io()->is_eof())) );
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub units {
    my ($self) = @_;
    return $self->{units};
}

1;
