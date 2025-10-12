import 'package:flutter/material.dart';

class MobileAppbar extends StatelessWidget {
  const MobileAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300, // set a nice expanded height
      pinned: true, // keeps title visible when scrolling
      backgroundColor: const Color.fromARGB(255, 15, 5, 59),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        background: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(45)),
          child: Image.asset('assets/appbara.gif', fit: BoxFit.cover),
        ),
        title: ClipRRect(
          child: Container(
            padding: EdgeInsets.zero,
            width: double.infinity,
            color: const Color.fromARGB(55, 53, 13, 139),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pixiverse',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      Text(
                        'Finding The Best Art',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                  Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
            ),
          ),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(0)),
        ),
      ),
    );
  }
}
