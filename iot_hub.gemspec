Gem::Specification.new do |s|
  s.name        = 'iot_hub'
  s.version     = '1.0'
  s.summary     = 'Hub for sensor networks'
  s.authors     = [ 'Mate Farkas' ]
  s.email       = 'mate.farkas@sch.hu'
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    = 'https://github.com/farkasmate/iot_hub'
end

