require_relative('./models/artist.rb')
require_relative('./models/album.rb')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist1.save()

artist2 = Artist.new({
  'name' => 'Taylor Swift'
  })

# artist2.save()
# artist1.delete()
# artist2.delete()
