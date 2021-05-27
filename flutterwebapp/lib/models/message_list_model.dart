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
    content: '你好，我是蜘蛛侠，全名彼得·本杰明·帕克（Peter Benjamin Parker），是美国的一名普通学生。',
    fromId: 'zhizhuxia',
    toId: 'ivy',
    id: DateTime.now().millisecondsSinceEpoch,
  ),
  new MsgModel(
    type: 1,
    content: '很高兴认识你。',
    fromId: 'ivy',
    toId: 'zhizhuxia',
    id: DateTime.now().millisecondsSinceEpoch,
  ),
];
