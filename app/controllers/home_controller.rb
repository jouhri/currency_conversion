# require 'net/http'

class HomeController < ApplicationController
  def index
  	@res = Currency.all
  end

  def convertion
  	currency_in =  Currency.find_by_country(params[:currency_in])
  	currency_out = Currency.find_by_country(params[:currency_out])
  	@output = ((currency_out.rate * params[:amount].to_i ) / currency_in.rate).round(3)
    @res = Currency.all
    render "home/index"
  end

end
