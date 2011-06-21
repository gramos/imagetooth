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

$LOAD_PATH << '../lib'

require 'array_adds'

describe "Array" do

  it "Should be generate color sequence" do
    char_colors = ['r', 'w']
    char_colors.permut(2).should == [["r", "r"], ["r", "w"], ["w", "r"], ["w", "w"]]
  end

   it "Should be generate color sequence" do
    char_colors = [['r', 'w'], ['r', 'w']]
    char_colors.sequence.should == [["r", "r"], ["r", "w"], ["w", "r"], ["w", "w"]]
  end
end
