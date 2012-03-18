class TwitterFeedsController < ApplicationController
  
  respond_to :html, :xml, :json
  
  def index
    respond_with TwitterFeed.last.text
  end
end