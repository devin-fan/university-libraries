class FilmsController < ApplicationController
    before_action :set_film, only: [:show, :download, :view, :edit, :update, :destroy]
    # skip_before_action :set_film, only: [:search]
    layout 'application'


    def index
        @base_films = Film.base_films.alphabetical
    end
      
    def show
    end

    def download
        if(@film.film_type == 1)
            redirect_to @film.base_film_path.url
        else
            redirect_to @film.film_path.url
        end
    end

    def view
        if(@film.film_type == 1)
            redirect_to @film.base_film_path.url
        else
            send_file @film.film_path.path, :disposition => :inline, :stream => true
        end
    end

    def new
        @film = Film.new
    end

    def admin_form
        @film = Film.new
        render 'admin_form'
    end

    def create
        @film = Film.new(film_params)
        #if the admin uploader has not specified the type, then it is set to student and not base
        if @film.film_type.nil?
            @film.film_type = 0
        end
        #Create and save all film tags
        if logged_in?
            @film.user_id = current_user.id
        end
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


    def search
        search_query = params[:q]
        @matched_by_title = Film.find_by_fuzzy_title(search_query)
        @matched_by_director = Film.find_by_fuzzy_director(search_query)
        @matched_by_tag = Tag.find_by_fuzzy_name(search_query)
    end
    
    def update
      if @film.update(film_params)
        redirect_to film_path(@film), notice: "Successfully updated #{@film.title}."
      else
        render action: 'edit'
      end   
    end 

    def destroy
        @film.remove_film_path!
        @film.save
        @film.destroy 
        redirect_to films_path, notice: "Successfully removed #{@film.title} from the system."   
    end

    private
    def remove_base_film (film)
    end

    def remove_film_and_essay
    end

    def set_film
        @film = Film.find(params[:id])
    end

    def film_params
        params.require(:film).permit(:title, :tag_names, :essay_path, :film_type, :director, :film_path, :base_film_path, :permission, :description)
    end
        
end
