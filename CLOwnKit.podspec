Pod::Spec.new do |s|
  s.name             = 'CLOwnKit'
  s.version          = '0.1.2'
  s.summary          = 'CLOwnKit.'
  s.description      = <<-DESC
  A business layer Module.
                       DESC
  s.homepage         = 'https://github.com/tomboyt/CLOwnKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'tomboyt' => 'tomboyt@163.com' }
  s.source           = { :git => 'https://github.com/tomboyt/CLOwnKit.git', :tag => s.version.to_s }
  s.platform         = :ios, '9.0'
  s.swift_versions   = '5.0'
  s.source_files = 'CLOwnKit/Classes/**/*'
  s.resource_bundles = {
    'CLOwnKit' => ['CLOwnKit/Assets/*']
  }
  #s.static_framework = true
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.dependency 'SnapKit'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
end
