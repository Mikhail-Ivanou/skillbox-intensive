import 'package:flutter/material.dart';
import 'package:flutter_2_app/colors.dart';
import 'package:flutter_2_app/models/location.dart';
import 'package:flutter_2_app/ui/locations/location_details.dart';

class LocationItem extends StatelessWidget {
  final Location location;

  const LocationItem({Key? key, required this.location}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LocationDetailsPage(location: location)));
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
                '${location.name}\n',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Type: ${location.type ?? 'NA'}'),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Dimension: ${location.dimension ?? 'NA'}\n',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Text('Residents: ${location.residents?.length ?? 'NA'}'),
          ],
        ),
      ),
    );
  }
}
