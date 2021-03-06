class DisciplinesController < ApplicationController
  before_action :authenticate_user!#, only: [:new, :create, :edit, :update, :destroy, :my]
  before_action :set_discipline, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :create, :edit, :update, :destroy, :my]
  before_action :check_permissions, only: [:update, :destroy]

  # GET /disciplines
  # GET /disciplines.json
  def index
    @disciplines = if current_user.try(:admin?)
      Discipline.all
    else
      Discipline.for_front
    end
  end

  def my
    @disciplines = current_user.disciplines
  end

  # GET /disciplines/1
  # GET /disciplines/1.json
  def show
  end

  # GET /disciplines/new
  def new
    @discipline = Discipline.new
  end

  # GET /disciplines/1/edit
  def edit
  end

  # POST /disciplines
  # POST /disciplines.json
  def create
    @discipline = Discipline.new(discipline_params.merge(user: current_user))

    respond_to do |format|
      if @discipline.save
        format.html { redirect_to @discipline, notice: 'Дисциплина была успешно создана' }
        format.json { render :show, status: :created, location: @discipline }
      else
        format.html { render :new }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /disciplines/1
  # PATCH/PUT /disciplines/1.json
  def update
    respond_to do |format|
      if @discipline.update(discipline_params)
        format.html { redirect_to @discipline, notice: 'Дисциплина была успешно обновлена.' }
        format.json { render :show, status: :ok, location: @discipline }
      else
        format.html { render :edit }
        format.json { render json: @discipline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /disciplines/1
  # DELETE /disciplines/1.json
  def destroy
    @discipline.destroy
    respond_to do |format|
      format.html { redirect_to disciplines_url, notice: 'Дисциплина была успешно удалена.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_discipline
    @discipline = Discipline.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def discipline_params
    params.require(:discipline).permit(:name, :description, :published)
  end

  def check_user
    unless current_user.can_upload_doc?
      flash[:error] = 'У вас не достаточно прав'
      redirect_to disciplines_path
    end
  end

  def check_permissions
    unless current_user.can_manage_discipline?(@discipline)
      flash[:error] = 'Отсутствуют права доступа'
      redirect_to disciplines_path
    end
  end
end
