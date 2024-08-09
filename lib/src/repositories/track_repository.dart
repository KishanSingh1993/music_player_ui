import '../models/track.dart';

class TrackRepository {
  List<Track> getTracks() {
    return [
      Track(title: 'Track 1', artist: 'Artist 1', url: 'url1'),
      Track(title: 'Track 2', artist: 'Artist 2', url: 'url2'),
      // Add more tracks here
    ];
  }
}
