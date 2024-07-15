import 'package:flutter_modular/flutter_modular.dart';
import 'package:miliemind_mvp/modules/home/presenter/home_module.dart';
import 'package:miliemind_mvp/modules/inventory_portage/inventory_portage_module.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
    ModuleRoute('/', module: HomeModule()),
    ModuleRoute('/inventory_portage_data', module: InventoryPortageModule())
  ];
}
