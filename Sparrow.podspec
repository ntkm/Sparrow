Pod::Spec.new do |s|
  s.name = 'Sparrow'
  s.version = '1.0.0'
  s.license = 'MIT'
  s.summary = 'A library for simplify iOS programming'
  s.homepage = 'https://github.com/IvanVorobei/Sparrow'
  s.authors = { 'Ivan Vorobei' => 'hello@ivanvorobei.by' }
  s.source = { :git => 'https://github.com/IvanVorobei/Sparrow.git', :tag => s.version.to_s }
  s.framework = 'UIKit'
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'sparrow/**/*.swift'

  s.subspec 'LaunchAnimation' do |launch_animation|
    launch_animation.source_files = 'sparrow/launch/animation/**/*.swift'
  end

end
