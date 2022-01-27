# class Song
#     attr_accessor :title, :artist

#     def initialize(title)
#         @title = title
#     end

# end

# class Artist
#     attr_accessor :name, :genre
#     def initialize(name,genre)
#         @name=name
#         @genre=genre

#         @songs = []
#     end

#     def songs
#         @songs
#     end

#     def add_song(song)
#         @songs << song
#         song.artist = self
#     end
# end

#user can still make changes to artist be using song.artist = ... instead of using add_song
# -> two sources of truth in two classes

#FIX for above problem put both sources of truth in one class
class Song
        attr_accessor :artist, :name

        @@all=[]
    
        def initialize(name,genre)
            @name = name


            @all << self
        end

        def self.all
            @@all
        end

        #instead of using .artist.name, we can call this method (cleaner code)
        def artist_name
            self.artist.name
        end
    
    end
    
    class Artist
        attr_accessor :name, :genre
        def initialize(name,genre)
            @name=name
            @genre=genre
        end

        def add_song(song)
            song.artist = self
        end
#collaborating between two classes
#artist class is collaborating with song class by using a method from the song class!
        def songs 
            Song.all.select {|song| song.artist == self}
        end

        def add_song_by_name(name)
            song = Song.new(name)
            song.artist = self
          end
    end
    


yesterday = Song.new("Yesterday", "Rock")
letItBe = Song.new("Let It Be", "Rock")
theBeatles = Artist.new("The beatles", "Rock")


#can now use both these methods to add songs to the songs array
theBeatles.add_song(yesterday)
theBeatles.add_song(letItBe)
#yesterday.artist = "The beatles"
#change string value to object
letItBe.artist = theBeatles
yesterday.artist = theBeatles

theBeatles.add_song_by_name("Yellow Submarine")

#puts theBeatles.songs[0].title

puts theBeatles.songs.inspect

puts yesterday.artist
puts yesterday.artist.genre

#to create a relationsip between two classes
#assign the artist attribute an instance of another class (which contains more info)

#result a more dynamic value of attributes (not just a string)