Pod::Spec.new do |s|

  s.name         = "ColorUsering"
  s.version      = "0.01"
  s.summary      = "ColorUsering"

  s.description  = <<-DESC
                   * Detail about LoginMode framework.
                   DESC
  s.homepage     = "http://"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "未定义" => "undefined" }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/SuddenKey/test.git', :tag => s.version}
  s.requires_arc = true
  s.source_files ='Scr/UIColor.*'


  #s.preserve_paths = "MOA_Foundation.framework/*"
  #s.resources  = "MOA_Foundation.framework/*.{bundle,xcassets}"
  #s.vendored_frameworks = 'MOA_Foundation.framework'
  #s.xcconfig = { 'FRAMEWORK_SEARCH_PATHS' => '$(PODS_ROOT)/MOA_Foundation' }
  #s.dependency 'XXXX'

end
