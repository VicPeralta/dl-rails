class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @user = user_validation
    return unless @user

    students = Student.all.order(:id)
    render json: students, status: 200
  end

  def show
    @user = user_validation
    return unless @user

    student = Student.find_by(id: params[:id])
    if student
      render json: student, code: 200
    else
      render json: '{error:Not found}', status: 422
    end
  end

  def create
    @user = user_validation
    return unless @user

    student = Student.new
    student.name = params[:name]
    student.id = params[:id]
    if student.valid?
      student.save
      render json: student, status: 201
    else
      render json: student.errors, status: 422
    end
  end

  def update
    @user = user_validation
    return unless @user

    student = Student.find_by(id: params[:id])
    if student
      student.update!(student_params)
      render json: student, code: 200
    else
      render json: '{error:Not found}', status: 422
    end
  end

  def destroy
    @user = user_validation
    return unless @user

    student = Student.find_by(id: params[:id])
    if student
      student.destroy
      render json: { status: 'ok' }, code: 200
    else
      render json: '{error:Not found}', status: 422
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

  def student_params
    params.require(:student).permit(:id, :name)
  end
end
