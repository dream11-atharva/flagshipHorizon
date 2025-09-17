#
# Be sure to run `pod lib lint flagshipHorizon.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'flagshipHorizon'
  s.version          = '0.1.0'
  s.summary          = 'FlagshipHorizon OpenFeature adapter for iOS'

  s.description      = <<-DESC
  A minimal OpenFeature provider (adapter) for iOS.
  Use it to register a FeatureProvider with OpenFeature and evaluate flags.
                       DESC

  s.homepage         = 'https://github.com/dream11-atharva/flagshipHorizon'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '210496608' => 'atharva.kothawade@dream11.com' }
  s.source           = { :git => 'https://github.com/dream11-atharva/flagshipHorizon.git', :tag => s.version.to_s }

  s.ios.deployment_target = '15.0'
  s.swift_versions        = ['5.7', '5.8', '5.9']

  # Core subspec (main SDK)
  s.subspec 'Core' do |core|
    core.ios.deployment_target = '15.0'
    core.source_files = 'Sources/Core/**/*.{swift}'
  end

  # OpenFeature adapter subspec
  s.subspec 'OpenFeature' do |ss|
    ss.ios.deployment_target = '15.0'
    ss.source_files = 'Sources/OpenFeatureAdapter/**/*.{swift}'
    ss.dependency 'OpenFeature', '~> 0.3'
    ss.dependency 'flagshipHorizon/Core'
  end

  # Default subspec includes Core only
  s.default_subspecs = ['Core', 'OpenFeature']
end
