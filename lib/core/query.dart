import 'dart:convert';
import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart';
import 'package:greenleaf/res/strings.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'core.dart';

class Query {
  final String? _authSession;
  final supabase = Supabase.instance.client;

  Query({required String? authSession}) : _authSession = authSession;

  FutureEither<List<Map<String, dynamic>>> fetchAllDataWithoutFiltering(
      {required bool requireAuth, required String table, required String selectColumn}) async {

    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }

    try {
      final response = await supabase.from(table).select(selectColumn);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.getRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> insertData(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    try {
      final response = await post(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPost);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.postRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> updateData(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpPut);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.putRequestMessage, stackTrace: stktrc));
    }
  }

  FutureEither<Response> deleteData(
      {required String url, dynamic body, required bool requireAuth}) async {
    final Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      "Authorization": "token=$_authSession"
    };
    if (requireAuth) {
      if ((_authSession ?? '').isEmpty) {
        return Left(Failure(message: FailureMessage.authTokenEmpty));
      }
    }
    try {
      final response = await put(Uri.parse(url),
          body: jsonEncode(body), headers: requestHeaders);
      log('RESPONSE : ${response.body}', name: LogLabel.httpDelete);
      return Right(response);
    } catch (e, stktrc) {
      return Left(Failure(
          message: FailureMessage.deleteRequestMessage, stackTrace: stktrc));
    }
  }
}