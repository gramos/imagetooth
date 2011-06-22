require 'date'

Gem::Specification.new do |s|
  s.name              = %q{imagetooth}
  s.version           = "2.0.0"
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
  s.rubyforge_project     = %q{imagetooth}
  s.has_rdoc              = true
  s.required_ruby_version = '>= 1.9.2'
  s.add_dependency("rmagick", ">= 2.13.1")
  s.files = Dir.glob("**/*").delete_if { |item| item.include?("~") }

  s.signing_key = '/home/gramos/src/ruby/ruby-sign/gem-private_key.pem'
  s.cert_chain  = ['/home/gramos/src/ruby/ruby-sign/gem-public_cert.pem']

end
