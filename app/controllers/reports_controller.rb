class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:new]
  before_action :set_user, only: [:create]
  before_action :find_tag, only: [:create]

  def index
  end
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    time_calculation
    @report.save
    
    # ユーザーのステータスを更新
    get_exp
    get_coin
    level_up

    redirect_to user_path(current_user.id)
  end

  def show
    @report = Report.where(user_id: current_user.id).order('created_at DESC')
  end


  private
  def report_params
    params.require(:report).permit( :content, :image, :total_time_hour, :total_time_minute,
                                    :concentration_time_hour, :concentration_time_minute, :total_time, :concentration_time, :concentration_rate, :tag_id)
                          .merge(user_id: current_user.id)
  end

  def set_tag
    @tags = Tag.all
  end

  def find_tag
    @learning = Registration.find_by(user_id: current_user.id, tag_id: report_params[:tag_id])
  end

  def set_user
    @user = User.find(current_user.id)
  end

  # 合計時間、集中時間、集中の割合を計算
  def time_calculation
    @total_time = @report.total_time_hour + (@report.total_time_minute.to_f / 60)
    @report[:total_time] = @total_time.round(2)
    @concentration_time = @report.concentration_time_hour + (@report.concentration_time_minute.to_f / 60)
    @report[:concentration_time] = @concentration_time.round(2)
    @report[:concentration_rate] = (@concentration_time / @total_time.to_f).round(3)
  end

  # <現在の設定> 1分につき、2ポイントの経験値
  def get_exp
    exp = 120 * @total_time
    tag_exp = @learning.exp + exp
    @learning.update(exp: tag_exp)
    if (@learning.until_next_level - exp) <= 0
      # 次のレベルの必要経験値を当て込む
      prepare_learning_level_up
      until_next_level = @until_learning_next - @learning.exp
      # @learning.update(until_next_level: until_next_level)
    else
      until_next_level = @learning.until_next_level - exp
    end
    @learning.update(until_next_level: until_next_level)

    
    user_exp = @user.exp + exp
    @user.update(exp: user_exp)
  end

  # <現在の設定> 100ポイント × 集中の割合
  def get_coin
    coin = @user.coin + 100 * @report.concentration_rate
    @user.update(coin: coin)
  end

  # 次のレベルに必要なそう獲得経験値を探してくる
  def prepare_user_level_up
    @until_user_next = ExperiencePoint.find_by(id: @user.level + 1)[:total_required_experience]
  end

  def prepare_learning_level_up
    @until_learning_next = ExperiencePoint.find_by(id: @learning.level + 1)[:total_required_experience]
  end

  def update_required_exp
    # 次のレベルの必要経験値を当て込む
  end

  def level_up
    # 学習中タグのレベルアップ
    prepare_learning_level_up
    while @learning.exp > @until_learning_next do
      @learning.update(level: @learning.level + 1)
      prepare_learning_level_up
    end

    # ユーザーのレベルアップ
    prepare_user_level_up
    while @user.exp > @until_user_next do
      @user.update(level: @user.level + 1)
      prepare_user_level_up
    end
  end

end
