import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miliemind_mvp/core/style/colors.dart';
import 'package:miliemind_mvp/core/style/text_style.dart';
import 'package:miliemind_mvp/modules/home/presenter/widgets/build_drawer.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/widgets/barchart_inventory_portage.dart';

class InventoryPortageInfoDataScreen extends StatefulWidget {
  const InventoryPortageInfoDataScreen({super.key});

  @override
  State<InventoryPortageInfoDataScreen> createState() =>
      _InventoryPortageInfoDataScreenState();
}

class _InventoryPortageInfoDataScreenState
    extends State<InventoryPortageInfoDataScreen> {
  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < 1000;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(),
      drawer: buildDrawer(context),
      body: isMobile
          ? Center(
              child: Text(
                "Favor entrar pelo computador, responsividade em desenvolvimento",
                style: GoogleFonts.poppins(
                    textStyle: const TextStyle(color: Colors.black)),
                textAlign: TextAlign.center,
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(32),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Modular.to.navigate("/"),
                          child: Icon(
                            Icons.arrow_back,
                            color: AppColors.onTertiary,
                            size: 24,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Data Test",
                          style: GoogleFonts.poppins(
                              textStyle: context.appTextStyles.mediumBlack),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Grafico Geral",
                                    style: GoogleFonts.poppins(
                                        textStyle:
                                            context.appTextStyles.smallBlack),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  BarChartInventoryPortage(),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
