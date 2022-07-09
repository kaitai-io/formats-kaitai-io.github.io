# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package QuakeMdl;

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

    $self->{header} = QuakeMdl::MdlHeader->new($self->{_io}, $self, $self->{_root});
    $self->{skins} = ();
    my $n_skins = $self->header()->num_skins();
    for (my $i = 0; $i < $n_skins; $i++) {
        push @{$self->{skins}}, QuakeMdl::MdlSkin->new($self->{_io}, $self, $self->{_root});
    }
    $self->{texture_coordinates} = ();
    my $n_texture_coordinates = $self->header()->num_verts();
    for (my $i = 0; $i < $n_texture_coordinates; $i++) {
        push @{$self->{texture_coordinates}}, QuakeMdl::MdlTexcoord->new($self->{_io}, $self, $self->{_root});
    }
    $self->{triangles} = ();
    my $n_triangles = $self->header()->num_tris();
    for (my $i = 0; $i < $n_triangles; $i++) {
        push @{$self->{triangles}}, QuakeMdl::MdlTriangle->new($self->{_io}, $self, $self->{_root});
    }
    $self->{frames} = ();
    my $n_frames = $self->header()->num_frames();
    for (my $i = 0; $i < $n_frames; $i++) {
        push @{$self->{frames}}, QuakeMdl::MdlFrame->new($self->{_io}, $self, $self->{_root});
    }
}

sub header {
    my ($self) = @_;
    return $self->{header};
}

sub skins {
    my ($self) = @_;
    return $self->{skins};
}

sub texture_coordinates {
    my ($self) = @_;
    return $self->{texture_coordinates};
}

sub triangles {
    my ($self) = @_;
    return $self->{triangles};
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

########################################################################
package QuakeMdl::MdlVertex;

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

    $self->{values} = ();
    my $n_values = 3;
    for (my $i = 0; $i < $n_values; $i++) {
        push @{$self->{values}}, $self->{_io}->read_u1();
    }
    $self->{normal_index} = $self->{_io}->read_u1();
}

sub values {
    my ($self) = @_;
    return $self->{values};
}

sub normal_index {
    my ($self) = @_;
    return $self->{normal_index};
}

########################################################################
package QuakeMdl::MdlTexcoord;

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

    $self->{on_seam} = $self->{_io}->read_s4le();
    $self->{s} = $self->{_io}->read_s4le();
    $self->{t} = $self->{_io}->read_s4le();
}

sub on_seam {
    my ($self) = @_;
    return $self->{on_seam};
}

sub s {
    my ($self) = @_;
    return $self->{s};
}

sub t {
    my ($self) = @_;
    return $self->{t};
}

########################################################################
package QuakeMdl::MdlHeader;

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

    $self->{ident} = $self->{_io}->read_bytes(4);
    $self->{version_must_be_6} = $self->{_io}->read_bytes(4);
    $self->{scale} = QuakeMdl::Vec3->new($self->{_io}, $self, $self->{_root});
    $self->{origin} = QuakeMdl::Vec3->new($self->{_io}, $self, $self->{_root});
    $self->{radius} = $self->{_io}->read_f4le();
    $self->{eye_position} = QuakeMdl::Vec3->new($self->{_io}, $self, $self->{_root});
    $self->{num_skins} = $self->{_io}->read_s4le();
    $self->{skin_width} = $self->{_io}->read_s4le();
    $self->{skin_height} = $self->{_io}->read_s4le();
    $self->{num_verts} = $self->{_io}->read_s4le();
    $self->{num_tris} = $self->{_io}->read_s4le();
    $self->{num_frames} = $self->{_io}->read_s4le();
    $self->{synctype} = $self->{_io}->read_s4le();
    $self->{flags} = $self->{_io}->read_s4le();
    $self->{size} = $self->{_io}->read_f4le();
}

sub version {
    my ($self) = @_;
    return $self->{version} if ($self->{version});
    $self->{version} = 6;
    return $self->{version};
}

sub skin_size {
    my ($self) = @_;
    return $self->{skin_size} if ($self->{skin_size});
    $self->{skin_size} = ($self->skin_width() * $self->skin_height());
    return $self->{skin_size};
}

sub ident {
    my ($self) = @_;
    return $self->{ident};
}

sub version_must_be_6 {
    my ($self) = @_;
    return $self->{version_must_be_6};
}

sub scale {
    my ($self) = @_;
    return $self->{scale};
}

sub origin {
    my ($self) = @_;
    return $self->{origin};
}

sub radius {
    my ($self) = @_;
    return $self->{radius};
}

sub eye_position {
    my ($self) = @_;
    return $self->{eye_position};
}

sub num_skins {
    my ($self) = @_;
    return $self->{num_skins};
}

sub skin_width {
    my ($self) = @_;
    return $self->{skin_width};
}

sub skin_height {
    my ($self) = @_;
    return $self->{skin_height};
}

sub num_verts {
    my ($self) = @_;
    return $self->{num_verts};
}

