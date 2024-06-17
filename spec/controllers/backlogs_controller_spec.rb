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
end
