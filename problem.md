# 踩坑合集

## 1. Flutter Web

1. Flutter web 发送 WebSockets 时，浏览器报错：  

Unsupported operation: Platform._version  
See also: https://flutter.dev/docs/testing/errors  
但是使用 Android 和 IOS 就没有问题。  

原因： Flutter 的 dart.io 操作不支持 web 端使用。  

## 2. Flutter Desktop

1. 服务端用ws库，node启动了一个服务，但是flutter 的websocket连接不上  

原因：  
Entitlements and the App Sandbox  
macOS builds are configured by default to be signed, and sandboxed with App Sandbox. This means that if you want to confer specific capabilities or services on your macOS app, such as the following:  

Accessing the internet  
Capturing movies and images from the built-in camera  
Accessing files  
Then you must set up specific entitlements in Xcode. The following section tells you how to do this.  

https://developer.apple.com/documentation/security/hardened_runtime配置沙箱权限  



2. desktop 问题

https://flutter.cn/desktop  
https://flutter.dev/desktop  

设置权限  
在 macos/Runner/*.entitlements 文件中完成管理沙盒的设置。当编辑这些文件时，您不应该删除原来的 Runner-DebugProfile.entitlements 中的条款（它们会支持传入网络连接和 JIT），因为 debug 和 profile 模式正常工作需要它们。

如果您习惯通过 Xcode capabilities UI 来管理权限文件，请注意 capabilities 编辑器只更新两个文件中的一个，在某些情况下，它会创建一个全新的权限文件，并且切换项目，使其应用于所有配置。这些情况都会导致问题。我们建议您直接编辑这些文件。除非有非常特殊的原因，否则您应该始终对两个文件进行相同的更改。  

如果您保持 App Sandbox 可用（如果您计划在 App Store 上发布应用，这是必需的），当您添加某些插件或其他本地功能时，您需要管理应用的权限。例如，使用 file_chooser 插件需要添加 com.apple.security.files.user-selected.read-only 或 com.apple.security.files.user-selected.read-write 权限。另一个通常使用到的权限是 com.apple.security.network.client，如果您想要进行网络请求，那么必须添加它。  

假设您没有设置 com.apple.security.network.client 权限，网络请求将会失败，并显示如下消息：

```text
content_copy
flutter: SocketException: Connection failed
(OS Error: Operation not permitted, errno = 1),
address = example.com, port = 443
```

3. flutter build macos——Building without sound null safety

解决方法：https://stackoverflow.com/questions/65504664/how-to-build-apk-with-no-sound-null-safety  

## 3. 其他问题

### 3.1. Cannot run with sound null safety because dependencies don't support null safety

解决方法：https://stackoverflow.com/questions/64917744/cannot-run-with-sound-null-safety-because-dependencies-dont-support-null-safety  

### 3.2. Error: The method 'inheritFromWidgetOfExactType' isn't defined for the class 'BuildContext'

解决方法：https://stackoverflow.com/questions/65749767/error-the-method-inheritfromwidgetofexacttype-isnt-defined-for-the-class-bu  

### 3.3. error: The sandbox is not in sync with the Podfile.lock. Run 'pod install' or update your CocoaPods installation.

从flutter config --enable-web 切换到移动端或桌面端会遇到这个问题  

解决方法：https://stackoverflow.com/questions/63226903/how-to-resolve-an-error-the-sandbox-is-not-in-sync-with-the-podfile-lock  

```text
cd macos  # 移动端 cd ios
flutter pub get
pod install
pod update
```

### 3.4. Flutter web 开发 “Unsupported operation: Platform._version”

https://pub.dev/packages/web_socket_channel  
https://pub.dev/packages/shelf_web_socket  

### 3.5. Dart Error: Can't load Kernel binary: Invalid SDK hash.

https://github.com/flutter/flutter/issues/67222  

### 3.6. flutter Invalid depfile

flutter clean

### 3.7. ios模拟器唤不起键盘, 安卓模拟器正常，可以唤起键盘  

原因：由于在iOS8.0及以后的模拟器中,Xcode默认是使用电脑键盘作为外接键盘，将不会不再弹出虚拟键盘。  

怎么取消使用电脑键盘作为外接键盘呢? IO->Keyboard->消选Connect Hardware Keyboard即可。  

### 3.8. 'IPHONEOS_DEPLOYMENT_TARGET' is set to 8.0, but the range of supported deployment target versions is 9.0 to 14.5.99.


解决方法：https://stackoverflow.com/questions/63973136/the-ios-deployment-target-iphoneos-deployment-target-is-set-to-8-0-in-flutter  

修改 ios 目录下的 Podfile 文件  

```text
post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
```

### 3.9. Error: Not found: 'dart:html'

原因：两端代码在同一工程，由于app端没有dart:html 文件编译时会报错Error: Not found: 'dart:html'  

问题在：import 'package:web_socket_channel/html.dart';  
