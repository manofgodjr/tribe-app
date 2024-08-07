class Tribe {
  final int index;
  final String state;
  final String tribes;

  Tribe(this.index, this.state, this.tribes);

  Tribe.fromJson(Map<String, dynamic> json)
      : index = json['Index'],
        state = json['State'] as String,
        tribes = json['Tribe'] as String;

  Map<String, dynamic> toJson() => {
        'id': index,
        'state': state,
        'tribe': tribes,
      };
}
