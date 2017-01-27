Pod::Spec.new do |s|
  s.name = 'Sparrow'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A library for simplify iOS programming'
  s.homepage = 'https://github.com/IvanVorobei/Sparrow'
  s.authors = { 'Ivan Vorobei' => 'hello@ivanvorobei.by' }
  s.platform = :ios 
  s.source = { :git => 'https://github.com/IvanVorobei/Sparrow.git', :tag => s.version.to_s }
  s.framework = 'UIKit'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.xcconfig = { 'SWIFT_VERSION' => '3.0' }
  s.default_subspec = 'Core'

  s.subspec 'Core' do |core|
    core.source_files = 'sparrow/**/*.swift'
  end

  s.subspec 'LaunchAnimation' do |launch_animation|
    launch_animation.source_files = 'sparrow/launch/animation/**/*.swift'
  end

end
