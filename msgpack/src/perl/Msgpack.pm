# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Msgpack;

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

    $self->{b1} = $self->{_io}->read_u1();
    my $_on = $self->b1();
    if ($_on == 211) {
        $self->{int_extra} = $self->{_io}->read_s8be();
    }
    elsif ($_on == 209) {
        $self->{int_extra} = $self->{_io}->read_s2be();
    }
    elsif ($_on == 210) {
        $self->{int_extra} = $self->{_io}->read_s4be();
    }
    elsif ($_on == 208) {
        $self->{int_extra} = $self->{_io}->read_s1();
    }
    elsif ($_on == 205) {
        $self->{int_extra} = $self->{_io}->read_u2be();
    }
    elsif ($_on == 207) {
        $self->{int_extra} = $self->{_io}->read_u8be();
    }
    elsif ($_on == 204) {
        $self->{int_extra} = $self->{_io}->read_u1();
    }
    elsif ($_on == 206) {
        $self->{int_extra} = $self->{_io}->read_u4be();
    }
    if ($self->is_float_32()) {
        $self->{float_32_value} = $self->{_io}->read_f4be();
    }
    if ($self->is_float_64()) {
        $self->{float_64_value} = $self->{_io}->read_f8be();
    }
    if ($self->is_str_8()) {
        $self->{str_len_8} = $self->{_io}->read_u1();
    }
    if ($self->is_str_16()) {
        $self->{str_len_16} = $self->{_io}->read_u2be();
    }
    if ($self->is_str_32()) {
        $self->{str_len_32} = $self->{_io}->read_u4be();
    }
    if ($self->is_str()) {
        $self->{str_value} = Encode::decode("UTF-8", $self->{_io}->read_bytes($self->str_len()));
    }
    if ($self->is_array_16()) {
        $self->{num_array_elements_16} = $self->{_io}->read_u2be();
    }
    if ($self->is_array_32()) {
        $self->{num_array_elements_32} = $self->{_io}->read_u4be();
    }
    if ($self->is_array()) {
        $self->{array_elements} = ();
        my $n_array_elements = $self->num_array_elements();
        for (my $i = 0; $i < $n_array_elements; $i++) {
            $self->{array_elements}[$i] = Msgpack->new($self->{_io});
        }
    }
    if ($self->is_map_16()) {
        $self->{num_map_elements_16} = $self->{_io}->read_u2be();
    }
    if ($self->is_map_32()) {
        $self->{num_map_elements_32} = $self->{_io}->read_u4be();
    }
    if ($self->is_map()) {
        $self->{map_elements} = ();
        my $n_map_elements = $self->num_map_elements();
        for (my $i = 0; $i < $n_map_elements; $i++) {
            $self->{map_elements}[$i] = Msgpack::MapTuple->new($self->{_io}, $self, $self->{_root});
        }
    }
}

sub is_array_32 {
    my ($self) = @_;
    return $self->{is_array_32} if ($self->{is_array_32});
    $self->{is_array_32} = $self->b1() == 221;
    return $self->{is_array_32};
}

sub int_value {
    my ($self) = @_;
    return $self->{int_value} if ($self->{int_value});
    if ($self->is_int()) {
        $self->{int_value} = ($self->is_pos_int7() ? $self->pos_int7_value() : ($self->is_neg_int5() ? $self->neg_int5_value() : 4919));
    }
    return $self->{int_value};
}

sub str_len {
    my ($self) = @_;
    return $self->{str_len} if ($self->{str_len});
    if ($self->is_str()) {
        $self->{str_len} = ($self->is_fix_str() ? ($self->b1() & 31) : ($self->is_str_8() ? $self->str_len_8() : ($self->is_str_16() ? $self->str_len_16() : $self->str_len_32())));
    }
    return $self->{str_len};
}

sub is_fix_array {
    my ($self) = @_;
    return $self->{is_fix_array} if ($self->{is_fix_array});
    $self->{is_fix_array} = ($self->b1() & 240) == 144;
    return $self->{is_fix_array};
}

