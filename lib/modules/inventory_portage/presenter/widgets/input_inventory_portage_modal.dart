import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/extensions/build_context_utils.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/data/cognitive/cognitive_zero_to_one.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/data/language/language_zero_to_one.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/data/motor/motor_zero_to_one.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/data/self_care/selfcare_zero_to_one.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/data/socialization/socialization_zero_to_one.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/model/questions_model.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/button_sample_input.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/questions_inventory_portage_modal.dart';
import '../imports_inventory_portage.dart';

class InputInventoryPortageModal extends StatefulWidget {
  const InputInventoryPortageModal({Key? key}) : super(key: key);

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.5),
      builder: (context) => const InputInventoryPortageModal(),
    );
  }

  @override
  State<InputInventoryPortageModal> createState() =>
      _InputInventoryPortageModalState();
}

class _InputInventoryPortageModalState
    extends State<InputInventoryPortageModal> {
  int _selectedAge = 0;
  int _selectedMonth = 0;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Center(
        child: Container(
          height: 376,
          width: 624,
          decoration: BoxDecoration(
            color: AppColors.tertiary.withOpacity(0.9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Inventario Portage Data",
                    style: GoogleFonts.poppins(
                      textStyle: context.appTextStyles.bigBlack,
                    ),
                  ),
                  const SizedBox(height: 35),
                  _buildAgeDropdown(),
                  const SizedBox(height: 20),
                  _buildMonthDropdown(),
                  const SizedBox(height: 20),
                  buttonSampleInput(
                    context,
                    title: "Continuar",
                    width: context.mediaWidth * 0.9,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {

                        Navigator.of(context).pop();

                        int age = _selectedAge;
                        final months = _selectedMonth;
                        List<List<QuestionsModel>> questionLists = [];

                        if (months > 6) {
                          age++;
                        }

                        if (age >= 0 && age <= 1) {
                          questionLists = [
                            cognitiveZeroToOneList,
                            languageZeroToOneList,
                            motorZeroToOneList,
                            selfCareZeroToOneList,
                            socializationZeroToOneList,
                          ];
                        } else if (age > 1 && age <= 2) {
                          questionLists = [
                            cognitiveOneToTwoList,
                            languageOneToTwoList,
                            motorOneToTwoList,
                            selfCareOneToTwoList,
                            socializationOneToTwoList,
                          ];
                        } else if (age > 2 && age <= 3) {
                          questionLists = [
                            cognitiveTwoToThreeList,
                            languageTwoToThreeList,
                            motorTwoToThreeList,
                            selfCareTwoToThreeList,
                            socializationTwoToThreeList,
                          ];
                        } else if (age > 3 && age <= 4) {
                          questionLists = [
                            cognitiveThreeToFourList,
                            languageThreeToFourList,
                            motorThreeToFourList,
                            selfCareThreeToFourList,
                            socializationThreeToFourList,
                          ];
                        } else if (age > 4 && age <= 5) {
                          questionLists = [
                            cognitiveFourToFiveList,
                            languageFourToFiveList,
                            motorFourToFiveList,
                            selfCareFourToFiveList,
                            socializationFourToFiveList,
                          ];
                        } else if (age > 5 && age <= 6) {
                          questionLists = [
                            cognitiveFiveToSixList,
                            languageFiveToSixList,
                            motorFiveToSixList,
                            selfCareFiveToSixList,
                            socializationFiveToSixList,
                          ];
                        }

                        QuestionInventoryPortageModal.show(
                          context,
                          questionLists,
                          [
                            "Cognitive",
                            "Language",
                            "Motor",
                            "Self Care",
                            "Socialization",
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAgeDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedAge,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.onTertiary)),
        labelText: "Idade do Paciente (anos)",
        labelStyle: GoogleFonts.poppins(
            textStyle: context.appTextStyles.smallBlack
                .copyWith(fontWeight: FontWeight.normal)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.onTertiary)),
        filled: true,
        fillColor: Colors.white,
      ),
      items: List.generate(7, (index) {
        return DropdownMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Icon(Icons.child_care, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                "$index Ano${index != 1 ? 's' : ''}",
                style: TextStyle(color: AppColors.gray),
              ),
            ],
          ),
        );
      }),
      onChanged: (value) {
        setState(() {
          _selectedAge = value!;
        });
      },
      validator: (value) {
        if (value == null || value < 0 || value > 6) {
          return "Idade deve ser entre 0 e 6";
        }
        return null;
      },
    );
  }

  Widget _buildMonthDropdown() {
    return DropdownButtonFormField<int>(
      value: _selectedMonth,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.onTertiary)),
        labelText: "Meses do Paciente",
        labelStyle: GoogleFonts.poppins(
            textStyle: context.appTextStyles.smallBlack
                .copyWith(fontWeight: FontWeight.normal)),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppColors.onTertiary)),
        filled: true,
        fillColor: Colors.white,
      ),
      items: List.generate(12, (index) {
        return DropdownMenuItem<int>(
          value: index,
          child: Row(
            children: [
              Icon(Icons.calendar_month, color: AppColors.primary),
              const SizedBox(width: 10),
              Text(
                "$index Meses",
                style: TextStyle(color: AppColors.gray),
              ),
            ],
          ),
        );
      }),
      onChanged: (value) {
        setState(() {
          _selectedMonth = value!;
        });
      },
      validator: (value) {
        if (value == null || value < 0 || value > 11) {
          return "Meses devem ser entre 0 e 11";
        }
        return null;
      },
    );
  }
}
