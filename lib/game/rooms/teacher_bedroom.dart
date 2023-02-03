import 'dart:math';

import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/padlocks/valid_object_padlock.dart';
import 'package:voyage_a_cendlard/game/rooms/teachers_bedrooms.dart';

class TeacherBedroomRoom extends Room {
  static const String roomId = 'teacher-bedroom';

  TeacherBedroomRoom()
      : super(
          id: roomId,
          interactables: [
            Interactable(
              id: 'chimney',
              renderSettings: const InteractableRenderSettings(
                top: 210,
                left: 79,
                height: 123,
                width: 89,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une immense cheminée, mais il n\'y a rien à l\'intérieur.')),
            ),
            Interactable(
              id: 'plant',
              renderSettings: const InteractableRenderSettings(
                top: 337,
                left: 900,
                height: 70,
                width: 74,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'C\'est une plante grasse.')),
            ),
            Interactable(
              id: 'bedside-lamp',
              renderSettings: const InteractableRenderSettings(
                top: 199,
                left: 824,
                height: 92,
                width: 58,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette lampe permet de tamiser la lumière.')),
            ),
            Interactable(
              id: 'candle-1',
              renderSettings: const InteractableRenderSettings(
                top: 67,
                left: 226,
                height: 35,
                width: 30,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette bougie permet d\'avoir un léger éclairage.')),
            ),
            Interactable(
              id: 'candle-2',
              renderSettings: const InteractableRenderSettings(
                top: 66,
                left: 744,
                height: 36,
                width: 24,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette bougie permet d\'avoir un léger éclairage.')),
            ),
            Interactable(
              id: 'candle-3',
              renderSettings: const InteractableRenderSettings(
                top: 42,
                left: 900,
                height: 50,
                width: 31,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Cette bougie permet d\'avoir un léger éclairage.')),
            ),
            Interactable(
              id: 'bed',
              renderSettings: const InteractableRenderSettings(
                top: 209,
                left: 348,
                height: 85,
                width: 294,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Ce lit est vraiment très grand !')),
            ),
            LockedInteractable(
                id: 'teacher',
                renderSettings: const InteractableRenderSettings(
                  top: 196,
                  left: 378,
                  height: 86,
                  width: 83,
                ),
                padlock: ValidObjectPadlock(),
                onTap: (escapeGame) {
                  escapeGame.finish();
                  return const ActionResult.success();
                }),
            Door(
              roomId: TeachersBedroomsRoom.roomId,
              renderSettings: InteractableRenderSettings(
                bottom: 30,
                right: 30,
                asset: 'assets/interactables/arrow-${TeachersBedroomsRoom.roomId}.svg',
                hoverAnimation: InteractableAnimation(type: InteractableAnimationType.swing),
                rotationAngle: pi / 10 - pi,
              ),
              onHover: (escapeGame) => const ActionResult.success(object: InteractableTooltip(text: 'Vers les chambres des professeurs')),
            ),
          ],
        );
}
