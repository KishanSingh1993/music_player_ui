import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player_bloc.dart';
import '../blocs/player_event.dart';
import '../blocs/player_state.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_bottom_nav_bar.dart';
import '../widgets/image_card.dart';
import '../widgets/player_dock.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: ListView.builder(
        itemCount: 15,  // Example count
        itemBuilder: (context, index) {
          return ImageCard(
            imageUrl: 'assets/images/track_cover.png',
            onTap: () {
              context.read<PlayerBloc>().add(PlayTrack(trackUrl: 'track_url_$index'));
              context.read<PlayerBloc>().add(ShowPlayerDock());
            },
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: BlocBuilder<PlayerBloc, PlayerState>(
        builder: (context, state) {
          return Visibility(
            visible: state.isDockVisible,
            child: PlayerDock(),
          );
        },
      ),
    );
  }
}
















// class HomeScreen extends StatelessWidget {
//   final TrackRepository trackRepository = TrackRepository();
//
//   @override
//   Widget build(BuildContext context) {
//     final tracks = trackRepository.getTracks();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Music Player UI'),
//       ),
//       body: ListView.builder(
//         itemCount: tracks.length,
//         itemBuilder: (context, index) {
//           final track = tracks[index];
//           return ListTile(
//             title: Text(track.title),
//             subtitle: Text(track.artist),
//             onTap: () {
//               context.read<PlayerBloc>().add(PlayTrack(track: track));
//             },
//           );
//         },
//       ),
//       bottomNavigationBar: PlayerDock(),
//     );
//   }
// }
