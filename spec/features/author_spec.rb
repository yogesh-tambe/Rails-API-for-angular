require "selenium-webdriver"
require 'rails_helper'

RSpec.feature "Authors", js: true, type: :feature do
	before(:each) do
    create(:author)
  end
  scenario 'Create a new author' do
  	visit "authors/new"
  	create(:author)
  	fill_in 'First name', with: 'Yogesh'
  	fill_in 'Last name', with: 'Tambe'
		page.find('#author_date_of_birth').set("2014-01-01")
		click_button 'Create Author'
		expect(page).to have_text("Author created successfully.")
  end

  scenario 'Should not create user' do
  	visit "authors/new"
  	fill_in 'First name', with: 'Yogesh'
  	fill_in 'Last name', with: 'Tambe'
		click_button 'Create Author'
		expect(page).to have_text("Date of birth can't be blank")
  end

  scenario 'Should display all the available users' do
  	visit "authors"
  end

  scenario 'Should diplay a particular author' do
  	visit "authors"
  	click_link 'Show'
  end

  scenario 'Should edit a particular author' do
  	visit "authors"
  	click_link 'Edit'
  	fill_in 'First name', with: 'Edited'
  	fill_in 'Last name', with: 'Edit'
  	click_button 'Update Author'
  	expect(page).to have_text("Author updated successfully.")
  end

  scenario 'Should delete a particular author' do
  	visit "authors"
  	click_link 'Delete'
  	page.driver.browser.switch_to.alert.accept
  end
end
