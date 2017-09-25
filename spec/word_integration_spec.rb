require "capybara/rspec"
require "./app"
require "pry"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe 'the word creation path', {:type => :feature} do
  it 'takes the user to the homepage where they can add a word to the list' do
    visit '/'
    fill_in('Word', :with => 'obtuse')
    click_button('Add Word')
    expect(page).to have_content('obtuse')
  end
end
