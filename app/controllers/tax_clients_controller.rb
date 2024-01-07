class TaxClientsController < ApplicationController
  before_action :authenticate_user!
  before_action :validate_office_id, only: [:show, :edit, :update, :destroy]

  def index
    @tax_clients = TaxClient.where(office_id: current_user.office_id)
  end

  def show
    @tax_client = TaxClient.find_by(id: params[:id], office_id: current_user.office_id)
    @fiscal_years = @tax_client.fiscal_years if @tax_client
  end

  def new
    @tax_client = TaxClient.new
    @tax_client.fiscal_years.build # 新しいFiscalYearインスタンスをビルド
  end

  def create
    @tax_client = TaxClient.new(tax_client_params)
    @tax_client.office_id = current_user.office_id

    if @tax_client.save
      redirect_to tax_clients_path(office_id: current_user.office_id), notice: 'Tax client and its fiscal year were successfully created.'
    else
      render :new
    end
  end

  private

  def tax_client_params
    params.require(:tax_client).permit(:name, :web_app_id, fiscal_years_attributes: [:period_number, :start_date, :end_date])
  end

  def validate_office_id
    unless params[:office_id] == current_user.office_id.to_s
      redirect_to root_path, alert: "Access denied."
    end
  end
end
