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
    'genre' => 'Rock',
    'artist_id' => artist1.id
})
album1.save()

album2 = Album.new({
    'title' => 'Brothers',
    'genre' => 'Rock',
    'artist_id' => artist1.id
})
album2.save()

album3 = Album.new({
    'title' => 'The Queen Is Dead',
    'genre' => 'Indie',
    'artist_id' => artist2.id
})
album3.save()

album4 = Album.new({
    'title' => 'Meat Is Murder',
    'genre' => 'Indie',
    'artist_id' => artist2.id
})
album4.save()

album5 = Album.new({
    'title' => 'Hatful Of Hollow',
    'genre' => 'Indie',
    'artist_id' => artist2.id
})
album5.save()

album5.delete()

album3.genre = 'Alternative rock'
album3.update()
album4.genre = 'Alternative rock'
album4.update()

all_the_albums = Album.all()
all_the_artists = Artist.all()

search_album = Album.find_by_id(album2.id)
search_artist = Artist.find_by_id(artist3.id)

artist2.list_all_albums_by_artist()

# search_album_not_found = Album.find_by_id(album8.id)
# search_artist_not_found = Artist.find_by_id(artist5.id)

binding.pry
nil