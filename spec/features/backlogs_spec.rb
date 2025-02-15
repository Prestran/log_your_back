# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Backlogs' do
  scenario 'User visits backlogs page' do
    create_list(:backlog, 5)
    visit backlogs_path
    expect(page).to have_content 'Backlogs'
  end

  scenario 'User visits backlog page' do
    backlog = create(:backlog)

    visit backlog_path(backlog)
    expect(page).to have_content(backlog.name)
  end

  # rubocop:disable RSpec/ExampleLength
  scenario 'User creates new backlog' do
    visit backlogs_path
    click_on 'Add backlog'

    fill_in 'Name', with: 'TestName'
    click_on 'Save'

    wait_for_ajax

    expect(page).to have_content 'TestName'
  end

  scenario 'User edits backlog' do
    backlog = create(:backlog)
    visit backlog_path(backlog)
    click_on 'Edit'
    fill_in 'Name', with: 'TestName'
    click_on 'Save'

    wait_for_ajax

    expect(page).to have_content 'TestName'
  end
  # rubocop:enable RSpec/ExampleLength
end
