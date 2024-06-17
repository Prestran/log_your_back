# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BacklogsController, type: :controller do
  describe 'GET index' do
    before do
      create_list(:backlog, 10)
    end

    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'returns all backlogs as json' do
      get :index
      expect(JSON.parse(response.body).length).to eq 10
    end
  end

  describe 'POST create' do
    let(:params) { { name: "Example backlog", type: 'books', content: [ { title: "Title", score: 7, status: 'completed' },
                   { title: "Title", status: 'to do' } ], due_at: 1.month.from_now } }
    it 'creates a new backlog' do
      expect do
        post :create, params: params
      end.to change{ Backlog.count }.by 1
    end

    it 'returns successful response' do
      post :create, params: params
      expect(response).to be_successful
      expect(JSON.parse(response.body)["name"]).to eq 'Example backlog'
    end
  end
end
