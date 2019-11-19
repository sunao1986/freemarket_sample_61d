require 'rails_helper'

describe ItemsController, type: :controller do
  let(:user) { create(:user) }
  
  describe 'GET #new' do

    context 'log in' do
      before do
        login user
        get :new, params: {}
      end

      it "renders the :new template" do
        get :new
        expect(response).to render_template :new
      end
    end

    context 'not log in' do
      before do
        get :new, params: {}
      end

      it 'redirects to new_user_session_path' do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
