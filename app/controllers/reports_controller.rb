class ReportsController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  
  def new
    @report = Report.new
  end

  def create
    # binding.pry
    Report.create(report_params)
    redirect_to user_path(current_user.id)
  end

  private
  def report_params
    params.require(:report).permit( :tagname, :total_time_hour, :total_time_minute,
                                    :concentration_time_hour, :concentration_time_minute, :content, :image)
                          .merge(user_id: current_user.id)
  end


end
