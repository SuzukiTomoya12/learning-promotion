class ReportsController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  
  def new
    @report = Report.new
  end

  def create
    @report = Report.create(report_params)
    # 合計時間、集中時間、集中の割合を計算
    total_time = @report.total_time_hour + (@report.total_time_minute.to_f / 60)
    @report[:total_time] = total_time.round(2)
    concentration_time = @report.concentration_time_hour + (@report.concentration_time_minute.to_f / 60)
    @report[:concentration_time] = concentration_time.round(2)
    @report[:concentration_rate] = (concentration_time / total_time.to_f).round(3)
    @report.save
    redirect_to user_path(current_user.id)
  end

  private
  def report_params
    params.require(:report).permit( :content, :image, :total_time_hour, :total_time_minute,
                                    :concentration_time_hour, :concentration_time_minute, :total_time, :concentration_time, :concentration_rate)
                          .merge(user_id: current_user.id)
  end


end
