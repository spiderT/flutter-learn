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
    type: 1,
    content: 'how are you',
    fromId: 'zhizhuxia',
    toId: 'ivy',
    id: DateTime.now().millisecondsSinceEpoch,
  ),
  new MsgModel(
    type: 1,
    content: 'fine, thank you',
    fromId: 'ivy',
    toId: 'zhizhuxia',
    id: DateTime.now().millisecondsSinceEpoch,
  ),
];
