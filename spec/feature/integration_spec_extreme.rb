# location: spec/feature/integration_spec.rb
require 'rails_helper'

RSpec.describe 'Creating a book - extreme', type: :feature do
  scenario 'valid inputs' do
    visit new_book_path
    fill_in 'Title', with: 'harry potter 432143214321534215433243' # These should pass
    fill_in 'Author', with: 'Jk lol &*$&*#@^$*(&%!@*^(&'
    fill_in 'Price', with: 50543254.5555
    fill_in 'Date', with: Date.new(2040,9,12)
    click_on 'Create Book'
    visit books_path
    expect(page).to have_content('harry potter 432143214321534215433243')
    expect(page).to have_content('Jk lol &*$&*#@^$*(&%!@*^(&')
    expect(page).to have_content(50543254.5555)
    expect(page).to have_content(Date.new(2040,9,12))
  end
end