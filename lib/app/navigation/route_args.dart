import 'package:pkp_hub/data/models/project.dart';

class ConsultationDetailsArgs {
  const ConsultationDetailsArgs({required this.project});

  final Project project;
}

class ChatArgs {
  const ChatArgs({this.name});

  final String? name;
}

class PaymentArgs {
  const PaymentArgs({required this.amount, this.method});

  final double amount;
  final String? method;
}

class VerifyOtpArgs {
  const VerifyOtpArgs({required this.email});

  final String email;
}

class ProjectsRouteArgs {
  const ProjectsRouteArgs({this.status});

  final String? status;
}

class ProjectReviewArgs {
  const ProjectReviewArgs({required this.project});

  final Project project;
}

class ConsultantDetailsArgs {
  const ConsultantDetailsArgs({
    required this.consultantId,
    required this.projectId,
    this.isPaidConsultation = false,
    this.consultation,
    this.requireLoginForAction = false,
  });

  final String consultantId;
  final String projectId;
  final bool isPaidConsultation;
  final dynamic consultation; // Keep dynamic to avoid tight coupling to model
  final bool requireLoginForAction;
}

class ConsultationArgs {
  const ConsultationArgs({
    required this.projectId,
    this.lat = 0.0,
    this.long = 0.0,
    this.sortBy,
    this.showCreateCta = false,
    this.requireLoginForAction = false,
    this.type,
  });

  final String projectId;
  final double lat;
  final double long;
  final String? sortBy;
  final bool showCreateCta;
  final bool requireLoginForAction;
  final String? type;
}

class ProjectDetailsArgs {
  const ProjectDetailsArgs({
    required this.projectId,
    this.homeOwnerId,
    this.homeOwnerName,
    this.consultantId,
    this.consultantName,
  });

  final String projectId;
  final int? homeOwnerId;
  final String? homeOwnerName;
  final int? consultantId;
  final String? consultantName;
}

class PrototypeDesignDetailsArgs {
  const PrototypeDesignDetailsArgs({
    required this.design,
    required this.imageUrl,
  });

  final dynamic design; // PrototypeDesign
  final String imageUrl;
}

class LocationDetailsArgs {
  const LocationDetailsArgs({
    this.consultantId,
    this.isPaidConsultation = false,
    this.type,
  });

  final String? consultantId;
  final bool isPaidConsultation;
  final String? type;
}

class LoginArgs {
  const LoginArgs({this.fromRoute, this.returnArguments});

  final String? fromRoute;
  final dynamic returnArguments;
}
