import 'package:equatable/equatable.dart';

class EmailAddress extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const EmailAddress({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory EmailAddress.create(String value) {
    if (value.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value)) {
      return EmailAddress(
          value: value,
          errorMessage: 'Please insert valid email address',
          hasError: true);
    }
    return EmailAddress(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty =
      EmailAddress(value: '', errorMessage: '', hasError: false);
}
