# This is a generated file! Please edit source .ksy file and use kaitai-struct-compiler to rebuild

use strict;
use warnings;
use IO::KaitaiStruct 0.009_000;
use Encode;

########################################################################
package Quake2Md2;

our @ISA = 'IO::KaitaiStruct::Struct';

sub from_file {
    my ($class, $filename) = @_;
    my $fd;

    open($fd, '<', $filename) or return undef;
    binmode($fd);
    return new($class, IO::KaitaiStruct::Stream->new($fd));
}

our $GL_PRIMITIVE_TRIANGLE_STRIP = 0;
our $GL_PRIMITIVE_TRIANGLE_FAN = 1;

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

    $self->{magic} = $self->{_io}->read_bytes(4);
    $self->{version} = $self->{_io}->read_u4le();
    $self->{skin_width_px} = $self->{_io}->read_u4le();
    $self->{skin_height_px} = $self->{_io}->read_u4le();
    $self->{bytes_per_frame} = $self->{_io}->read_u4le();
    $self->{num_skins} = $self->{_io}->read_u4le();
    $self->{vertices_per_frame} = $self->{_io}->read_u4le();
    $self->{num_tex_coords} = $self->{_io}->read_u4le();
    $self->{num_triangles} = $self->{_io}->read_u4le();
    $self->{num_gl_cmds} = $self->{_io}->read_u4le();
    $self->{num_frames} = $self->{_io}->read_u4le();
    $self->{ofs_skins} = $self->{_io}->read_u4le();
    $self->{ofs_tex_coords} = $self->{_io}->read_u4le();
    $self->{ofs_triangles} = $self->{_io}->read_u4le();
    $self->{ofs_frames} = $self->{_io}->read_u4le();
    $self->{ofs_gl_cmds} = $self->{_io}->read_u4le();
    $self->{ofs_eof} = $self->{_io}->read_u4le();
}

sub anim_num_frames {
    my ($self) = @_;
    return $self->{anim_num_frames} if ($self->{anim_num_frames});
    $self->{anim_num_frames} = pack('C*', (40, 6, 8, 4, 4, 4, 6, 12, 11, 17, 11, 12, 19, 6, 9, 4, 5, 6, 6, 8));
    return $self->{anim_num_frames};
}

