require 'spec_helper'

describe 'project page' do
 # fixtures :projects

 let(:project) { Project.create!(title: "Sausages", tempo: 140) }

  it 'displays the selected project' do

    visit '/projects/' + "#{project.id}"
    expect(page).to have_content("Sausages")
  end
end
