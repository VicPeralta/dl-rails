class StudentsController < ApplicationController
  protect_from_forgery with: :null_session
  def index
    @students = Student.all
    respond_to do |format|
      format.json { render json: @students }
    end
  end

  def show
    student = Student.find(params[:id])
    respond_to do |format|
      format.json { render json: student }
    end
  end

  def create
    student = Student.new
    student.name = params[:name]
    student.id = params[:id]
    if student.valid?
      student.save
      render json: 'ok', status: 201
    else
      render json: student.errors, status: 422
    end
  end
end