sub anorms_table {
    my ($self) = @_;
    return $self->{anorms_table} if ($self->{anorms_table});
    $self->{anorms_table} = [[-0.525731, 0.000000, 0.850651], [-0.442863, 0.238856, 0.864188], [-0.295242, 0.000000, 0.955423], [-0.309017, 0.500000, 0.809017], [-0.162460, 0.262866, 0.951056], [0.000000, 0.000000, 1.000000], [0.000000, 0.850651, 0.525731], [-0.147621, 0.716567, 0.681718], [0.147621, 0.716567, 0.681718], [0.000000, 0.525731, 0.850651], [0.309017, 0.500000, 0.809017], [0.525731, 0.000000, 0.850651], [0.295242, 0.000000, 0.955423], [0.442863, 0.238856, 0.864188], [0.162460, 0.262866, 0.951056], [-0.681718, 0.147621, 0.716567], [-0.809017, 0.309017, 0.500000], [-0.587785, 0.425325, 0.688191], [-0.850651, 0.525731, 0.000000], [-0.864188, 0.442863, 0.238856], [-0.716567, 0.681718, 0.147621], [-0.688191, 0.587785, 0.425325], [-0.500000, 0.809017, 0.309017], [-0.238856, 0.864188, 0.442863], [-0.425325, 0.688191, 0.587785], [-0.716567, 0.681718, -0.147621], [-0.500000, 0.809017, -0.309017], [-0.525731, 0.850651, 0.000000], [0.000000, 0.850651, -0.525731], [-0.238856, 0.864188, -0.442863], [0.000000, 0.955423, -0.295242], [-0.262866, 0.951056, -0.162460], [0.000000, 1.000000, 0.000000], [0.000000, 0.955423, 0.295242], [-0.262866, 0.951056, 0.162460], [0.238856, 0.864188, 0.442863], [0.262866, 0.951056, 0.162460], [0.500000, 0.809017, 0.309017], [0.238856, 0.864188, -0.442863], [0.262866, 0.951056, -0.162460], [0.500000, 0.809017, -0.309017], [0.850651, 0.525731, 0.000000], [0.716567, 0.681718, 0.147621], [0.716567, 0.681718, -0.147621], [0.525731, 0.850651, 0.000000], [0.425325, 0.688191, 0.587785], [0.864188, 0.442863, 0.238856], [0.688191, 0.587785, 0.425325], [0.809017, 0.309017, 0.500000], [0.681718, 0.147621, 0.716567], [0.587785, 0.425325, 0.688191], [0.955423, 0.295242, 0.000000], [1.000000, 0.000000, 0.000000], [0.951056, 0.162460, 0.262866], [0.850651, -0.525731, 0.000000], [0.955423, -0.295242, 0.000000], [0.864188, -0.442863, 0.238856], [0.951056, -0.162460, 0.262866], [0.809017, -0.309017, 0.500000], [0.681718, -0.147621, 0.716567], [0.850651, 0.000000, 0.525731], [0.864188, 0.442863, -0.238856], [0.809017, 0.309017, -0.500000], [0.951056, 0.162460, -0.262866], [0.525731, 0.000000, -0.850651], [0.681718, 0.147621, -0.716567], [0.681718, -0.147621, -0.716567], [0.850651, 0.000000, -0.525731], [0.809017, -0.309017, -0.500000], [0.864188, -0.442863, -0.238856], [0.951056, -0.162460, -0.262866], [0.147621, 0.716567, -0.681718], [0.309017, 0.500000, -0.809017], [0.425325, 0.688191, -0.587785], [0.442863, 0.238856, -0.864188], [0.587785, 0.425325, -0.688191], [0.688191, 0.587785, -0.425325], [-0.147621, 0.716567, -0.681718], [-0.309017, 0.500000, -0.809017], [0.000000, 0.525731, -0.850651], [-0.525731, 0.000000, -0.850651], [-0.442863, 0.238856, -0.864188], [-0.295242, 0.000000, -0.955423], [-0.162460, 0.262866, -0.951056], [0.000000, 0.000000, -1.000000], [0.295242, 0.000000, -0.955423], [0.162460, 0.262866, -0.951056], [-0.442863, -0.238856, -0.864188], [-0.309017, -0.500000, -0.809017], [-0.162460, -0.262866, -0.951056], [0.000000, -0.850651, -0.525731], [-0.147621, -0.716567, -0.681718], [0.147621, -0.716567, -0.681718], [0.000000, -0.525731, -0.850651], [0.309017, -0.500000, -0.809017], [0.442863, -0.238856, -0.864188], [0.162460, -0.262866, -0.951056], [0.238856, -0.864188, -0.442863], [0.500000, -0.809017, -0.309017], [0.425325, -0.688191, -0.587785], [0.716567, -0.681718, -0.147621], [0.688191, -0.587785, -0.425325], [0.587785, -0.425325, -0.688191], [0.000000, -0.955423, -0.295242], [0.000000, -1.000000, 0.000000], [0.262866, -0.951056, -0.162460], [0.000000, -0.850651, 0.525731], [0.000000, -0.955423, 0.295242], [0.238856, -0.864188, 0.442863], [0.262866, -0.951056, 0.162460], [0.500000, -0.809017, 0.309017], [0.716567, -0.681718, 0.147621], [0.525731, -0.850651, 0.000000], [-0.238856, -0.864188, -0.442863], [-0.500000, -0.809017, -0.309017], [-0.262866, -0.951056, -0.162460], [-0.850651, -0.525731, 0.000000], [-0.716567, -0.681718, -0.147621], [-0.716567, -0.681718, 0.147621], [-0.525731, -0.850651, 0.000000], [-0.500000, -0.809017, 0.309017], [-0.238856, -0.864188, 0.442863], [-0.262866, -0.951056, 0.162460], [-0.864188, -0.442863, 0.238856], [-0.809017, -0.309017, 0.500000], [-0.688191, -0.587785, 0.425325], [-0.681718, -0.147621, 0.716567], [-0.442863, -0.238856, 0.864188], [-0.587785, -0.425325, 0.688191], [-0.309017, -0.500000, 0.809017], [-0.147621, -0.716567, 0.681718], [-0.425325, -0.688191, 0.587785], [-0.162460, -0.262866, 0.951056], [0.442863, -0.238856, 0.864188], [0.162460, -0.262866, 0.951056], [0.309017, -0.500000, 0.809017], [0.147621, -0.716567, 0.681718], [0.000000, -0.525731, 0.850651], [0.425325, -0.688191, 0.587785], [0.587785, -0.425325, 0.688191], [0.688191, -0.587785, 0.425325], [-0.955423, 0.295242, 0.000000], [-0.951056, 0.162460, 0.262866], [-1.000000, 0.000000, 0.000000], [-0.850651, 0.000000, 0.525731], [-0.955423, -0.295242, 0.000000], [-0.951056, -0.162460, 0.262866], [-0.864188, 0.442863, -0.238856], [-0.951056, 0.162460, -0.262866], [-0.809017, 0.309017, -0.500000], [-0.864188, -0.442863, -0.238856], [-0.951056, -0.162460, -0.262866], [-0.809017, -0.309017, -0.500000], [-0.681718, 0.147621, -0.716567], [-0.681718, -0.147621, -0.716567], [-0.850651, 0.000000, -0.525731], [-0.688191, 0.587785, -0.425325], [-0.587785, 0.425325, -0.688191], [-0.425325, 0.688191, -0.587785], [-0.425325, -0.688191, -0.587785], [-0.587785, -0.425325, -0.688191], [-0.688191, -0.587785, -0.425325]];
    return $self->{anorms_table};
}

