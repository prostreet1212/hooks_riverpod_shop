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

  void buyNot(CoffeeMenu cofee){
    //_menuRepositority.changeMenuStatus(cofee);
    state=state.map((e) {
      if(e==cofee){
        e.isBuy=!e.isBuy;
        return e;
      }else{
        return e;
      }
    }).toList();
  }

  void clearBuyStatus(){
    state=state.map((e) {
      if(e.isBuy==true){
        e.isBuy=false;
        return e;
      }else{
        return e;
      }

    }).toList();
  }

}


class BadgeNotifier extends StateNotifier<List<CoffeeMenu>>{
  //List<CoffeMenu> badgeList;

  BadgeNotifier() : super([]);

  /*List<CoffeMenu> getBadge() {
    return badgeList;
  }*/

  void changeBadgeCount(CoffeeMenu cofee) {

    if (cofee.isBuy) {
      state.add(cofee);

    } else {
      state.remove(cofee);
    }
  }

  void clearBadge() {
    state.clear();
  }
}