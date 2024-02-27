import 'package:get/get.dart';
import 'package:tictactoe/app/modules/game/game_binding.dart';
import 'package:tictactoe/app/modules/game/game_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.GAME;

  static final routes = [
    GetPage(
      name: _Paths.GAME,
      page: () => const GameView(),
      binding: GameBinding(),
    ),
  ];
}