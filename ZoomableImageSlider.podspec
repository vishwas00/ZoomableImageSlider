#
# Be sure to run `pod lib lint ZoomableImageSlider.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = 'ZoomableImageSlider'
s.version          = '0.2.1'
s.summary          = 'ZoomableImageSlider is a simple iOS library for showing images from url in form of slider'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

s.description      = <<-DESC
ZoomableImageSlider is a simple iOS library for showing images in slider. It has following features-

Images are zoomable by double tap and by panning the finger as well.
Images are loaded from url (from internet).
Shows the image index as well.
Close the carousel by simply swiping down
Support for all device orientations
DESC

s.homepage         = 'https://github.com/vishwas00/ZoomableImageSlider'
# s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Vishwas Singh' => 'singh.vis00@gmail.com' }
s.source           = { :git => 'https://github.com/vishwas00/ZoomableImageSlider.git', :tag => s.version.to_s }
s.social_media_url = 'https://twitter.com/vishwas00'

s.ios.deployment_target = '8.0'

s.source_files = 'ZoomableImageSlider/Classes/*'

s.resource_bundles = {
   'ZoomableImageSlider' => ['ZoomableImageSlider/Assets/*.png']
 }

# s.public_header_files = 'Pod/Classes/**/*.h'
# s.frameworks = 'UIKit', 'MapKit'
s.dependency 'Kingfisher'
end
