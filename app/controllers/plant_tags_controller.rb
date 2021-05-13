class PlantTagsController < ApplicationController
  def new
    @tags = Tag.all
    @plant = Plant.find(params[:plant_id])
    @plant_tag = PlantTag.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    # @tag = Tag.find(params[:plant_tag][:tag])
    @tags = Tag.where(id: params[:plant_tag][:tag]) # ["1", "2"]
    @tags.each do |tag|
      PlantTag.create(plant: @plant, tag: tag)
    end
    redirect_to garden_path(@plant.garden)
    # @plant_tag = PlantTag.new(plant: @plant, tag: @tag)
    # if @plant_tag.save
    #   redirect_to garden_path(@plant.garden)
    # else
    #   render :new
    # end
  end
end
