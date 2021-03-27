import 'package:flutter/material.dart';
import 'package:flutter_2_app/colors.dart';
import 'package:flutter_2_app/models/person.dart';
import 'package:flutter_2_app/ui/person_detail/person_page.dart';

class PersonItem extends StatelessWidget {
  final Person item;

  const PersonItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonPage(person: item)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            //TODO correct image size
            ClipRRect(
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                child: Hero(
                  tag: item.image,
                  child: Image.network(
                    item.image,
                    width: 166,
                    height: 166,
                    fit: BoxFit.cover,
                  ),
                )),
            const SizedBox(
              width: 16,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 12,
                ),
                Text(
                  item.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Container(
                      height: 8,
                      width: 8,
                      decoration: BoxDecoration(
                          color: item.status == 'Alive' ? Colors.green : Colors.red,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Text(
                        '${item.status} - ${item.species}',
                        style: TextStyle(color: Colors.white),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  'Last known location:',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.location.name,
                  style: TextStyle(color: Colors.white),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Origin:',
                  style: TextStyle(color: AppColors.greyColor),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  item.origin.name,
                  style: TextStyle(color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(
                  height: 16,
                ),
              ],
            )),
            const SizedBox(
              width: 12,
            ),
          ],
        ),
      ),
    );
  }
}
