import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';
import 'package:miliemind_mvp/modules/home/presenter/widgets/build_drawer.dart';
import 'package:miliemind_mvp/modules/home/presenter/widgets/button_sample.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/input_inventory_portage_modal.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/results_inventory_portage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1000;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: InkWell(
          onTap: () {
            InputInventoryPortageModal.show(context);
          },
          child: Container(
            alignment: Alignment.center,
            height: 40,
            width: 182,
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16)),
            child: Text(
              "Criar Relatorio",
              style: GoogleFonts.poppins(
                  textStyle: context.appTextStyles.smallWhite),
            ),
          ),
        ),
      ),
      drawer: buildDrawer(context),
      body: isMobile
          ? Center(
              child: Text(
                "Favor entrar pelo computador, responsividade em desenvolvimento",
                style: GoogleFonts.poppins(
                    textStyle:
                        const TextStyle(color: Colors.black, fontSize: 40)),
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            buttonSample(
                              context,
                              "Inventario Portage",
                              true,
                              () {},
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            buttonSample(
                              context,
                              "CARS2",
                              false,
                              () {},
                            ),
                            const SizedBox(
                              width: 25,
                            ),
                            buttonSample(
                              context,
                              "M-Chat",
                              false,
                              () {},
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: const ResultTable(),
                  ),
                ],
              ),
            ),
    );
  }
}
