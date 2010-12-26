#!/usr/bin/env perl

use Mojolicious::Lite;
use File::Slurp;

get '/' => 'index';

post '/store-image' => sub {
    my $self = shift;
    if ( my $jpeg = $self->req->content->asset->{content} ) {
        my $filename = 'pic/' . time . '.jpg';
        write_file( 'public/' . $filename => $jpeg ) ;
        $self->render( text => "http://localhost:3000/$filename");
    }
};

app->start;
