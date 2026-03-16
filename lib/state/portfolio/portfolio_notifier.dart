import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gozie_williams_portfolio/data/repositories/portfolio/portfolio_repository_abstract.dart';
import 'package:gozie_williams_portfolio/state/portfolio/portfolio_state.dart';

class PortfolioNotifier extends StateNotifier<PortfolioState> {
  PortfolioNotifier(PortfolioRepositoryAbstract repository)
      : super(
          PortfolioState(
            profile: repository.getProfile(),
            projects: repository.getProjects(),
            selectedFilter: 'All',
          ),
        );

  void changeFilter(String filter) {
    state = state.copyWith(selectedFilter: filter);
  }
}
