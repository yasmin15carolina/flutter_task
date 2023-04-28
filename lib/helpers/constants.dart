import 'package:dio/dio.dart';

const urlApi = "https://sys-dev.searchandstay.com/api";

const defaultErrorMessage = "Something went wrong";

getHeaders() {
  return {
    "Authorization":
        "Bearer 40fe071962846075452a4f6123ae71697463cad20f51e237e2035b41af0513d8"
  };
}
