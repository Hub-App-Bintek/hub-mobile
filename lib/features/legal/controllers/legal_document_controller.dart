import 'package:get/get.dart';
import 'package:pkp_hub/app/navigation/route_args.dart';
import 'package:pkp_hub/app/theme/app_colors.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/core/enums/legal_document_type.dart';
import 'package:pkp_hub/domain/usecases/legal/get_legal_document_use_case.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LegalDocumentController extends BaseController {
  LegalDocumentController(this._getLegalDocumentUseCase);

  final GetLegalDocumentUseCase _getLegalDocumentUseCase;
  final Rxn<LegalDocumentType> documentType = Rxn<LegalDocumentType>();
  final RxBool isLoading = false.obs;
  final RxString htmlContent = ''.obs;
  late final WebViewController webViewController;

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(AppColors.white);

    final args = Get.arguments as LegalDocumentArgs?;
    documentType.value = args?.type ?? legalDocumentTerms;
    loadDocument();
  }

  Future<void> loadDocument() async {
    if (isLoading.value) return;
    final type = documentType.value ?? legalDocumentTerms;
    isLoading.value = true;
    await handleAsync<String>(
      () => _getLegalDocumentUseCase(type),
      onSuccess: (content) {
        htmlContent.value = content;
        webViewController.loadHtmlString(content);
      },
      onFailure: (failure) {
        htmlContent.value = '';
        showError(failure);
      },
    );
    isLoading.value = false;
  }

  String get title => documentType.value?.title ?? legalDocumentTerms.title;
}
