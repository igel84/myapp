#encoding: utf-8
class Cms::ArticlesController < ApplicationController
  layout 'admin'
  
  before_filter :have_access
  
  protected
  	def have_access
			if current_user == nil
				redirect_to enter_path
			end
  	end
  	  	
  def index
  	@articles = Article.all
  	@article = Article.new
  end
  
  def show
  	@id = params[:num_article]
  	@article = Article.find(@id)
  	respond_to do |format|
    	format.js {render :layout=>false}
    end    
  end
  
  def update
  	@id = params[:article][:id]
  	@article = Article.find(@id) 		
 		if !@article.update_attributes(params[:article])
			@message = "Ошибка при сохранении"
		else
			@message = "Запись успешно сохранена"
		end
		
		respond_to do |format|
    	format.js {render :layout=>false}
    end   
  end
  
  def rem
  	@id = params[:article][:id]
  	@article = Article.find(@id)
  	if !@article.destroy
			@message = "Ошибка при удалении"
		else
			@message = "Запись успешно удалена"
		end
  	respond_to do |format|
    	format.js {render :layout=>false}
    end    
  end
  
  def new
  	@article = Article.new
  	respond_to do |format|
    	format.js {render :layout=>false}
    end   
  end
  
  def add
  	@last = Article.last.id
  	@article = Article.new(params[:article])
 		
 		if !@article.save
			@message = "Ошибка при сохранении"
		else
			@message = "Запись успешно сохранена"
		end
				
		respond_to do |format|
    	format.js {render :layout=>false}
    end    
  end
  
end
