import 'package:pkp_hub/core/error/failure.dart';
import 'package:pkp_hub/core/network/result.dart';
import 'package:pkp_hub/data/datasources/contract/contract_network_data_source.dart';
import 'package:pkp_hub/data/models/contract.dart';
import 'dart:io';

abstract class ContractRepository {
  Future<Result<Contract, Failure>> getContract(String consultationId);
  Future<Result<Contract, Failure>> signContract(String contractId);
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
  );
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
  Future<Result<Contract, Failure>> uploadContract(
    String consultationId,
    File file,
  ) => _ds.uploadContract(consultationId, file);
}
