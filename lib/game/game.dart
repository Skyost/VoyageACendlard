import 'package:escape_game_kit/escape_game_kit.dart';
import 'package:voyage_a_pastlard/game/rooms/abandoned_classroom.dart';
import 'package:voyage_a_pastlard/game/rooms/abandoned_library.dart';
import 'package:voyage_a_pastlard/game/rooms/bedroom.dart';
import 'package:voyage_a_pastlard/game/rooms/forgiven_forest.dart';
import 'package:voyage_a_pastlard/game/rooms/lobby.dart';
import 'package:voyage_a_pastlard/game/rooms/principal_office.dart';
import 'package:voyage_a_pastlard/game/rooms/storage.dart';
import 'package:voyage_a_pastlard/game/rooms/teacher_bedroom.dart';
import 'package:voyage_a_pastlard/game/rooms/teachers_bedrooms.dart';

class VoyageAPastlardGame extends EscapeGame {
  VoyageAPastlardGame() : super(
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