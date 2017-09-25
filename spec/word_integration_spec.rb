require "capybara/rspec"
require "./app"
require "pry"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the word creation path', {:type => :feature}) do
  it('takes the user to the homepage where they can add a word to the list') do
    visit('/')
    fill_in('name', :with => 'obtuse')
    click_button('Add Word')
    expect(page).to have_content('obtuse')
  end
end

describe('Definitions page', {:type => :feature}) do
  it("display clicked word on its own page") do
    visit('/')
    fill_in('name', :with => "demagogue")
    click_button("Add Word")
    click_on("demagogue")
    expect(page).to have_content("demagogue")
  end
end

describe('Definitions page', {:type => :feature}) do
  it("allows students to enter definition for a word") do
    visit('/')
    click_on('demagogue')
    fill_in('definition', :with => "a leader who seeks support by appealing to popular passions")
    click_button("Add Definition")
    expect(page).to have_content("a leader who seeks support by appealing to popular passions")
  end
end

# describe('Definitions page', {:type => :feature}) do
#   it("allows students to enter additional definitions") do
#     visit('/')
#     click_on('brittle')
#     fill_in('definition', :with => "hard but liable to break or shatter easily.")
#     click_button("Add Definition")
#     fill_in('definition', :with => "a candy made from nuts and set melted sugar.")
#     click_button("Add Definition")
#     expect(page).to have_content("hard but liable to break or shatter easily.")
#     expect(page).to have_content("a candy made from nuts and set melted sugar.")
#   end
# end
