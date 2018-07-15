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

  post '/:id/transfer' do |id|
    {
      'teste': params[:id]
    }
  end
end
