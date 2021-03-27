import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty/colors.dart';
import 'package:rick_and_morty/models/person.dart';
import 'package:rick_and_morty/ui/person_detail/person_page.dart';

class PersonCellWidget extends StatelessWidget {
  final Person person;

  const PersonCellWidget({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PersonPage(person: person)));
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.cellBackground,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Hero(
                    tag: person.image,
                    child: Image.network(
                      person.image,
                      fit: BoxFit.cover,
                    ),
                  )),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  person.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ));
  }
}
