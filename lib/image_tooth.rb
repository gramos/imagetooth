#!/usr/bin/ruby
##########################################################################
#  Copyright (C) 2007 Ramos, Gaston - ramos.gaston@gmail.com
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
require 'RMagick'
require 'array_adds'

include Magick

class ImageTooth
  attr_accessor :root_path

  @@colors = { :n => 'black', :w => 'white', :g => 'green',
      :r => 'red', :b => 'blue' }

  def initialize
    @root_path = './'
    @file_name_base = 'base_tooth.png'
    @extension = ".png"
  end

  def ImageTooth.colors=(hash_colors)
    @@colors = hash_colors
  end

  def ImageTooth.chars_colors
    @@colors.keys
  end


  # Generate the base tooth image, with all faces in white color.
  # This are store in root_path/base_path.png

  def graph_base file = @file_name_base
    background = Image.new(25, 35)
    gc = Draw.new
    gc.stroke('black')
    gc.fill('white')
    gc.rectangle(6, 6, 18, 28)
    gc.line(0, 0, 6, 6)
    gc.line(24, 0, 18, 6)
    gc.line(0, 35, 6, 28)
    gc.line(25, 35, 18, 28)
    gc.draw(background)
    background.border!(1, 1, 'black')
    background.write( "#{root_path}/#{file}" )
  end

  # Paints the faces of the tooth image on hash colors based.
  # The tooth's filename represents the faces painted,
  # The filename's characters are:
  # * w - White
  # * g - Green
  # * b - Blue
  # * n - Black
  # * r - Red
  # * t - To extract
  # * x - Extracted
  # and are ordered, begining on the upper face of the
  # the tooth and moving clockwise ending on the center face.
  #  Example: wrrgw.png
  def paint hash_faces, name_file
    # FIXME
    self.graph_base

    tooth = Magick::Image.read("#{@root_path}/#{@file_name_base}").first
    gc = Draw.new

    gc.fill(hash_faces[:top])
    x = 1
    y = 1
    gc.polygon(x, y, x+7, y+5, x+18, y+5, x+23, y)

    gc.fill(hash_faces[:bottom])
    x = 3
    y = 35
    gc.polygon(x, y, x+5, y-5, x+16, y-5, x+21, y)

    gc.fill(hash_faces[:center])
    x = 8
    y = 8
    gc.rectangle(x, y, x+10, y+20)

    gc.fill(hash_faces[:right])
    x = 20
    y = 8
    gc.polygon(x, y, x+5, y-6, x+5, y+25, x, y+20)

    gc.fill(hash_faces[:left])
    x = 1
    y = 35
    gc.polygon(x, y, x+5, y-6, x+5, 7, 1, 2)

    gc.draw(tooth)
    tooth.write("#{self.root_path}/#{name_file}")
    File.delete("#{self.root_path}/#{@file_name_base}")
  end

  def paint_extract color, filename
    self.graph_base

    tooth = Magick::Image.read("#{@root_path}/#{@file_name_base}").first
    gc = Draw.new

    x = 4
    y = 10
    gc.stroke(color)
    gc.stroke_width(3)
    gc.line(x, y, x+19, y+15)
    gc.line(x + 18, y, x, y+16)

    gc.draw(tooth)
    tooth.write("#{self.root_path}/#{filename}#{@extension}")
    File.delete("#{self.root_path}/#{@file_name_base}")
  end

  # Generates a hash based on tooth's file name, where keys are the tooth's
  # faces and value is the colour to painted.

  def file_name2hash_faces file_name
    desc = file_name.split('.').first
    hash = Hash.new
    hash[:top]      = @@colors[desc[0].chr.to_sym]
    hash[:right]    = @@colors[desc[1].chr.to_sym]
    hash[:bottom]   = @@colors[desc[2].chr.to_sym]
    hash[:left]     = @@colors[desc[3].chr.to_sym]
    hash[:center]   = @@colors[desc[4].chr.to_sym]
    hash
  end

  # Generates all tooth's images in a folder structure like this:
  # b/ w/ n/ r/ g/
  #
  # * b/ - Blue (those wich it's top face is blue)
  # * w/ - White (those wich it's top face is white)
  # * n/ - Black (those wich it's top face is Black)
  # * g/ - Green (those wich it's top face is Green)
  # * t/ - To extrate (this will be extracted)
  # * x/ - Extracted (this was extracted)
  def gen_all
    root_path_aux = self.root_path
    self.permut.each{|i|
      self.root_path = "#{root_path_aux}/#{i[0].chr}"
      self.paint_img i
    }

    #Generate the 2 extractions marcs
    self.root_path = "#{root_path_aux}/t"
    self.paint2extract
    self.root_path = "#{root_path_aux}/x"

    self.paint_extracted

    self.root_path = root_path_aux
  end

  def method_missing(method_name, *args)

    case method_name.to_s
    when /paint_img/
      case args[0]
      when /^ttttt/
        self.paint2extract
      when /^xxxxx/
        self.paint_extracted
      else
        self.paint(file_name2hash_faces(args[0]), args[0])
      end
    when /paint2extract/
      self.paint_extract 'blue', 'ttttt'
    when /paint_extracted/
      self.paint_extract 'red', 'xxxxx'
    else
      super.method_missing
    end

  end

  # Generates all permutations tooth's filenames.
  def permut
    @@colors.keys.permut(5).collect{ |v| v.join('') + @extension}
  end

  def wrap_color char_color
    @@colors[char_color]
  end

  # Create all folders ones for each color and 2 more for extractions (x/ and t/)
  def create_folders
    #FIXME
    Dir.mkdir(@root_path) if not File.exist?(@root_path)
    ImageTooth.chars_colors.each { |f|
      Dir.mkdir("#{@root_path}/#{f}") if not File.exist?("#{@root_path}/#{f}")
    }
    Dir.mkdir("#{@root_path}/t")
    Dir.mkdir("#{@root_path}/x")
  end

end
