Pod::Spec.new do |s|
  s.name             = 'CommonSwift'
  s.version          = '1.0.0'
  s.summary          = 'Common Swift extensions'
  s.homepage         = 'https://github.com/sublabdev/common-swift'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Substrate Laboratory LLC' => 'info@sublab.dev' }
  s.source           = { :git => 'https://github.com/sublabdev/common-swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.osx.deployment_target = '10.15'
  s.watchos.deployment_target = '6.0'
  s.tvos.deployment_target = '13.0'
  s.source_files = 'Sources/CommonSwift/**/*'
  s.dependency 'BigInt', '5.0.0'
end
