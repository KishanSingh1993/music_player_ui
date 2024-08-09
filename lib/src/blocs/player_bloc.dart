import 'package:flutter_bloc/flutter_bloc.dart';
import 'player_event.dart';
import 'player_state.dart';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  PlayerBloc() : super(PlayerInitial()) {
    // Handle PlayTrack event
    on<PlayTrack>((event, emit) {
      emit(PlayerPlaying(trackUrl: event.trackUrl, isDockVisible: true));
    });

    // Handle PauseTrack event
    on<PauseTrack>((event, emit) {
      if (state is PlayerPlaying) {
        emit(PlayerPaused(trackUrl: (state as PlayerPlaying).trackUrl, isDockVisible: true));
      }
    });

    // Handle StopTrack event
    on<StopTrack>((event, emit) {
      emit(PlayerStopped());
    });

    // Handle ShowPlayerDock event
    on<ShowPlayerDock>((event, emit) {
      if (state is PlayerPlaying) {
        emit(PlayerPlaying(trackUrl: (state as PlayerPlaying).trackUrl, isDockVisible: true));
      } else if (state is PlayerPaused) {
        emit(PlayerPaused(trackUrl: (state as PlayerPaused).trackUrl, isDockVisible: true));
      }
    });

    // Handle HidePlayerDock event
    on<HidePlayerDock>((event, emit) {
      if (state is PlayerPlaying) {
        emit(PlayerPlaying(trackUrl: (state as PlayerPlaying).trackUrl, isDockVisible: false));
      } else if (state is PlayerPaused) {
        emit(PlayerPaused(trackUrl: (state as PlayerPaused).trackUrl, isDockVisible: false));
      }
    });
  }
}