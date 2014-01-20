class LoansController < ApplicationController

  def create

    @loan = Loan.new(loan_params)
    logger.debug @loan
    respond_to do |format|
      if @loan.save
        format.json { render action: 'show', status: :created}
      else
        format.json { render json: @loan.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def loan_params

    params.permit(:user_id, :item_id, :item_type_id)
  end
end