# == Schema Information
#
# Table name: users
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  username   :string           not null
#

class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  
  has_many :artworks,
    foreign_key: :artist_id,
    class_name: :Artwork
  
  has_many :viewed_artworks,
    foreign_key: :viewer_id,
    class_name: :ArtworkShare
    
  has_many :shared_artworks,
    through: :viewed_artworks,
    source: :artwork
    
  has_many :comments,
    foreign_key: :user_id,
    class_name: :Comment
    
end
