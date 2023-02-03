import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/objects/ingredient.dart';

class ChampinumEnigma extends EscapeGameObject with Ingredient {
  static const String objectId = 'champinum-enigma';
  static const String asset = 'assets/objects/$objectId.svg';

  const ChampinumEnigma()
      : super(
          id: objectId,
          name: 'Champinum Enigma',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
