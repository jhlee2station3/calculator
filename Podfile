# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'test5' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for test5
  pod 'Alamofire', '~> 4.4'
  pod ’SwiftyJSON’
  pod 'RealmSwift'

  target 'test5Tests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'test5UITests' do
    inherit! :search_paths
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '3.0'
    end
  end
end






