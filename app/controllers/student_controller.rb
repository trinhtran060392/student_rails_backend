class StudentController < ApplicationController

	def show
		respond_to do |format|

      format.html # show.html.erb
      format.json { render json: {:name => "David"}.to_json }
    end
	end

	def index
		@user_info_token = SecureRandom.uuid
		@students = Student.all
     render :json => {:students => @students, :TOKEN => @user_info_token}.to_json
	end

	def create
		@token = request.headers['X-Auth-Token'];
		if @token
			@student = Student.new(student_params)
			@student.save
			render :json => {:TOKEN => @token, :data => @student}.to_json
		else 
			render json: {
        error: "Authorized Failed",
        status: 400
      }, status: 400
		end
	end
  private
    def student_params
      params.require(:student).permit(:name, :age)
    end
end
