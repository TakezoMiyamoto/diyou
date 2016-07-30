# -*- encoding: utf-8 -*-
# stub: simple_form_fancy_uploads 0.2.0 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_form_fancy_uploads"
  s.version = "0.2.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Andrea Pavoni"]
  s.date = "2015-01-12"
  s.description = "Use simple_form (>= v2.0) custom inputs to get image previews or a link to uploaded file. Save time and code when you need useful file uploads."
  s.email = ["andrea.pavoni@gmail.com"]
  s.homepage = "http://github.com/apeacox/simple_form_fancy_uploads"
  s.rubygems_version = "2.2.2"
  s.summary = "simple_form custom inputs to get image/link previews with file uploads."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 4.0.0"])
      s.add_runtime_dependency(%q<simple_form>, ["~> 3.1"])
      s.add_runtime_dependency(%q<carrierwave>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 4.0.0"])
      s.add_dependency(%q<simple_form>, ["~> 3.1"])
      s.add_dependency(%q<carrierwave>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 4.0.0"])
    s.add_dependency(%q<simple_form>, ["~> 3.1"])
    s.add_dependency(%q<carrierwave>, [">= 0"])
  end
end
