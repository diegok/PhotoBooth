#!/usr/bin/env perl

use Mojolicious::Lite;

get '/' => 'index';

post '/store-image' => sub {
    my $self = shift;
    if ( my $jpeg = $self->req->content->asset->{content} ) {
        my $filename = 'pic/' . time . '.jpg';
        my $asset = Mojo::Asset::File->new( path => 'public/' . $filename );
        $asset->add_chunk( $jpeg );
        $self->render( text => "http://localhost:3000/$filename");
    }
};

app->start;
