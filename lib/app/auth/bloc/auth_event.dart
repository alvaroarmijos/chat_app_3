part of 'auth_bloc.dart';

sealed class AuthEvent {}

// Evento para empezar a esccuhar si tenemos usuario logueado
final class CheckUserEvent extends AuthEvent {}
