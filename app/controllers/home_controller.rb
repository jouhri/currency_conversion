# require 'net/http'
require 'xmlsimple'

class HomeController < ApplicationController
  def index
  	uri = URI('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml')
  	@res = XmlSimple.xml_in(Net::HTTP.get(uri), {'KeyAttr' => 'currency'})
  	@res = @res["Cube"][0]["Cube"][0]["Cube"]
  end

  def convertion
  	p params
  end

end
