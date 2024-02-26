import 'dart:convert';

import '../../domain/entities/verification_entity.dart';

class VerificationModel extends VerificationEntity {
  const VerificationModel({
    bool? verified,
    String? reason,
    dynamic signature,
    dynamic payload,
  }) : super(
          payload: payload,
          reason: reason,
          signature: signature,
          verified: verified,
        );
  factory VerificationModel.fromRawJson(String str) =>
      VerificationModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerificationModel.fromJson(Map<String, dynamic> json) =>
      VerificationModel(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );

  Map<String, dynamic> toJson() => {
        "verified": verified,
        "reason": reason,
        "signature": signature,
        "payload": payload,
      };
}
