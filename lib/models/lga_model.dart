class LGAModel {
  final String state;
  final List<String> lga;

  LGAModel(this.state, this.lga);

  LGAModel.fromJson(Map<String, dynamic> json)
      : state = json['State'] as String,
        lga = json['Tribe'] as List<String>;

  Map<String, dynamic> toJson() => {
        'state': state,
        'tribe': lga,
      };
}
