class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :download]
     
    def index
        @base_films = Film.base_films
        puts @base_films
    end
      
    def show
    end

    def download
        redirect_to @film.film_path
    end

    def new
    end

    def create
    end
    
    private 
    def set_film
        @film = Film.find(params[:id])
    end

    def film_params
        params.require(:film).permit(:title, :tags, :essay_path, :type, :director, :film_path, :permission, :description)
    end
        
end
