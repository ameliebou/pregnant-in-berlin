class FavoriteKindergarten < ApplicationRecord
  belongs_to :kindergarten
  belongs_to :user
end
