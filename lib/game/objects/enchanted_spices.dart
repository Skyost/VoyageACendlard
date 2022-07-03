import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/ingredient.dart';

class EnchantedSpices extends EscapeGameObject with Ingredient {
  static const String objectId = 'enchanted-spices';
  static const String asset = 'assets/objects/enchanted-spices.svg';

  const EnchantedSpices()
      : super(
          id: objectId,
          name: 'Épices enchantées',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
