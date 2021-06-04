class BmiData {
  String name;
  int height;
  int weight;
  double bmi;
  DateTime date;

  BmiData({
    required this.name,
    required this.height,
    required this.weight,
    required this.bmi,
    required this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'height': height,
      'weight': weight,
      'bmi': bmi,
      'date': date.toIso8601String(),
    };
  }

  factory BmiData.fromJson(Map<String, dynamic> json) {
    return BmiData(
      name: json['name'],
      height: json['height'],
      weight: json['weight'],
      bmi: json['bmi'],
      date: DateTime.parse(json['date']),
    );
  }

  @override
  String toString() {
    return 'name: ' +
        name +
        'height: ' +
        '$height' +
        'weight: ' +
        '$weight' +
        'bmi' +
        '$bmi' +
        'date' +
        '$date';
  }
}
