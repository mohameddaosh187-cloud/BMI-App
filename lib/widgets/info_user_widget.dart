import 'package:flutter/material.dart';

class InfoUserWidget extends StatelessWidget {
  const InfoUserWidget({
    super.key,
    required this.title,
    required this.value,
    required this.add,
    required this.remove,
  });
  final String title;
  final int value;
  final void Function() add;
  final void Function() remove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff24263B),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: .spaceEvenly,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: .w300,
                color: Color(0xff8B8C9E),
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 40,
                fontWeight: .bold,
                color: Color(0xffFFFFFF),
              ),
            ),
            Row(
              mainAxisAlignment: .spaceAround,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff8B8C9E),
                  ),
                  onPressed: remove,
                  icon: Icon(Icons.remove, color: Colors.white, size: 35),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Color(0xff8B8C9E),
                  ),
                  onPressed: add,
                  icon: Icon(Icons.add, color: Colors.white, size: 35),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
