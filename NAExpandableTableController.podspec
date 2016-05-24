#
# pod lib lint NAExpandableTableController.podspec
#

Pod::Spec.new do |s|
  s.name             = "NAExpandableTableController"
  s.version          = "1.1.0"
  s.summary          = "An expandable UITableView implementation written in swift."
  s.description      = <<-DESC 
  An easy way to make an expandable UITableView written in Swift.
  DESC

  s.homepage         = "https://github.com/narciero/NAExpandableTableController"
  s.screenshots      = "http://g.recordit.co/UsDQ3oI0wg.gif"
  s.license          = 'MIT'
  s.author           = { "Nick A" => "narciero" }
  s.source           = { :git => "https://github.com/narciero/NAExpandableTableController.git", :tag => s.version.to_s }
  s.platform     = :ios, '8.0'
  s.requires_arc = true
  s.source_files = 'Pod/Classes/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
