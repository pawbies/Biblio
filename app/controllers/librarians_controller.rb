class LibrariansController < ApplicationController
  before_action :set_librarian, only: %i[ show edit update destroy ]
  before_action :require_librarian!
  layout "admin"

  # GET /librarians or /librarians.json
  def index
    @librarians = Librarian.all.page(params[:page]).per(30)
  end

  # GET /librarians/1 or /librarians/1.json
  def show
  end

  # GET /librarians/new
  def new
    @librarian = Librarian.new
  end

  # GET /librarians/1/edit
  def edit
  end

  # POST /librarians or /librarians.json
  def create
    @librarian = Librarian.new(librarian_params)

    respond_to do |format|
      if @librarian.save
        format.html { redirect_to @librarian, notice: "Bibliothekar wurde erfolgreich gelöscht." }
        format.json { render :show, status: :created, location: @librarian }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @librarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /librarians/1 or /librarians/1.json
  def update
    respond_to do |format|
      if @librarian.update(librarian_params)
        format.html { redirect_to @librarian, notice: "Bibliothekar wurde erfolgreich aktualisiert." }
        format.json { render :show, status: :ok, location: @librarian }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @librarian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /librarians/1 or /librarians/1.json
  def destroy
    @librarian.destroy!

    respond_to do |format|
      format.html { redirect_to librarians_path, status: :see_other, notice: "Bibliothekar wurde erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_librarian
      @librarian = Librarian.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def librarian_params
      params.require(:librarian).permit(:firstname, :lastname, :email, :password, :password_confirmation)
    end
end
