import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/player_bloc.dart';
import '../blocs/player_event.dart';
import '../blocs/player_state.dart';



class PlayerDock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerBloc, PlayerState>(
      builder: (context, state) {
        return GestureDetector(
          onVerticalDragEnd: (_) {
            context.read<PlayerBloc>().add(HidePlayerDock());
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.black,  // Background color to match the screenshot
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/images/track_cover.png',  // Replace with actual image
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'How to make your business grow',  // Replace with actual track title
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '@ShellyShah',  // Replace with actual artist name
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        state is PlayerPaused ? Icons.play_arrow : Icons.pause,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        if (state is PlayerPlaying) {
                          context.read<PlayerBloc>().add(PauseTrack(trackUrl: state.trackUrl));
                        } else if (state is PlayerPaused) {
                          context.read<PlayerBloc>().add(PlayTrack(trackUrl: state.trackUrl));
                        }
                      },
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        // Implement favorite logic here
                      },
                    ),
                  ],
                ),
                // Add any other UI components needed
              ],
            ),
          ),
        );
      },
    );
  }
}










// class PlayerDock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PlayerBloc, PlayerState>(
//       builder: (context, state) {
//         if (state is PlayerPlaying) {
//           return GestureDetector(
//             onVerticalDragEnd: (_) {
//               context.read<PlayerBloc>().add(StopTrack());
//             },
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: Colors.blueGrey,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(16),
//                   topRight: Radius.circular(16),
//                 ),
//               ),
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Image.asset(
//                       'assets/images/track_cover.png', // Replace with actual image
//                       width: 60,
//                       height: 60,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         state.track.title,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                       ),
//                       Text(
//                         state.track.artist,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Colors.white70,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const Spacer(),
//                   IconButton(
//                     icon: const Icon(Icons.pause, color: Colors.white),
//                     onPressed: () {
//                       context.read<PlayerBloc>().add(PauseTrack(track: state.track));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         return const SizedBox.shrink();
//       },
//     );
//   }
// }




// class PlayerDock extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PlayerBloc, PlayerState>(
//       builder: (context, state) {
//         if (state is PlayerPlaying) {
//           return GestureDetector(
//             onVerticalDragEnd: (_) {
//               context.read<PlayerBloc>().add(StopTrack());
//             },
//             child: Container(
//               color: Colors.blueGrey,
//               padding: EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(state.track.title, style: TextStyle(color: Colors.white)),
//                   IconButton(
//                     icon: Icon(Icons.pause, color: Colors.white),
//                     onPressed: () {
//                       context.read<PlayerBloc>().add(PauseTrack(track: state.track));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         return SizedBox.shrink();
//       },
//     );
//   }
// }
