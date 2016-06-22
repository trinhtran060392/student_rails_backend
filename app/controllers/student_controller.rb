class StudentController < ApplicationController
	def show
		respond_to do |format|

      format.html # show.html.erb
      format.json { render json: {:name => "David"}.to_json }
    end
	end

	def index
     render :json => {:name => "David"}.to_json
	end
end
