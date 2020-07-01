require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

artist1 = Artist.new({
    'name' => 'The Black Keys'
})

album1 = Album.new({
    'title' => 'El Camino'
    'genre' => 'rock'
    'artist_id' => artist1.id
})

binding.pry
nil