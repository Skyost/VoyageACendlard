import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:voyage_a_cendlard/game/objects/teachers_rooms_key.dart';
import 'package:voyage_a_cendlard/game/rooms/abandoned_classroom.dart';
import 'package:voyage_a_cendlard/game/rooms/lobby.dart';
import 'package:voyage_a_cendlard/game/rooms/storage.dart';
import 'package:voyage_a_cendlard/widgets/object_found_dialog_content.dart';

class PrincipalOfficeRoom extends Room {
  static const String roomId = 'principal-office';

  PrincipalOfficeRoom({
    TeachersRoomsKey teachersRoomsKey = const TeachersRoomsKey(),
  }) : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'window',
              renderSettings: const InteractableRenderSettings(
                top: 49,
                left: 409,
                height: 208,
                width: 161,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Une grande fenêtre est située au fond du bureau.')),
            ),
            PickableObject(
              id: 'desk',
              object: teachersRoomsKey,
              renderSettings: const InteractableRenderSettings(
                top: 258,
                left: 404,
                height: 74,
                width: 191,
              ),
              onPickedUp: (escapeGame) {
                escapeGame.showDialog(const EscapeGameDialog(
                  title: 'Objet trouvé !',
                  content: ObjectFoundDialogContent(
                    asset: TeachersRoomsKey.asset,
                    message: "Vous avez trouvé un double de la clé permettant d'ouvrir la <strong>porte du couloir menant aux chambres des professeurs</strong> !",
                  ),
                ));
                return const ActionResult.success();
              },
              removedTooltip: const InteractableTooltip(text: 'Vous avez trouvé une clé pour rentrer dans le couloir menant aux chambres des professeurs ici.'),
            ),
            Interactable(
              id: 'paper',
              renderSettings: const InteractableRenderSettings(
                top: 242,
                left: 480,
                height: 14,
                width: 111,
              ),
              onTap: (escapeGame) {
                escapeGame.showDialog(
                  EscapeGameDialog(
                    title: 'Un code sympathique',
                    content: Column(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(bottom: 14),
                          child: HtmlWidget('''
                            <div align="center">
                              <p>
                                <em>Il y a un post-it sur le bureau, mais le texte est effacé par endroits...</em>
                              </p>
                              <p>~</p>
                            </div>
                            '''),
                        ),
                        SelectableText.rich(
                          TextSpan(children: [
                            TextSpan(text: "2"),
                            TextSpan(
                              text: "3",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: " jui"),
                            TextSpan(
                              text: "llet : n",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: "e pa"),
                            TextSpan(
                              text: "s o",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: "ublier l'an"),
                            TextSpan(
                              text: "niversai",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: "re d"),
                            TextSpan(
                              text: "e mon",
                              style: TextStyle(color: Colors.white),
                            ),
                            TextSpan(text: " frèr"),
                            TextSpan(
                              text: "e.",
                              style: TextStyle(color: Colors.white),
                            )
                          ]),
                        ),
                      ],
                    ),
                  ),
                );
                return const ActionResult.success();
              },
            ),
            Interactable(
                id: 'pillar-writings',
                renderSettings: const InteractableRenderSettings(
                  top: 251,
                  left: 166,
                  height: 59,
                  width: 35,
                ),
                onTap: (escapeGame) {
                  escapeGame.showDialog(const EscapeGameDialog(
                    title: 'Des points et des tirets',
                    content: '''
                    <p>
                      <em>Tiens, il y a des sortes d'inscriptions sur ce pilier !</em>
                    </p>
                    <p>~</p>
                    <p style="font-size: 32px;">·−··&ensp;·&emsp;−·−·&ensp;−−−&ensp;−··&ensp;·&emsp;·&ensp;···&ensp;−&emsp;−−−−−&ensp;−····&ensp;·−−−−&ensp;····−</p>
                    ''',
                  ));
                  return const ActionResult.success();
                }),
            Interactable(
              id: 'broken-pillar',
              renderSettings: const InteractableRenderSettings(
                top: 88,
                left: 166,
                height: 160,
                width: 29,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce pilier est cassé...')),
            ),
            Interactable(
              id: 'pillar-1',
              renderSettings: const InteractableRenderSettings(
                top: 69,
                left: 31,
                height: 207,
                width: 34,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce pilier a l\'air porteur.')),
            ),
            Interactable(
              id: 'pillar-2',
              renderSettings: const InteractableRenderSettings(
                top: 90,
                left: 302,
                height: 153,
                width: 33,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'La lumière de la lune éclaire ce pilier.')),
            ),
            Interactable(
              id: 'pillar-3',
              renderSettings: const InteractableRenderSettings(
                top: 96,
                left: 652,
                height: 144,
                width: 30,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce pillier est fait d\'une pierre grise.')),
            ),
            Interactable(
              id: 'pillar-4',
              renderSettings: const InteractableRenderSettings(
                top: 76,
                left: 782,
                height: 175,
                width: 37,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'La lumière des bougies éclaire ce pilier.')),
            ),
            Door(
              roomId: StorageRoom.roomId,
              renderSettings: const InteractableRenderSettings(
                top: 176,
                left: 878,
                height: 134,
                width: 33,
              ),
              padlock: DigitsPadlock(
                title: 'Cadenas',
                unlockMessage: '<em>Cette porte est protégée par un cadenas à code... Il doit y avoir un indice quelque part.</em>',
                failedToUnlockMessage: 'Mince, cela ne fonctionne pas...',
                digits: '2307',
              ),
              onHover: (escapeGame) {
                Room principalOffice = escapeGame.getRoomById(roomId)!;
                Door storageRoomDoor = principalOffice.getInteractableById(StorageRoom.roomId)! as Door;
                return ActionResult.success(
                  object: storageRoomDoor.padlock!.isUnlocked
                      ? const InteractableTooltip(
                          text: 'Vers le stockage',
                        )
                      : null,
                );
              },
            ),
            Door(
              roomId: AbandonedClassroomRoom.roomId,
              renderSettings: const InteractableRenderSettings(
                top: 176,
                left: 74,
                height: 134,
                width: 33,
              ),
              padlock: DigitsPadlock(
                title: 'Cadenas',
                unlockMessage: '<em>Un cadenas à code protège cette porte. Il doit y avoir un indice quelque part.</em>',
                failedToUnlockMessage: "Aïe, ce n'est pas le bon code !",
                digits: '0614',
              ),
              onHover: (escapeGame) {
                Room principalOffice = escapeGame.getRoomById(roomId)!;
                Door abandonedClassroomDoor = principalOffice.getInteractableById(AbandonedClassroomRoom.roomId)! as Door;
                return ActionResult.success(
                  object: abandonedClassroomDoor.padlock!.isUnlocked
                      ? const InteractableTooltip(
                          text: 'Vers la salle de classe abandonnée',
                        )
                      : null,
                );
              },
            ),
            Door(
              roomId: LobbyRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                left: 30,
                asset: 'assets/interactables/arrow-${LobbyRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "Vers l'entrée de l'école")),
            ),
          ],
        );
}
