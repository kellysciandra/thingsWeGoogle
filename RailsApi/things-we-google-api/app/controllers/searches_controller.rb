class SearchesController < ApplicationController
    def index
        searches = Search.all
        render json: searches, except: [:created_at, :updated_at]
    end 

    def show
        search = Search.find_by(id: params[:id])
        if search 
            render json: searches, except: [:created_at, :updated_at]
        else 
            render json: {message: "Search not found."} 
        end
    end 

    def create
        search = Search.new(search_params)
        # current_user.favorite.build(favorite_params)
        if search.save
            render json: search, except: [:created_at, :updated_at]
        else
            render json: {message: "Search Failed"}
        end
    end

    private

    def search_params 
        params.permit(:content, :link)
    end 
end
