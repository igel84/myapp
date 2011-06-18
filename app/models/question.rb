class Question < ActiveRecord::Base
	has_one :answer
	
	cattr_reader :per_page
  @@per_page = 3
end

class Answer < ActiveRecord::Base
	belongs_to :question
end
