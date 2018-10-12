require "./spec_helper"

def instance_hash
  {"name" => "Fake", "url" => "Fake", "repo" => "Fake"}
end

def instance_params
  params = [] of String
  params << "name=#{instance_hash["name"]}"
  params << "url=#{instance_hash["url"]}"
  params << "repo=#{instance_hash["repo"]}"
  params.join("&")
end

def create_instance
  model = Instance.new(instance_hash)
  model.save
  model
end

class InstanceControllerTest < GarnetSpec::Controller::Test
  getter handler : Amber::Pipe::Pipeline

  def initialize
    @handler = Amber::Pipe::Pipeline.new
    @handler.build :web do
      plug Amber::Pipe::Error.new
      plug Amber::Pipe::Session.new
      plug Amber::Pipe::Flash.new
    end
    @handler.prepare_pipelines
  end
end

describe InstanceControllerTest do
  subject = InstanceControllerTest.new

  it "renders instance index template" do
    Instance.clear
    response = subject.get "/instances"

    response.status_code.should eq(200)
    response.body.should contain("instances")
  end

  it "renders instance show template" do
    Instance.clear
    model = create_instance
    location = "/instances/#{model.id}"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Show Instance")
  end

  it "renders instance new template" do
    Instance.clear
    location = "/instances/new"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("New Instance")
  end

  it "renders instance edit template" do
    Instance.clear
    model = create_instance
    location = "/instances/#{model.id}/edit"

    response = subject.get location

    response.status_code.should eq(200)
    response.body.should contain("Edit Instance")
  end

  it "creates a instance" do
    Instance.clear
    response = subject.post "/instances", body: instance_params

    response.headers["Location"].should eq "/instances"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "updates a instance" do
    Instance.clear
    model = create_instance
    response = subject.patch "/instances/#{model.id}", body: instance_params

    response.headers["Location"].should eq "/instances"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end

  it "deletes a instance" do
    Instance.clear
    model = create_instance
    response = subject.delete "/instances/#{model.id}"

    response.headers["Location"].should eq "/instances"
    response.status_code.should eq(302)
    response.body.should eq "302"
  end
end
