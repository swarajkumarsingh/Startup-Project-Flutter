import 'package:flutter/material.dart';
import 'package:starter_project_flutter/features/home/widgets/grid_view_card.dart';

class PopularItemsGridView extends StatelessWidget {
  final String title;
  const PopularItemsGridView({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int itemCount = 5;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          child: Text(
            title,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: itemCount % 2 == 0
              ? (230 * itemCount) / 2
              : (230 * (itemCount + 1.3)) / 2,
          width: double.infinity,
          child: GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              crossAxisCount: 2,
              mainAxisExtent: 230, // here set custom Height You Want
            ),
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return const GridViewCard();
            },
            itemCount: itemCount,
          ),
        ),
      ],
    );
  }
}
