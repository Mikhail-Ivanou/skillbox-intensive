import 'dart:convert';

import 'package:rick_and_morty/data/dto/episodes_response.dart';
import 'package:rick_and_morty/data/dto/location_response.dart';
import 'package:rick_and_morty/models/episode.dart';
import 'package:rick_and_morty/models/error.dart';
import 'package:rick_and_morty/models/location.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/data/dto/person_response.dart';
import 'package:rick_and_morty/data/extensions/person_extension.dart';
import 'package:rick_and_morty/data/extensions/location_extension.dart';
import 'package:rick_and_morty/data/extensions/episodes_extension.dart';
import 'package:rick_and_morty/models/person.dart';

class DataProvider {
  static Future<List<Person>> loadPersons({int page = 1}) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character?page=$page'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final List<dynamic> persons = parsed['results'];
      return persons.map((e) {
        return PersonResponse.fromJson(e).toModel();
      }).toList();
    } else {
      return Future.error(response);
    }
  }

  static Future<List<Person>> loadPersonDetails(List<String> ids) async {
    if (ids.isEmpty) return [];
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/character/${ids.join(',')}'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      if (parsed is List) {
        return parsed.map((e) {
          return PersonResponse.fromJson(e).toModel();
        }).toList();
      } else {
        return [PersonResponse.fromJson(parsed).toModel()];
      }
    } else {
      return Future.error(response);
    }
  }

  static Future<Episode> loadEpisodeDetails(String id) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode/$id'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      return EpisodesResponse.fromJson(parsed).toModel();
    } else {
      return Future.error(response);
    }
  }

  static Future<List<Location>> loadLocations({int page = 1}) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/location?page=$page'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final List<dynamic> persons = parsed['results'];
      return persons.map((e) {
        return LocationResponse.fromJson(e).toModel();
      }).toList();
    } else {
      return Future.error(response);
    }
  }

  static Future<List<Episode>> loadEpisodes({int page = 1}) async {
    final response = await http.get(Uri.parse('https://rickandmortyapi.com/api/episode?page=$page'));
    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final List<dynamic> persons = parsed['results'];
      return persons.map((e) {
        return EpisodesResponse.fromJson(e).toModel();
      }).toList();
    } else {
      return Future.error(Errors(response.statusCode, response.reasonPhrase));
    }
  }
}
