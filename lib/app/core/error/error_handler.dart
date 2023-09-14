import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mobile/app/core/error/exceptions.dart';
import 'package:mobile/app/core/error/failures.dart';
import 'package:mobile/app/core/values/constants.dart';

void showErrorMessageSnackBar(String title, String message) {
  Get.snackbar(title, message, backgroundColor: Colors.red.shade300);
}

Future<T?> handleFutureErrors<T>(Future<T> future) async {
  try {
    return await future;
  } on ServerException catch (e) {
    showErrorMessageSnackBar(
        e.runtimeType.toString(), e.message ?? Constants.messageServerFailure);
  }
  return null;
}

/// returns future function result. If an exception ocurred,
/// it will return a failure object.
Future<Either<Failure, T>> handleFutureFunctionsExceptions<T>(
    Future<T> Function() future,
    {VoidCallback? onNoException}) async {
  try {
    final result = await future();
    onNoException?.call();
    return Right(result);
  } on ServerException catch (e) {
    log(e.toString());
    return Left(
        ServerFailure('${Constants.messageServerFailure}:${e.message}'));
  } on NetworkException catch (e) {
    log(e.toString());
    return Left(
        NetworkFailure('${Constants.messageNetworkFailure}. ${e.message}'));
  } on LocalException catch (e) {
    return Left(LocalFailure('${Constants.messageLocalError}. ${e.message}'));
  } catch (e) {
    log(e.toString());
    return Left(
        LocalFailure('${Constants.messageUnexpectedError}. ${e.toString()}'));
  }
}

void handleFailure(Failure f) {
  switch (f.runtimeType) {
    case ServerFailure:
      showErrorMessageSnackBar('ServerFailure',
          '${Constants.messageServerFailure}. Message: ${f.message ?? 'Empty'}');
      break;
    case NetworkFailure:
      showErrorMessageSnackBar('NetworkFailure',
          '${Constants.messageNetworkFailure}. Message: ${f.message ?? 'Empty'}');
      break;
    case LocalFailure:
      showErrorMessageSnackBar('LocalFailure',
          '${Constants.messageLocalError}. Message: ${f.message ?? 'Empty'}');
      break;
    case CacheFailure:
      showErrorMessageSnackBar('CacheFailure',
          '${Constants.messageCacheError}. Message: ${f.message ?? 'Empty'}');
      break;
    default:
      showErrorMessageSnackBar('Error',
          '${Constants.messageUnexpectedError}. Message: ${f.message ?? 'Empty'}');
  }
}
