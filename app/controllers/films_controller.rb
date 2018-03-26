class FilmsController < ApplicationController
    before_action :set_film, only: [:show]
     
    def index
        @base_films = Film.base_films.alphabetical
    end
      
    def show
    end
    
    private 
    def set_film
        @film = Film.find(params[:id])
    end
        
end
