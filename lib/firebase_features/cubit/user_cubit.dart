import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/firebase_features/cubit/user_state.dart';
import 'package:notes_app/firebase_features/service/user_data_source.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());
  Future<void> getUsers() async {
    emit(UserLoading());
    try {
      final user = await UserDataSource().getUsers();
      emit(UserLoaded(users: user));
    } catch (e) {
      emit(UserError(message: e.toString()));
    }
  }
}
