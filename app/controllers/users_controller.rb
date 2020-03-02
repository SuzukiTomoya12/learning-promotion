class UsersController < ApplicationController

  def new
  end

  def create
  end
  
  def edit
  end

#   def update
#   end

    def show
      @user = User.find(params[:id])
      # @report = @user.reports
    end

#   private
#   def user_params
#   end

end
