class VersionsController < ApplicationController
  before_action :set_doc
  before_action :set_version, only: [:show, :edit, :update, :destroy]

  # GET /versions
  # GET /versions.json
  def index
    @versions = @doc.versions
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
  end

  # GET /versions/new
  def new
    @version = @doc.versions.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = @doc.versions.create(version_params)

    uploaded_io = params[:version][:file]
    file_name = @version.file_name(uploaded_io.original_filename)
    file_path = Rails.root.join('public', 'versions', file_name)
    File.open(file_path, 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @version.update path: file_name

      if @version.save
        redirect_to @doc, notice: 'Новая версия была добавлена'
      else
        render :new
      end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to @version, notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    respond_to do |format|
      format.html { redirect_to versions_url, notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_doc
    @doc = Doc.find_by(id: params[:doc_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_version
    @version = Version.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def version_params
    params.require(:version).permit(:doc_id, :path)
  end
end
