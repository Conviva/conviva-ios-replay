Pod::Spec.new do |s|
  s.name             = "ConvivaReplay"
s.version='0.0.2'
  s.summary          = "A plugabble sdk for recording user sessions and helps in replaying them in pulse."
  s.description      = <<-DESC
 A plugabble sdk for recording user sessions and helps in replaying them in pulse.
                       DESC
  s.homepage         = "https://github.com/Conviva/conviva-ios-replay"
  s.license          = { :type => 'Commercial', :text => 'LICENSE.md' }
  s.author           = { "Conviva" => "www.conviva.com" }
  s.source           = { :git => "https://github.com/Conviva/conviva-ios-replay.git", :tag => s.version.to_s }

  s.swift_version = '5.3'
  s.ios.deployment_target = '15.0'
  s.requires_arc = true
  s.static_framework = true
  s.vendored_frameworks = 'Framework/ConvivaReplay.xcframework'
  s.frameworks = 'Foundation'
  s.pod_target_xcconfig = { "DEFINES_MODULE" => "YES" }

end

