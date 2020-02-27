class TagsController < ApplicationController

  def index
  end

  def new
    @tag = Tag.new
  end

  def create
    Tag.create(tag_params)
  end

  private
  def tag_params
    params.require(:tag).permit(:tagname, :parent_tag_id)
  end

end
