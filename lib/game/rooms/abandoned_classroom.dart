import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/objects/happiness_mirror.dart';
import 'package:voyage_a_pastlard/game/rooms/principal_office.dart';
import 'package:voyage_a_pastlard/widgets/object_found_dialog_content.dart';

class AbandonedClassroomRoom extends Room {
  static const String roomId = 'abandoned-classroom';

  AbandonedClassroomRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'blackboard',
              renderSettings: const InteractableRenderSettings(
                top: 113,
                left: 635,
                height: 122,
                width: 268,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce tableau noir est à peine effacé...')),
            ),
            Interactable(
              id: 'desk',
              renderSettings: const InteractableRenderSettings(
                top: 266,
                left: 742,
                height: 95,
                width: 228,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est le bureau du professeur.')),
            ),
            Interactable(
              id: 'student-desk',
              renderSettings: const InteractableRenderSettings(
                top: 261,
                left: 191,
                height: 122,
                width: 128,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce pupitre semble être très vieux.')),
            ),
            Interactable(
              id: 'web-1',
              renderSettings: const InteractableRenderSettings(
                top: -7,
                left: 562,
                height: 65,
                width: 390,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une grande toile d\'araignée !')),
            ),
            Interactable(
              id: 'web-2',
              renderSettings: const InteractableRenderSettings(
                top: 62,
                left: 132,
                height: 81,
                width: 92,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Une toile d\'araignée surplombe les bibliothèques.')),
            ),
            Interactable(
              id: 'paper-dumpling-1',
              renderSettings: const InteractableRenderSettings(
                top: 373,
                left: 563,
                height: 14,
                width: 29,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une boulette de papier.')),
            ),
            Interactable(
              id: 'paper-dumpling-2',
              renderSettings: const InteractableRenderSettings(
                top: 336,
                left: 662,
                height: 10,
                width: 14,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Encore une boulette de papier.')),
            ),
            Interactable(
              id: 'crack-1',
              renderSettings: const InteractableRenderSettings(
                top: 109,
                left: 342,
                height: 113,
                width: 79,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Le mur est fissuré ici.')),
            ),
            Interactable(
              id: 'crack-2',
              renderSettings: const InteractableRenderSettings(
                top: 121,
                left: 482,
                height: 132,
                width: 146,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Le mur est fissuré ici aussi.')),
            ),
            Interactable(
              id: 'bookshelf-1',
              renderSettings: const InteractableRenderSettings(
                top: 115,
                left: 29,
                height: 241,
                width: 122,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces livres comportent des sorts de magie noire.')),
            ),
            Interactable(
              id: 'bookshelf-2',
              renderSettings: const InteractableRenderSettings(
                top: 114,
                left: 228,
                height: 137,
                width: 104,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des recettes de potions magiques se trouvent dans ces livres.')),
            ),
            Interactable(
              id: 'note',
              renderSettings: const InteractableRenderSettings(
                top: 297,
                left: 491,
                height: 52,
                width: 32,
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Message',
                  content: '''
                    <p>
                      <em>Il y a un message !</em>
                    </p>
                    <p>~</p>
                    <p><strong>DANGER !</strong></p>
                    <p>
                      Cette salle de classe a été abandonnée à la suite d'expériences de magies malencontreuses.
                      Y entrer représente un danger de mort.
                    </p>
                    ''',
                ));
                return const ActionResult.success();
              },
            ),
            Interactable(
              id: 'book',
              renderSettings: const InteractableRenderSettings(
                top: 224,
                left: 809,
                height: 42,
                width: 89,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "C'est un livre contenant des incantations occultes...")),
            ),
            Interactable(
              id: 'desk-writings',
              renderSettings: const InteractableRenderSettings(
                top: 265,
                left: 394,
                height: 30,
                width: 137,
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Des carrés et encore des carrés',
                  content: '''
                  <p>
                    <em>Il y a un dessin sur le coin de cette table.</em>
                  </p>
                  <p>~</p>
                  <img src="asset:assets/padlocks/squares-1.svg" width="300">
                  ''',
                ));
                return const ActionResult.success();
              },
            ),
            PickableObject(
              object: const HappinessMirror(),
              renderSettings: const InteractableRenderSettings(
                top: 268,
                left: 539,
                height: 62,
                width: 82,
              ),
              padlock: DigitsPadlock(
                title: 'Cadenas',
                unlockMessage: '''
                <p>
                  <em>Le tiroir de cette commode est protégé par un cadenas à code avec une étrange inscription.</em>
                </p>
                <p>~</p>
                <img src="asset:assets/padlocks/squares-2.svg" width="200">
                ''',
                failedToUnlockMessage: "Cela ne fonctionne pas... Peut-être qu'il y a un indice quelque part qui pourrait nous aider.",
                digits: '14',
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: HappinessMirror.asset,
                    message: "Vous avez trouvé un <strong>Miroir de Bonheur</strong> !<br>Se regarder dans ce miroir apporte une véritable sensation de plaisir et de félicité.",
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: 'Vous avez trouvé un Miroir de Bonheur ici.'),
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
            ),
          ],
        );
}