sub num_tris {
    my ($self) = @_;
    return $self->{num_tris};
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub synctype {
    my ($self) = @_;
    return $self->{synctype};
}

sub flags {
    my ($self) = @_;
    return $self->{flags};
}

sub size {
    my ($self) = @_;
    return $self->{size};
}

########################################################################
package QuakeMdl::MdlSkin;

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

    $self->{group} = $self->{_io}->read_s4le();
    if ($self->group() == 0) {
        $self->{single_texture_data} = $self->{_io}->read_bytes($self->_root()->header()->skin_size());
    }
    if ($self->group() != 0) {
        $self->{num_frames} = $self->{_io}->read_u4le();
    }
    if ($self->group() != 0) {
        $self->{frame_times} = ();
        my $n_frame_times = $self->num_frames();
        for (my $i = 0; $i < $n_frame_times; $i++) {
            push @{$self->{frame_times}}, $self->{_io}->read_f4le();
        }
    }
    if ($self->group() != 0) {
        $self->{group_texture_data} = ();
        my $n_group_texture_data = $self->num_frames();
        for (my $i = 0; $i < $n_group_texture_data; $i++) {
            push @{$self->{group_texture_data}}, $self->{_io}->read_bytes($self->_root()->header()->skin_size());
        }
    }
}

sub group {
    my ($self) = @_;
    return $self->{group};
}

sub single_texture_data {
    my ($self) = @_;
    return $self->{single_texture_data};
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub frame_times {
    my ($self) = @_;
    return $self->{frame_times};
}

sub group_texture_data {
    my ($self) = @_;
    return $self->{group_texture_data};
}

########################################################################
package QuakeMdl::MdlFrame;

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

    $self->{type} = $self->{_io}->read_s4le();
    if ($self->type() != 0) {
        $self->{min} = QuakeMdl::MdlVertex->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->type() != 0) {
        $self->{max} = QuakeMdl::MdlVertex->new($self->{_io}, $self, $self->{_root});
    }
    if ($self->type() != 0) {
        $self->{time} = ();
        my $n_time = $self->type();
        for (my $i = 0; $i < $n_time; $i++) {
            push @{$self->{time}}, $self->{_io}->read_f4le();
        }
    }
    $self->{frames} = ();
    my $n_frames = $self->num_simple_frames();
    for (my $i = 0; $i < $n_frames; $i++) {
        push @{$self->{frames}}, QuakeMdl::MdlSimpleFrame->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_simple_frames {
    my ($self) = @_;
    return $self->{num_simple_frames} if ($self->{num_simple_frames});
    $self->{num_simple_frames} = ($self->type() == 0 ? 1 : $self->type());
    return $self->{num_simple_frames};
}

sub type {
    my ($self) = @_;
    return $self->{type};
}

sub min {
    my ($self) = @_;
    return $self->{min};
}

sub max {
    my ($self) = @_;
    return $self->{max};
}

sub time {
    my ($self) = @_;
    return $self->{time};
}

sub frames {
    my ($self) = @_;
    return $self->{frames};
}

########################################################################
package QuakeMdl::MdlSimpleFrame;

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

    $self->{bbox_min} = QuakeMdl::MdlVertex->new($self->{_io}, $self, $self->{_root});
    $self->{bbox_max} = QuakeMdl::MdlVertex->new($self->{_io}, $self, $self->{_root});
    $self->{name} = Encode::decode("ASCII", IO::KaitaiStruct::Stream::bytes_terminate(IO::KaitaiStruct::Stream::bytes_strip_right($self->{_io}->read_bytes(16), 0), 0, 0));
    $self->{vertices} = ();
    my $n_vertices = $self->_root()->header()->num_verts();
    for (my $i = 0; $i < $n_vertices; $i++) {
        push @{$self->{vertices}}, QuakeMdl::MdlVertex->new($self->{_io}, $self, $self->{_root});
    }
}

sub bbox_min {
    my ($self) = @_;
    return $self->{bbox_min};
}

sub bbox_max {
    my ($self) = @_;
    return $self->{bbox_max};
}

sub name {
    my ($self) = @_;
    return $self->{name};
}

sub vertices {
    my ($self) = @_;
    return $self->{vertices};
}

########################################################################
package QuakeMdl::MdlTriangle;

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

    $self->{faces_front} = $self->{_io}->read_s4le();
    $self->{vertices} = ();
    my $n_vertices = 3;
    for (my $i = 0; $i < $n_vertices; $i++) {
        push @{$self->{vertices}}, $self->{_io}->read_s4le();
    }
}

sub faces_front {
    my ($self) = @_;
    return $self->{faces_front};
}

sub vertices {
    my ($self) = @_;
    return $self->{vertices};
}

########################################################################
package QuakeMdl::Vec3;

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

    $self->{x} = $self->{_io}->read_f4le();
    $self->{y} = $self->{_io}->read_f4le();
    $self->{z} = $self->{_io}->read_f4le();
}

sub x {
    my ($self) = @_;
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z};
}

1;
