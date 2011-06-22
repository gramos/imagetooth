##########################################################################
#  Copyright (C) 2007 Ramos, Gastón - ramos.gaston@gmail.com
#
#  This program is free software; you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation; either version 2 of the License, or
#  (at your option) any later version.
#
#  This program is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
#  GNU General Public License for more details.
#
#########################################################################

require 'image_tooth'

describe "Image Tooth" do

  before(:each) do
    @img_tooth = ImageTooth.new
    @base_img = 'base_tooth.png'
    @painted_tooth = 'painted_tooth.png'
  end

  def delete_img
    File.delete(@img_tooth.root_path +  "/" + @base_img) \
    if  File.exists?(@img_tooth.root_path + "/" + @base_img)

    File.delete(@img_tooth.root_path +  "/" + @painted_tooth) \
    if  File.exists?(@img_tooth.root_path + "/" + @painted_tooth)
  end

  def delete_folders
    ImageTooth.chars_colors{ |d|
      Dir.rmdir(@img_tooth.root_path + "/" + d)
    }
  end

  it "One color should be just one character" do
    @img_tooth.wrap_color(:r).should == 'red'
    @img_tooth.wrap_color(:g).should == 'green'
    @img_tooth.wrap_color(:w).should == 'white'
    @img_tooth.wrap_color(:n).should == 'black'
    @img_tooth.wrap_color(:b).should == 'blue'
  end

  it "Should be generate base image tooth" do
    @img_tooth.graph_base(@base_img)
    File.exists?(@img_tooth.root_path +  "/" + @base_img).should be_true
    delete_img

  end

  it "Should be generate image with face painted, on base image" do
    hash_faces = { :top => 'blue', :right => 'white', :bottom => 'white',
      :left => 'white', :center => 'white' }
    @img_tooth.graph_base
    @img_tooth.paint hash_faces, @painted_tooth
    File.exists?(@img_tooth.root_path +  "/" + @painted_tooth).should be_true
    delete_img


    hash_faces = { :top => 'blue', :right => 'green', :bottom => 'red',
      :left => 'black', :center => 'white' }
    @img_tooth.graph_base
    @img_tooth.paint hash_faces, @painted_tooth
    File.exists?(@img_tooth.root_path +  "/" + @painted_tooth).should be_true
  end

  it "Should be generate image with face painted, on base image" do
    file_tooth = 'wrrgw.png'
    @img_tooth.graph_base
    @img_tooth.paint_img file_tooth
    File.exists?(@img_tooth.root_path +  "/" + 'wrrgw.png').should be_true
    delete_img
  end

  it "Should have five colors chars" do
    [:w, :n, :r, :b, :g].each do |c|
        ImageTooth.chars_colors.should include c
    end
  end

  it "Should be generate a hash based on file name " do
    hash_faces = { :top => 'white', :right => 'white', :bottom => 'green',
      :left => 'green', :center => 'white' }
    @img_tooth.file_name2hash_faces('wwggw.png').should == hash_faces
  end

end
