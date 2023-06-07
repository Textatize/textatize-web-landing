part of "home_bloc.dart";

@immutable
abstract class HomeEvent {}

class GetMedia extends HomeEvent {
  final String uniqueId;
  final BuildContext context;

  GetMedia({required this.uniqueId, required this.context});
}
