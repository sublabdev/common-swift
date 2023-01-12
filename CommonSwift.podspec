Pod::Spec.new do |s|
  s.name             = 'CommonSwift'
  s.version          = '1.0.0'
  s.summary          = 'Common Swift extensions'

  # s.description      = <<-DESC
# TODO: Add long description of the pod here.
#                      DESC

  s.homepage         = 'https://github.com/sublabdev/common-swift'
  s.license          = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author           = { 'Tigran Iskandaryan' => 'tiger@sublab.dev' }
  s.source           = { :git => 'https://github.com/sublabdev/common-swift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '13.0'
  s.source_files = 'CommonSwift/Classes/**/*'
  s.dependency 'BigInt', '~> 3.1'
end
