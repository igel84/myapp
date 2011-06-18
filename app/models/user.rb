class User < ActiveRecord::Base
	validates_presence_of :name
	
	has_attached_file :avatar #, :styles => { :medium => "300x300>", :thumb => "100x100>" }
	has_many :mails
	
	def full_name
  	fname = name + " "
  	#name += "#{middle_initial}. " unless middle_initial.nil?
  	if mails != []
  		fname += mails.first.mail
  	end
  	fname
	end
end

class Mail < ActiveRecord::Base
	validates_presence_of :mail
	
	belongs_to :user
end
