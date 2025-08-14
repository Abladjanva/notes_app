
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notes_app/firebase_features/models/user_model.dart';

class UserDataSource {
  final CollectionReference _user =
      FirebaseFirestore.instance.collection('users');
  Future<void> createUser(UserModel user) async {
    try {
      await _user.doc(user.id).set(user.toMap());
    } catch (e) {
      throw Exception('Failed to create user: $e');
    }
  }

  Future<List<UserModel>> getUsers() async {
    try {
      final QuerySnapshot snapshot = await _user.get();
      final List<UserModel> user = snapshot.docs.map((e) {
        final Map<String, dynamic> data = e.data() as Map<String, dynamic>;
        data['id'] = e.id;
        return UserModel.fromMap(data);
      }).toList();
      return user;
    } catch (e) {
      throw Exception('Failed to fetch users: $e');
    }
  }
}
