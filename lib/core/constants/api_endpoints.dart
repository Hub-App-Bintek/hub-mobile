/// A centralized repository for all API endpoints used in the application.
abstract class ApiEndpoints {
  // Private constructor to prevent instantiation.
  ApiEndpoints._();

  // --- Auth ---
  static const String login = '/api/auth/login';
  static const String register = '/api/v2/home-owner/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  // TODO: Update this later since it doesn't exist in the backend yet.
  static const String resendOtp = '/api/auth/resend-otp';
  static const projects = '/api/projects/v2';
  static const projectDetailV2 = '/api/projects/{projectId}/v2';

  /// Obsolete, remove it later
  static const projectsV1 = '/api/projects';
  static const consultationProjects = '/api/consultations/projects';

  // --- User ---
  static const String consultants = '/api/users/consultants';
  static const String consultantPortfolio =
      '/api/users/consultants/{consultantId}/portfolio';

  // --- Consultation Management ---
  static const String consultations = '/api/consultations';
  static const String consultationDetail =
      '/api/consultations/{consultationId}';
  static const String consultationAccept =
      '/api/consultations/{consultationId}/accept';
  static const String consultationReject =
      '/api/consultations/{consultationId}/reject';
  static const String consultationStartActive =
      '/api/consultations/{consultationId}/start-active';
  static const String consultationStartRevision =
      '/api/consultations/{consultationId}/start-revision';
  static const String consultationFinalize =
      '/api/consultations/{consultationId}/finalize-workflow';

  // --- Survey Schedules ---
  static const String surveyByConsultation =
      '/api/survey-schedules/consultations/{consultationId}';
  static const String surveyApprove =
      '/api/survey-schedules/consultations/{consultationId}/approve';
  static const String surveyReject =
      '/api/survey-schedules/consultations/{consultationId}/reject';
  static const String surveyReschedule =
      '/api/survey-schedules/consultations/{consultationId}/reschedule';
  static const String surveyComplete =
      '/api/survey-schedules/consultations/{consultationId}/complete';

  // --- Contracts ---
  // Adjusted to match Contact Management API v1.0
  static const String contractByConsultation =
      '/api/contracts/consultations/{consultationId}';
  static const String contractCreateDraft =
      '/api/contracts/consultations/{consultationId}/draft';
  static const String contractGenerateDraft =
      '/api/contracts/{consultationId}/generate-draft';
  static const String contractRequestApproval =
      '/api/contracts/{contractId}/request-approval';
  static const String contractApprove = '/api/contracts/{contractId}/approve';
  static const String contractRejectPost = '/api/contracts/{contractId}/reject';
  static const String contractRequestRevision =
      '/api/contracts/{contractId}/request-revision';
  static const String contractSign = '/api/contracts/{contractId}/sign';
  static const String contractRequestPayment =
      '/api/contracts/{contractId}/request-payment';
  static const String contractVersions =
      '/api/contracts/projects/{projectId}/consultations/{consultationId}/versions';
  static const String contractRevisedUpload =
      '/api/contracts/consultations/{consultationId}/revised-upload';

  // --- Files ---
  static const String filesUpload = '/api/files/upload';
  static const String filesList = '/api/files/list';
  static const String filesDownload = '/api/files/download/{fileId}';
  static const String filesDownloadUrl = '/api/files/download-url';

  // --- Chats ---
  static const String chatDirectRoom =
      '/api/v1/chat/rooms/direct/{targetUserId}';
  static const String chatRoomDetail = '/api/chats/{roomId}/room';
  static const String chatRoomMessages = '/api/chats/{roomId}/messages';
  static const String chatIncoming = '/api/chats/incoming';

  // --- Locations ---
  static const String locationsProvince = '/api/locations/province';
  static const String locationsRegency = '/api/locations/regency/{provinceId}';
  static const String locationsDistrict = '/api/locations/district/{regencyId}';
  static const String locationsVillage = '/api/locations/village/{districtId}';

  // --- Revisions ---
  static const String revisions = '/api/revisions';

  // --- Payments ---
  static const String payments = '/api/payments';
  static const String paymentApprove = '/api/payments/{paymentId}/approve';

  // --- Design Documents ---
  static const String designDocumentsUpload = '/api/design-documents/upload';
  static const String designDocumentDownload =
      '/api/design-documents/{documentId}/download';
  static const String designDocumentsApprove =
      '/api/design-documents/{designDocumentId}/approve';
  static const String designDocumentsRevisionRequest =
      '/api/design-documents/{consultationId}/revision-request';
  static const String designDocumentsVersions =
      '/api/design-documents/versions';
  static const String designDocumentsVersionDownload =
      '/api/design-documents/versions/{version}/download';

  // --- Prototype Designs (Catalog) ---
  static const String prototypeDesigns = '/api/prototypes';
  static const String prototypeDesignById = '/api/prototypes/{id}';
  static const String prototypeDesignDownload = '/api/prototypes/{id}/download';

  // --- Wallet ---
  static const String walletBalance = '/api/wallet/balance';

  // --- Permit ---
  static const String submitPermit = '/api/permits/{projectId}/submit';
  static const String statusPermit = '/api/permits/{projectId}/status';

  // Add other endpoints here as the app grows, for example:
  // static const String forgotPassword = '/api/auth/forgot-password';
}
