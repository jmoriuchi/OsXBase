#
# Be sure to run `pod lib lint OsXBase.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'OsXBase'
  s.version          = '0.1.0'
  s.summary          = 'The base framework for osX applications.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
OsXBase is the base framework for osX applications.
The framework provides utility functionarities and methods for logs.
                       DESC

  s.homepage         = 'https://github.com/yaiyai/OsXBase'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Junichi Moriuchi' => 'jmoriuchi@icloud.com' }
  s.source           = { :git => 'https://github.com/yaiyai/OsXBase.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

#  s.ios.deployment_target = '8.0'

  s.platform = :osx, '10.11'

  s.source_files = 'OsXBase/Classes/**/*'
  
  # s.resource_bundles = {
  #   'OsXBase' => ['OsXBase/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
