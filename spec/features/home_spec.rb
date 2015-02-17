require 'spec_helper'

describe 'home page' do
  it 'has the heading \'Projects\'' do
    visit '/'
    expect(page).to have_content('Projects')
  end

  it "displays a link for creating a new project" do
    visit '/'
    expect(page).to have_content('New Project')
  end

  it "displays the links for projects in the database" do
    visit '/'
    expect(page).to have_content('ManBoogey')
  end
end