import 'package:freezed_annotation/freezed_annotation.dart';

part 'approve_design_request.freezed.dart';
part 'approve_design_request.g.dart';

@freezed
class ApproveDesignRequest with _$ApproveDesignRequest {
  const factory ApproveDesignRequest({
    String? approvedVersion,
    String? revisionNotes,
  }) = _ApproveDesignRequest;

  factory ApproveDesignRequest.fromJson(Map<String, dynamic> json) =>
      _$ApproveDesignRequestFromJson(json);
}
