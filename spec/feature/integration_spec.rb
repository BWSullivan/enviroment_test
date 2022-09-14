# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter'
    fill_in 'Author', with: 'Jk lol'
    fill_in 'Price', with: 50.5
    fill_in 'Date', with: Date.new(2022,9,12)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter')
    expect(page).to have_content('Jk lol')
    expect(page).to have_content(50.5)
    expect(page).to have_content(Date.new(2022,9,12))
  end
end