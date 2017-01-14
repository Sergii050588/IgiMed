class HospitalsController < ApplicationController
  before_action :set_hospital, only: [:show, :destroy, :delete_habtm]

  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.create(hospital_params)
    if @hospital.save
      flash[:success] = "Ви успішно додали лікарню"
      redirect_to hospitals_path
    else
      flash[:alert] = "Виникла помилка при створенні нової лікарні"
      render 'new'
    end
  end

  def update
    if @hospital.update(hospital_params)
      flash[:success] = "Профіль лікарні оновлено"
      redirect_to hospitals_path
    else
      flash[:alert] = "Виникла помилка при оновленні профілю"
      render :edit
    end
  end

  def destroy
    @hospital.destroy
    redirect_to hospitals_path
  end

  def delete_habtm
    @hospital.employees.delete(params[:employee_id])
    redirect_to hospital_path
  end

   def save_to_habtm
    hospital = Hospital.find(params[:id])
    employee = Employee.find(params[:employee_id])
    hospital.employees << employee

    redirect_to hospital_path
    end

  def show
    @employees = Employee.all
    @without_hospitals = Employee.not_connected_to(@hospital)
  end

  private

  def set_hospital
    @hospital = Hospital.find(params[:id])
  end

  def hospital_params
    params.require(:hospital).permit(:number, employee_ids: [])
  end

end
