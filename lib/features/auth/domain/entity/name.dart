import 'package:equatable/equatable.dart';

class Name extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const Name({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory Name.create(String value) {
    if (value.isEmpty || !RegExp(r'^[a-zA-Z\s]+$').hasMatch(value)) {
      return Name(
          value: value,
          errorMessage: 'Please insert valid name',
          hasError: true);
    }
    return Name(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty = Name(value: '', errorMessage: '', hasError: false);
}
