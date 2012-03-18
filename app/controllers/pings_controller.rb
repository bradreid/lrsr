class PingsController < ApplicationController
  
  def index
    render :text => 'ping'
  end
end