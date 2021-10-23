import 'dart:async';
import 'dart:isolate';

// demo1 Future
// main() {
// Future(() => print('f1'));
// Future(() => print('f2'));
// Future(() => print('f3')).then((_) => print('then 3'));
// Future(() => null).then((_) => print('then 4'));
// }

// demo2 Future
// main() {
// Future(() => print('f1'));
// Future fx = Future(() => null);

// Future(() => print('f2')).then((_) {
//   print('f3');
//   scheduleMicrotask(() => print('f4'));
// }).then((_) => print('f5'));

// Future(() => print('f6'))
//     .then((_) => Future(() => print('f7')))
//     .then((_) => print('f8'));

// Future(() => print('f9'));

// fx.then((_) => print('f10'));

// scheduleMicrotask(() => print('f11'));
// print('f12');
// }

// demo3 异步函数
// 声明了一个延迟2秒返回Hello的Future，并注册了一个then返回拼接后的Hello 2019
Future<String> fetchContent() =>
    Future<String>.delayed(Duration(seconds: 2), () => "Hello")
        .then((x) => "$x 2019");
func() async => print(await fetchContent());

main() {
  print("func before");
  func();
  print("func after");
}

// demo4
//并发计算阶乘
// Future<dynamic> asyncFactoriali(n) async {
//   final response = ReceivePort(); //创建管道
//   //创建并发Isolate，并传入管道
//   await Isolate.spawn(_isolate, response.sendPort);
//   //等待Isolate回传管道
//   final sendPort = await response.first as SendPort;
//   //创建了另一个管道answer
//   final answer = ReceivePort();
//   //往Isolate回传的管道中发送参数，同时传入answer管道
//   sendPort.send([n, answer.sendPort]);
//   return answer.first; //等待Isolate通过answer管道回传执行结果
// }

// //Isolate函数体，参数是主Isolate传入的管道
// _isolate(initialReplyTo) async {
//   final port = ReceivePort(); //创建管道
//   initialReplyTo.send(port.sendPort); //往主Isolate回传管道
//   final message = await port.first as List; //等待主Isolate发送消息(参数和回传结果的管道)
//   final data = message[0] as int; //参数
//   final send = message[1] as SendPort; //回传结果的管道
//   send.send(syncFactorial(data)); //调用同步计算阶乘的函数回传结果
// }

// //同步计算阶乘
// int syncFactorial(n) => n < 2 ? n : n * syncFactorial(n - 1);
// main() async => print(await asyncFactoriali(4)); //等待并发计算阶乘结果
