require 'rails_helper'

describe ItemsController, type: :controller do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end

# describe 'GET #edit' do
#   it "assigns the requested tweet to @tweet" do
#   end

#   it "renders the :edit template" do
#   end
# end