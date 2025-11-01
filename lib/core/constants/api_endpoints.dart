/// A centralized repository for all API endpoints used in the application.
abstract class ApiEndpoints {
  // Private constructor to prevent instantiation.
  ApiEndpoints._();

  // --- Auth ---
  static const String login = '/api/auth/login';
  static const String register = '/api/auth/register';
  static const String verifyOtp = '/api/auth/verify-otp';
  // TODO: Update this later since it doesn't exist in the backend yet.
  static const String resendOtp = '/api/auth/resend-otp';
  static const projects = '/api/projects';

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

  // --- Files ---
  static const String filesUpload = '/api/files/upload';
  static const String filesList = '/api/files/list';
  static const String filesDownload = '/api/files/download/{fileId}';
  static const String filesDownloadUrl = '/api/files/download-url';

  // --- Chats ---
  static const String chatMessages = '/api/v1/chats/{consultationId}/messages';
  static const String chatLatest =
      '/api/v1/chats/{consultationId}/messages/latest';

  // --- Revisions ---
  static const String revisions = '/api/revisions';

  // --- Payments ---
  static const String payments = '/api/payments';

  // --- Final Documents ---
  static const String finalDocuments = '/api/final-documents';
  static const String finalDocumentDownload =
      '/api/final-documents/{documentId}/download';
  static const String finalDocumentsApprove =
      '/api/final-documents/consultations/{consultationId}/approve';
  static const String finalDocumentsReject =
      '/api/final-documents/consultations/{consultationId}/reject';

  // --- Prototype Designs (Catalog) ---
  static const String prototypeDesigns = '/api/consultations/designs';

  // Add other endpoints here as the app grows, for example:
  // static const String forgotPassword = '/api/auth/forgot-password';
}
