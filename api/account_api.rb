require_relative 'base_api'

class AccountApi < BaseApi
  get '/:id/amount' do
    {
      'teste': params[:id]
    }
  end

  post '/:id/transfer' do
    {
      'teste': params[:id]
    }
  end
end
