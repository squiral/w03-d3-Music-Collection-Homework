require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist1.save()

album1 = Album.new({
  'artist_id' => artist1.id,
  'title' => 'Blackstar',
  'genre' => 'Experimental Rock'
  })

album1.save()


p album1.artist()

# artist2.save()
# artist1.delete()
# artist2.delete()
