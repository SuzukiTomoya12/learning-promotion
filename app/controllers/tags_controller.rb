class TagsController < ApplicationController

  def index
  end

  def register
    @tags = Tag.all
  end

  def search
  end
  
  private

end