sub tex_coords {
    my ($self) = @_;
    return $self->{tex_coords} if ($self->{tex_coords});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_tex_coords());
    $self->{tex_coords} = ();
    my $n_tex_coords = $self->num_tex_coords();
    for (my $i = 0; $i < $n_tex_coords; $i++) {
        push @{$self->{tex_coords}}, Quake2Md2::TexPoint->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{tex_coords};
}

sub triangles {
    my ($self) = @_;
    return $self->{triangles} if ($self->{triangles});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_triangles());
    $self->{triangles} = ();
    my $n_triangles = $self->num_triangles();
    for (my $i = 0; $i < $n_triangles; $i++) {
        push @{$self->{triangles}}, Quake2Md2::Triangle->new($self->{_io}, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{triangles};
}

sub frames {
    my ($self) = @_;
    return $self->{frames} if ($self->{frames});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_frames());
    $self->{_raw_frames} = ();
    $self->{frames} = ();
    my $n_frames = $self->num_frames();
    for (my $i = 0; $i < $n_frames; $i++) {
        push @{$self->{_raw_frames}}, $self->{_io}->read_bytes($self->bytes_per_frame());
        my $io__raw_frames = IO::KaitaiStruct::Stream->new($self->{_raw_frames}[$i]);
        push @{$self->{frames}}, Quake2Md2::Frame->new($io__raw_frames, $self, $self->{_root});
    }
    $self->{_io}->seek($_pos);
    return $self->{frames};
}

sub anim_names {
    my ($self) = @_;
    return $self->{anim_names} if ($self->{anim_names});
    $self->{anim_names} = ["stand", "run", "attack", "pain1", "pain2", "pain3", "jump", "flip", "salute", "taunt", "wave", "point", "crstnd", "crwalk", "crattak", "crpain", "crdeath", "death1", "death2", "death3"];
    return $self->{anim_names};
}

sub gl_cmds {
    my ($self) = @_;
    return $self->{gl_cmds} if ($self->{gl_cmds});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_gl_cmds());
    $self->{_raw_gl_cmds} = $self->{_io}->read_bytes((4 * $self->num_gl_cmds()));
    my $io__raw_gl_cmds = IO::KaitaiStruct::Stream->new($self->{_raw_gl_cmds});
    $self->{gl_cmds} = Quake2Md2::GlCmdsList->new($io__raw_gl_cmds, $self, $self->{_root});
    $self->{_io}->seek($_pos);
    return $self->{gl_cmds};
}

sub skins {
    my ($self) = @_;
    return $self->{skins} if ($self->{skins});
    my $_pos = $self->{_io}->pos();
    $self->{_io}->seek($self->ofs_skins());
    $self->{skins} = ();
    my $n_skins = $self->num_skins();
    for (my $i = 0; $i < $n_skins; $i++) {
        push @{$self->{skins}}, Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(64), 0, 0));
    }
    $self->{_io}->seek($_pos);
    return $self->{skins};
}

sub anim_start_indices {
    my ($self) = @_;
    return $self->{anim_start_indices} if ($self->{anim_start_indices});
    $self->{anim_start_indices} = pack('C*', (0, 40, 46, 54, 58, 62, 66, 72, 84, 95, 112, 123, 135, 154, 160, 169, 173, 178, 184, 190));
    return $self->{anim_start_indices};
}

