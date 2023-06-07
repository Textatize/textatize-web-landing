part of "home_bloc.dart";

@immutable
abstract class HomeEvent {}

class GetMedia extends HomeEvent {
  final String mediaId;
  final BuildContext context;

  GetMedia({required this.mediaId, required this.context});
}
