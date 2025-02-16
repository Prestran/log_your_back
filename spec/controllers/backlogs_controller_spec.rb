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
  end

  describe 'POST create' do
    let(:params) do
      {
        backlog: {
          name: 'Example backlog',
          backlog_type: 'books',
          due_at: 1.month.from_now
        }
      }
    end

    context 'when creation goes ok' do
      it 'returns successful response' do
        post(:create, params:)
        expect(response).to have_http_status :found
      end
    end
  end

  describe 'PUT update' do
    let(:backlog) { create(:backlog) }
    let(:due_at) { 2.weeks.from_now.to_date }
    let(:params) do
      {
        id: backlog.id,
        backlog: {
          name: 'Updated backlog',
          backlog_type: 'books',
          due_at: due_at
        }
      }
    end

    context 'with successful response' do
      it 'updates the backlog type' do
        put(:update, params:)
        expect(backlog.reload.backlog_type).to eq 'books'
      end

      it 'updates the backlog name' do
        put(:update, params:)
        expect(backlog.reload.name).to eq 'Updated backlog'
      end

      it 'updates the backlog due time' do
        put(:update, params:)
        expect(backlog.reload.due_at).to eq due_at
      end
    end
  end
end
