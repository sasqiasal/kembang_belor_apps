import 'package:equatable/equatable.dart';

class PhoneNumber extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const PhoneNumber({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory PhoneNumber.create(String value) {
    if (value.isEmpty || !RegExp(r'^(\+62|62|0)[0-9]{9,12}$').hasMatch(value)) {
      return PhoneNumber(
          value: value,
          errorMessage: 'Please insert valid phone number',
          hasError: true);
    }
    return PhoneNumber(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty =
      PhoneNumber(value: '', errorMessage: '', hasError: false);
}
