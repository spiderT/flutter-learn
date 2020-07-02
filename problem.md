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

