require_relative('./models/artist.rb')
require_relative('./models/album.rb')

artist1 = Artist.new({
  'name' => 'David Bowie'
  })

artist1.save()
