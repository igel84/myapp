#encoding: utf-8
module ApplicationHelper
	def link_to_home(text)
		link_to(text, :root, alt:"Веб-студия 'Юлиансайт'. Разработка сайтов в Воронеже. Создание сайта в Воронеже. Раскрутка сайта в Воронеже, сайт веб студии")
	end
	
	def current_user
		if !session[:user_id].present?
			@current_user = nil
		else
  		@current_user ||= User.find(session[:user_id])
  	end
	end
	
	def title(page_title)
  	content_for(:title) { page_title }
	end
	
	def last_news
		Article.find(:all, :conditions => ["id!=1 and id!=2 and id!=3"], :order => "created_at DESC", :limit => "2")
	end
	
	protected
		def admin?
			if current_user != nil && current_user
				true
			else
				false
			end
		end

end
