

import "package:bloc/bloc.dart";
import "package:flutter/material.dart";

part "home_event.dart";
part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeUnloaded()) {
    on<GetMedia>((event, emit) async {
      try {
        emit(HomeLoading());

        emit(HomeLoaded());
      } catch(e) {
        emit(HomeError(e.toString()));
      }
    });
  }
}
