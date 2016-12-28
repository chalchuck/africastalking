# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'africastalking/version'

Gem::Specification.new do |spec|
  spec.name          = "africastalking"
  spec.version       = Africastalking::VERSION
  spec.authors       = ["Charles Chuck"]
  spec.email         = ["chalcchuck@gmail.com"]

  spec.summary       = %q{Africas Best SMS/AIRTIME API}
  spec.description   = %q{Africas SMS/AIRTIME API}
  spec.homepage      = "https://africastalking.com/"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', "~> 0.13.7"

  spec.add_development_dependency "pry", "~>0.10.4"
  spec.add_development_dependency "rubycritic"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
