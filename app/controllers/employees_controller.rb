class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :show, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.create(employee_params)
    if @employee.save
      flash[:success] = "Ви успішно додали співробітника"
      redirect_to employees_path
    else
      flash[:alert] = "Виникла помилка при створенні нового співробітника"
      render 'new'
    end
  end

  def update
    if @employee.update(employee_params)
      flash[:success] = "Профіль співробітника оновлено"
      redirect_to employees_path
    else
      flash[:alert] = "Виникла помилка при оновленні профілю"
      render :edit
    end
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:last_name, :birthday, :position, hospital_ids: [])
  end
end
