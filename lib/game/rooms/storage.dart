import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/enchanted_spices.dart';
import 'package:voyage_a_pastlard/game/objects/purple_crystals.dart';
import 'package:voyage_a_pastlard/game/rooms/lobby.dart';
import 'package:voyage_a_pastlard/game/rooms/principal_office.dart';
import 'package:voyage_a_pastlard/widgets/object_found_dialog_content.dart';

class StorageRoom extends Room {
  static const String roomId = 'storage';

  StorageRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'lamp-1',
              renderSettings: const InteractableRenderSettings(
                top: 170,
                left: 220,
                height: 51,
                width: 67,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce n\'est pas allumé...')),
            ),
            Interactable(
              id: 'lamp-2',
              renderSettings: const InteractableRenderSettings(
                top: 171,
                left: 694,
                height: 47,
                width: 73,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce n\'est pas allumé...')),
            ),
            Interactable(
              id: 'moonlight',
              renderSettings: const InteractableRenderSettings(
                top: 48,
                left: 517,
                height: 258,
                width: 183,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Le clair de lune éclaire cet endroit.')),
            ),
            PickableObject(
              object: const PurpleCrystals(),
              renderSettings: const InteractableRenderSettings(
                bottom: 40,
                left: 400,
                width: 120,
                asset: PurpleCrystals.asset,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.openDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: PurpleCrystals.asset,
                    message: "Vous avez trouvé des <strong>Cristaux pourpres</strong> !<br>En réalité, la couleur de ces cristaux varie en fonction de l'heure de la journée.",
                  ),
                ));
                return const ActionResult.success();
              },
            ),
            PickableObject(
              object: const EnchantedSpices(),
              renderSettings: const InteractableRenderSettings(
                bottom: 40,
                left: 520,
                width: 120,
                asset: EnchantedSpices.asset,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.openDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: EnchantedSpices.asset,
                    message: "Vous avez trouvé des <strong>Épices enchantées</strong> !<br>Ce sont des épices très rares qui servent dans la confection de nombreuses potions.",
                  ),
                ));
                return const ActionResult.success();
              },
            ),
            Door(
              roomId: PrincipalOfficeRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                left: 30,
                asset: 'assets/interactables/arrow-${PrincipalOfficeRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
                mirror: true,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers le bureau du principal')),
            ),
          ],
        );
}
