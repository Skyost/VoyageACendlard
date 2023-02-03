import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:voyage_a_cendlard/game/game.dart';
import 'package:voyage_a_cendlard/game/padlocks/equations_padlock.dart';
import 'package:voyage_a_cendlard/game/padlocks/find_x_padlock.dart';
import 'package:voyage_a_cendlard/game/padlocks/text_padlock.dart';
import 'package:voyage_a_cendlard/game/padlocks/valid_object_padlock.dart';
import 'package:voyage_a_cendlard/widgets/main_widget.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && (defaultTargetPlatform == TargetPlatform.windows || defaultTargetPlatform == TargetPlatform.linux || defaultTargetPlatform == TargetPlatform.macOS)) {
    adjustWindowSize();
  }
  registerPadlocks();
  VoyageACendlardGame escapeGame = VoyageACendlardGame();
  runApp(MainWidget(escapeGame: escapeGame));
}

Future<void> adjustWindowSize() async {
  await windowManager.ensureInitialized();

  windowManager.waitUntilReadyToShow().then((_) async {
    Size size = const Size(1000, 434);
    await windowManager.setTitleBarStyle(TitleBarStyle.normal, windowButtonVisibility: false);
    await windowManager.setSize(size);
    await windowManager.setMinimumSize(size);
    // await windowManager.setMaximumSize(size);
    // await windowManager.setResizable(false);
    await windowManager.center();
    await windowManager.show();
  });
}

void registerPadlocks() {
  PadlockDialogs.registerBuilderFor(EquationsPadlock, EquationsPadlockDialog.builder);
  PadlockDialogs.registerBuilderFor(FindXPadlock, FindXPadlockDialog.builder);
  PadlockDialogs.registerBuilderFor(TextPadlock, TextPadlockDialog.builder);
  PadlockDialogs.registerBuilderFor(ValidObjectPadlock, ValidObjectPadlockDialog.builder);
}
