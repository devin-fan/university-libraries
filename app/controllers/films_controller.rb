class FilmsController < ApplicationController
    before_action :set_film, only: [:show]
     
    def index
        @base_films = Film.base_films.alphabetical
    end
      
    def show
    end

    def download
        send_file(@film.film_path, type: "application/mov")
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
