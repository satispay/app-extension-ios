Pod::Spec.new do |s|
  s.name             = 'SatispayAppExtension'
  s.version          = '0.0.1'
  s.summary          = 'Satispay App Extension support library'
  s.description      = <<-DESC
    Support library for the Satispay App Extension
                       DESC

  s.homepage         = 'https://github.com/satispay/app-extension-ios'
  s.license          = { :type => 'Apache-2.0', :file => 'LICENSE' }
  s.author           = { 'Pierluigi D\'Andrea' => 'pierluigi.dandrea@satispay.com' }
  s.source           = { :git => 'https://github.com/satispay/app-extension-ios.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'SatispayAppExtension/Classes/**/*'
  s.public_header_files = 'SatispayAppExtension/Classes/SatispayExtension.h'

end
