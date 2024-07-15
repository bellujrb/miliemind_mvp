import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/extensions/build_context_utils.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/button_sample_input.dart';

class SuccessInventoryPortageModal extends StatefulWidget {
  const SuccessInventoryPortageModal({
    Key? key,
  }) : super(key: key);

  static void show(BuildContext context) {
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
                child: const SuccessInventoryPortageModal(),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  State<SuccessInventoryPortageModal> createState() =>
      _SuccessInventoryPortageModalState();
}

class _SuccessInventoryPortageModalState
    extends State<SuccessInventoryPortageModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 440,
        width: 470,
        decoration: BoxDecoration(
          color: AppColors.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 260,
              width: context.mediaWidth * 1.0,
              child: Image.asset("assets/success_inventory_portage.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Resultado gerado com sucesso! ",
                    style: GoogleFonts.poppins(
                        textStyle: context.appTextStyles.smallBlack.copyWith(
                      color: const Color(0xFF282828),
                      fontSize: 20,
                    )),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Veja com mais detalhes no grafico gerado.",
                    style: GoogleFonts.poppins(
                      textStyle: context.appTextStyles.smallGray
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  buttonSampleInput(context,
                      title: "Ver grafico",
                      width: context.mediaWidth * 1.0, onTap: () {
                    Modular.to.navigate("inventory_portage_data");
                  })
                ],
              ),
            )
          ],
        ));
  }
}
