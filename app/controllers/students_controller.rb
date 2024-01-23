class StudentsController < ApplicationController
  before_action :set_student, only: [:edit, :update, :show, :destroy]
  def index
    @students = Student.all
  end

  def show; end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to root_path
    else
      render 'new', flash[:notice] = @student.eroors.full_messages.join('')
    end
  end

  def edit; end

  def update
    if @student.update(student_params)
      redirect_to root_path
    else
      render 'edit', flash[:notice] = @student.errors.full_messages.join('')
    end
  end

  def destroy
    @student.destroy
    redirect_to root_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :enroll_number, :fees_status, :eligiable_for_exam, :marks, :barcode)
  end

  def set_student
    @student = Student.find_by(id: params[:id])
  end
end
