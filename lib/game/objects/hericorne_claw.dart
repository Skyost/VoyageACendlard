import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/objects/ingredient.dart';

class HericorneClaw extends EscapeGameObject with Ingredient {
  static const String objectId = 'hericorne-claw';
  static const String asset = 'assets/objects/$objectId.svg';

  const HericorneClaw()
      : super(
          id: objectId,
          name: "Griffe d'Héricorne",
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
