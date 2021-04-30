class Song < ApplicationRecord
  belongs_to :artist, :dependent => :delete
  belongs_to :genre, :dependent => :delete
  # belongs_to :artist, class_name: "artist", foreign_key: "artist_id"
  # belongs_to :genre, class_name: "genre", foreign_key: "genre_id"
end
