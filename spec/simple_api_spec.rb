require 'spec_helper'

describe "OinkMiddleware" do
  subject do
    Oinkers = Class.new(Grape::API) do
      format :json
      use Grape::Middleware::OinkMiddleware

      get('/fat/:id') do
        {msg: "oink!", oink_env: env['action_dispatch.request.parameters'] }
      end
    end
  end

  def app
    subject
  end

  describe "#/fat/:id" do
    it "adds controller and action information needed by Oink to the environment" do
      get "/fat/:id"
      body = JSON.parse(last_response.body)
      expect(body["oink_env"]).to eq({"controller" => "oinkers", "action" => "sl_fatsl_col_id_GET"})
    end
  end
end
