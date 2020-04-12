class ReportsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tag, only: [:new]
  before_action :set_user, only: [:create]
  # before_action :prepare_level_up, only: [:level_up]

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


  private
  def report_params
    params.require(:report).permit( :content, :image, :total_time_hour, :total_time_minute,
                                    :concentration_time_hour, :concentration_time_minute, :total_time, :concentration_time, :concentration_rate, :tag_id)
                          .merge(user_id: current_user.id)
  end

  def set_tag
    @tags = Tag.all
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
    exp = @user.exp + 120 * @total_time
    @user.update(exp: exp)
  end

  # <現在の設定> 100ポイント × 集中の割合
  def get_coin
    coin = @user.coin + 100 * @report.concentration_rate
    @user.update(coin: coin)
  end

  def prepare_level_up
    @total_exp_of_next_level = ExperiencePoint.find_by(id: @user.level + 1)[:total_required_experience]
  end

  def level_up
    prepare_level_up
    while @user.exp > @total_exp_of_next_level do
      @user.update(level: @user.level + 1)
      prepare_level_up
    end
  end

end
