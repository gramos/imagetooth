require 'date'

Gem::Specification.new do |s|
  s.name              = %q{imagetooth}
  s.version           = "0.2.0"
  s.date              = Date.today.to_s
  s.summary           = %q{This library allows to generate images of teeth for odontograms with tooth faces painted in a color (red, green, blue, white or black for example). This is very usefull for dental applications..}
  s.description       =<<DESCRIPTION
This library allows to generate images of teeth for odontograms with tooth faces painted in a color (red, green, blue, white or black for example). This is very usefull for dental applications.
DESCRIPTION

  s.author                = %q{Gaston Ramos}
  s.email                 = %q{ramos.gaston@gmail.com}
  s.homepage              = %q{http://rubyforge.org/projects/imagetooth}
  s.bindir                = 'bin'
  s.executables           = ['imagetooth']
  s.default_executable = %q{imagetooth}
  s.require_paths         = %w{lib bin .}
  s.autorequire           = 'image_tooth'
  s.rubyforge_project     = %q{imagetooth}
  s.has_rdoc              = true
  s.required_ruby_version = '>= 1.8'
  s.add_dependency("rmagick", ">= 1.15.7")
  s.add_dependency("OptionParser", ">= 0.5.1")
  s.files = Dir.glob("**/*").delete_if { |item| item.include?("SVN") }

  s.signing_key = '/home/gramos/src/ruby/ruby-sign/gem-private_key.pem'
  s.cert_chain  = ['/home/gramos/src/ruby/ruby-sign/gem-public_cert.pem']

end
