class TagsController < ApplicationController

  def index
    @tags = Tag.order('id ASC').limit(15)
    # @registration = Registration.new(user_id: current_user.id, tag_id: params[:tag_id])
  end

  def show
    @tags = Tag.order('id ASC').limit(5)
    # @tags = Tag.all
  end

  def search
  end
  
  private

end
