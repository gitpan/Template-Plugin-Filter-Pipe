package Template::Plugin::Filter::Pipe;

use strict;
use warnings;
use Text::Pipe;


our $VERSION = '0.01';


use base qw(Template::Plugin::Filter);


sub init {
    my $self = shift;
    $self->{_DYNAMIC} = 1;
    $self->install_filter($self->{_ARGS}[0] || 'pipe');
    $self;
}


sub filter {
    my ($self, $text, $args, $config) = @_;

    die "pipe name?\n" unless defined $args->[0];
    my $pipe = Text::Pipe->new($args->[0], %$config);
    $pipe->filter($text);
}



1;


__END__



=head1 NAME

Template::Plugin::Filter::Pipe - Filter plugin adapter for Text::Pipe

=head1 SYNOPSIS

    [%- USE Filter.Pipe -%]
    [%- 'a test' | pipe("Uppercase") |
        pipe("Repeat", times => 2, join => " = ") |
        pipe("Reverse") -%]
    EOTMPL

=head1 DESCRIPTION

This Template Toolkit filter plugin is an adapter for L<Text::Pipe>. The
default filter name is C<pipe>, but you can override this with the C<USE>
directive.

When using the filter, you need to pass the name of the pipe segment you would
like to create, and optionally named arguments to be passed to the pipe.

See L<Text::Pipe> and its derived distributions for more detail on which pipe
segments are available and which arguments they take.

Template::Plugin::Filter::Pipe inherits from L<Template::Plugin::Filter>.

=head1 METHODS

=over 4



=item init

Overrided method - see L<Template::Plugin::Filter> for details.

=item filter

Overrided method - see L<Template::Plugin::Filter> for details.

=back

=head1 TAGS

If you talk about this module in blogs, on del.icio.us or anywhere else,
please use the C<templatepluginfilterpipe> tag.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<<bug-template-plugin-filter-pipe@rt.cpan.org>>, or through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit <http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see <http://www.perl.com/CPAN/authors/id/M/MA/MARCEL/>.

=head1 AUTHOR

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2007 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.


=cut

