# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use DcmpVariableLengthInteger;

########################################################################
package Dcmp0;

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
    do {
        $_ = Dcmp0::Chunk->new($self->{_io}, $self, $self->{_root});
        push @{$self->{chunks}}, $_;
    } until ($_->tag() == 255);
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

########################################################################
package Dcmp0::Chunk;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $TAG_KIND_INVALID = -1;
our $TAG_KIND_LITERAL = 0;
our $TAG_KIND_BACKREFERENCE = 1;
our $TAG_KIND_TABLE_LOOKUP = 2;
our $TAG_KIND_EXTENDED = 3;
our $TAG_KIND_END = 4;

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

    $self->{tag} = $self->{_io}->read_u1();
    my $_on = ( (($self->tag() >= 0) && ($self->tag() <= 31))  ? $Dcmp0::Chunk::TAG_KIND_LITERAL : ( (($self->tag() >= 32) && ($self->tag() <= 74))  ? $Dcmp0::Chunk::TAG_KIND_BACKREFERENCE : ( (($self->tag() >= 75) && ($self->tag() <= 253))  ? $Dcmp0::Chunk::TAG_KIND_TABLE_LOOKUP : ($self->tag() == 254 ? $Dcmp0::Chunk::TAG_KIND_EXTENDED : ($self->tag() == 255 ? $Dcmp0::Chunk::TAG_KIND_END : $Dcmp0::Chunk::TAG_KIND_INVALID)))));
    if ($_on == $Dcmp0::Chunk::TAG_KIND_EXTENDED) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dcmp0::Chunk::TAG_KIND_LITERAL) {
        $self->{body} = Dcmp0::Chunk::LiteralBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dcmp0::Chunk::TAG_KIND_END) {
        $self->{body} = Dcmp0::Chunk::EndBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dcmp0::Chunk::TAG_KIND_TABLE_LOOKUP) {
        $self->{body} = Dcmp0::Chunk::TableLookupBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $Dcmp0::Chunk::TAG_KIND_BACKREFERENCE) {
        $self->{body} = Dcmp0::Chunk::BackreferenceBody->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Dcmp0::Chunk::LiteralBody;

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

    if ($self->is_len_literal_div2_separate()) {
        $self->{len_literal_div2_separate} = $self->{_io}->read_u1();
    }
    $self->{literal} = $self->{_io}->read_bytes($self->len_literal());
}

sub do_store {
    my ($self) = @_;
    return $self->{do_store} if ($self->{do_store});
    $self->{do_store} = ($self->tag() & 16) != 0;
    return $self->{do_store};
}

sub len_literal_div2 {
    my ($self) = @_;
    return $self->{len_literal_div2} if ($self->{len_literal_div2});
    $self->{len_literal_div2} = ($self->is_len_literal_div2_separate() ? $self->len_literal_div2_separate() : $self->len_literal_div2_in_tag());
    return $self->{len_literal_div2};
}

sub len_literal {
    my ($self) = @_;
    return $self->{len_literal} if ($self->{len_literal});
    $self->{len_literal} = ($self->len_literal_div2() * 2);
    return $self->{len_literal};
}

sub len_literal_div2_in_tag {
    my ($self) = @_;
    return $self->{len_literal_div2_in_tag} if ($self->{len_literal_div2_in_tag});
    $self->{len_literal_div2_in_tag} = ($self->tag() & 15);
    return $self->{len_literal_div2_in_tag};
}

sub is_len_literal_div2_separate {
    my ($self) = @_;
    return $self->{is_len_literal_div2_separate} if ($self->{is_len_literal_div2_separate});
    $self->{is_len_literal_div2_separate} = $self->len_literal_div2_in_tag() == 0;
    return $self->{is_len_literal_div2_separate};
}

sub len_literal_div2_separate {
    my ($self) = @_;
    return $self->{len_literal_div2_separate};
}

sub literal {
    my ($self) = @_;
    return $self->{literal};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Dcmp0::Chunk::BackreferenceBody;

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

    if ($self->is_index_separate()) {
        my $_on = $self->tag();
        if ($_on == 32) {
            $self->{index_separate_minus} = $self->{_io}->read_u1();
        }
        elsif ($_on == 33) {
            $self->{index_separate_minus} = $self->{_io}->read_u1();
        }
        elsif ($_on == 34) {
            $self->{index_separate_minus} = $self->{_io}->read_u2be();
        }
    }
}

