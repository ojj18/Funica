import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  const CommonButton(
      {super.key,
      this.buttonText,
      this.onButtonTap,
      this.isBorderEnable = false,
      this.radius = 25,
      this.height = 50,
      this.width = 50,
      this.buttonTextColor = Colors.white,
      this.buttonIcon,
      this.iconColor = const Color(0xff8bad1c),
      this.elevation = 0.0});

  final String? buttonText;
  final void Function()? onButtonTap;
  final bool isBorderEnable;
  final double radius;
  final double height;
  final double width;
  final Color buttonTextColor;
  final IconData? buttonIcon;
  final Color iconColor;
  final double elevation;
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(radius),
      elevation: elevation,
      child: InkWell(
        onTap: onButtonTap!,
        child: Container(
            height: height,
            width: width,
            decoration: isBorderEnable
                ? BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                    ),
                    borderRadius: BorderRadius.circular(radius))
                : BoxDecoration(
                    color: const Color(0xff8bad1c),
                    borderRadius: BorderRadius.circular(radius)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buttonIcon != null
                    ? Icon(
                        buttonIcon,
                        color: iconColor,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  buttonText!,
                  style: TextStyle(color: buttonTextColor, fontSize: 14),
                ),
              ],
            )),
      ),
    );
  }
}
