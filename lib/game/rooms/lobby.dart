import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/teachers_rooms_key.dart';
import 'package:voyage_a_pastlard/game/padlocks/equations_padlock.dart';
import 'package:voyage_a_pastlard/game/padlocks/text_padlock.dart';
import 'package:voyage_a_pastlard/game/rooms/bedroom.dart';
import 'package:voyage_a_pastlard/game/rooms/forgiven_forest.dart';
import 'package:voyage_a_pastlard/game/rooms/principal_office.dart';
import 'package:voyage_a_pastlard/game/rooms/teachers_bedrooms.dart';

class LobbyRoom extends Room {
  static const String roomId = 'lobby';

  LobbyRoom()
      : super(
          id: roomId,
          interactables: [
            Door(
              roomId: BedroomRoom.roomId,
              renderSettings: InteractableRenderSettings(
                top: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${BedroomRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers votre chambre')),
            ),
            Door(
              roomId: PrincipalOfficeRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${PrincipalOfficeRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers le bureau du principal')),
              padlock: TextPadlock(
                title: 'Interdit aux élèves !',
                unlockMessage: '<em>La porte est protégée par un cadenas à mot de passe...</em>',
                answer: '0',
                failedToUnlockMessage: "Mince, ce n'est pas le bon mot de passe... Il doit y avoir un indice quelque-part.",
              ),
            ),
            Door(
              roomId: TeachersBedroomsRoom.roomId,
              renderSettings: InteractableRenderSettings(
                top: 30,
                left: 30,
                asset: 'assets/interactables/arrow-${TeachersBedroomsRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers les chambres des professeurs')),
              onTap: (escapeGame) {
                if (!escapeGame.inventory.hasObjectId(TeachersRoomsKey.objectId)) {
                  escapeGame.openDialog(const EscapeGameDialog(
                    title: 'Porte fermée à clé',
                    content: "<em>Mince, la porte du couloir menant aux chambres des professeurs est fermée à clé.</em>",
                  ));
                  return const ActionResult.failed();
                }
                return const ActionResult.success();
              },
            ),
            Door(
              roomId: ForgivenForestRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                left: 30,
                asset: 'assets/interactables/arrow-${ForgivenForestRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              padlock: EquationsPadlock(),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers la forêt interdite')),
            ),
            Interactable(
              id: 'windows',
              renderSettings: const InteractableRenderSettings(
                top: 121,
                left: 430,
                height: 156,
                width: 123,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'De grandes fenêtres donnent sur l\'extérieur.')),
            ),
            Interactable(
              id: 'hidden-switch',
              renderSettings: const InteractableRenderSettings(
                top: 183,
                left: 730,
                height: 24,
                width: 23,
              ),
              onTap: (escapeGame) {
                Room lobby = escapeGame.getRoomById(roomId)!;
                if (lobby.getInteractableById('trapdoor') != null) {
                  return const ActionResult.success();
                }
                escapeGame.openDialog(const EscapeGameDialog(
                  title: 'Message',
                  content: '<em>Tiens, un interrupteur !</em>',
                ));
                escapeGame.getRoomById(roomId)!.addInteractable(
                      Door(
                        id: 'trapdoor',
                        roomId: 'abandoned-library',
                        renderSettings: const InteractableRenderSettings(
                          top: 315,
                          left: 455,
                          width: 70,
                          asset: 'assets/interactables/trapdoor.svg',
                        ),
                        onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers la bibliothèque abandonnée')),
                      ),
                    );
                return const ActionResult.success();
              },
              onHover: (escapeGame) {
                Room lobby = escapeGame.getRoomById(roomId)!;
                return ActionResult.success(
                  object: lobby.getInteractableById('trapdoor') == null
                      ? null
                      : const InteractableTooltip(
                          text: 'Il y avait un interrupteur derrière cette lampe.',
                        ),
                );
              },
            ),
            Interactable(
              id: 'lamp-1',
              renderSettings: const InteractableRenderSettings(
                top: 184,
                left: 853,
                height: 27,
                width: 27,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe éclaire la pièce.')),
            ),
            Interactable(
              id: 'lamp-2',
              renderSettings: const InteractableRenderSettings(
                top: 184,
                left: 610,
                height: 23,
                width: 24,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe éclaire la pièce.')),
            ),
            Interactable(
              id: 'lamp-3',
              renderSettings: const InteractableRenderSettings(
                top: 186,
                left: 346,
                height: 22,
                width: 22,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe éclaire la pièce.')),
            ),
            Interactable(
              id: 'lamp-4',
              renderSettings: const InteractableRenderSettings(
                top: 183,
                left: 225,
                height: 22,
                width: 28,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe éclaire la pièce.')),
            ),
            Interactable(
              id: 'lamp-5',
              renderSettings: const InteractableRenderSettings(
                top: 179,
                left: 99,
                height: 38,
                width: 29,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe éclaire la pièce.')),
            ),
            Interactable(
              id: 'pattern',
              renderSettings: const InteractableRenderSettings(
                top: 289,
                left: 260,
                height: 71,
                width: 455,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Un joli motif en carrelage se trouve au sol.')),
            ),
          ],
        );
}
