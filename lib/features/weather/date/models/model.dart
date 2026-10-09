
class OtpRequestModel {
  final String phone;
  final String deviceId;
  final String platform;

  const OtpRequestModel({
    required this.phone,
    required this.deviceId,
    required this.platform,
  });


  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'device_id': deviceId,
      'platform': platform,
    };
  }


  ////////// for fromJson always use factory
//   factory OtpRequestModel.fromJson(
//     Map<String,dynamic> json,
//   ){

//     return OtpRequestModel(
//       id: json['id'],
//       name: json['name'],
//     );

//  }

//  CurrentCityEntity toEntity(){
//     return CurrentCityEntity(
//        name:name,
//     );
//  }
}


