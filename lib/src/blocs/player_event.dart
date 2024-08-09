import 'package:equatable/equatable.dart';
import '../models/track.dart';

abstract class PlayerEvent extends Equatable {
  const PlayerEvent();

  @override
  List<Object> get props => [];
}

class PlayTrack extends PlayerEvent {
  final String trackUrl;

  const PlayTrack({required this.trackUrl});

  @override
  List<Object> get props => [trackUrl];
}

class PauseTrack extends PlayerEvent {
  final String trackUrl;

  const PauseTrack({required this.trackUrl});

  @override
  List<Object> get props => [trackUrl];
}

class StopTrack extends PlayerEvent {}

class ShowPlayerDock extends PlayerEvent {}

class HidePlayerDock extends PlayerEvent {}
