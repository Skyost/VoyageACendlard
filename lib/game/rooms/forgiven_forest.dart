import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/champinum_enigma.dart';
import 'package:voyage_a_pastlard/game/objects/forest_cards.dart';
import 'package:voyage_a_pastlard/game/objects/scaribo.dart';
import 'package:voyage_a_pastlard/game/padlocks/text_padlock.dart';
import 'package:voyage_a_pastlard/game/rooms/lobby.dart';
import 'package:voyage_a_pastlard/widgets/object_found_dialog_content.dart';

class ForgivenForestRoom extends Room {
  static const String roomId = 'forgiven-forest';

  ForgivenForestRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'pond',
              renderSettings: const InteractableRenderSettings(
                top: 328,
                left: 415,
                height: 34,
                width: 390,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une sorte de mare...\nMieux vaut ne pas s\'approcher.')),
            ),
            Interactable(
              id: 'tree-1',
              renderSettings: const InteractableRenderSettings(
                top: 42,
                left: 409,
                height: 209,
                width: 38,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce n\'est qu\'un arbre.')),
            ),
            Interactable(
              id: 'tree-2',
              renderSettings: const InteractableRenderSettings(
                top: 32,
                left: 461,
                height: 208,
                width: 32,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Encore un arbre.')),
            ),
            Interactable(
              id: 'tree-3',
              renderSettings: const InteractableRenderSettings(
                top: 8,
                left: 506,
                height: 217,
                width: 25,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Il n\'y a rien sur cet arbre.')),
            ),
            Interactable(
              id: 'tree-4',
              renderSettings: const InteractableRenderSettings(
                top: 66,
                left: 657,
                height: 167,
                width: 27,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Rien d\'intéressant sur cet arbre.')),
            ),
            Interactable(
              id: 'tree-5',
              renderSettings: const InteractableRenderSettings(
                top: 66,
                left: 702,
                height: 159,
                width: 29,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Rien ici non plus.')),
            ),
            Interactable(
              id: 'tree-6',
              renderSettings: const InteractableRenderSettings(
                top: 115,
                left: 927,
                height: 132,
                width: 87,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Tiens, il y a quelque chose au pied de cet arbre...')),
            ),
            Interactable(
              id: 'tree-7',
              renderSettings: const InteractableRenderSettings(
                top: 48,
                left: 886,
                height: 238,
                width: 28,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Rien sur cet arbre.')),
            ),
            Interactable(
              id: 'tree-8',
              renderSettings: const InteractableRenderSettings(
                top: 1,
                left: 31,
                height: 262,
                width: 28,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cet arbre n\'a rien de particulier.')),
            ),
            Interactable(
              id: 'liana-1',
              renderSettings: const InteractableRenderSettings(
                top: 77,
                left: 302,
                height: 310,
                width: 30,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des lianes pendent de cet arbre.')),
            ),
            Interactable(
              id: 'liana-2',
              renderSettings: const InteractableRenderSettings(
                top: 43,
                left: 349,
                height: 285,
                width: 26,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des lianes pendent de cet arbre.')),
            ),
            PickableObject(
              object: const Scaribo(),
              renderSettings: const InteractableRenderSettings(
                top: 284,
                left: 72,
                width: 28,
                height: 29.54,
                asset: Scaribo.asset,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: Scaribo.asset,
                    message: "Vous avez ramassé un <strong>Scaribo</strong> !<br>Cet étrange scarabée est connu depuis l'Égypte antique.",
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: 'Vous avez ramassé un Scaribo ici.'),
            ),
            PickableObject(
              object: const ForestCards(),
              renderSettings: const InteractableRenderSettings(
                top: 252,
                left: 921,
                height: 38,
                width: 62,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: ForestCards.asset,
                    message: "Vous avez ramassé des <strong>Cartes de la Forêt</strong> !<br>On ne dirait pas, mais il s'agit d'un organisme vivant !",
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: 'Vous avez ramassé des Cartes de la Forêt ici.'),
            ),
            PickableObject(
              object: const ChampinumEnigma(),
              renderSettings: const InteractableRenderSettings(
                top: 292,
                left: 171,
                height: 72,
                width: 91,
              ),
              padlock: TextPadlock(
                title: 'Une histoire de champignons',
                unlockMessage: '''
                <p>
                  <em>Tiens, il y a quelque chose derrière cet arbre...</em>
                </p>
                <img src="asset:assets/objects/champinum-enigma.svg" height="100">
                <p>
                  <em>
                    C'est un Champinum Enigma, une variété très rare de champignons qui ne se laissent cueillir qu'après avoir posé une énigme !
                  </em>
                </p>
                <p>~</p>
                <p>
                  Il se tient toujours sur un pied,
                  <br>
                  Porte parfois la collerette.
                  <br>
                  Par un chapeau, il est coiffé.
                  <br>
                  Un peu lugubre est sa trompette.
                </p>
                <p><strong>Qui est-il ?</strong></p>
                ''',
                answer: 'Le champignon',
                failedToUnlockMessage: "Aïe, il m'a mordu !\nJe pense que ce n'est pas la bonne réponse...",
                codePromptText: 'Entrer la réponse ici',
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: ChampinumEnigma.asset,
                    message: 'Vous avez ramassé le <strong>Champinum Enigma</strong> !<br>Ce champignon ne pousse que dans les forêts mystiques du nord du continent.',
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: 'Vous avez trouvé un Champinum Enigma ici.'),
            ),
            Door(
              roomId: LobbyRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${LobbyRoom.roomId}.svg',
                rotationAngle: pi,
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "Vers l'entrée de l'école")),
            ),
          ],
        );
}