sub magic {
    my ($self) = @_;
    return $self->{magic};
}

sub version {
    my ($self) = @_;
    return $self->{version};
}

sub skin_width_px {
    my ($self) = @_;
    return $self->{skin_width_px};
}

sub skin_height_px {
    my ($self) = @_;
    return $self->{skin_height_px};
}

sub bytes_per_frame {
    my ($self) = @_;
    return $self->{bytes_per_frame};
}

sub num_skins {
    my ($self) = @_;
    return $self->{num_skins};
}

sub vertices_per_frame {
    my ($self) = @_;
    return $self->{vertices_per_frame};
}

sub num_tex_coords {
    my ($self) = @_;
    return $self->{num_tex_coords};
}

sub num_triangles {
    my ($self) = @_;
    return $self->{num_triangles};
}

sub num_gl_cmds {
    my ($self) = @_;
    return $self->{num_gl_cmds};
}

sub num_frames {
    my ($self) = @_;
    return $self->{num_frames};
}

sub ofs_skins {
    my ($self) = @_;
    return $self->{ofs_skins};
}

sub ofs_tex_coords {
    my ($self) = @_;
    return $self->{ofs_tex_coords};
}

sub ofs_triangles {
    my ($self) = @_;
    return $self->{ofs_triangles};
}

sub ofs_frames {
    my ($self) = @_;
    return $self->{ofs_frames};
}

sub ofs_gl_cmds {
    my ($self) = @_;
    return $self->{ofs_gl_cmds};
}

sub ofs_eof {
    my ($self) = @_;
    return $self->{ofs_eof};
}

sub _raw_frames {
    my ($self) = @_;
    return $self->{_raw_frames};
}

sub _raw_gl_cmds {
    my ($self) = @_;
    return $self->{_raw_gl_cmds};
}

########################################################################
package Quake2Md2::Vertex;

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

    $self->{position} = Quake2Md2::CompressedVec->new($self->{_io}, $self, $self->{_root});
    $self->{normal_index} = $self->{_io}->read_u1();
}

sub normal {
    my ($self) = @_;
    return $self->{normal} if ($self->{normal});
    $self->{normal} = @{$self->_root()->anorms_table()}[$self->normal_index()];
    return $self->{normal};
}

sub position {
    my ($self) = @_;
    return $self->{position};
}

sub normal_index {
    my ($self) = @_;
    return $self->{normal_index};
}

########################################################################
package Quake2Md2::CompressedVec;

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

    $self->{x_compressed} = $self->{_io}->read_u1();
    $self->{y_compressed} = $self->{_io}->read_u1();
    $self->{z_compressed} = $self->{_io}->read_u1();
}

sub x {
    my ($self) = @_;
    return $self->{x} if ($self->{x});
    $self->{x} = (($self->x_compressed() * $self->_parent()->_parent()->scale()->x()) + $self->_parent()->_parent()->translate()->x());
    return $self->{x};
}

sub y {
    my ($self) = @_;
    return $self->{y} if ($self->{y});
    $self->{y} = (($self->y_compressed() * $self->_parent()->_parent()->scale()->y()) + $self->_parent()->_parent()->translate()->y());
    return $self->{y};
}

sub z {
    my ($self) = @_;
    return $self->{z} if ($self->{z});
    $self->{z} = (($self->z_compressed() * $self->_parent()->_parent()->scale()->z()) + $self->_parent()->_parent()->translate()->z());
    return $self->{z};
}

sub x_compressed {
    my ($self) = @_;
    return $self->{x_compressed};
}

sub y_compressed {
    my ($self) = @_;
    return $self->{y_compressed};
}

sub z_compressed {
    my ($self) = @_;
    return $self->{z_compressed};
}

########################################################################
package Quake2Md2::Triangle;

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

    $self->{vertex_indices} = ();
    my $n_vertex_indices = 3;
    for (my $i = 0; $i < $n_vertex_indices; $i++) {
        push @{$self->{vertex_indices}}, $self->{_io}->read_u2le();
    }
    $self->{tex_point_indices} = ();
    my $n_tex_point_indices = 3;
    for (my $i = 0; $i < $n_tex_point_indices; $i++) {
        push @{$self->{tex_point_indices}}, $self->{_io}->read_u2le();
    }
}

