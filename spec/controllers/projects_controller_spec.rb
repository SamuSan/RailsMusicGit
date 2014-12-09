require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  fixtures :projects

  let(:project) { projects(:with_title) }

  describe "POST create" do
    let(:create_project) { instance_double(CreateProject) }

    before do
      expect(CreateProject).to receive(:new).and_return(create_project)
    end

    context "when the CreateProject service succeeds" do
      let(:project) { projects(:with_title) }

      before do
        expect(create_project).to receive(:call).and_return(project)
      end

      it "redirects to the new project" do
        post :create, :project => {:title => "Awesome song", :tempo => "120"}
        expect(response).to redirect_to project_path(project)
      end
    end

    context "when the CreateProject service fails" do 
      let(:project) { Project.new }
      
      before do
        expect(create_project).to receive(:call).and_return(project)
      end

      it "redirects to the project index page" do
        post :create, :project => {:title => "", :tempo => "120"}
        expect(response).to redirect_to(projects_path)
      end
    end
  end

  describe "GET show" do
    context "when the show action is successful" do
      it "redirects to the show page for the given project id" do
        get :show, :id => project.id
        expect(response).to render_template(:show)
      end
    end

    context "when the show action fails" do
      it "redirects to the index page" do
        get :show, :id => 1000
        expect(response).to redirect_to(projects_path)
      end
    end
  end

  describe "GET index" do
    context "when the index requested" do
      it "redirects to the index page" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
end