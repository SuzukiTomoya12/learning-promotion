class ReportsController < ApplicationController

  before_action :authenticate_user!

  def index
  end
  
  def new
    @report = Report.new
  end

  def create
  end


end