sub is_index_separate {
    my ($self) = @_;
    return $self->{is_index_separate} if ($self->{is_index_separate});
    $self->{is_index_separate} =  (($self->tag() >= 32) && ($self->tag() <= 34)) ;
    return $self->{is_index_separate};
}

sub index_in_tag {
    my ($self) = @_;
    return $self->{index_in_tag} if ($self->{index_in_tag});
    $self->{index_in_tag} = ($self->tag() - 35);
    return $self->{index_in_tag};
}

sub index_separate {
    my ($self) = @_;
    return $self->{index_separate} if ($self->{index_separate});
    if ($self->is_index_separate()) {
        $self->{index_separate} = (($self->index_separate_minus() + 40) + ($self->tag() == 33 ? 256 : 0));
    }
    return $self->{index_separate};
}

sub index {
    my ($self) = @_;
    return $self->{index} if ($self->{index});
    $self->{index} = ($self->is_index_separate() ? $self->index_separate() : $self->index_in_tag());
    return $self->{index};
}

sub index_separate_minus {
    my ($self) = @_;
    return $self->{index_separate_minus};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Dcmp0::Chunk::TableLookupBody;

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

}

sub lookup_table {
    my ($self) = @_;
    return $self->{lookup_table} if ($self->{lookup_table});
    $self->{lookup_table} = (pack('C*', (0, 0)), pack('C*', (78, 186)), pack('C*', (0, 8)), pack('C*', (78, 117)), pack('C*', (0, 12)), pack('C*', (78, 173)), pack('C*', (32, 83)), pack('C*', (47, 11)), pack('C*', (97, 0)), pack('C*', (0, 16)), pack('C*', (112, 0)), pack('C*', (47, 0)), pack('C*', (72, 110)), pack('C*', (32, 80)), pack('C*', (32, 110)), pack('C*', (47, 46)), pack('C*', (255, 252)), pack('C*', (72, 231)), pack('C*', (63, 60)), pack('C*', (0, 4)), pack('C*', (255, 248)), pack('C*', (47, 12)), pack('C*', (32, 6)), pack('C*', (78, 237)), pack('C*', (78, 86)), pack('C*', (32, 104)), pack('C*', (78, 94)), pack('C*', (0, 1)), pack('C*', (88, 143)), pack('C*', (79, 239)), pack('C*', (0, 2)), pack('C*', (0, 24)), pack('C*', (96, 0)), pack('C*', (255, 255)), pack('C*', (80, 143)), pack('C*', (78, 144)), pack('C*', (0, 6)), pack('C*', (38, 110)), pack('C*', (0, 20)), pack('C*', (255, 244)), pack('C*', (76, 238)), pack('C*', (0, 10)), pack('C*', (0, 14)), pack('C*', (65, 238)), pack('C*', (76, 223)), pack('C*', (72, 192)), pack('C*', (255, 240)), pack('C*', (45, 64)), pack('C*', (0, 18)), pack('C*', (48, 46)), pack('C*', (112, 1)), pack('C*', (47, 40)), pack('C*', (32, 84)), pack('C*', (103, 0)), pack('C*', (0, 32)), pack('C*', (0, 28)), pack('C*', (32, 95)), pack('C*', (24, 0)), pack('C*', (38, 111)), pack('C*', (72, 120)), pack('C*', (0, 22)), pack('C*', (65, 250)), pack('C*', (48, 60)), pack('C*', (40, 64)), pack('C*', (114, 0)), pack('C*', (40, 110)), pack('C*', (32, 12)), pack('C*', (102, 0)), pack('C*', (32, 107)), pack('C*', (47, 7)), pack('C*', (85, 143)), pack('C*', (0, 40)), pack('C*', (255, 254)), pack('C*', (255, 236)), pack('C*', (34, 216)), pack('C*', (32, 11)), pack('C*', (0, 15)), pack('C*', (89, 143)), pack('C*', (47, 60)), pack('C*', (255, 0)), pack('C*', (1, 24)), pack('C*', (129, 225)), pack('C*', (74, 0)), pack('C*', (78, 176)), pack('C*', (255, 232)), pack('C*', (72, 199)), pack('C*', (0, 3)), pack('C*', (0, 34)), pack('C*', (0, 7)), pack('C*', (0, 26)), pack('C*', (103, 6)), pack('C*', (103, 8)), pack('C*', (78, 249)), pack('C*', (0, 36)), pack('C*', (32, 120)), pack('C*', (8, 0)), pack('C*', (102, 4)), pack('C*', (0, 42)), pack('C*', (78, 208)), pack('C*', (48, 40)), pack('C*', (38, 95)), pack('C*', (103, 4)), pack('C*', (0, 48)), pack('C*', (67, 238)), pack('C*', (63, 0)), pack('C*', (32, 31)), pack('C*', (0, 30)), pack('C*', (255, 246)), pack('C*', (32, 46)), pack('C*', (66, 167)), pack('C*', (32, 7)), pack('C*', (255, 250)), pack('C*', (96, 2)), pack('C*', (61, 64)), pack('C*', (12, 64)), pack('C*', (102, 6)), pack('C*', (0, 38)), pack('C*', (45, 72)), pack('C*', (47, 1)), pack('C*', (112, 255)), pack('C*', (96, 4)), pack('C*', (24, 128)), pack('C*', (74, 64)), pack('C*', (0, 64)), pack('C*', (0, 44)), pack('C*', (47, 8)), pack('C*', (0, 17)), pack('C*', (255, 228)), pack('C*', (33, 64)), pack('C*', (38, 64)), pack('C*', (255, 242)), pack('C*', (66, 110)), pack('C*', (78, 185)), pack('C*', (61, 124)), pack('C*', (0, 56)), pack('C*', (0, 13)), pack('C*', (96, 6)), pack('C*', (66, 46)), pack('C*', (32, 60)), pack('C*', (103, 12)), pack('C*', (45, 104)), pack('C*', (102, 8)), pack('C*', (74, 46)), pack('C*', (74, 174)), pack('C*', (0, 46)), pack('C*', (72, 64)), pack('C*', (34, 95)), pack('C*', (34, 0)), pack('C*', (103, 10)), pack('C*', (48, 7)), pack('C*', (66, 103)), pack('C*', (0, 50)), pack('C*', (32, 40)), pack('C*', (0, 9)), pack('C*', (72, 122)), pack('C*', (2, 0)), pack('C*', (47, 43)), pack('C*', (0, 5)), pack('C*', (34, 110)), pack('C*', (102, 2)), pack('C*', (229, 128)), pack('C*', (103, 14)), pack('C*', (102, 10)), pack('C*', (0, 80)), pack('C*', (62, 0)), pack('C*', (102, 12)), pack('C*', (46, 0)), pack('C*', (255, 238)), pack('C*', (32, 109)), pack('C*', (32, 64)), pack('C*', (255, 224)), pack('C*', (83, 64)), pack('C*', (96, 8)), pack('C*', (4, 128)), pack('C*', (0, 104)), pack('C*', (11, 124)), pack('C*', (68, 0)), pack('C*', (65, 232)), pack('C*', (72, 65)));
    return $self->{lookup_table};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = @{$self->lookup_table()}[($self->tag() - 75)];
    return $self->{value};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Dcmp0::Chunk::EndBody;

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

}

