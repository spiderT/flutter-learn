# 踩坑合集

## 1. Flutter Web

1. Flutter web 发送 WebSockets 时，浏览器报错：  

Unsupported operation: Platform._version  
See also: https://flutter.dev/docs/testing/errors  
但是使用 Android 和 IOS 就没有问题。  

原因： Flutter 的 dart.io 操作不支持 web 端使用。  

## 2. Flutter Desktop

1. 服务端用ws库，node启动了一个服务，但是flutter 的websocket连接不上  

