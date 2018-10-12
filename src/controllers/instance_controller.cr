class InstanceController < ApplicationController
  getter instance = Instance.new

  before_action do
    only [:show, :edit, :update, :destroy] { set_instance }
  end

  def index
    instances = Instance.all
    render "index.slang"
  end

  def show
    render "show.slang"
  end

  def new
    render "new.slang"
  end

  def edit
    render "edit.slang"
  end

  def update
    instance.set_attributes instance_params.validate!
    if instance.save
      redirect_to action: :index, flash: {"success" => "Updated instance successfully."}
    else
      flash["danger"] = "Could not update Instance!"
      render "edit.slang"
    end
  end

  def create
    instance = Instance.new instance_params.validate!
    if instance.save
      redirect_to action: :index, flash: {"success" => "Created instance successfully."}
    else
      flash["danger"] = "Could not create Instance!"
      render "new.slang"
    end
  end

  def destroy
    instance.destroy
    redirect_to action: :index, flash: {"success" => "Deleted instance successfully."}
  end

  private def instance_params
    params.validation do
      required :name { |f| !f.nil? }
      required :picture { |f| !f.nil? }
      required :url { |f| !f.nil? }
      required :repo { |f| !f.nil? }
    end
  end

  private def set_instance
    @instance = Instance.find! params[:id]
  end
end
