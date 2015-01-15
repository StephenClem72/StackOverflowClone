require 'rails_helper'

RSpec.describe QuestionsController, :type => :controller do

  # let(:question1) { FactoryGirl.create :question, title: "I'm question number 1" }
  # let(:question2) { FactoryGirl.create :question, title: "I'm question number 2" }
  # let(:answer1) {FactoryGirl.create :answer, question: question1}
  # let(:answer2) {FactoryGirl.create :answer, question: question2}
  # let(:answer3) {FactoryGirl.create :answer, question: question1}


  describe 'QuestionsController' do
    context '#index' do
      it 'returns a status of 200 - O.K.' do
        get :index
        expect(response).to be_success
        expect(response).to have_http_status(200)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end

      it 'displays all the questions' do
        get :index
        expect(assigns(:questions)).to eq Question.all
      end
    end

    context '#show' do
      before :each do
        @question = Question.create(title: 'Test Question', content: 'Test content')
        get :show, id: @question.id
      end

      it 'renders the show template' do
        expect(response).to have_http_status(200)
      end

      it 'renders the show template' do
        expect(response).to render_template('show')
      end

      it 'assigns the question correctly' do
        expect(assigns(:question)).to eq(@question)
      end
    end

    context '#create' do

    before :each do
      post :create, {question: {title: "Test Question", content: "Test content for question"}}
    end

      it 'creates a successful question' do
        expect(Question.all.count).to eq(1)
      end

      it "route gets redirected" do
        expect(response).to be_redirect
      end
    end

    context '#edit' do
      before :each do
        @question2 = Question.create(title: 'Test Question2', content: 'Test content2')
        get :edit, id: @question2.id
      end

      it 'returns an HTTP status of 200 - O.K.' do
        expect(response).to have_http_status(200)
      end

      it 'successfully renders an edit page' do
        expect(response).to render_template('edit')
      end

      it 'assigns @question correctly' do
        expect(assigns(:question)).to eq(@question2)
      end
    end

    context '#update' do
      before :each do
        @question3 = Question.create(title: 'Test Question3', content: 'test content3')
        patch :update, id: @question3.id, :question => {title: 'change title', content: 'change content'}
        @question3.reload
      end

      it 'redirect to another page' do
        expect(response).to be_redirect
      end

      it 'changes the title' do
        expect(@question3.title).to eq('change title')
      end
    end

    end
  end
end

