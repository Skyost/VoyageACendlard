import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/rooms/lobby.dart';

class AbandonedLibraryRoom extends Room {
  static const String roomId = 'abandoned-library';

  AbandonedLibraryRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'hole',
              renderSettings: const InteractableRenderSettings(
                top: 370,
                left: 340,
                height: 17,
                width: 268,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Mieux vaut ne pas tomber...')),
            ),
            Interactable(
              id: 'window',
              renderSettings: const InteractableRenderSettings(
                top: 160,
                left: 430,
                height: 119,
                width: 130,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'La fenêtre est barricadée.')),
            ),
            Interactable(
              id: 'web-1',
              renderSettings: const InteractableRenderSettings(
                top: 44,
                left: 241,
                height: 88,
                width: 114,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette toile doit être là depuis longtemps...')),
            ),
            Interactable(
              id: 'web-2',
              renderSettings: const InteractableRenderSettings(
                top: 6,
                left: 667,
                height: 76,
                width: 80,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une grande toile d\'araignée.')),
            ),
            Interactable(
              id: 'web-3',
              renderSettings: const InteractableRenderSettings(
                top: 314,
                left: 846,
                height: 63,
                width: 98,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Encore une grande toile d\'araignée.')),
            ),
            Interactable(
              id: 'bookshelf-1',
              renderSettings: const InteractableRenderSettings(
                top: 133,
                left: 157,
                height: 170,
                width: 122,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Beaucoup de livres se trouvent sur ces étagères.')),
            ),
            Interactable(
              id: 'bookshelf-2',
              renderSettings: const InteractableRenderSettings(
                top: 157,
                left: 297,
                height: 82,
                width: 83,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces livres doivent être très anciens !')),
            ),
            Interactable(
              id: 'bookshelf-3',
              renderSettings: const InteractableRenderSettings(
                top: 277,
                left: 298,
                height: 25,
                width: 86,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ces livres doivent être très anciens !')),
            ),
            Interactable(
              id: 'bookshelf-3',
              renderSettings: const InteractableRenderSettings(
                top: 155,
                left: 607,
                height: 32,
                width: 86,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des anciens livres de cartographie !')),
            ),
            Interactable(
              id: 'bookshelf-4',
              renderSettings: const InteractableRenderSettings(
                top: 221,
                left: 605,
                height: 82,
                width: 89,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Des anciens livres de cartographie !')),
            ),
            Interactable(
              id: 'bookshelf-5',
              renderSettings: const InteractableRenderSettings(
                top: 120,
                left: 707,
                height: 184,
                width: 123,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce sont des livres sur la théorie de Riéfou.')),
            ),
            Interactable(
              id: 'chair',
              renderSettings: const InteractableRenderSettings(
                top: 229,
                left: 545,
                height: 129,
                width: 123,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce fauteuil est plein de toiles d\'araignée...')),
            ),
            Interactable(
              id: 'paper-dumpling-1',
              renderSettings: const InteractableRenderSettings(
                top: 353,
                left: 657,
                height: 22,
                width: 26,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Rien d\'intéressant sur cette boulette de papier.')),
            ),
            Interactable(
              id: 'paper-dumpling-2',
              renderSettings: const InteractableRenderSettings(
                top: 376,
                left: 759,
                height: 15,
                width: 18,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Rien non plus sur cette boulette de papier.')),
            ),
            Interactable(
              id: 'paper-dumpling-3',
              renderSettings: const InteractableRenderSettings(
                top: 375,
                left: 198,
                height: 13,
                width: 26,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette boulette de papier contient des formules de mathématicus.')),
            ),
            Interactable(
              id: 'recipe-book',
              renderSettings: const InteractableRenderSettings(
                top: 245,
                left: 299,
                height: 28,
                width: 80,
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Livre de recettes',
                  content: '''
                  <h2>Antidote d'orage</h2>
                  <p>
                    Utilisé la nuit, cet antidote guérit des brûlures causées par la foudre.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/champinum-enigma.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/healing-potion.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/medusa.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/purple-crystals.svg" height="72">
                  <h2>Bouillon d'illusions</h2>
                  <p>
                    Gare à celui qui humera ce bouillon : il sera sitôt victime d'illusions et d'hallucinations.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/enchanted-spices.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/forest-cards.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/voeilette.svg" height="72">
                  <h2>Élixir de guérison</h2>
                  <p>
                    Cet élixir, une fois consumé, permet la guérison de tous types de blessures physiques.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/healing-potion.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/happiness-mirror.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/hericorne-claw.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/medusa.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/purple-crystals.svg" height="72">
                  <h2>Fiole de colère</h2>
                  <p>
                    Le contenu de cette fiole rend son consommateur immédiatement fou de rage.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/champinum-enigma.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/hericorne-claw.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/scaribo.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/voeilette.svg" height="72">
                  <h2>Mélange de démence</h2>
                  <p>
                    Un mélange suggéré par les démons eux-mêmes, dont la seule vision provoque des troubles schizophréniques.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/champinum-enigma.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/medusa.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/purple-crystals.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/voeilette.svg" height="72">
                  <h2>Philtre d'amour</h2>
                  <p>
                    Fabriqué à l'aide de plantes magiques, ce philtre permet de faire tomber amoureuses deux personnes qui le boivent.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/enchanted-spices.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/forest-cards.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/healing-potion.svg" height="72">
                  <h2>Potion de sommeil</h2>
                  <p>
                    La simple odeur de cette potion permet de faire tomber instantanément son consommateur dans un profond sommeil d'une durée de plusieurs jours.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/champinum-enigma.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/enchanted-spices.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/happiness-mirror.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/hericorne-claw.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/scaribo.svg" height="72">
                  <h2>Tonique de silence</h2>
                  <p>
                    Malheur à celui qui ingurgitera ce tonique : il verra sa mâchoire complètement paralysée pendant trois mois.
                  </p>
                  <p>
                    <strong>~ Ingrédients ~</strong>
                  </p>
                  <img src="asset:assets/objects/enchanted-spices.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/happiness-mirror.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/medusa.svg" height="72">
                  &nbsp;<img src="asset:assets/objects/purple-crystals.svg" height="72">
                  ''',
                ));
                return const ActionResult.success();
              },
            ),
            Interactable(
              id: 'principal-office-book',
              renderSettings: const InteractableRenderSettings(
                top: 189,
                left: 606,
                height: 29,
                width: 88,
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Un bien long calcul',
                  content: '''
                  <p>
                    De tout temps, le bureau du principal a été protégé par un cadenas permettant de refouler les élèves
                    un peu trop téméraires pour s'y aventurer en sa non-présence.
                    Afin de protéger ce secret, je vais vous le donner sous forme d'énigme.
                  </p>
                  <p>
                    Le calcul ci-dessous (qui est très long, d'où l'utilisation de <q>...</q>)
                    donne le même résultat quel que soit les nombres qui remplacent les lettres de l'alphabet.
                  </p>
                  <p>
                    (<em>x</em> - <em>a</em>) × (<em>x</em> - <em>b</em>) × (<em>x</em> - <em>c</em>) × ... × (<em>x</em> - <em>y</em>) × (<em>x</em> - <em>z</em>) = <em>?</em>
                  </p>
                  <p>
                    <strong>Saurez-vous trouver le résultat ?</strong>
                  </p>
                  ''',
                ));
                return const ActionResult.success();
              },
            ),
            Door(
              roomId: LobbyRoom.roomId,
              renderSettings: InteractableRenderSettings(
                top: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${LobbyRoom.roomId}.svg',
                rotationAngle: pi / 2,
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "Vers l'entrée de l'école")),
            ),
          ],
        );
}
