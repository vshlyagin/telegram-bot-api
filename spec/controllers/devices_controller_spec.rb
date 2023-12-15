require "rails_helper"
RSpec.describe DevicesController, type: :controller do

    describe "#index" do
      subject { process :index, method: :get}  

      it "get all devices" do
        
        expect(subject).to have_http_status(:success)
      end
    end  

    describe "#show" do
        let!(:params) {{id:394236}} 
        let(:other_params) {{id:1}}
        
        context "with correct id" do
          subject { process :show, method: :get, params: params} 
          it "get device by id" do
            expect(subject).to have_http_status(:success)
          end
        end

        context "device not found" do
          subject { process :show, method: :get, params: other_params} 
          it "get device by wrong id" do
            expect(subject).to have_http_status(:internal_server_error)
          end
        end
      end  
  end