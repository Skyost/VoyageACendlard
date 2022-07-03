import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/hericorne_claw.dart';
import 'package:voyage_a_pastlard/game/rooms/lobby.dart';
import 'package:voyage_a_pastlard/widgets/cauldron_dialog_content.dart';
import 'package:voyage_a_pastlard/widgets/object_found_dialog_content.dart';

class BedroomRoom extends Room {
  static const String roomId = 'bedroom';

  BedroomRoom()
      : super(
          id: roomId,
          onFirstVisit: (escapeGame) {
            escapeGame.showDialog(
              const EscapeGameDialog(
                content: '''<h1>🪄 Bienvenue !</h1>
                <p>
                  <em>
                    Vous êtes élève à l'école Pastlard, un établissement magique peuplé de jeunes apprentis sorciers.
                    <br>Vous vous êtes réveillé en pleine nuit car, demain, vous avez interrogation de mathématicus,
                    la matière tant redoutée par les élèves de Pastlard... Et vous n'avez pas du tout révisé !
                  </em>
                </p>
                <p>~</p>
                <p>
                  <em>
                    Votre objectif est de trouver un moyen d'échapper à cette interrogation.<br>
                    <strong>Attention</strong>. Certaines portes sont fermées pour éviter que les élèves ne s'introduisent n'importe où la nuit !
                  </em>
               </p>''',
              ),
            );
            return const ActionResult.success();
          },
          interactables: [
            Interactable(
              id: 'window-1',
              renderSettings: const InteractableRenderSettings(
                top: 93,
                left: 421,
                height: 116,
                width: 89,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Il fait nuit dehors.')),
            ),
            Interactable(
              id: 'window-2',
              renderSettings: const InteractableRenderSettings(
                top: 86,
                left: 604,
                height: 181,
                width: 94,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Il fait nuit dehors.')),
            ),
            Interactable(
              id: 'flasks',
              renderSettings: const InteractableRenderSettings(
                top: 100,
                left: 254,
                height: 62,
                width: 46,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces fioles contiennent des potions de déformation.')),
            ),
            Interactable(
              id: 'torch-1',
              renderSettings: const InteractableRenderSettings(
                top: 108,
                left: 317,
                height: 58,
                width: 22,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des bougies éclairent la pièce.')),
            ),
            Interactable(
              id: 'torch-2',
              renderSettings: const InteractableRenderSettings(
                top: 158,
                left: 501,
                height: 60,
                width: 34,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des bougies éclairent la pièce.')),
            ),
            Interactable(
              id: 'witch-hat',
              renderSettings: const InteractableRenderSettings(
                top: 192,
                left: 850,
                height: 54,
                width: 106,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est un chapeau de sorcière !')),
            ),
            Interactable(
              id: 'love-potion',
              renderSettings: const InteractableRenderSettings(
                top: 238,
                left: 524,
                height: 99,
                width: 40,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Il s\'agit d\'un philtre d\'amour, mais il est râté...')),
            ),
            Interactable(
              id: 'bones',
              renderSettings: const InteractableRenderSettings(
                top: 210,
                left: 189,
                height: 64,
                width: 43,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces os sont suspendus.')),
            ),
            Interactable(
              id: 'mushrooms',
              renderSettings: const InteractableRenderSettings(
                top: 208,
                left: 252,
                height: 61,
                width: 34,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces champignons dégagent une forte odeur de vanille.')),
            ),
            Interactable(
              id: 'books',
              renderSettings: const InteractableRenderSettings(
                top: 146,
                left: 734,
                height: 22,
                width: 74,
              ),
              onHover: (escapeGame) => const ActionResult.success(
                object: InteractableTooltip(
                  text: 'Ce sont des livres de mathématicus, mais il est trop tard pour réviser.\nSi seulement j\'avais écouté mon professeur...',
                ),
              ),
            ),
            Interactable(
              id: 'scepter',
              renderSettings: const InteractableRenderSettings(
                top: 189,
                left: 413,
                height: 184,
                width: 58,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Un sceptre magique !')),
            ),
            PickableObject(
              id: 'hericorne-claw',
              object: const HericorneClaw(),
              renderSettings: const InteractableRenderSettings(
                top: 179,
                left: 718,
                height: 38,
                width: 86,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: HericorneClaw.asset,
                    message: "Vous avez trouvé une <strong>Griffe de Héricorne</strong> !<br>Cet animal mystique ne se montre qu'aux plus téméraires.",
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: "Vous avez trouvé une Griffe de Héricorne ici."),
            ),
            Interactable(
              id: 'empty-draw',
              renderSettings: const InteractableRenderSettings(
                top: 285,
                left: 864,
                height: 42,
                width: 79,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce tiroir est vide.')),
            ),
            Interactable(
              id: 'eye-potion',
              renderSettings: const InteractableRenderSettings(
                top: 198,
                left: 608,
                height: 77,
                width: 34,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Un œil flotte dans un liquide rougeâtre.')),
            ),
            Interactable(
              id: 'mushroom',
              renderSettings: const InteractableRenderSettings(
                top: 172,
                left: 650,
                height: 101,
                width: 40,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une nitama, une sorte de champignon vivant.')),
            ),
            Interactable(
              id: 'cauldron',
              renderSettings: const InteractableRenderSettings(
                bottom: 19,
                left: 295,
                height: 137,
                asset: 'assets/interactables/cauldron.svg',
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(EscapeGameDialog(
                  title: 'Confection de potions',
                  content: CauldronDialogContent(inventory: escapeGame.inventory),
                ));
                return const ActionResult.success();
              },
            ),
            Door(
              roomId: LobbyRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                left: 30,
                asset: 'assets/interactables/arrow-${LobbyRoom.roomId}.svg',
                rotationAngle: -pi / 10,
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "Vers l'entrée de l'école")),
            ),
          ],
        );
}
