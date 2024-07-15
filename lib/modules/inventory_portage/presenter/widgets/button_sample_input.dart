import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';

Widget buttonSampleInput(BuildContext context,
    {required String title, required double width, void Function()? onTap}) {
  return Material(
    child: InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 45,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColors.primary,
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: context.appTextStyles.smallWhite
          ),
        ),
      ),
    ),
  );
}
