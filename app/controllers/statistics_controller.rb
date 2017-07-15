class StatisticsController < ApplicationController

  def index
    # asdflkasdlfasd
    # stats = $redis.get("stats")
    # if stats.nil?
    #   stats = HTTParty.get("http://api.census.gov/data/2015/acs5?get=B05001_002E,B05001_005E,B05001_006E&for=county:*&key=#{ENV["CENSUS_KEY"]}")
    #   $redis.set("stats", stats.body)
    #   $redis.expire("stats", 300.seconds.to_i)
    #   @stats = stats.body
    # else
    #   @stats = stats
    # end
    # render json: @stats
  end

  def show
    render json: "i see you're looking for data for #{params[:state]}"
  end

end
