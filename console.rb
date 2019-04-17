require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Electric Light Orchestra'
  })

artist2.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Blackstar',
  'genre' => 'Experimental Rock'
  })

album1.save()

album2 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Diamond Dogs',
  'genre' => 'Glam Rock'
  })

album2.save()


album1.artist()

artist1.albums()

Artist.all()
Album.all()

album2.artist.albums


Artist.find(artist1.id)

p Album.find(album2.id)


# artist1.delete()

# artist2.delete()
