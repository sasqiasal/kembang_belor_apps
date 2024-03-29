// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:kembang_belor_apps/features/payment/domain/entity/payment_entity.dart';

class GetPaymentModel extends GetPaymentEntity {
  GetPaymentModel({required super.token, required super.redirect_url});

  GetPaymentModel copyWith({
    String? token,
    String? redirect_url,
  }) {
    return GetPaymentModel(
      token: token ?? this.token,
      redirect_url: redirect_url ?? this.redirect_url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'redirect_url': redirect_url,
    };
  }

  factory GetPaymentModel.fromMap(Map<String, dynamic> map) {
    return GetPaymentModel(
      token: map['token'] as String,
      redirect_url: map['redirect_url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetPaymentModel.fromJson(String source) =>
      GetPaymentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'GetPaymentModel(token: $token, redirect_url: $redirect_url)';

  @override
  bool operator ==(covariant GetPaymentModel other) {
    if (identical(this, other)) return true;

    return other.token == token && other.redirect_url == redirect_url;
  }

  @override
  int get hashCode => token.hashCode ^ redirect_url.hashCode;
}
