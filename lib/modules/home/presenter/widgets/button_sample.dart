import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';

Widget buttonSample(
      BuildContext context, String title, bool isSelected, Function() onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 241,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.tertiary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Text(
          title,
          style: GoogleFonts.poppins(
            textStyle: isSelected
                ? context.appTextStyles.smallWhite
                : context.appTextStyles.smallBlack,
          ),
        ),
      ),
    );
  }