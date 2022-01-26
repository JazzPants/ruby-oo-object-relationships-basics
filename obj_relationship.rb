class Song
    attr_accessor :title, :artist

    def initialize(title)
        @title = title
    end

end

class Artist
attr_accessor :name, :genre
def initialize(name,genre)
    @name=name
    @genre=genre
end
end

yesterday = Song.new("Yesterday")
theBeatles = Artist.new("The beatles", "Rock")

#yesterday.artist = "The beatles"
#change string value to object
yesterday.artist = theBeatles

puts yesterday.artist
puts yesterday.artist.genre

#to create a relationsip between two classes
#assign the artist attribute an instance of another class (which contains more info)

#result a more dynamic value of attributes (not just a string)