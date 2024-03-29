package App::skryf::Plugin::Blog::Model;

our $VERSION = '0.001_03'; # VERSION

use Mojo::Base 'App::skryf::Model::Base';
use Mango::BSON ':bson';
use App::skryf::Util;
use Method::Signatures;
use DateTime;

method posts {
    $self->mgo->db->collection('posts');
}

method all {
    $self->posts->find->sort({created => -1})->all;
}

method this_year ($limit = 5) {
    my $year = DateTime->now->year;
    $self->posts->find({created => qr/$year/})->sort({created => -1})->limit($limit)->all;
}

method by_year ($year = DateTime->now->year, $limit = -1) {
    $self->posts->find({created => qr/$year/})->sort({created => -1})->limit($limit)->all;
}

method get ($slug) {
    $self->posts->find_one({slug => $slug});
}

method create ($topic, $content, $tags, $public = 0, $created = bson_time) {
    my $slug = App::skryf::Util->slugify($topic);
    my $html = App::skryf::Util->convert($content);
    $self->posts->insert(
        {   slug    => $slug,
            topic   => $topic,
            content => $content,
            tags    => $tags,
            public  => $public,
            created => $created,
            html    => $html,
        }
    );
}

method save ($post) {
    $post->{slug} = App::skryf::Util->slugify($post->{topic});
    $post->{html} = App::skryf::Util->convert($post->{content});
    $post->{modified} = bson_time;
    $self->posts->save($post);
}

method remove ($slug) {
    $self->posts->remove({slug => $slug});
}

method by_cat ($category) {
    my $_filtered = [];
    foreach (@{$self->all}) {
        if ((my $found = $_->{tags}) =~ /$category/) {
            push @{$_filtered}, $_;
        }
    }
    return $_filtered;
}

1;
__END__

=head1 NAME

App::skryf::Plugin::Blog:::Model - Skryf Blog Model

=head1 DESCRIPTION

Post model

=head1 METHODS

=head2 B<posts>

Posts collection

=head1 SEE ALSO

L<Mojolicious>, L<Mojolicious::Guides>, L<http://mojolicio.us>. L<Mango>.

=head1 COPYRIGHT AND LICENSE

This plugin is copyright (c) 2013 by Adam Stokes <adamjs@cpan.org>

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
