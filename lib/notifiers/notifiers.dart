import 'package:hooks_riverpod_shop/model/coffe_menu.dart';
import 'package:state_notifier/state_notifier.dart';
import '../repository/MenuRepository.dart';


class MenuNotifier extends StateNotifier<List<CoffeeMenu>>{
  final MenuRepository _menuRepositority;
  MenuNotifier(this._menuRepositority):super([]){
    _init();
  }

  void _init() {
    state= _menuRepositority.getListMenu();
  }

}