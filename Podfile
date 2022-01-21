# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'
target 'walkingApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for walkingApp
  pod 'NMapsMap'
  pod 'Alamofire'
  pod 'SwiftyJSON'

  pod 'GoogleSignIn', '~> 5.0.2'
  pod 'Firebase/Auth'
  pod 'Firebase/Firestore'
  pod 'Firebase/Core'
  pod 'Firebase/Database'

  pod 'Floaty', '~> 4.2.0'
  pod 'FloatingPanel'
  post_install do |pi|
      pi.pods_project.targets.each do |t|
          t.build_configurations.each do |bc|
             bc.build_settings['ARCHS[sdk=iphonesimulator*]'] =  `uname -m`
          end
      end
   end
end
