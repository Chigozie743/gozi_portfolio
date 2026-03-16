import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gozie_williams_portfolio/provider/repository_provider/repository_provider.dart';
import 'package:gozie_williams_portfolio/state/portfolio/portfolio_notifier.dart';
import 'package:gozie_williams_portfolio/state/portfolio/portfolio_state.dart';

final portfolioStateNotifierProvider =
    StateNotifierProvider<PortfolioNotifier, PortfolioState>((ref) {
      final repository = ref.watch(portfolioRepositoryProvider);
      return PortfolioNotifier(repository);
    });
