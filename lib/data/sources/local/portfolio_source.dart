import 'package:gozie_williams_portfolio/constants/utils/app_assets.dart';
import 'package:gozie_williams_portfolio/models/profile/profile_model.dart';
import 'package:gozie_williams_portfolio/models/project/project_model.dart';

class PortfolioSource {
  const PortfolioSource();

  ProfileModel fetchProfile() {
    return const ProfileModel(
      name: 'Iwuoha Chigozie Williams',
      role: 'Mobile Software Engineer',
      bio:
          'I design and build scalable Flutter apps for Android, iOS, and Web. My work focuses on performance, maintainability, and delivering business value fast.',
      githubUrl: 'https://github.com/Chigozie743',
      linkedinUrl: 'https://www.linkedin.com/in/iwuoha-chigozie-williams/',
    );
  }

  List<ProjectModel> fetchProjects() {
    return const [
      ProjectModel(
        name: 'Cardify Africa',
        summary:
            'Digital gift card trading application with secure transactions and user wallet features.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=co.savertech.cardify',
        iosUrl: 'https://apps.apple.com/us/app/cardify-africa/id6449608887',
        imageAsset: PortfolioAssetsPath.cardifyAfricaImage,
      ),
      ProjectModel(
        name: 'MyLibri Books',
        summary:
            'Book reading and publishing platform with personalized reading experience.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.libribooks',
        iosUrl: 'https://apps.apple.com/us/app/mylibri-books/id1528198803',
        imageAsset: PortfolioAssetsPath.myLibriBooksImage,
      ),
      ProjectModel(
        name: 'LoadNG',
        summary:
          'Automated Bitcoin-to-Naira exchange app for Nigeria with instant wallet-to-bank conversion from major crypto wallets.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=loadng.com.loadng',
        iosUrl: 'https://apps.apple.com/ng/app/loadng/id1537865343',
        imageAsset: PortfolioAssetsPath.loadNgImage,
      ),
      ProjectModel(
        name: 'Gate Africa',
        summary:
            'Cross-border payments and financial operations app for African markets.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=co.savertech.gateAfrica',
        iosUrl: 'https://apps.apple.com/uy/app/gate-africa/id6470201463',
        imageAsset: PortfolioAssetsPath.gateAfricaImage,
      ),
      ProjectModel(
        name: 'Rosabon Loan App',
        summary:
            'Loan servicing and customer experience app for digital lending operations.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.optisoft.rosabon',
        iosUrl: 'https://apps.apple.com/us/app/rosabon/id6449434438',
        imageAsset: PortfolioAssetsPath.rosabonImage,
      ),
      ProjectModel(
        name: 'Nurquest App',
        summary:
            'Faith and learning focused mobile experience designed for accessible content.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=rightislam.com.ng',
        iosUrl: 'https://apps.apple.com/us/app/nurquest/id6502515755',
      ),
      ProjectModel(
        name: 'Skillwave',
        summary:
            'Customer-facing learning and service platform with polished mobile workflows.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.skillwave.customer',
      ),
      ProjectModel(
        name: 'Smart Agent',
        summary:
            'Agent utility application focused on speed, reliability, and simple onboarding.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.smart.agent',
      ),
    ];
  }
}
