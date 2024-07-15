import 'package:flutter_modular/flutter_modular.dart';
import 'package:miliemind_mvp/modules/inventory_portage/presenter/screens/inventory_portage_infodata_screen.dart';

class InventoryPortageModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (context, args) => const InventoryPortageInfoDataScreen()),
  ];
}
