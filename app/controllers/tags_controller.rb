class TagsController < ApplicationController

  def index
    @tags = Tag.order('id ASC').limit(15)
  end

  def show
    @tags = Tag.order('id ASC').limit(5)
    # @tags = Tag.all
  end

  def search
  end
  
  private

end
