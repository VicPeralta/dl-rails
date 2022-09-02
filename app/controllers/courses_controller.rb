class CoursesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    course = Course.all
    render json: course
  end

  def show
    course = Course.find_by(id: params[:id])
    if course
      render json: course, status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  def create
    course = Course.new
    course.name = params[:name]
    course.id = params[:id]
    if course.valid?
      course.save
      render json: course, status: 201
    else
      render json: course.errors, status: 422
    end
  end

  def update
    course = Course.find_by(id: params[:id])
    if course
      course.update!(course_params)
      render json: course, status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  def destroy
    course = Course.find_by(id: params[:id])
    if course
      course.destroy
      render json: '{status:ok}', status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  private

  def course_params
    params.require(:course).permit(:id, :name)
  end
end
