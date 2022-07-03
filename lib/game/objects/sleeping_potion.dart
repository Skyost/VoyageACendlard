import 'package:escape_game_kit/escape_game_kit.dart';

class SleepingPotion extends EscapeGameObject {
  static const String objectId = 'sleeping-potion';
  static const String asset = 'assets/objects/$objectId.svg';

  const SleepingPotion()
      : super(
          id: objectId,
          name: 'Potion de sommeil',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
