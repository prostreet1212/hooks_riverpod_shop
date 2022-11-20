import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod_shop/model/coffe_menu.dart';
import 'package:hooks_riverpod_shop/notifiers/notifiers.dart';
import 'package:hooks_riverpod_shop/repository/MenuRepository.dart';

final menuProvider = StateNotifierProvider<MenuNotifier, List<CoffeeMenu>>(
    (_) => MenuNotifier());

final badgeProvider = StateNotifierProvider<BadgeNotifier, List<CoffeeMenu>>(
        (_) => BadgeNotifier());
