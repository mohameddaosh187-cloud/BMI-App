import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {
  const GenderWidget({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    this.onTap,
  });
  final String image;
  final String title;
  final bool isSelected;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff24263B) : Color(0xff333244),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Image.asset(image),
              Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: .w400,
                  color: Color(0xff8B8C9E),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
