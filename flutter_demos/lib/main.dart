import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Welcome to Flutter'),
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Hello world',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18.0,
                    fontFamily: 'Courier',
                    backgroundColor: Colors.yellow,
                    decoration: TextDecoration.underline,
                    decorationStyle: TextDecorationStyle.dashed),
              ),
              Text(
                'Hello world! Welcome to Flutter. This part is for Text Widget!',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(text: 'Home: '),
                TextSpan(
                  text: 'https://flutterchina.club',
                  style: TextStyle(color: Colors.blue),
                ),
              ])),
              // Image(image: AssetImage('images/zhizhuxia.png'), width: 100.0),
              // Image(
              //     image: NetworkImage('https://picsum.photos/250?image=1'),
              //     width: 100.0),
              Image.asset('images/zhizhuxia.png', width: 100.0),
              Image.network('https://picsum.photos/250?image=1', width: 100.0),
              FadeInImage.memoryNetwork(
                  placeholder: kTransparentImage,
                  image: 'https://picsum.photos/250?image=2',
                  width: 100.0),
              FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.gif',
                  image: 'https://picsum.photos/250?image=9',
                  width: 100.0),
              CachedNetworkImage(
                  imageUrl: "http://xxx/xxx/jpg",
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  width: 100.0),
              new MaterialButton(
                child: new Text('MaterialButton'),
                onPressed: () {
                  print('MaterialButton');
                },
              ),
              new RaisedButton(
                child: new Text('RaisedButton'),
                onPressed: () {
                  print('RaisedButton');
                },
              ),
              new FlatButton(
                child: new Text('FlatButton'),
                onPressed: () {
                  print('FlatButton');
                },
              ),
              new IconButton(
                icon: new Icon(Icons.wifi),
                tooltip: 'click IconButton',
                onPressed: () {
                  print('IconButton');
                },
              ),
              new FloatingActionButton(
                child: new Icon(Icons.add_a_photo),
//            child: new Text('FloatingActionButton'),
                tooltip: 'click FloatingActionButton',
                onPressed: () {
                  print('FloatingActionButton');
                },
              ),
              OutlineButton(
                child: Text("OutlineButton"),
                borderSide: new BorderSide(color: Colors.pink),
                onPressed: () {
                  print('OutlineButton');
                },
              ),
              OutlineButton.icon(
                icon: Icon(Icons.add),
                label: Text("添加"),
                onPressed: () {
                  print('OutlineButton.icon');
                },
              ),
              FlatButton(
                color: Colors.blue,
                highlightColor: Colors.blue[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("Submit"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: () {
                  print('Submit');
                },
              )
            ]),
          )),
    );
  }
}
