class CoursesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    course = Course.all
    respond_to do |format|
      format.json { render json: course }
    end
  end

  def show
    course = Course.find(params[:id])
    respond_to do |format|
      format.json { render json: course }
    end
  end

  def create
    course = Course.new
    course.name = params[:name]
    course.id = params[:id]
    if course.valid?
      course.save
      render json: 'ok', status: 201
    else
      render json: course.errors, status: 422
    end
  end
end
