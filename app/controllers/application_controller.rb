class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
#set :views, File.expand_path('../../views', __FILE__)

helper_method def logged_in?
session[:student_id]
end

helper_method def current_student
@current_student ||= Student.find(session[:student_id]) if logged_in?
end
end