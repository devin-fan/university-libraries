class TagsController < ApplicationController
    before_action :set_tag, only: [:show]

    def index
        @tags = Tag.alphabetical
    end

    def show
        @tagged_films = @tag.films.alphabetical
    end

    def create
        @tag = Tag.new(tag_params)
        @tag.save
    end
    
    private
    def set_tag
        @tag = Tag.find(params[:id])
    end

    def tag_params
        params.require(:tag).permit(:name)
    end
end

