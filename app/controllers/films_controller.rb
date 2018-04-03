class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :download]
     
    def index
        @base_films = Film.base_films
    end
      
    def show
        movie = FFMPEG::Movie.new(@film.film_path.path)
        transcoder_options = { preserve_aspect_ratio: :width, preserve_aspect_ratio: :height }
        base_path = /^(.*[\\\/])/.match(@film.film_path.path)
        @transcoded_movie = movie.transcode(base_path + , transcoder_options)
        puts @transcoded_movie
    end

    def download
        redirect_to @film.film_path.url
    end

    def new
        @film = Film.new
    end

    def create
        @film = Film.new(film_params)
        #if the admin uploader has not specified the type, then it is set to student and not base
        if @film.film_type.nil?
            @film.film_type = 1
        end
        #Create and save all film tags here
        
        if @film.save!
            redirect_to film_path(@film)
        else
            redirect_to new_film_path
        end
    end

    def edit
    end
    
    private 
    def set_film
        @film = Film.find(params[:id])
    end

    def film_params
        params.require(:film).permit(:title, :tag_names, :essay_path, :film_type, :director, :film_path, :permission, :description)
    end
        
end
