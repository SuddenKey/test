Pod::Spec.new do |s|

  s.name         = "ColorUsering"
  s.version      = "0.01"
  s.summary      = "ColorUsering"

  s.description  = <<-DESC
                   * Detail about LoginMode framework.
                   DESC
  s.homepage     = "https://github.com/SuddenKey/wanhaoFirstLibText"
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { "未定义" => "undefined" }
  s.platform     = :ios, '8.0'
  s.ios.deployment_target = '8.0'
  s.source       = { :git => 'https://github.com/SuddenKey/test.git', :tag => s.version}
  s.requires_arc = true
  s.source_files = 'Scr/UIColor/*'

end
