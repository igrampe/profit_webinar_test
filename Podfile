platform :ios, '11.0'
inhibit_all_warnings!
use_frameworks!

target 'TestWebinar_1' do
    pod 'Alamofire'
    pod 'ObjectMapper'
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '4.0'
        end
    end
end
