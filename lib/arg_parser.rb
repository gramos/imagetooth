class ArgParser
  def self.parse(args)
    options = OpenStruct.new

    gen_img_help = <<-EOS
   ImageTooth paints the faces of the tooth image on hash colors based.
   The tooth's filename represents the faces painted,
   The filename's characters are:

   * w - White
   * g - Green
   * b - Blue
   * n - Black
   * r - Red
   * t - To extract
   * x - Extracted

   and are ordered, begining on the upper face of the
   the tooth and moving clockwise ending on the center face.

   Example: imagetooth --image wrrgw.png --folder ./

    EOS

    opts = OptionParser.new do |opts|
      opts.on("-a", "--all", "Generate all teeth images's combinations.") do |all|
        options.all = all
      end

      opts.on("-i", "--image IMAGE", "Generate image tooth based on file name.") do |i|
        options.image = i
      end

      opts.on("-f", "--folder FOLDER", "Folder where images are saved. (** Required **)") do |f|
        options.folder = f
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts gen_img_help
        puts opts

        exit
      end
    end

    opts.parse!(args)
    options
  end
end

