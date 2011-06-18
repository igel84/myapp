class QuestionsController < ApplicationController
  layout 'my'
  
  def index
    #@questions = Question.all
		#@questions = Question.paginate :page => params[:page], :order => 'created_at DESC'
		#if @questions == nil
		@questions = Question.all
		@question = Question.new
  end
  
	def add
		if params[:question].present?	
			@question = Question.new(params[:question])
			@text = @question.body	
			if !@text.strip.empty? 
				if Question.all == [] or Question.last.body != @question.body	
					#@text
					@question.body = @text.gsub("<", "&alt").gsub(">", "&alt").gsub("\r\n", "<br />")
					@question.save
				end
			end
		end
		
		@questions = Question.all
		respond_to do |format|
    	format.js {render :layout=>false}
		end
		#format.js { render :layout => false }
		#if params[:body].present?
		#	@questions = Question.all
		#end
	end
		
	def rem
		@question = Question.find(params[:id])
		@question.destroy
		@questions = Question.all
	end
	
	def answer
		@question = Question.find(params[:id])
		Answer.new do |a|
			a.body = params[:answer][:body].gsub("\r\n", "<br />")
			@question.answer = a
			@question.save	
		end			
		@questions = Question.all
	end
end
