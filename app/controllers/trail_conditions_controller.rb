class TrailConditionsController < ApplicationController

  
  def show
    @trail_condition = TrailCondition.first
  end
end