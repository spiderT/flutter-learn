class MsgModel {
  final int type;
  final String content;
  final String fromId;
  final String toId;
  final int id;

  // type,
    // 1 文本
    // 2 系统
    // 3 图片
  // content,
  // fromId,
  // toId,
  // id: DateTime.now().millisecondsSinceEpoch,

  MsgModel({this.type, this.content, this.fromId, this.toId, this.id});
}

List<MsgModel> dummyData = [
  new MsgModel(
    type: 2,
    content: '10:29',
    fromId: 'zhizhuxia',
    toId: 'me',
    id: DateTime.now().millisecondsSinceEpoch, 
  ),
  new MsgModel(
    type: 1,
    content: '你好，我是蜘蛛侠，很高兴认识你。命运无可掌控，充满了无奈、未知，然而，我依然要走下去。',
    fromId: 'zhizhuxia',
    toId: 'me',
    id: DateTime.now().millisecondsSinceEpoch,
  ),
  // new MsgModel(
  //   type: 3,
  //   content: 'xxxxx',
  //   fromId: 'zhizhuxia',
  //   toId: 'me',
  //   id: DateTime.now().millisecondsSinceEpoch,
  // ),
];
