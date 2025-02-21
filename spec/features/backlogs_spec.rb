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
    assert_selector 'h1', text: 'Backlogs'

    click_on 'New backlog'
    fill_in 'Name', with: 'Capybara backlog'

    assert_selector 'h1', text: 'backlogs'
    click_on 'Create backlog'

    assert_selector 'h1', text: 'Backlogs'
    assert_text 'Capybara backlog'
  end

  scenario 'User edits backlog' do
    create(:backlog)

    visit backlogs_path
    assert_selector 'h1', text: 'Backlogs'

    click_on 'Edit', match: :first
    fill_in 'Name', with: 'Updated backlog'

    assert_selector 'h1', text: 'Backlogs'
    click_on 'Update backlog'

    assert_selector 'h1', text: 'Backlog'
    assert_text 'Updated backlog'
  end

  scenario "User destroys a backlog" do
    backlog = create(:backlog)

    visit backlogs_path
    assert_text backlog.name

    click_on "Delete", match: :first
    assert_no_text backlog.name
  end
  # rubocop:enable RSpec/ExampleLength
end
