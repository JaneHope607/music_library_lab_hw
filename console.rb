require('pry-byebug')
require_relative('models/album.rb')
require_relative('models/artist.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
    'name' => 'The Black Keys'
})
artist1.save()

artist2 = Artist.new({
    'name' => 'The Smiths'
})
artist2.save()

artist3 = Artist.new({
    'name' => 'The Libertines'
})
artist3.save()


album1 = Album.new({
    'title' => 'El Camino',
    'genre' => 'rock',
    'artist_id' => artist1.id
})
album1.save()

album2 = Album.new({
    'title' => 'Brothers',
    'genre' => 'rock',
    'artist_id' => artist1.id
})
album2.save()

album3 = Album.new({
    'title' => 'The Queen Is Dead',
    'genre' => 'alternative',
    'artist_id' => artist2.id
})
album3.save()

album4 = Album.new({
    'title' => 'Meat Is Murder',
    'genre' => 'rock',
    'artist_id' => artist2.id
})
album4.save()

album5 = Album.new({
    'title' => 'Hatful Of Hollow',
    'genre' => 'rock',
    'artist_id' => artist2.id
})
album5.save()

album5.delete()


binding.pry
nil