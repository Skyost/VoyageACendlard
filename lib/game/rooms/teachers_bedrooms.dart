import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/padlocks/find_x_padlock.dart';
import 'package:voyage_a_cendlard/game/rooms/lobby.dart';
import 'package:voyage_a_cendlard/game/rooms/teacher_bedroom.dart';

class TeachersBedroomsRoom extends Room {
  static const String roomId = 'teachers-bedrooms';

  TeachersBedroomsRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'door-cartography-teacher',
              renderSettings: const InteractableRenderSettings(
                top: 128,
                left: -18,
                height: 245,
                width: 82,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est la porte de la chambre de la professeur de cartographie !')),
            ),
            Interactable(
              id: 'door-hat-making-teacher',
              renderSettings: const InteractableRenderSettings(
                top: 143,
                left: 912,
                height: 225,
                width: 102,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est la porte de la chambre du professeur de chapellerie.')),
            ),
            Interactable(
              id: 'torch-1',
              renderSettings: const InteractableRenderSettings(
                top: 114,
                left: 216,
                height: 110,
                width: 74,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette torche permet d\'éclairer le couloir.')),
            ),
            Interactable(
              id: 'torch-2',
              renderSettings: const InteractableRenderSettings(
                top: 114,
                left: 691,
                height: 110,
                width: 73,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette torche permet également d\'éclairer le couloir.')),
            ),
            Door(
              roomId: LobbyRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${LobbyRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
                rotationAngle: pi / 10 - pi,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: "Vers l'entrée de l'école")),
            ),
            Door(
              roomId: TeacherBedroomRoom.roomId,
              renderSettings: const InteractableRenderSettings(
                top: 109,
                left: 422,
                height: 246,
                width: 141,
              ),
              padlock: FindXPadlock(),
              onHover: (escapeGame) {
                Room teachersBedrooms = escapeGame.getRoomById(roomId)!;
                Door teacherBedroomDoor = teachersBedrooms.getInteractableById(TeacherBedroomRoom.roomId)! as Door;
                return ActionResult.success(
                  object: teacherBedroomDoor.padlock!.isUnlocked
                      ? const InteractableTooltip(
                          text: 'Vers la chambre du professeur de mathématicus',
                        )
                      : null,
                );
              },
            ),
          ],
        );
}
