#!/usr/bin/env perl

use Mojolicious::Lite;

get '/' => 'index';

post '/store-image' => sub {
    my $self = shift;
    if ( my $jpeg = $self->req->content->asset->{content} ) {
        my $filename = 'pic/' . time . '.jpg';
        my $asset = Mojo::Asset::File->new( path => 'public/' . $filename );
        $asset->add_chunk( $jpeg )->cleanup( 0 );
        $self->render( text => $self->req->url->path( $filename ) );
    }
};

app->start;
