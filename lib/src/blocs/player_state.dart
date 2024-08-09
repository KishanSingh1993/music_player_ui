import 'package:equatable/equatable.dart';
import '../models/track.dart';

abstract class PlayerState extends Equatable {
  final bool isDockVisible;

  const PlayerState({this.isDockVisible = false});

  @override
  List<Object> get props => [isDockVisible];
}

class PlayerInitial extends PlayerState {}

class PlayerPlaying extends PlayerState {
  final String trackUrl;

  const PlayerPlaying({required this.trackUrl, bool isDockVisible = true})
      : super(isDockVisible: isDockVisible);

  @override
  List<Object> get props => [trackUrl, isDockVisible];
}

class PlayerPaused extends PlayerState {
  final String trackUrl;

  const PlayerPaused({required this.trackUrl, bool isDockVisible = true})
      : super(isDockVisible: isDockVisible);

  @override
  List<Object> get props => [trackUrl, isDockVisible];
}

class PlayerStopped extends PlayerState {}
