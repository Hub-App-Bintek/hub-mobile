import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'dart:io';
import 'package:retrofit/dio.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';

abstract class ContractRepository {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> rejectContract(String contractId);
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
    double contractValue,
  );
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  });
}

class ContractRepositoryImpl implements ContractRepository {
  final ContractNetworkDataSource _ds;
  ContractRepositoryImpl(this._ds);

  @override
  Future<Result<Contract, Failure>> getContract(String consultationId) =>
      _ds.getContract(consultationId);

  @override
  Future<Result<Contract, Failure>> signContract(String contractId) =>
      _ds.signContract(contractId);

  @override
  Future<Result<Contract, Failure>> rejectContract(String contractId) =>
      _ds.rejectContract(contractId);

  @override
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
    double contractValue,
  ) => _ds.uploadContract(consultationId, file, contractValue);

  @override
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  }) => _ds.generateDraft(consultationId: consultationId, request: request);
}
