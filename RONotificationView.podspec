Pod::Spec.new do |s|
s.name             = 'RONotificationView'
s.version          = '0.1.0'
s.summary          = 'Helps you add different types of Notification Banners.'

s.description      = <<-DESC
RONotificationView helps you add Notification/Alert banners over your controller, view, or window with custom configuration and design.
DESC

s.homepage         = 'https://github.com/rahimkhalid/RONotificationView'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'Rahim Khalid' => 'jessanirahim@gmail.com' }
s.source           = { :git => 'https://github.com/rahimkhalid/RONotificationView.git', :tag => s.version.to_s }

s.ios.deployment_target = '11.0'
s.source_files = 'RONotificationView/RONotification/*'

s.static_framework = true

end
