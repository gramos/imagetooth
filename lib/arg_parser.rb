class ArgParser
  def self.parse(args)
    options = OpenStruct.new

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
        puts opts

        exit
      end
    end

    opts.parse!(args)
    options
  end
end

