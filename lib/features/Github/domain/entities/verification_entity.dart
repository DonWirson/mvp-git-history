import 'package:equatable/equatable.dart';

class VerificationEntity extends Equatable {
  final bool? verified;
  final String? reason;
  final dynamic signature;
  final dynamic payload;

  const VerificationEntity({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });
  @override
  List<Object?> get props => [
        verified,
        reason,
        signature,
        payload,
      ];
}
