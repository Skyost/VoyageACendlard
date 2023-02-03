import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_cendlard/game/rooms/abandoned_classroom.dart';
import 'package:voyage_a_cendlard/game/rooms/abandoned_library.dart';
import 'package:voyage_a_cendlard/game/rooms/bedroom.dart';
import 'package:voyage_a_cendlard/game/rooms/forgiven_forest.dart';
import 'package:voyage_a_cendlard/game/rooms/lobby.dart';
import 'package:voyage_a_cendlard/game/rooms/principal_office.dart';
import 'package:voyage_a_cendlard/game/rooms/storage.dart';
import 'package:voyage_a_cendlard/game/rooms/teacher_bedroom.dart';
import 'package:voyage_a_cendlard/game/rooms/teachers_bedrooms.dart';

class VoyageACendlardGame extends EscapeGame {
  VoyageACendlardGame() : super(
    inventory: Inventory(
      title: 'Inventaire',
      emptyMessage: "Il n'y a rien dans votre inventaire."
    ),
    rooms: [
      BedroomRoom(),
      LobbyRoom(),
      AbandonedLibraryRoom(),
      ForgivenForestRoom(),
      PrincipalOfficeRoom(),
      TeachersBedroomsRoom(),
      TeacherBedroomRoom(),
      StorageRoom(),
      AbandonedClassroomRoom(),
    ],
  );
}