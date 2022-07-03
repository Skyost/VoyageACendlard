import 'package:escape_game_kit/escape_game_kit.dart';

class TeachersRoomsKey extends EscapeGameObject {
  static const String objectId = 'teachers-rooms-key';
  static const String asset = 'assets/objects/$objectId.svg';

  const TeachersRoomsKey()
      : super(
          id: objectId,
          name: 'Clé pour accéder aux chambres des professeurs',
          inventoryRenderSettings: const RenderSettings(
            height: 60,
            asset: asset,
          ),
        );
}
