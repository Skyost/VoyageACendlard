import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/objects/ingredient.dart';

class ForestCards extends EscapeGameObject with Ingredient {
  static const String objectId = 'forest-cards';
  static const String asset = 'assets/objects/$objectId.svg';

  const ForestCards()
      : super(
          id: objectId,
          name: 'Cartes de la Forêt',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
