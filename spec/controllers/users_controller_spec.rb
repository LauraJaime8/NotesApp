require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    let(:user) { create(:user_with_notes) }

    subject { get :show, params: { id: user.id } }

    it "responds with 200 status code" do
      expect(subject).to have_http_status(200)
    end

    it "render show template" do
      expect(subject).to render_template(:show)
    end
  end
end
