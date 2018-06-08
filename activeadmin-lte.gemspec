# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'active_admin/LTE/version'

Gem::Specification.new do |spec|
  spec.name          = "activeadmin-lte"
  spec.version       = ActiveAdmin::LTE::VERSION
  spec.authors       = ["Clément Prod'homme", "Armand Niampa", "Sam Ettahiri"]
  spec.email         = ["armand@capsens.eu", "sam@capsens.eu"]
  spec.summary       = %q{AadminLTE ( Almsaeedstudio.com ) theme for ActiveAdmin }
  spec.description   = %q{AadminLTE ( Almsaeedstudio.com ) theme for ActiveAdmin }
  spec.homepage      = "https://github.com/Cle61/activeadmin-lte"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = Dir["{lib,app}/**/*"] + ["LICENSE.txt", "README.md"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]


end