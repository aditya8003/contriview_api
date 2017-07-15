class StatisticsController < ApplicationController

  def index
  end

  def show
    state = AmericanState.include(:populations).where(state_name: params[:state]).first
  end

end
