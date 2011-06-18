#encoding: utf-8
module HomesHelper
	def body_for_news(body)
		pattern = /(^.*<\/p>)/ #/(^<h3><\/p>)/;\W*\w*\d*\S*\s*\D*		
		pattern =~ body
		data = Regexp.last_match(1)
		
		if data != nil
			return data
		else
			return body
		end		
	end
end
