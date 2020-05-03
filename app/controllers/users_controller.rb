class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :until_next_level, only: [:show]
  # before_action :set_tag, only: [:register]


    def show
    end

    def learning
      @learning = Registration.where(user_id: current_user.id).order('exp DESC')
    end

    def register
      # 被らないようにする
      @registration = Registration.new(user_id: current_user.id, tag_id: params[:tag_id])
      initial_value
      if @registration.save
      else
        flash.now[:alert] = "失敗です。"
        redirect_to tags_path
      end
    end

  private
  def set_user
    @user = User.find(current_user.id)
  end

  def until_next_level
    @experience_point = ExperiencePoint.find_by(id: @user.level + 1)
    @required_experience = @experience_point.total_required_experience - @user.exp
  end

  # def set_tag
  #   @tags = Tag.all
  # end

  # def registration_params
  #   params.permit(:tag_id).merge(user_id: current_user.id)
  # end

  def initial_value
    @registration[:level] = 1
    @registration[:exp] = 0
  end

end
