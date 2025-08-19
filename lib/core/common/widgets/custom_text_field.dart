import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData? icon;
  final String? svgIconPath;

  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.icon,
    this.svgIconPath,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontFamily: "HelveticaNeue"),
      decoration: InputDecoration(
        prefixIcon: svgIconPath != null
            ? Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset(svgIconPath!),
              )
            : Icon(icon, color: Colors.white),

        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white54,
          fontFamily: "HelveticaNeue",
        ),
        filled: true,
        fillColor: Colors.black,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white24),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
