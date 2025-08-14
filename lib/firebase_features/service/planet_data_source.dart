import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/firebase_features/models/planets_model.dart';

class PlanetDataSource {
  final CollectionReference _planets =
      FirebaseFirestore.instance.collection('planets');
  Future<List<PlanetsModel>> getPlanets() async {
    try {
      final QuerySnapshot snapshot = await _planets.get();
      return snapshot.docs
          .map(
              (doc) => PlanetsModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print("Error in getPlanets: $e");
      throw Exception('Failed to fetch planets: $e');
    }
  }
}
