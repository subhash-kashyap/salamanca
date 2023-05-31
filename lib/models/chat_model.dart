class SaulModel {
  final String msg;
  final int chatIndex;

  SaulModel({required this.msg, required this.chatIndex});

  factory SaulModel.fromJson(Map<String, dynamic> json) => SaulModel(
        msg: json["msg"],
        chatIndex: json["chatIndex"],
      );
}
