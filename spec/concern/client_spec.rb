require 'rails_helper'

RSpec.describe Integration::Owen::Client do
  let(:login) { Rails.application.credentials.dig(:owen_data, :login) }
  let(:password) { Rails.application.credentials.dig(:owen_data, :password) }
  let(:host) { 'https://api.owencloud.ru' }
  
  subject(:client) { described_class.new(login, password, host) }

  describe '#auth' do
   #do
  end
end