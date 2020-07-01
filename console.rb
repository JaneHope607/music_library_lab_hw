require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

artist1 = Artist.new({
    'name' => 'The Black Keys'
})
artist1.save()

album1 = Album.new({
    'title' => 'El Camino',
    'genre' => 'rock',
    'artist_id' => artist1.id
})
album1.save()

binding.pry
nil