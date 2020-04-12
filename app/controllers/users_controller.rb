class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :until_next_level, only: [:show]

    def show
    end


  private
  def set_user
    @user = User.find(current_user.id)
  end

  def until_next_level
    @experience_point = ExperiencePoint.find_by(id: @user.level + 1)
    @required_experience = @experience_point.total_required_experience - @user.exp
  end

end
