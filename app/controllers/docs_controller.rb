class DocsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :my]
  before_action :set_doc, only: [:show, :edit, :update, :destroy]
  before_action :check_user, only: [:new, :create, :edit, :update, :destroy, :my]
  before_action :check_permissions, only: [:update, :destroy]

  # GET /docs
  # GET /docs.json
  def index
    @docs = Doc.all
  end

  def my
    @docs = current_user.docs
  end

  # GET /docs/1
  # GET /docs/1.json
  def show
  end

  # GET /docs/new
  def new
    @doc = Doc.new
    @doc.versions.build
  end

  # GET /docs/1/edit
  def edit
  end

  # POST /docs
  # POST /docs.json
  def create
    uploaded_io = params[:doc][:versions_attributes]["0"][:file]
    file_name = "#{SecureRandom.hex(5)}_#{uploaded_io.original_filename}"
    file_path = Rails.root.join('public', 'versions', file_name)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    params[:doc][:versions_attributes]["0"].delete(:file)
    params[:doc][:versions_attributes]["0"][:path] = file_name

    @doc = current_user.docs.new(doc_params)

    respond_to do |format|
      if @doc.save
        format.html { redirect_to @doc, notice: 'Материал был успешно загружен' }
        format.json { render :show, status: :created, location: @doc }
      else
        format.html { render :new }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /docs/1
  # PATCH/PUT /docs/1.json
  def update
    respond_to do |format|
      if @doc.update(doc_params)
        format.html { redirect_to @doc, notice: 'Материал был успешно обновлён' }
        format.json { render :show, status: :ok, location: @doc }
      else
        format.html { render :edit }
        format.json { render json: @doc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /docs/1
  # DELETE /docs/1.json
  def destroy
    @doc.destroy
    respond_to do |format|
      format.html { redirect_to docs_url, notice: 'Материал был успешно удалён' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_doc
    @doc = Doc.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def doc_params
    params.require(:doc).permit(:name, versions_attributes: [:path])
  end

  def check_user
    unless current_user.can_upload_doc?
      flash[:error] = 'У вас нет прав на выгрузку'
      redirect_to docs_url
    end
  end

  def check_permissions
    unless current_user.can_manage_doc?(@doc)
      flash[:error] = 'Отсутствуют права доступа'
      redirect_to docs_url
    end
  end
end
