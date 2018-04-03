class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :download, :view]
     
    def index
        @base_films = Film.base_films
    end
      
    def show
    end

    def download
        if(@film.film_type == 1)
            redirect_to @film.base_film_path
        else
            redirect_to @film.film_path.url
        end
    end

    def view
        # movie = FFMPEG::Movie.new(@film.film_path.path)
        # transcoder_options = { preserve_aspect_ratio: :width, preserve_aspect_ratio: :height }
        # base_path = /^(.*[\\\/])/.match(@film.film_path.path)
        # file_name = @film.film_path.path.split('/')[-1].split('.')[0]
        # transcoded_movie = movie.transcode(base_path[0] + file_name + "_transcoded.mp4", transcoder_options)
        # puts transcoded_movie.inspect
        # @film_path = transcoded_movie.path.split('public')[1]

        # send_file File.join([Rails.root, "public", @film_path]), 
        #       :disposition => :inline, :stream => true
        if(@film.film_type == 1)
            redirect_to @film.base_film_path
        else
            send_file @film.film_path.path, :disposition => :inline, :stream => true
        end
    end

    def new
        @film = Film.new
    end

    def create
        @film = Film.new(film_params)
        #if the admin uploader has not specified the type, then it is set to student and not base
        if @film.film_type.nil?
            @film.film_type = 0
        end
        #Create and save all film tags
        if @film.save!
            for tag_name in @film.tag_names.split
                @film_tag = FilmTag.new
                @tag = Tag.has_name(tag_name).to_a.first
                if @tag.nil?
                    @tag = Tag.new
                    @tag.name = tag_name
                    @tag.save
                end
                @film_tag.film_id = @film.id
                @film_tag.tag_id = @tag.id
                @film_tag.save
            end 
            redirect_to film_path(@film)
        else
            redirect_to films_path
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
