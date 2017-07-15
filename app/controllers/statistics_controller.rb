class StatisticsController < ApplicationController

  def index
    render json: "hello"
  end

  def show
    render json: "i see you're looking for data for #{params[:state]}"
  end
end
