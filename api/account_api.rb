require_relative 'base_api'
require_relative '../services/account_service'
require_relative '../exception/account_not_found'
require_relative '../exception/destination_account_does_not_exists'
require_relative '../exception/not_enough_money'
require 'sinatra/param'

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
    param :destination_account_id, String, required: true, message: 'Destination account id is required'
    param :amount, String, required: true, message: 'Amount is required'
    status(201)
    @account_service.transfer(
      souce_account_id,
      params[:destination_account_id],
      params[:amount]
    )
  end

  error AccountNotFound do
    status(404)
    {
      'message': 'Account not found'
    }
  end

  error NotEnoughMoney do
    status(422)
    {
      'message': 'Not enough money for the transaction.'
    }
  end

    error DestinationAccountDoesNotExists do
    status(404)
    {
      'message': 'Destination account does not exist'
    }
  end
end
