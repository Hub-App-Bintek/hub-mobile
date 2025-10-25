import 'package:get/get.dart';
import 'package:pkp_hub/core/base/base_controller.dart';
import 'package:pkp_hub/data/models/portfolio.dart';
import 'package:pkp_hub/data/models/response/portfolio_response.dart';
import 'package:pkp_hub/domain/usecases/consultant/get_consultant_portfolio_list_use_case.dart';

class ConsultantPortfolioController extends BaseController {
  final String _consultantId;
  final GetConsultantPortfolioListUseCase _getPortfolioListUseCase;

  final portfolios = <Portfolio>[].obs;
  final isLoading = false.obs;
  final hasMore = true.obs;
  int _page = 1;
  final int _pageSize = 10;

  ConsultantPortfolioController(
    this._consultantId,
    this._getPortfolioListUseCase,
  );

  @override
  Future<void> onInit() async {
    super.onInit();
    loadInitial();
  }

  void loadInitial() {
    portfolios.clear();
    _page = 0;
    hasMore.value = true;
    loadMore();
  }

  void loadMore() async {
    if (isLoading.value || !hasMore.value) return;
    isLoading.value = true;
    await handleAsync<PortfolioResponse>(
      () => _getPortfolioListUseCase(
        consultantId: _consultantId,
        page: _page,
        size: _pageSize,
      ),
      onSuccess: (response) {
        final newItems = response.portfolios;
        portfolios.addAll(newItems);
        _page++;
        hasMore.value = newItems.length == _pageSize;
      },
      onFailure: (failure) {
        hasMore.value = false;
        showError(failure);
      },
    );
    isLoading.value = false;
  }
}
