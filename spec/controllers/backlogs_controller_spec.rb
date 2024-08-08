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
    let(:params) do
      { name: 'Example backlog', type: 'books', content: [{ title: 'Title', score: 7, status: 'completed' },
                                                          { title: 'Title',
                                                            status: 'to do' }], due_at: 1.month.from_now }
    end
    context 'when creation goes ok' do
      it 'creates a new backlog' do
        expect do
          post :create, params:
        end.to change { Backlog.count }.by 1
      end

      it 'returns successful response' do
        post(:create, params:)
        expect(response).to be_successful
        expect(JSON.parse(response.body)['name']).to eq 'Example backlog'
      end
    end
  end

  describe 'PUT update' do
    let(:backlog) { create(:backlog) }
    let(:params) do
      { id: backlog.id, name: 'Updated backlog', type: 'books', content: [{ title: 'Title', score: 7, status: 'completed' },
                                                                          { title: 'Title',
                                                                            status: 'to do' }], due_at: 2.weeks.from_now }
    end
    it 'updates the backlog' do
      put(:update, params:)

      expect(response).to be_successful
      expect(JSON.parse(response.body)['name']).to eq 'Updated backlog'
      expect(JSON.parse(response.body)['type']).to eq 'books'
    end
  end
end
