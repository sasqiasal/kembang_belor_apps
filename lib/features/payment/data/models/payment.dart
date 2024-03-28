// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';

class GetPaymentModel extends GetPaymentEntity {
  GetPaymentModel({required super.token, required super.redirected_url});

  GetPaymentModel copyWith({
    String? token,
    String? redirected_url,
  }) {
    return GetPaymentModel(
      token: token ?? this.token,
      redirected_url: redirected_url ?? this.redirected_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'redirected_url': redirected_url,
    };
  }

  factory GetPaymentModel.fromMap(Map<String, dynamic> map) {
    return GetPaymentModel(
      token: map['token'] as String,
      redirected_url: map['redirected_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPaymentModel.fromJson(String source) =>
      GetPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GetPaymentModel(token: $token, redirected_url: $redirected_url)';

  @override
  bool operator ==(covariant GetPaymentModel other) {
    if (identical(this, other)) return true;

    return other.token == token && other.redirected_url == redirected_url;
  }

  @override
  int get hashCode => token.hashCode ^ redirected_url.hashCode;
}
