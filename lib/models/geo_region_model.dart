class GeoLocationModel {
  final String regionName;
  final List<String> regionStates;

  GeoLocationModel(this.regionName, this.regionStates);

  // GeoLocationModel.fromJson(Map<String, dynamic> json)
  //     : regionName = json['region_name'] as String,
  //       regionStates = json['region_states'] as List<String>;

  Map<String, dynamic> toJson() => {
        'region_name': regionName,
        'region_states': regionStates,
      };
  factory GeoLocationModel.fromJson(Map<String, dynamic> json) {
    return GeoLocationModel(
      json['region_name'] as String,
      (json['region_states'] as List).cast<String>(),
    );
  }
}
