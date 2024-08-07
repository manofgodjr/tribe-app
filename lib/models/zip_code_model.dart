class ZipcodeModel {
  final String state;
  final List<String> pcode;

  ZipcodeModel(this.state, this.pcode);

  ZipcodeModel.fromJson(Map<String, dynamic> json)
      : state = json['state'] as String,
        pcode = json['pcode'] as List<String>;

  Map<String, dynamic> toJson() => {
        'state': state,
        'pcode': pcode,
      };
}