sub vertex_indices {
    my ($self) = @_;
    return $self->{vertex_indices};
}

sub tex_point_indices {
    my ($self) = @_;
    return $self->{tex_point_indices};
}

########################################################################
package Quake2Md2::Frame;

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

    $self->{scale} = Quake2Md2::Vec3f->new($self->{_io}, $self, $self->{_root});
    $self->{translate} = Quake2Md2::Vec3f->new($self->{_io}, $self, $self->{_root});
    $self->{name} = Encode::decode("ascii", IO::KaitaiStruct::Stream::bytes_terminate($self->{_io}->read_bytes(16), 0, 0));
    $self->{vertices} = ();
    my $n_vertices = $self->_root()->vertices_per_frame();
    for (my $i = 0; $i < $n_vertices; $i++) {
        push @{$self->{vertices}}, Quake2Md2::Vertex->new($self->{_io}, $self, $self->{_root});
    }
}

sub scale {
    my ($self) = @_;
    return $self->{scale};
}

sub translate {
    my ($self) = @_;
    return $self->{translate};
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
package Quake2Md2::GlCmdsList;

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

    if (!($self->_io()->is_eof())) {
        $self->{items} = ();
        do {
            $_ = Quake2Md2::GlCmd->new($self->{_io}, $self, $self->{_root});
            push @{$self->{items}}, $_;
        } until ($_->cmd_num_vertices() == 0);
    }
}

sub items {
    my ($self) = @_;
    return $self->{items};
}

########################################################################
package Quake2Md2::TexPoint;

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

    $self->{s_px} = $self->{_io}->read_u2le();
    $self->{t_px} = $self->{_io}->read_u2le();
}

sub s_normalized {
    my ($self) = @_;
    return $self->{s_normalized} if ($self->{s_normalized});
    $self->{s_normalized} = (($self->s_px() + 0.0) / $self->_root()->skin_width_px());
    return $self->{s_normalized};
}

sub t_normalized {
    my ($self) = @_;
    return $self->{t_normalized} if ($self->{t_normalized});
    $self->{t_normalized} = (($self->t_px() + 0.0) / $self->_root()->skin_height_px());
    return $self->{t_normalized};
}

sub s_px {
    my ($self) = @_;
    return $self->{s_px};
}

sub t_px {
    my ($self) = @_;
    return $self->{t_px};
}

########################################################################
package Quake2Md2::Vec3f;

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

########################################################################
package Quake2Md2::GlVertex;

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

    $self->{tex_coords_normalized} = ();
    my $n_tex_coords_normalized = 2;
    for (my $i = 0; $i < $n_tex_coords_normalized; $i++) {
        push @{$self->{tex_coords_normalized}}, $self->{_io}->read_f4le();
    }
    $self->{vertex_index} = $self->{_io}->read_u4le();
}

sub tex_coords_normalized {
    my ($self) = @_;
    return $self->{tex_coords_normalized};
}

sub vertex_index {
    my ($self) = @_;
    return $self->{vertex_index};
}

########################################################################
package Quake2Md2::GlCmd;

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

    $self->{cmd_num_vertices} = $self->{_io}->read_s4le();
    $self->{vertices} = ();
    my $n_vertices = $self->num_vertices();
    for (my $i = 0; $i < $n_vertices; $i++) {
        push @{$self->{vertices}}, Quake2Md2::GlVertex->new($self->{_io}, $self, $self->{_root});
    }
}

sub num_vertices {
    my ($self) = @_;
    return $self->{num_vertices} if ($self->{num_vertices});
    $self->{num_vertices} = ($self->cmd_num_vertices() < 0 ? -($self->cmd_num_vertices()) : $self->cmd_num_vertices());
    return $self->{num_vertices};
}

sub primitive {
    my ($self) = @_;
    return $self->{primitive} if ($self->{primitive});
    $self->{primitive} = ($self->cmd_num_vertices() < 0 ? $Quake2Md2::GL_PRIMITIVE_TRIANGLE_FAN : $Quake2Md2::GL_PRIMITIVE_TRIANGLE_STRIP);
    return $self->{primitive};
}

sub cmd_num_vertices {
    my ($self) = @_;
    return $self->{cmd_num_vertices};
}

sub vertices {
    my ($self) = @_;
    return $self->{vertices};
}

1;
