import "package:bloc/bloc.dart";
import "package:flutter/material.dart";
import "package:textatize_landing/api/api.dart";

import "../../models/media.dart";

part "home_event.dart";

part "home_state.dart";

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  Media? media;

  HomeBloc() : super(HomeUnloaded()) {
    on<GetMedia>((event, emit) async {
      try {
        emit(HomeLoading());
        media = (await TextatizeApi().getMedia(event.mediaId)).media;
        emit(HomeLoaded());
      } catch (e) {
        if (e.toString().toLowerCase().contains("unknown")) {
          emit(HomeError("This media does not exist!"));
        } else {
          emit(HomeError(e.toString()));
        }
      }
    });
  }
}
