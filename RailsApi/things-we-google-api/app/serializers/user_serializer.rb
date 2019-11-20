class UserSerializer
    include FastJsonapi::ObjectSerializer
    attributes  :name, :email, :password_digest
    has_many :favorites
    has_many :searches, through: :favorites
end 