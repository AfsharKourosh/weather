
import 'package:equatable/equatable.dart';

class OtpResponseEntity extends Equatable{
  final String id;
  final String phone;

  const OtpResponseEntity({
    required this.id,
    required this.phone,
  });

  @override
  List<Object?> get props =>[id,phone];
}
