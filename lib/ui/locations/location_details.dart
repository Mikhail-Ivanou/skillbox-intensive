import 'package:flutter/material.dart';
import 'package:flutter_2_app/data/provider.dart';
import 'package:flutter_2_app/models/episode.dart';
import 'package:flutter_2_app/models/location.dart';
import 'package:flutter_2_app/models/person.dart';
import 'package:flutter_2_app/ui/common/custom_sliver_grid_view.dart';
import 'package:flutter_2_app/ui/persons/person_small_item.dart';

class LocationDetailsPage extends StatelessWidget {
  final Location location;

  const LocationDetailsPage({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Person>>(
        future: DataProvider.loadPersonDetails(getCharactersIds(location.residents)),
        builder: (context, snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Location'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomScrollView(
                slivers: [
                  CustomSliverGridView(
                      header: _HeaderWidget(location: location),
                      items: snapshot.data?.map((e) => PersonCellWidget(person: e)).toList() ?? [])
                ],
              ),
            ),
          );
        });
  }
}

class _HeaderWidget extends StatelessWidget {
  final Location location;

  const _HeaderWidget({Key? key, required this.location}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        const SizedBox(
          height: 24,
        ),
        Center(
          child: Text(
            '${location.name}',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text('Type: ${location.type ?? 'NA'}'),
        const SizedBox(
          height: 8,
        ),
        Text(
          'Dimensions: ${location.dimension ?? 'NA'}',
        ),
        const SizedBox(
          height: 8,
        ),
        Text('Residents: ${location.residents?.length ?? 'NA'}'),
        const SizedBox(
          height: 16,
        ),
      ],
    );
  }
}
