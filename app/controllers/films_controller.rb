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
        @film = Film.new
    end

    def create
        @film = Film.new(film_params)
        #if the admin uploader has not specified the type, then it is set to student and not base
        if film.type.nil? 
            @film.type = 'student'
        end
        #Create and save all film tags
        if @film.save 
            redirect_to film_path(@film)
        else
            render action 'new'
        end
    end

    def edit
    end
    
    private 
    def set_film
        @film = Film.find(params[:id])
    end

    def film_params
        params.require(:film).permit(:title, :tags, :essay_path, :type, :director, :film_path, :permission, :description)
    end
        
end
