import "package:flutter/material.dart";

class PopularList extends StatelessWidget {
  const PopularList({this.label, this.index, required this.onTap, super.key});
  final String? label;
  final VoidCallback onTap;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Container(
        width: 100,
        margin: const EdgeInsets.only(right: 5, left: 5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: index == 0 ? const Color(0xff8bad1c) : Colors.transparent,
          border: Border.all(
            width: 1.5,
            style: BorderStyle.solid,
            color: index == 0
                ? Colors.transparent
                : const Color(0xff5b5b5b).withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Center(
          child: Text(
            label!,
            style: TextStyle(
              fontSize: 14,
              color: index == 0 ? Colors.white : const Color(0xff5b5b5b),
            ),
          ),
        ),
      ),
    );
  }
}
