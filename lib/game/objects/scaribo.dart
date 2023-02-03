import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/objects/ingredient.dart';

class Scaribo extends EscapeGameObject with Ingredient {
  static const String objectId = 'scaribo';
  static const String asset = 'assets/objects/$objectId.svg';

  const Scaribo()
      : super(
          id: objectId,
          name: 'Scaribo',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
