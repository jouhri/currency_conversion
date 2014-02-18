require 'xmlsimple'
namespace :currency do
	desc "update currency rate from ECB"

	task :update_rate => :environment do
		Currency.delete_all
	  	uri = URI('http://www.ecb.europa.eu/stats/eurofxref/eurofxref-daily.xml')
	  	res = XmlSimple.xml_in(Net::HTTP.get(uri), {'KeyAttr' => 'currency'})
		res = res["Cube"][0]["Cube"][0]["Cube"]
		Currency.create({country: "EUR", rate: 1.000})
		res.each do |currency|
			Currency.create({country: currency[0], rate: currency[1]["rate"]})
		end
	end
end