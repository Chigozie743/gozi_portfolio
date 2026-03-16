import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gozie_williams_portfolio/data/repositories/portfolio/portfolio_repository_abstract.dart';
import 'package:gozie_williams_portfolio/data/repositories/portfolio/portfolio_repository_impl.dart';
import 'package:gozie_williams_portfolio/data/sources/local/portfolio_source.dart';

final portfolioSourceProvider = Provider<PortfolioSource>((ref) {
  return const PortfolioSource();
});

final portfolioRepositoryProvider = Provider<PortfolioRepositoryAbstract>((ref) {
  final source = ref.watch(portfolioSourceProvider);
  return PortfolioRepositoryImpl(source);
});
