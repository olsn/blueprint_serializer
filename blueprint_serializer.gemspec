$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "blueprint_serializer/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "blueprint_serializer"
  s.version     = SchemaSerializer::VERSION
  s.authors     = ["Olaf Horstmann"]
  s.email       = ["pure.onh@gmail.com"]
  s.homepage    = "indiegamr.com"
  s.summary     = "Add the ability to output a serialization of any Model to json."
  s.description = "Add the ability to output a serialization of any Model to json."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
end