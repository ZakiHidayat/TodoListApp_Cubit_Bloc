import 'package:crud_todolist_cubit_bloc/shared/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final double height;
  final double width;
  final Color backgroundColor;

  const CustomButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.height,
      this.width = double.infinity,
      required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: StadiumBorder(),
            elevation: 0,
            side: const BorderSide(
              width: 1.0,
              color: Color(0xff1E1E1E),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            title,
            style: GoogleFonts.spaceGrotesk(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff1E1E1E)),
          )),
    );
  }
}
