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
    state = AmericanState.includes(:populations).where(state_name: params[:state].titleize)
    @state = state.map { |state|
      {
        state: state.state_name,
        counties: state.populations.map { |p| p.county.county_name }.sort
      }
    }
    render json: @state
  end

  def show_county
    state = AmericanState.where(state_name: params[:state].titleize).first
    county = County.where("county_name = ? AND american_state_id = ?", params[:county_name], state.id).first
    puts county.county_name
    byebug
    pop = Population.where("county_id = ? AND american_state_id = ?", county.id, state.id)
    render json: pop
  end

end
