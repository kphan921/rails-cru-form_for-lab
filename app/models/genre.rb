class Genre < ApplicationRecord
    # has_many :songs, :dependent => :delete_all
    # has_many :artists, through: :songs
    has_many :songs, class_name: "song", foreign_key: "reference_id", dependent: :destroy
    has_many :artists, through: :songs, source: :songs_table_foreign_key_to_artists_table
end