sub is_map {
    my ($self) = @_;
    return $self->{is_map} if ($self->{is_map});
    $self->{is_map} =  (($self->is_fix_map()) || ($self->is_map_16()) || ($self->is_map_32())) ;
    return $self->{is_map};
}

sub is_array {
    my ($self) = @_;
    return $self->{is_array} if ($self->{is_array});
    $self->{is_array} =  (($self->is_fix_array()) || ($self->is_array_16()) || ($self->is_array_32())) ;
    return $self->{is_array};
}

sub is_float {
    my ($self) = @_;
    return $self->{is_float} if ($self->{is_float});
    $self->{is_float} =  (($self->is_float_32()) || ($self->is_float_64())) ;
    return $self->{is_float};
}

sub is_str_8 {
    my ($self) = @_;
    return $self->{is_str_8} if ($self->{is_str_8});
    $self->{is_str_8} = $self->b1() == 217;
    return $self->{is_str_8};
}

sub is_fix_map {
    my ($self) = @_;
    return $self->{is_fix_map} if ($self->{is_fix_map});
    $self->{is_fix_map} = ($self->b1() & 240) == 128;
    return $self->{is_fix_map};
}

sub is_int {
    my ($self) = @_;
    return $self->{is_int} if ($self->{is_int});
    $self->{is_int} =  (($self->is_pos_int7()) || ($self->is_neg_int5())) ;
    return $self->{is_int};
}

sub is_bool {
    my ($self) = @_;
    return $self->{is_bool} if ($self->{is_bool});
    $self->{is_bool} =  (($self->b1() == 194) || ($self->b1() == 195)) ;
    return $self->{is_bool};
}

sub is_str_16 {
    my ($self) = @_;
    return $self->{is_str_16} if ($self->{is_str_16});
    $self->{is_str_16} = $self->b1() == 218;
    return $self->{is_str_16};
}

sub is_float_64 {
    my ($self) = @_;
    return $self->{is_float_64} if ($self->{is_float_64});
    $self->{is_float_64} = $self->b1() == 203;
    return $self->{is_float_64};
}

sub is_map_16 {
    my ($self) = @_;
    return $self->{is_map_16} if ($self->{is_map_16});
    $self->{is_map_16} = $self->b1() == 222;
    return $self->{is_map_16};
}

sub is_neg_int5 {
    my ($self) = @_;
    return $self->{is_neg_int5} if ($self->{is_neg_int5});
    $self->{is_neg_int5} = ($self->b1() & 224) == 224;
    return $self->{is_neg_int5};
}

sub pos_int7_value {
    my ($self) = @_;
    return $self->{pos_int7_value} if ($self->{pos_int7_value});
    if ($self->is_pos_int7()) {
        $self->{pos_int7_value} = $self->b1();
    }
    return $self->{pos_int7_value};
}

sub is_nil {
    my ($self) = @_;
    return $self->{is_nil} if ($self->{is_nil});
    $self->{is_nil} = $self->b1() == 192;
    return $self->{is_nil};
}

sub float_value {
    my ($self) = @_;
    return $self->{float_value} if ($self->{float_value});
    if ($self->is_float()) {
        $self->{float_value} = ($self->is_float_32() ? $self->float_32_value() : $self->float_64_value());
    }
    return $self->{float_value};
}

sub num_array_elements {
    my ($self) = @_;
    return $self->{num_array_elements} if ($self->{num_array_elements});
    if ($self->is_array()) {
        $self->{num_array_elements} = ($self->is_fix_array() ? ($self->b1() & 15) : ($self->is_array_16() ? $self->num_array_elements_16() : $self->num_array_elements_32()));
    }
    return $self->{num_array_elements};
}

sub neg_int5_value {
    my ($self) = @_;
    return $self->{neg_int5_value} if ($self->{neg_int5_value});
    if ($self->is_neg_int5()) {
        $self->{neg_int5_value} = -(($self->b1() & 31));
    }
    return $self->{neg_int5_value};
}

