class BorrowsController < ApplicationController
  before_action :set_borrow, only: %i[ show edit finish update update_finish destroy ]
  before_action :require_librarian!
  layout "admin"

  # GET /borrows or /borrows.json
  def index
    @borrows = Borrow.all.order(:return_date).where(returned: false).page(params[:page]).per(30)
  end

  def archive
    @borrows = Borrow.all.where(returned: true).page(params[:page]).per(30)
  end

  # GET /borrows/1 or /borrows/1.json
  def show
  end

  # GET /borrows/new
  def new
    @borrow = Borrow.new
  end

  # GET /borrows/1/edit
  def edit
  end

  # GET /borrows/1/finish
  def finish
  end

  # POST /borrows or /borrows.json
  def create
    @borrow = Borrow.new(returned: false, librarian: Current.librarian, reviewed: false, **borrow_params)

    respond_to do |format|
      if @borrow.save
        format.html { redirect_to @borrow, notice: "Ausleihe wurde erfolgreich erstellt." }
        format.json { render :show, status: :created, location: @borrow }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /borrows/1 or /borrows/1.json
  def update
    respond_to do |format|
      if @borrow.update(borrow_params)
        format.html { redirect_to @borrow, notice: "Ausleihe wurde erfolgreich aktualisiert." }
        format.json { render :show, status: :ok, location: @borrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  def update_finish
    if @borrow.email.present?
      ReviewsMailer.with(borrow: @borrow).new.deliver_later
    end

    respond_to do |format|
      if @borrow.update(borrow_params)
        format.html { redirect_to borrows_path, notice: "Ausleihe wurde erfolgreich abgeschlosen." }
        format.json { render :show, status: :ok, location: @borrow }
      else
        format.html { render :finish, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1 or /borrows/1.json
  def destroy
    @borrow.destroy!

    respond_to do |format|
      format.html { redirect_to archive_path, status: :see_other, notice: "Ausleihe wurde erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

  private
    def set_borrow
      @borrow = Borrow.find(params[:id])
    end

    def borrow_params
      params.require(:borrow).permit(:borrow_date, :return_date, :actual_return_date, :returned, :librarian_id, :firstname, :lastname, :phone, :email, book_ids: [])
    end
end
