class TagsController < ApplicationController

  def index
  end

  def new
    @tag = Tag.new
  end

  def create
    Tag.create(tag_params)
  end


  def register
  end

  
  private
  def tag_params
    params.require(:tag).permit(:name, :parent_tag_id)
  end

end
