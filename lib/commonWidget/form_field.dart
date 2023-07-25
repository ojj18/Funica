import 'package:flutter/material.dart';

class CommonFormField extends StatelessWidget {
  const CommonFormField(
      {this.initialText,
      this.currentFocusNode,
      this.textController,
      this.hintText,
      this.onChanged,
      this.onError,
      this.onSave,
      this.prefixIcon,
      this.suffixIcon,
      this.suffixIconEvent,
      this.obscureText = false,
      this.isPrefixIcon = true,
      this.isSuffixIcon = true,
      this.height = 50,
      this.width,
      this.keyboardType,
      this.prefixIconColor,
      this.suffixIconColor,
      this.prefixIconSize,
      this.suffixIconSize,
      super.key});

  final String? hintText;
  final String? initialText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? suffixIconEvent;
  final Function? onError;
  final Function? onSave;
  final Function? onChanged;
  final TextEditingController? textController;
  final FocusNode? currentFocusNode;
  final bool obscureText;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  final double? height;
  final double? width;
  final TextInputType? keyboardType;
  final Color? prefixIconColor;
  final Color? suffixIconColor;
  final double? prefixIconSize;
  final double? suffixIconSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.grey.shade100, borderRadius: BorderRadius.circular(15)),
      child: TextFormField(
        style: const TextStyle(
          color: Color(0xff5b5b5b),
          fontSize: 14,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
          ),
          prefixIcon: isPrefixIcon
              ? Icon(
                  prefixIcon,
                  color: prefixIconColor ?? const Color(0xff8bad1c),
                  size: prefixIconSize,
                )
              : null,
          suffixIcon: isSuffixIcon
              ? IconButton(
                  icon: Icon(
                    suffixIcon,
                    size: suffixIconSize,
                  ),
                  onPressed: suffixIconEvent,
                  color: suffixIconColor ?? const Color(0xff8bad1c),
                )
              : null,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Colors.transparent,
              ),
              borderRadius: BorderRadius.circular(15)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                width: 1,
                color: Color(0xff8bad1c),
              ),
              borderRadius: BorderRadius.circular(15)),
        ),
        obscureText: obscureText,
        initialValue: initialText,
        controller: textController,
        focusNode: currentFocusNode,
        keyboardType: keyboardType,
        onSaved: (value) {
          onSave!(value);
        },
        onChanged: (value) {
          onChanged!(value);
        },
        validator: (value) {
          onError!(value);
          return null;
        },
      ),
    );
  }
}
