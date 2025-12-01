import 'package:dio/dio.dart';
import 'package:pkp_hub/core/error/failure.dart';
import 'dart:io';
import 'dart:typed_data';

import 'package:pkp_hub/core/constants/api_endpoints.dart';
import 'package:pkp_hub/core/models/downloaded_file.dart';
import 'package:pkp_hub/core/network/api_client.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/core/network/services/design_api_service.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';

abstract class DesignNetworkDataSource {
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns();
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(String id);
  Future<Result<DownloadedFile, Failure>> downloadPrototypeDesign(String id);
}

class DesignNetworkDataSourceImpl implements DesignNetworkDataSource {
  final ApiClient _apiClient;
  final DesignApiService _designApi;
  DesignNetworkDataSourceImpl(this._apiClient, this._designApi);

  @override
  Future<Result<List<PrototypeDesign>, Failure>> getPrototypeDesigns() async {
    try {
      final response = await _designApi.getPrototypeDesigns();
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to parse prototype designs: $e'),
      );
    }
  }

  @override
  Future<Result<PrototypeDesign, Failure>> getPrototypeDesignById(
    String id,
  ) async {
    try {
      final response = await _designApi.getPrototypeDesignById(id);
      return Success(response);
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to fetch prototype design: $e'),
      );
    }
  }

  @override
  Future<Result<DownloadedFile, Failure>> downloadPrototypeDesign(
    String id,
  ) async {
    try {
      final tempDir = Directory.systemTemp;
      final tempPath =
          '${tempDir.path}/prototype-$id-${DateTime.now().millisecondsSinceEpoch}.zip';

      final url = ApiEndpoints.prototypeDesignDownload.replaceFirst('{id}', id);

      final response = await _apiClient.dio.download(
        url,
        tempPath,
        options: Options(responseType: ResponseType.stream),
      );

      String? fileName;
      final cd = response.headers.map['content-disposition']?.first;
      if (cd != null) {
        fileName = _extractFileNameFromContentDisposition(cd);
      }
      fileName ??= 'prototype-$id.zip';

      return Success(
        DownloadedFile(fileName: fileName, bytes: Uint8List(0), path: tempPath),
      );
    } on DioException catch (e) {
      return Error(_apiClient.toFailure(e));
    } catch (e) {
      return Error(
        ServerFailure(message: 'Failed to download prototype design: $e'),
      );
    }
  }

  String? _extractFileNameFromContentDisposition(String? contentDisposition) {
    if (contentDisposition == null) return null;
    final regex = RegExp(
      r'''filename\*=UTF-8'[^']*'([^;]+)|filename="?([^";]+)"?''',
    );
    final match = regex.firstMatch(contentDisposition);
    if (match != null) {
      final fn1 = match.group(1);
      final fn2 = match.group(2);
      return (fn1 ?? fn2)?.trim();
    }
    return null;
  }
}
