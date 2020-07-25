# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.007_000;
use DcmpVariableLengthInteger;

########################################################################
package Dcmp1;

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
        $_ = Dcmp1::Chunk->new($self->{_io}, $self, $self->{_root});
        push @{$self->{chunks}}, $_;
    } until ($_->tag() == 255);
}

sub chunks {
    my ($self) = @_;
    return $self->{chunks};
}

########################################################################
package Dcmp1::Chunk;

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
    my $_on = ( (($self->tag() >= 0) && ($self->tag() <= 31))  ? $TAG_KIND_LITERAL : ( (($self->tag() >= 32) && ($self->tag() <= 207))  ? $TAG_KIND_BACKREFERENCE : ( (($self->tag() >= 208) && ($self->tag() <= 209))  ? $TAG_KIND_LITERAL : ($self->tag() == 210 ? $TAG_KIND_BACKREFERENCE : ( (($self->tag() >= 213) && ($self->tag() <= 253))  ? $TAG_KIND_TABLE_LOOKUP : ($self->tag() == 254 ? $TAG_KIND_EXTENDED : ($self->tag() == 255 ? $TAG_KIND_END : $TAG_KIND_INVALID)))))));
    if ($_on == $TAG_KIND_END) {
        $self->{body} = Dcmp1::Chunk::EndBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $TAG_KIND_LITERAL) {
        $self->{body} = Dcmp1::Chunk::LiteralBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $TAG_KIND_BACKREFERENCE) {
        $self->{body} = Dcmp1::Chunk::BackreferenceBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $TAG_KIND_TABLE_LOOKUP) {
        $self->{body} = Dcmp1::Chunk::TableLookupBody->new($self->{_io}, $self, $self->{_root});
    }
    elsif ($_on == $TAG_KIND_EXTENDED) {
        $self->{body} = Dcmp1::Chunk::ExtendedBody->new($self->{_io}, $self, $self->{_root});
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
package Dcmp1::Chunk::LiteralBody;

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

    if ($self->is_len_literal_separate()) {
        $self->{len_literal_separate} = $self->{_io}->read_u1();
    }
    $self->{literal} = $self->{_io}->read_bytes($self->len_literal());
}

sub do_store {
    my ($self) = @_;
    return $self->{do_store} if ($self->{do_store});
    $self->{do_store} = ($self->is_len_literal_separate() ? $self->tag() == 209 : ($self->tag() & 16) != 0);
    return $self->{do_store};
}

sub len_literal_m1_in_tag {
    my ($self) = @_;
    return $self->{len_literal_m1_in_tag} if ($self->{len_literal_m1_in_tag});
    if (!($self->is_len_literal_separate())) {
        $self->{len_literal_m1_in_tag} = ($self->tag() & 15);
    }
    return $self->{len_literal_m1_in_tag};
}

sub is_len_literal_separate {
    my ($self) = @_;
    return $self->{is_len_literal_separate} if ($self->{is_len_literal_separate});
    $self->{is_len_literal_separate} = $self->tag() >= 208;
    return $self->{is_len_literal_separate};
}

sub len_literal {
    my ($self) = @_;
    return $self->{len_literal} if ($self->{len_literal});
    $self->{len_literal} = ($self->is_len_literal_separate() ? $self->len_literal_separate() : ($self->len_literal_m1_in_tag() + 1));
    return $self->{len_literal};
}

sub len_literal_separate {
    my ($self) = @_;
    return $self->{len_literal_separate};
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
package Dcmp1::Chunk::BackreferenceBody;

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
        $self->{index_separate_minus} = $self->{_io}->read_u1();
    }
}

sub is_index_separate {
    my ($self) = @_;
    return $self->{is_index_separate} if ($self->{is_index_separate});
    $self->{is_index_separate} = $self->tag() == 210;
    return $self->{is_index_separate};
}

sub index_in_tag {
    my ($self) = @_;
    return $self->{index_in_tag} if ($self->{index_in_tag});
    $self->{index_in_tag} = ($self->tag() - 32);
    return $self->{index_in_tag};
}

sub index_separate {
    my ($self) = @_;
    return $self->{index_separate} if ($self->{index_separate});
    if ($self->is_index_separate()) {
        $self->{index_separate} = ($self->index_separate_minus() + 176);
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
package Dcmp1::Chunk::TableLookupBody;

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
    $self->{lookup_table} = (pack('C*', (0, 0)), pack('C*', (0, 1)), pack('C*', (0, 2)), pack('C*', (0, 3)), pack('C*', (46, 1)), pack('C*', (62, 1)), pack('C*', (1, 1)), pack('C*', (30, 1)), pack('C*', (255, 255)), pack('C*', (14, 1)), pack('C*', (49, 0)), pack('C*', (17, 18)), pack('C*', (1, 7)), pack('C*', (51, 50)), pack('C*', (18, 57)), pack('C*', (237, 16)), pack('C*', (1, 39)), pack('C*', (35, 34)), pack('C*', (1, 55)), pack('C*', (7, 6)), pack('C*', (1, 23)), pack('C*', (1, 35)), pack('C*', (0, 255)), pack('C*', (0, 47)), pack('C*', (7, 14)), pack('C*', (253, 60)), pack('C*', (1, 53)), pack('C*', (1, 21)), pack('C*', (1, 2)), pack('C*', (0, 7)), pack('C*', (0, 62)), pack('C*', (5, 213)), pack('C*', (2, 1)), pack('C*', (6, 7)), pack('C*', (7, 8)), pack('C*', (48, 1)), pack('C*', (1, 51)), pack('C*', (0, 16)), pack('C*', (23, 22)), pack('C*', (55, 62)), pack('C*', (54, 55)));
    return $self->{lookup_table};
}

sub value {
    my ($self) = @_;
    return $self->{value} if ($self->{value});
    $self->{value} = @{$self->lookup_table()}[($self->tag() - 213)];
    return $self->{value};
}

sub tag {
    my ($self) = @_;
    return $self->{tag};
}

########################################################################
package Dcmp1::Chunk::EndBody;

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
package Dcmp1::Chunk::ExtendedBody;

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
    if ($_on == 2) {
        $self->{body} = Dcmp1::Chunk::ExtendedBody::RepeatBody->new($self->{_io}, $self, $self->{_root});
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
package Dcmp1::Chunk::ExtendedBody::RepeatBody;

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

1;
