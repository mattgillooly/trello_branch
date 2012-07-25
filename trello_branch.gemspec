Gem::Specification.new do |s|
  s.name        = 'trello_branch'
  s.version     = '0.0.0'
  s.executables << 'tb'
  s.date        = '2012-07-24'
  s.summary     = "TrelloBranch!"
  s.description = "Easily create branches from Trello cards"
  s.authors     = ["Matt Gillooly"]
  s.email       = 'matt@mattgillooly.com'
  s.files       = ["lib/trello_branch.rb"]
  s.homepage    = 'http://github.com/mattgillooly/trello_branch'

  s.add_dependency 'ruby-trello'
  s.add_dependency 'git'
  s.add_dependency 'configuration'
end
