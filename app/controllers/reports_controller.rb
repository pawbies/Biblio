class ReportsController < ApplicationController
  before_action :set_report, only: %i[ show destroy ]
  before_action :require_librarian!, except: %i[ new ]
  layout "admin", except: %i[ new ]

  # GET /reports or /reports.json
  def index
    @reports = Report.all.page(params[:page]).per(30)
  end

  # GET /reports/1 or /reports/1.json
  def show
  end

  # GET /reports/new
  def new
    @report = Report.new
    @review = Review.find(params[:review_id])
  end

  # POST /reports or /reports.json
  def create
    @report = Report.new(report_params)
    @review = Review.find(report_params[:review_id])

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report.review.book, notice: "Report wurde erfolgreich erstellt." }
        format.json { render json: @report.review.book, status: :created, location: @report.review.book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1 or /reports/1.json
  def destroy
    @report.destroy!

    respond_to do |format|
      format.html { redirect_to reports_path, status: :see_other, notice: "Report wurde erfolgreich gelöscht." }
      format.json { head :no_content }
    end
  end

  private
    def set_report
      @report = Report.find(params[:id])
    end

    def report_params
      params.require(:report).permit(:message, :review_id)
    end
end
