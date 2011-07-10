class SponsorsController < ApplicationController
  
  def index
    @sponsors = Sponsor.order('name asc')
  end
end