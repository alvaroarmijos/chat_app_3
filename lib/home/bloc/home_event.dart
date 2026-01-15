part of 'home_bloc.dart';

sealed class HomeEvent {}

// Dispara la lectrua de la base de datos de los contactos
final class GetContactsEvent extends HomeEvent {}

// Actualizar la información del usuario en la base de datos
final class UpdateUserStatus extends HomeEvent {
  final bool status;

  UpdateUserStatus({required this.status});
}
