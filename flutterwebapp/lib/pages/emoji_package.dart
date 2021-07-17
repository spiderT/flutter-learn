// 自组件选择一个表情，通知父组件 发送消息
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Emoji extends StatelessWidget {
  Emoji({Key key, this.sendEmoji}) : super(key: key);
  final sendEmoji;
  final emojiArr = [
    '😊',
    '😢',
    '😄',
    '🔥',
    '👌',
    '👀',
    '🐦',
    '😯',
    '👎',
    '🤮',
    '🀄️',
    '😔',
    '😁',
    '👿',
    '🐢',
    '🐑',
    '🐎',
    '🐷',
    '😍',
    '❤️',
    '🌹',
    '💩',
    '👼',
    '🍦',
    '🍰',
    '🐻',
    '🍞',
    '🐼',
    '🐟',
    '🐬',
    '⛽️',
    '🏠',
    '🚗',
    '😼',
    '🚴‍',
    '🏃‍',
    '😯',
    '🐶',
    '👸',
    '🧙‍',
    '🌧️',
    '🌞',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 240,
        width: 200,
        padding: EdgeInsets.all(6.0),
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 6,
          itemCount: emojiArr.length,
          itemBuilder: (BuildContext context, int index) => new Container(
            child: GestureDetector(
              child: new Text(
                emojiArr[index],
                style: TextStyle(
                  fontSize: 28.0,
                ),
              ),
              onTap: () {
                print(emojiArr[index]);
                this.sendEmoji(emojiArr[index]);
              },
            ),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(1, 1),
          mainAxisSpacing: 2.0,
          crossAxisSpacing: 2.0,
        ));
  }
}
