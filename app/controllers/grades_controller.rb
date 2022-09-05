class GradesController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    grades = Grade.all.order(:student_id)
    render json: grades, status: 200
  end

  def show
    grade = Grade.find_by(id: params[:id])
    if grade
      render json: grade, status: 200
    else
      render json: '{error:Not found}', status: 422
    end
  end

  # Enroll role
  def create
    grade = Grade.new
    grade.student_id = params[:student_id]
    grade.course_id = params[:course_id]
    if grade.valid?
      grade.save
      render json: grade, status: 201
    else
      render json: grade.errors, status: 422
    end
  end

  def update
    grade = Grade.find_by(id: params[:id])
    if grade
      grade.update!(grade_params)
      render json: grade, status: 200
    else
      render json: '{error:Not found}', status: 422
    end
  end

  def destroy
    grade = Grade.find_by(id: params[:id])
    if grade
      grade.destroy
      render json: '{status:ok}', status: 200
    else
      render json: '{error:Not found}', status: 422
    end
  end

  def by_student
    grades = Grade.joins(:course)
      .select('grades.*, courses.name')
      .where(student_id: params[:student_id])
      .order(:course_id)
    render json: grades, status: 200
  end

  def by_course
    grades = Grade.joins(:student)
      .select('grades.*, students.name')
      .where(course_id: params[:course_id])
      .order(:student_id)
    render json: grades, status: 200
  end

  private

  def grade_params
    params.require(:grade).permit(:id, :q1, :q2, :q3, :q4)
  end
end
