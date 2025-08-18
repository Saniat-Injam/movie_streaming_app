// import 'package:flutter/material.dart';

// class CustomTextField extends StatelessWidget {
//   final TextEditingController controller;
//   final String? hintText;
//   final IconData icon;
//   final bool obscureText;
//   final VoidCallback? onTap;
//   final bool readOnly;

//   const CustomTextField({
//     super.key,
//     required this.controller,
//     required this.icon,
//     this.hintText, //
//     this.obscureText = false,
//     this.onTap,
//     this.readOnly = false,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       controller: controller,
//       obscureText: obscureText,
//       readOnly: readOnly,
//       onTap: onTap,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         prefixIcon: Icon(icon, color: Colors.white),
//         hintText: hintText,
//         hintStyle: const TextStyle(color: Colors.white54),
//         filled: true,
//         fillColor: Colors.black,
//         enabledBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white24),
//           borderRadius: BorderRadius.circular(8),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: const BorderSide(color: Colors.white),
//           borderRadius: BorderRadius.circular(8),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final IconData icon;
  final bool obscureText;
  final VoidCallback? onTap;
  final bool readOnly;

  /// 👇 Add this
  final ValueChanged<String>? onChanged;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.icon,
    this.hintText,
    this.obscureText = false,
    this.onTap,
    this.readOnly = false,
    this.onChanged, // 👈 optional callback
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      onChanged: onChanged, // 👈 wire it here
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
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
