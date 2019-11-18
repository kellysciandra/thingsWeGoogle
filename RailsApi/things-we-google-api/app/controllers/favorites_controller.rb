class FavoritesController < ApplicationController
    def new
        favorite = Favorite.new
    end

    def create
        favorite = Favorite.new(favorite_params)
        # current_user.favorite.build(favorite_params)
        if favorite.save
            render json: favorite, except: [:created_at, :updated_at]
        else
            render json: {message: "Favorite Failed"}
        end
    end

    def index
        user_id = params[:user_id]
        @user = User.find(user_id)
        favorites = @user.favorites
        render json: favorites, include: [:search]
        # rendering related object data in JSON by nesting models
        # result:
          #       {
          # "id": 2,
          # "user_id": 1,
          # "gift": {
          #   "id": 4,
          #   "title": "Airpods",
          #   "category": "tech",
          #   "created_at": "2019-05-14T11:20:37.177Z",
          #   "updated_at": "2019-05-14T11:20:37.177Z"
          # }
    end

    def destroy
        fav_id = params[:id]
        favorite = Favorite.find(fav_id)
        favorite.destroy
    end


private
    def favorite_params
      params.permit(:user_id, :search_id)
    end
end
