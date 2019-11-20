class FavoritesController < ApplicationController
    def new
        favorite = Favorite.new
    end

    def create
        favorite = Favorite.new(favorite_params)
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
