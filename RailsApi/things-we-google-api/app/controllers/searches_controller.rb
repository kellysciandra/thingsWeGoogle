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
end
