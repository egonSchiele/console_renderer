Gem::Specification.new do |s|
  s.name        = 'console_renderer'
  s.version     = '0.0.3'
  s.date        = '2012-02-01'
  s.summary     = "A renderer for Redcarpet. Render Markdown to the command line."
  s.description = "A renderer for Redcarpet. Render Markdown to the command line!"
  s.authors     = ["Aditya Bhargava"]
  s.email       = 'bluemangroupie@gmail.com'
  s.files       = ["lib/console_renderer.rb", "bin/console_renderer"]
  s.homepage    = "https://github.com/egonSchiele/console_renderer"
  s.executables = "console_renderer"
  s.add_dependency("redcarpet")
  s.add_dependency("rainbow")
  s.add_dependency("syntax")
end
