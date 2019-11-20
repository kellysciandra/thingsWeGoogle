class FavoriteSearializer
    include FastJsonapi::ObjectSerializer
    belongs_to :user
    belongs_to :search
end 