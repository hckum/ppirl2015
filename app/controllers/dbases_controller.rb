class DbasesController < ApplicationController
  def index
    @dbases = Dbase.all
  end

  def upload
    begin
      Dbase.upload(params[:file])
      redirect_to root_url, notice: 'Database uploaded.'
    rescue
      redirect_to root_url, notice: 'Invalid CSV file format.'
    end
  end
end
