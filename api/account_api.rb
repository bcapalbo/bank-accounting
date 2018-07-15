require_relative 'base_api'
require_relative '../services/account_service'

class AccountApi < BaseApi
  before do
    @account_service = AccountService.new
  end

  get '/:id/balance' do |id|
    {
      'balance': @account_service.get_balance(id)
    }
  end

  post '/:souce_account_id/transfer' do |souce_account_id|
    status(201) unless @account_service.transfer(
      souce_account_id,
      params[:destination_account_id],
      params[:amount]
    )
  end
end
