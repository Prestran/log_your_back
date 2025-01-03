# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BacklogsController do
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
      expect(response.parsed_body.length).to eq 10
    end
  end

  describe 'POST create' do
    let(:params) do
      {
        name: 'Example backlog',
        backlog_type: 'books',
        due_at: 1.month.from_now
      }
    end

    context 'when creation goes ok' do
      it 'creates a new backlog' do
        expect do
          post :create, params:
        end.to change(Backlog, :count).by 1
      end

      it 'returns successful response' do
        post(:create, params:)
        expect(response).to be_successful
      end

      it 'returns new values of backlog' do
        post(:create, params:)
        expect(response.parsed_body['name']).to eq 'Example backlog'
      end
    end
  end

  describe 'PUT update' do
    let(:backlog) { create(:backlog) }
    let(:due_at) { 2.weeks.from_now }
    let(:params) do
      { id: backlog.id,
        name: 'Updated backlog',
        backlog_type: 'books',
        due_at: due_at}
    end

    context 'with successful response' do
      it 'updates the backlog type' do
        put(:update, params:)
        expect(response.parsed_body['backlog_type']).to eq 'books'
      end

      it 'updates the backlog name' do
        put(:update, params:)
        expect(response.parsed_body['name']).to eq 'Updated backlog'
      end

      it 'updates the backlog due time' do
        put(:update, params:)
        expect(response.parsed_body['due_at']).to eq due_at
      end
    end
  end
end
