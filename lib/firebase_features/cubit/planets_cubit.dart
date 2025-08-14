import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/firebase_features/models/planets_model.dart';
import 'package:notes_app/firebase_features/service/planet_data_source.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsInitial());
  void loadPlanets() async {
    emit(PlanetsLoading());
    try {
      final planets = await PlanetDataSource().getPlanets();
      emit(PlanetsSuccess(planets));
    } catch (e) {
      emit(PlanetError('Failed to load planets: $e'));
    }
  }

  
}
