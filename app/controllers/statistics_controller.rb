class StatisticsController < ApplicationController

  def index
    @stats = HTTParty.get("http://api.census.gov/data/2015/acs5?get=B05001_002E,B05001_005E,B05001_006E&for=county:*&key=#{ENV["CENSUS_KEY"]}")
    render json: @stats.body  
  end

  def show
    render json: "i see you're looking for data for #{params[:state]}"
  end
end
