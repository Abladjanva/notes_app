part of 'planets_cubit.dart';


abstract class PlanetsState {}
class PlanetsInitial extends PlanetsState{}
class PlanetsLoading extends PlanetsState{}
class PlanetsSuccess extends PlanetsState{
  final List<PlanetsModel> planets;
  PlanetsSuccess(this.planets);
}
class PlanetError extends PlanetsState{
  final String message;
  PlanetError(this.message);
}