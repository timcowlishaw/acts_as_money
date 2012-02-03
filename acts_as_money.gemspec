# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "acts_as_money"
  s.version = "0.2.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jordan Glasner", "Econsultancy", "Tim Cowlishaw", "Ylan Segal"]
  s.date = "2012-02-03"
  s.email = "tim@timcowlishaw.co.uk"
  s.extra_rdoc_files = ["README"]
  s.files = ["README", "test", "lib/acts_as_money.rb"]
  s.homepage = "http://github.com/timcowlishaw/acts_as_money"
  s.rdoc_options = ["--main", "README"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A fairly trivial plugin allowing easy serialisation of Money values (from the money gem) as attributes on activerecord objects"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<money>, [">= 0"])
      s.add_runtime_dependency(%q<activerecord>, [">= 0"])
    else
      s.add_dependency(%q<money>, [">= 0"])
      s.add_dependency(%q<activerecord>, [">= 0"])
    end
  else
    s.add_dependency(%q<money>, [">= 0"])
    s.add_dependency(%q<activerecord>, [">= 0"])
  end
end
