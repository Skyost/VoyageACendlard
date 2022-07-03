import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/ingredient.dart';

class HappinessMirror extends EscapeGameObject with Ingredient {
  static const String objectId = 'happiness-mirror';
  static const String asset = 'assets/objects/$objectId.svg';

  const HappinessMirror()
      : super(
          id: objectId,
          name: 'Miroir de Bonheur',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