sub bool_value {
    my ($self) = @_;
    return $self->{bool_value} if ($self->{bool_value});
    if ($self->is_bool()) {
        $self->{bool_value} = $self->b1() == 195;
    }
    return $self->{bool_value};
}

sub is_pos_int7 {
    my ($self) = @_;
    return $self->{is_pos_int7} if ($self->{is_pos_int7});
    $self->{is_pos_int7} = ($self->b1() & 128) == 0;
    return $self->{is_pos_int7};
}

sub is_array_16 {
    my ($self) = @_;
    return $self->{is_array_16} if ($self->{is_array_16});
    $self->{is_array_16} = $self->b1() == 220;
    return $self->{is_array_16};
}

sub is_str {
    my ($self) = @_;
    return $self->{is_str} if ($self->{is_str});
    $self->{is_str} =  (($self->is_fix_str()) || ($self->is_str_8()) || ($self->is_str_16()) || ($self->is_str_32())) ;
    return $self->{is_str};
}

sub is_fix_str {
    my ($self) = @_;
    return $self->{is_fix_str} if ($self->{is_fix_str});
    $self->{is_fix_str} = ($self->b1() & 224) == 160;
    return $self->{is_fix_str};
}

sub is_str_32 {
    my ($self) = @_;
    return $self->{is_str_32} if ($self->{is_str_32});
    $self->{is_str_32} = $self->b1() == 219;
    return $self->{is_str_32};
}

sub num_map_elements {
    my ($self) = @_;
    return $self->{num_map_elements} if ($self->{num_map_elements});
    if ($self->is_map()) {
        $self->{num_map_elements} = ($self->is_fix_map() ? ($self->b1() & 15) : ($self->is_map_16() ? $self->num_map_elements_16() : $self->num_map_elements_32()));
    }
    return $self->{num_map_elements};
}

sub is_float_32 {
    my ($self) = @_;
    return $self->{is_float_32} if ($self->{is_float_32});
    $self->{is_float_32} = $self->b1() == 202;
    return $self->{is_float_32};
}

sub is_map_32 {
    my ($self) = @_;
    return $self->{is_map_32} if ($self->{is_map_32});
    $self->{is_map_32} = $self->b1() == 223;
    return $self->{is_map_32};
}

sub b1 {
    my ($self) = @_;
    return $self->{b1};
}

sub int_extra {
    my ($self) = @_;
    return $self->{int_extra};
}

sub float_32_value {
    my ($self) = @_;
    return $self->{float_32_value};
}

sub float_64_value {
    my ($self) = @_;
    return $self->{float_64_value};
}

sub str_len_8 {
    my ($self) = @_;
    return $self->{str_len_8};
}

sub str_len_16 {
    my ($self) = @_;
    return $self->{str_len_16};
}

sub str_len_32 {
    my ($self) = @_;
    return $self->{str_len_32};
}

sub str_value {
    my ($self) = @_;
    return $self->{str_value};
}

sub num_array_elements_16 {
    my ($self) = @_;
    return $self->{num_array_elements_16};
}

sub num_array_elements_32 {
    my ($self) = @_;
    return $self->{num_array_elements_32};
}

sub array_elements {
    my ($self) = @_;
    return $self->{array_elements};
}

sub num_map_elements_16 {
    my ($self) = @_;
    return $self->{num_map_elements_16};
}

sub num_map_elements_32 {
    my ($self) = @_;
    return $self->{num_map_elements_32};
}

sub map_elements {
    my ($self) = @_;
    return $self->{map_elements};
}

########################################################################
package Msgpack::MapTuple;

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

    $self->{key} = Msgpack->new($self->{_io});
    $self->{value} = Msgpack->new($self->{_io});
}

sub key {
    my ($self) = @_;
    return $self->{key};
}

sub value {
    my ($self) = @_;
    return $self->{value};
}

1;
