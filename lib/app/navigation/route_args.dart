import 'package:pkp_hub/core/enums/consultation_filter_status.dart';
import 'package:pkp_hub/data/models/project.dart';
import 'package:pkp_hub/data/models/prototype_design.dart';

enum VerifyOtpFlow { accountVerification, forgotPassword }

class ConsultationDetailsArgs {
  const ConsultationDetailsArgs({this.project});

  final Project? project;
}

class ChatArgs {
  const ChatArgs({this.name, this.roomId, this.receiverId});

  final String? name;
  final String? roomId;
  final int? receiverId;
}

class PaymentArgs {
  const PaymentArgs({required this.amount, this.method});

  final double amount;
  final String? method;
}

class VerifyOtpArgs {
  const VerifyOtpArgs({
    required this.email,
    this.flow = VerifyOtpFlow.accountVerification,
    this.otpLength,
  });

  final String email;
  final VerifyOtpFlow flow;
  final int? otpLength;
}

class ResetPasswordArgs {
  const ResetPasswordArgs({required this.resetToken, required this.email});

  final String resetToken;
  final String email;
}

class ProjectsRouteArgs {
  const ProjectsRouteArgs({this.status});

  final String? status;
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

class ConsultantsArgs {
  const ConsultantsArgs({
    required this.projectId,
    this.lat = 0.0,
    this.long = 0.0,
    this.sortBy,
    this.showCreateCta = false,
    this.requireLoginForAction = false,
    this.type,
    this.isPaidConsultation = false,
  });

  final String projectId;
  final double lat;
  final double long;
  final String? sortBy;
  final bool showCreateCta;
  final bool requireLoginForAction;
  final String? type;
  final bool isPaidConsultation;
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
  const PrototypeDesignDetailsArgs({required this.designId, this.design});

  final PrototypeDesign? design;
  final String designId;
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

class MainNavigationArgs {
  const MainNavigationArgs({this.selectedIndex, this.consultationStatus});

  final int? selectedIndex;
  final ConsultationFilterStatus? consultationStatus;
}
