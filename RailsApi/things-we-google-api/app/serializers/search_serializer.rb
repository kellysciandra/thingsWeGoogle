class SearchSerializer 
    include FastJsonapi::ObjectSerializer
    attributes :content, :link
    has_many :favorites
    has_many :users, through: :favorites 
end 