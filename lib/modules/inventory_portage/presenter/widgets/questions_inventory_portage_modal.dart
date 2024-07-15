import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/extensions/build_context_utils.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';
import 'package:miliemind_mvp/modules/inventory_portage/infra/model/questions_model.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/button_sample_input.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/questions_switch.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/success_inventory_portage_modal.dart';

class QuestionInventoryPortageModal extends StatefulWidget {
  final List<List<QuestionsModel>> allQuestionsByType;
  final List<String> questionTypes;

  const QuestionInventoryPortageModal({
    Key? key,
    required this.allQuestionsByType,
    required this.questionTypes,
  }) : super(key: key);

  static void show(
      BuildContext context,
      List<List<QuestionsModel>> allQuestionsByType,
      List<String> questionTypes) {
    showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 500),
      pageBuilder: (context, animation, secondaryAnimation) {
        return GestureDetector(
          onTap: () {},
          child: Material(
            color: Colors.transparent,
            child: Center(
              child: GestureDetector(
                onTap: () {},
                child: QuestionInventoryPortageModal(
                  allQuestionsByType: allQuestionsByType,
                  questionTypes: questionTypes,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  State<QuestionInventoryPortageModal> createState() =>
      _QuestionInventoryPortageModalState();
}

class _QuestionInventoryPortageModalState
    extends State<QuestionInventoryPortageModal> {
  int currentIndex = 0;
  late List<QuestionsModel> filteredQuestions;
  late Map<int, List<bool>> selectedStatesMap;

  @override
  void initState() {
    super.initState();
    selectedStatesMap = {};
    filterQuestionsByType(widget.questionTypes.first);
  }

  List<QuestionsModel> filterQuestionsByType(String type) {
    final index = widget.questionTypes.indexOf(type);
    currentIndex = index;
    if (!selectedStatesMap.containsKey(index)) {
      selectedStatesMap[index] =
          List.generate(widget.allQuestionsByType[index].length, (_) => false);
    }
    filteredQuestions = widget.allQuestionsByType[index];
    return filteredQuestions;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: context.mediaHeight * 0.8,
        width: context.mediaWidth * 0.7,
        decoration: BoxDecoration(
          color: AppColors.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: context.mediaWidth * 1.0,
                child: Column(
                  children: [
                    Text(
                      "Perguntas sobre ${widget.questionTypes[currentIndex]}",
                      style: GoogleFonts.poppins(
                          textStyle: context.appTextStyles.mediumBlack),
                    ),
                    Text(
                      "Assinale para afirmar a pergunta.",
                      style: GoogleFonts.poppins(
                          textStyle: context.appTextStyles.smallGray),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: filteredQuestions.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: QuestionsSwitch(
                        text: filteredQuestions[index].description,
                        isSelected: selectedStatesMap[currentIndex]![index],
                        onChanged: (isSelected) {
                          setState(() {
                            selectedStatesMap[currentIndex]![index] =
                                isSelected;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              buttonSampleInput(context,
                  title: "Continue",
                  width: context.mediaWidth * 0.9, onTap: () {
                for (var i = 0;
                    i < selectedStatesMap[currentIndex]!.length;
                    i++) {
                  filteredQuestions[i].result =
                      selectedStatesMap[currentIndex]![i];
                }
                if (kDebugMode) {
                  print("Result:");
                }
                for (var question in filteredQuestions) {
                  if (kDebugMode) {
                    print(
                        "Question: ${question.description}, Result: ${question.result}");
                  }
                }

                if (currentIndex < widget.questionTypes.length - 1) {
                  currentIndex++;
                  setState(() {
                    filterQuestionsByType(widget.questionTypes[currentIndex]);
                  });
                } else {
                  Navigator.of(context).pop();
                  SuccessInventoryPortageModal.show(context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
