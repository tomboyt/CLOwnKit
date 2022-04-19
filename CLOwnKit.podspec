Pod::Spec.new do |s|
  s.name             = 'CLOwnKit'
  s.version          = '0.1.1'
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
    'CLOwnKit' => ['CLOwnKit/Assets/*.{xcassets,nib}']
  }
  s.static_framework = true
  s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
  s.dependency 'CPAnimationKit'
  s.dependency 'HandyJSON', '~> 5.0.1'
  s.dependency 'SwiftyJSON'
  s.dependency 'Moya'
  s.dependency 'SnapKit'
  s.dependency 'Kingfisher'
  s.dependency 'IQKeyboardManagerSwift'
  s.dependency 'RxSwift'
  s.dependency 'RxCocoa'
  s.dependency 'DNSPageView'
  s.dependency 'DZNEmptyDataSet'
  s.dependency 'LSTPopView'
  s.dependency 'SVProgressHUD'
  s.dependency 'TXIMSDK_Plus_iOS'
  s.dependency 'lottie-ios' , '~> 2.5.3'
end
