import 'package:flutter/material.dart';
import 'package:flutter_2_app/colors.dart';
import 'package:flutter_2_app/models/episode.dart';
import 'package:flutter_2_app/ui/episodes/episode_details.dart';

class EpisodeItem extends StatelessWidget {
  final Episode episode;

  const EpisodeItem({Key? key, required this.episode}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => EpisodeDetailsPage(episode: episode)));
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Center(
              child: Text(
                '${episode.name}\n',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Episode: ${episode.episode ?? 'NA'}'),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Air date: ${episode.airDate ?? 'NA'}\n',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Characters: ${episode.characters?.length ?? 'NA'}'),
          ],
        ),
      ),
    );
  }
}
