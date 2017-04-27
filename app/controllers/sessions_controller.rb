class SessionsController < ApplicationController

# GET /sessions/new
def new
end

# POST /sessions
def create
    @student = Student.find_by(pennkey: params[:pennkey])
  if params[:pennkey].empty? || params[:password].empty? || @student.nil?
    redirect_to '/login', :flash => { :error => "Password or Account Name incorrect. Is [caps lock] on?" }
  elsif @student.password == params[:password]
    session[:student_id] = @student.id
    redirect_to "/students/#{@student.id}"
  else redirect_to '/login', :flash => { :error => "Username or password invalid." }
  end
end

# DELETE /sessions/1
def destroy
  reset_session
  redirect_to '/'
end

end
