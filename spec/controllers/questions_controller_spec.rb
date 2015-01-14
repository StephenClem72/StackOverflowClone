require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do


  describe 'QuestionsController' do
    context '#index' do
      it 'returns a status of 200 - O.K.' do
        get :index
        expect(response.status).to eq(200)
      end

      it 'displays all the questions' do
        get :index
        expect(assigns(:questions)).to eq Question.all
      end
    end

    context '#create' do

      it 'creates a new instance of Question' do
        get :new
        expect()
      end
    end

    # context '#show'


  end

end

