class StatisticsController < ApplicationController

  def index
    states = AmericanState.includes(:populations).all
    @states = states.map { |state| 
      {
        state: state.state_name,
        total_population: state.populations.map { |p| p.total_pop }.sum, 
        immigrant_population: state.populations.map {|p| p.naturalized_citizens + p.non_citizens }.sum 
      }
    }
    render json: @states
  end

  def show
  end

end
