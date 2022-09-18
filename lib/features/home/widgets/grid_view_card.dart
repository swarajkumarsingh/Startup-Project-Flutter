import 'package:flutter/material.dart';
import 'package:starter_project_flutter/constants/themes/color.dart';

class GridViewCard extends StatelessWidget {
  const GridViewCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(7),
          bottomRight: Radius.circular(7),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            child: Image.network( 
              "https://media.istockphoto.com/photos/turquoise-arm-chair-isolated-on-white-background-front-view-of-picture-id1199428736?k=20&m=1199428736&s=612x612&w=0&h=vRS-zg2d6tF7jqQ8lI3oYFs_JC3fXdPCZhkvlEhHJkc=",
              height: 100,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Learn Python: The Complete Python Programming course",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Maximilian Schwarzmüller",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: const [
              Text(
                "4.4",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: kStarColor,
                ),
              ),
              Text(
                " (3,322)",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          const Text(
            "3,399",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
