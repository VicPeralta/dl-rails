class CoursesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @user = user_validation
    return unless @user

    course = Course.all.order(:id)
    render json: course, status: 200
  end

  def show
    @user = user_validation
    return unless @user

    course = Course.find_by(id: params[:id])
    if course
      render json: course, status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  def create
    @user = user_validation
    return unless @user

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
    @user = user_validation
    return unless @user

    course = Course.find_by(id: params[:id])
    if course
      course.update!(course_params)
      render json: course, status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  def destroy
    @user = user_validation
    return unless @user

    course = Course.find_by(id: params[:id])
    if course
      course.destroy
      render json: '{status:ok}', status: 200
    else
      render json: { error: 'Not found' }, status: 422
    end
  end

  private

  def user_validation
    user, error, status = UsersHelper::Validator.valid_user_token?(request.headers['Authorization'])
    unless user
      render json: { 'error:': error }, status: status
      return
    end
    user
  end

  def course_params
    params.require(:course).permit(:id, :name)
  end
end
