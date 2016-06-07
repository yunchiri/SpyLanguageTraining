


source 'https://github.com/CocoaPods/Specs.git'
platform :ios, "9.0"

use_frameworks!

target "SpyLanguageTraining" do
pod "Koloda"
pod 'RealmSwift'
pod 'CountdownLabel'

pod 'ChameleonFramework/Swift'


pod 'TisprCardStack', '~> 0.3.0'


post_install do |installer|
`find Pods -regex 'Pods/pop.*\\.h' -print0 | xargs -0 sed -i '' 's/\\(<\\)pop\\/\\(.*\\)\\(>\\)/\\"\\2\\"/'`
end

end