########################################################################
package Dcmp0::Chunk::ExtendedBody;

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

    $self->{tag} = $self->{_io}->read_u1();
    my $_on = $self->tag();
    if ($_on == 0) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody::JumpTableBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 4) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody::DeltaEncoding16BitBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 6) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody::DeltaEncoding32BitBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 3) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody::RepeatBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == 2) {
        $self->{body} = Dcmp0::Chunk::ExtendedBody::RepeatBody->new($self->{_io}, $self, $self->{_root});
    }
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

sub body {
    my ($self) = @_;
    return $self->{body};
}

########################################################################
package Dcmp0::Chunk::ExtendedBody::JumpTableBody;

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

    $self->{segment_number_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{num_addresses_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{addresses_raw} = ();
    my $n_addresses_raw = $self->num_addresses();
    for (my $i = 0; $i < $n_addresses_raw; $i++) {
        $self->{addresses_raw}[$i] = DcmpVariableLengthInteger->new($self->{_io});
    }
}

sub segment_number {
    my ($self) = @_;
    return $self->{segment_number} if ($self->{segment_number});
    $self->{segment_number} = $self->segment_number_raw()->value();
    return $self->{segment_number};
}

sub num_addresses {
    my ($self) = @_;
    return $self->{num_addresses} if ($self->{num_addresses});
    $self->{num_addresses} = $self->num_addresses_raw()->value();
    return $self->{num_addresses};
}

sub segment_number_raw {
    my ($self) = @_;
    return $self->{segment_number_raw};
}

sub num_addresses_raw {
    my ($self) = @_;
    return $self->{num_addresses_raw};
}

sub addresses_raw {
    my ($self) = @_;
    return $self->{addresses_raw};
}

########################################################################
package Dcmp0::Chunk::ExtendedBody::RepeatBody;

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

    $self->{to_repeat_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{repeat_count_m1_raw} = DcmpVariableLengthInteger->new($self->{_io});
}

sub byte_count {
    my ($self) = @_;
    return $self->{byte_count} if ($self->{byte_count});
    $self->{byte_count} = ($self->tag() == 2 ? 1 : ($self->tag() == 3 ? 2 : -1));
    return $self->{byte_count};
}

sub to_repeat {
    my ($self) = @_;
    return $self->{to_repeat} if ($self->{to_repeat});
    $self->{to_repeat} = $self->to_repeat_raw()->value();
    return $self->{to_repeat};
}

sub repeat_count_m1 {
    my ($self) = @_;
    return $self->{repeat_count_m1} if ($self->{repeat_count_m1});
    $self->{repeat_count_m1} = $self->repeat_count_m1_raw()->value();
    return $self->{repeat_count_m1};
}

sub repeat_count {
    my ($self) = @_;
    return $self->{repeat_count} if ($self->{repeat_count});
    $self->{repeat_count} = ($self->repeat_count_m1() + 1);
    return $self->{repeat_count};
}

sub to_repeat_raw {
    my ($self) = @_;
    return $self->{to_repeat_raw};
}

sub repeat_count_m1_raw {
    my ($self) = @_;
    return $self->{repeat_count_m1_raw};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Dcmp0::Chunk::ExtendedBody::DeltaEncoding16BitBody;

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

    $self->{first_value_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{num_deltas_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{deltas} = ();
    my $n_deltas = $self->num_deltas();
    for (my $i = 0; $i < $n_deltas; $i++) {
        $self->{deltas}[$i] = $self->{_io}->read_s1();
    }
}

sub first_value {
    my ($self) = @_;
    return $self->{first_value} if ($self->{first_value});
    $self->{first_value} = $self->first_value_raw()->value();
    return $self->{first_value};
}

sub num_deltas {
    my ($self) = @_;
    return $self->{num_deltas} if ($self->{num_deltas});
    $self->{num_deltas} = $self->num_deltas_raw()->value();
    return $self->{num_deltas};
}

sub first_value_raw {
    my ($self) = @_;
    return $self->{first_value_raw};
}

sub num_deltas_raw {
    my ($self) = @_;
    return $self->{num_deltas_raw};
}

sub deltas {
    my ($self) = @_;
    return $self->{deltas};
}

########################################################################
package Dcmp0::Chunk::ExtendedBody::DeltaEncoding32BitBody;

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

    $self->{first_value_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{num_deltas_raw} = DcmpVariableLengthInteger->new($self->{_io});
    $self->{deltas_raw} = ();
    my $n_deltas_raw = $self->num_deltas();
    for (my $i = 0; $i < $n_deltas_raw; $i++) {
        $self->{deltas_raw}[$i] = DcmpVariableLengthInteger->new($self->{_io});
    }
}

sub first_value {
    my ($self) = @_;
    return $self->{first_value} if ($self->{first_value});
    $self->{first_value} = $self->first_value_raw()->value();
    return $self->{first_value};
}

sub num_deltas {
    my ($self) = @_;
    return $self->{num_deltas} if ($self->{num_deltas});
    $self->{num_deltas} = $self->num_deltas_raw()->value();
    return $self->{num_deltas};
}

sub first_value_raw {
    my ($self) = @_;
    return $self->{first_value_raw};
}

sub num_deltas_raw {
    my ($self) = @_;
    return $self->{num_deltas_raw};
}

sub deltas_raw {
    my ($self) = @_;
    return $self->{deltas_raw};
}

1;
