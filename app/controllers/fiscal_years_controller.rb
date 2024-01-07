class FiscalYearsController < ApplicationController
  def new
    @fiscal_year = FiscalYear.new
  end

  def create
    # createアクションの実装
  end

  # その他のアクション...
end
