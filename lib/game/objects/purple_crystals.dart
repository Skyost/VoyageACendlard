import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/ingredient.dart';

class PurpleCrystals extends EscapeGameObject with Ingredient {
  static const String objectId = 'purple-crystals';
  static const String asset = 'assets/objects/$objectId.svg';

  const PurpleCrystals()
      : super(
          id: objectId,
          name: 'Cristaux pourpres',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
