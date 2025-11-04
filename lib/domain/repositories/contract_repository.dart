import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'package:retrofit/dio.dart';
import 'package:pkp_hub/data/models/request/generate_contract_draft_request.dart';
import 'package:pkp_hub/data/models/response/upload_contract_response.dart';
import 'package:pkp_hub/domain/usecases/contract/upload_contract_param.dart';

abstract class ContractRepository {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> rejectContract(String contractId);
  Future<Result<Contract, Failure>> approveContract(String contractId);
  Future<Result<Contract, Failure>> requestRevision(
    String contractId,
    String? revisionNotes,
  );

  Future<Result<Contract, Failure>> requestPayment(String contractId);
  Future<Result<UploadContractResponse, Failure>> uploadContract(
    UploadContractParam param,
  );
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  });
}

class ContractRepositoryImpl implements ContractRepository {
  final ContractNetworkDataSource _remoteDataSource;
  ContractRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<Contract, Failure>> getContract(String consultationId) =>
      _remoteDataSource.getContract(consultationId);

  @override
  Future<Result<Contract, Failure>> signContract(String contractId) =>
      _remoteDataSource.signContract(contractId);

  @override
  Future<Result<Contract, Failure>> rejectContract(String contractId) =>
      _remoteDataSource.rejectContract(contractId);

  @override
  Future<Result<Contract, Failure>> approveContract(String contractId) =>
      _remoteDataSource.approveContract(contractId);

  @override
  Future<Result<Contract, Failure>> requestRevision(
    String contractId,
    String? revisionNotes,
  ) => _remoteDataSource.requestRevision(
    contractId,
    revisionNotes: revisionNotes,
  );

  @override
  Future<Result<Contract, Failure>> requestPayment(String contractId) =>
      _remoteDataSource.requestPayment(contractId);

  @override
  Future<Result<UploadContractResponse, Failure>> uploadContract(
    UploadContractParam param,
  ) => _remoteDataSource.uploadContract(param);

  @override
  Future<Result<HttpResponse<List<int>>, Failure>> generateDraft({
    required String consultationId,
    required GenerateContractDraftRequest request,
  }) => _remoteDataSource.generateDraft(
    consultationId: consultationId,
    request: request,
  );
}
