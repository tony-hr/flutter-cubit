import 'package:dio/dio.dart';
import 'dart:io';

abstract class NetworkExceptions {
  static String getDioException(error) {
    if (error is Exception) {
      try {
        String errorType = "";

        if (error is DioError) {
          switch (error.type) {
            case DioErrorType.cancel:
              errorType = "CANCEL";
              break;
            case DioErrorType.connectTimeout:
              errorType = "CONNECT_TIMEOUT";
              break;
            case DioErrorType.other:
              print("(Error OTHER) $error.message");
              errorType = "OTHER";
              break;
            case DioErrorType.receiveTimeout:
              errorType = "RECEIVE_TIMEOUT";
              break;
            case DioErrorType.response:
              switch (error.response!.statusCode) {
                case 400:
                  errorType = "UNAUTHORISED_REQUEST";
                  break;
                case 401:
                  errorType = "UNAUTHORISED_REQUEST";
                  break;
                case 403:
                  errorType = "UNAUTHORISED_REQUEST";
                  break;
                case 404:
                  errorType = "NOT_FOUND";
                  break;
                case 409:
                  errorType = "CONFLICT";
                  break;
                case 408:
                  errorType = "REQUEST_TIMEOUT";
                  break;
                case 500:
                  errorType = "INTERNAL_SERVER_ERROR";
                  break;
                case 503:
                  errorType = "SERVICE_UNAVAILABLE";
                  break;
                default:
                  var resp = error.response;
                  errorType = "(defaultError) ${resp!.statusMessage}: ${resp.statusCode}";
              }
              break;
            case DioErrorType.sendTimeout:
              errorType = "SEND_TIMEOUT";
              break;
          }
        } else if (error is SocketException) {
          errorType = "SOCKET_EXCEPTION";
        } else {
          errorType = "UNEXPECTED_ERROR";
        }

        return errorType;
      } on FormatException catch (_) {
        return "FORMAT_EXCEPTION";
      } catch (_) {
        return "UNEXPECTED_ERROR";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "UNABLE_TO_PROCESS";
      } else {
        return "UNEXPECTED_ERROR";
      }
    }
  }

  static String getErrorMessage(String err) {
    var errorMessage = "";
    switch (err) {
      case "CANCEL":
        errorMessage = "Proses telah dibatalkan";
        break;
      case "CONNECT_TIMEOUT":
        errorMessage = "Jaringan Anda terlalu lama";
        break;
      case "DEFAULT":
        errorMessage = "Gagal memproses permintaan Anda";
        break;
      case "RECEIVE_TIMEOUT":
        errorMessage = "Receive timeout in connection with API server";
        break;
      case "CONFLICT":
        errorMessage = "Data yang Anda kirim sudah ada sebelumnya";
        break;
      case "INTERNAL_SERVER_ERROR":
        errorMessage = "Maaf.. permintaan Anda saat ini tidak dapat kami proses. Silahkan coba beberapa saat lagi";
        break;
      case "OTHER":
        errorMessage = "Maaf.. terjadi kesalahan";
        break;
      default:
        errorMessage = err;
    }


    return errorMessage;
  }
}