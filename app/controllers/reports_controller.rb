class ReportsController < ApplicationController

  # GET /reports/new
  def new
    @report = Report.new
  end

  # POST /report
  # POST /report.json
  def create
    @report = Report.new(report)

    plate_number = params[:license_plate_number]

    unless plate_number.empty?
      driver = Driver.where(license_plate_number: plate_number).first
      driver = Driver.create!(license_plate_number: plate_number) unless driver

      @report.driver = driver
    end

    respond_to do |format|
      if @report.save
        format.html { redirect_to driver, notice: 'Way to go - you reported a bad driver. Do you feel better?' }
        format.json { render action: 'show', status: :created, location: @report }
      else
        format.html { render action: 'new' }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report
      params.require(:report).permit(:offense)
    end
end

