class PlanetsModel {
  final String id;
  final String name;
  final String description;
  final String image;
  final double distance;
  final double mass;
  final double gravity;
  final double hours;
  final double temp;
  final double velocity;

  PlanetsModel({
    required this.name,
    required this.id,
    required this.description,
    required this.image,
    required this.distance,
    required this.mass,
    required this.gravity,
    required this.hours,
    required this.temp,
    required this.velocity,
  });

  factory PlanetsModel.fromMap(Map<String, dynamic> map) {
    return PlanetsModel(
        id: map['id'] ?? '',
        name: map['name'] ?? '',
        description: map['description'] ?? '',
        image: map['image'] ?? '',
        distance: (map['distance'] as num?)?.toDouble() ?? 0.0,
        mass: (map['mass'] as num?)?.toDouble() ?? 0.0,
        gravity: (map['gravity'] as num?)?.toDouble() ?? 0.0,
        hours: (map['hours'] as num?)?.toDouble() ?? 0.0,
        temp: (map['temp'] as num?)?.toDouble() ?? 0.0,
        velocity: (map['velocity'] as num?)?.toDouble() ?? 0.0);
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'description': description,
      'image': image,
      'hours': hours,
      'distance': distance,
      'gravity': gravity,
      'mass': mass,
      'velocity': velocity,
    };
  }
}
 