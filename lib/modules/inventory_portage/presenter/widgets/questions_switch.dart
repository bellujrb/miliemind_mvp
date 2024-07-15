import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';

class QuestionsSwitch extends StatefulWidget {
  final String text;
  final bool isSelected; 
  final Function(bool) onChanged; 

  const QuestionsSwitch({Key? key, required this.text, required this.isSelected, required this.onChanged}) : super(key: key);

  @override
  State<QuestionsSwitch> createState() => _QuestionsSwitchState();
}

class _QuestionsSwitchState extends State<QuestionsSwitch> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.poppins(
            textStyle: context.appTextStyles.smallBlack.copyWith(color: const Color(0xFF282828)),
          ),
        ),
        Transform.scale(
          scale: 1,
          child: Switch(
            value: widget.isSelected,
            onChanged: widget.onChanged, 
            activeColor: AppColors.primary,
            activeTrackColor: Colors.pink[100],
          ),
        ),
      ],
    );
  }
}
