class Appointment {
  final String id;
  final String petName;
  final String vetName;
  final DateTime dateTime;
  final String clinic;
  final String reason;
  final double price;
  final bool isConfirmed;

  Appointment({
    required this.id,
    required this.petName,
    required this.vetName,
    required this.dateTime,
    required this.clinic,
    required this.reason,
    required this.price,
    this.isConfirmed = false,
  });

  Appointment copyWith({
    String? id,
    String? petName,
    String? vetName,
    DateTime? dateTime,
    String? clinic,
    String? reason,
    double? price,
    bool? isConfirmed,
  }) {
    return Appointment(
      id: id ?? this.id,
      petName: petName ?? this.petName,
      vetName: vetName ?? this.vetName,
      dateTime: dateTime ?? this.dateTime,
      clinic: clinic ?? this.clinic,
      reason: reason ?? this.reason,
      price: price ?? this.price,
      isConfirmed: isConfirmed ?? this.isConfirmed,
    );
  }
}