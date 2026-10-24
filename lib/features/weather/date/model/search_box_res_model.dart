import 'package:weather/features/weather/domain/entity/search_box_res_entity.dart';

class SearchBoxResModel {
  SearchBoxResModel({required this.data, required this.metadata});

  final List<Datum>? data;
  final Metadata? metadata;

  factory SearchBoxResModel.fromJson(Map<String, dynamic> json) {
    List<Datum> data = [];
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(Datum.fromJson(v));
      });
    }
    return SearchBoxResModel(
      data: data,
      metadata: json['metadata'] != null
          ? Metadata.fromJson(json['metadata'])
          : null,
    );
  }
  SearchBoxResEntity toEntity() {
    return SearchBoxResEntity(data: data, metadata: metadata);
  }
}

class Datum {
  final int id;
  final String wikiDataId;
  final String type;
  final String city;
  final String name;
  final String country;
  final String countryCode;
  final String region;
  final String regionCode;
  final String regionWdId;
  final double latitude;
  final double longitude;
  final int population;

  Datum({
    required this.id,
    required this.wikiDataId,
    required this.type,
    required this.city,
    required this.name,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionCode,
    required this.regionWdId,
    required this.latitude,
    required this.longitude,
    required this.population,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    wikiDataId: json["wikiDataId"],
    type: json["type"],
    city: json["city"],
    name: json["name"],
    country: json["country"],
    countryCode: json["countryCode"],
    region: json["region"],
    regionCode: json["regionCode"],
    regionWdId: json["regionWdId"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    population: json["population"],
  );
}

class Metadata {
  final int currentOffset;
  final int totalCount;

  Metadata({required this.currentOffset, required this.totalCount});

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
    currentOffset: json["currentOffset"],
    totalCount: json["totalCount"],
  );

  Map<String, dynamic> toJson() => {
    "currentOffset": currentOffset,
    "totalCount": totalCount,
  };
}
