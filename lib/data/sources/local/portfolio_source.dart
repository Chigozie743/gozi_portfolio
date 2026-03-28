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
        details:
          'Cardify Africa is a digital trading and wallet platform built for smooth gift card transactions, secure account management, and reliable user wallet operations. The app focuses on speed, trust, and a polished financial experience for users buying, selling, and managing value digitally.',
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
        details:
          'MyLibri Books is a mobile reading and publishing platform designed to help users discover, read, and engage with books through a personalized digital experience. It supports content accessibility, intuitive browsing, and a streamlined reading flow for both casual readers and active learners.',
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
        details:
            'LoadNG provides a fully automated Bitcoin-to-Naira exchange experience for users in Nigeria, enabling instant conversion from popular wallets such as Paxful, Binance, Luno, Blockchain, Cash App, and more. Its core value lies in seamless crypto selling with direct and immediate Naira settlement into user accounts without manual intervention.',
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
        details:
          'Gate Africa is a finance-focused mobile product built to support cross-border payments and modern financial operations across African markets. The app emphasizes efficient transfers, accessible money movement, and a dependable experience for users handling international and regional financial activities.',
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
        details:
          'Rosabon Loan App is a digital lending experience tailored for customers who need convenient access to loan services, account visibility, and repayment interactions on mobile. The product improves loan servicing workflows with a customer-centered interface focused on clarity, responsiveness, and trust.',
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
        details:
          'Nurquest is a faith and learning mobile app created to make spiritual and educational content more accessible, engaging, and easy to navigate. The experience is designed around simplicity, content clarity, and an intuitive flow that supports users consuming guided knowledge on the go.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=rightislam.com.ng',
        iosUrl: 'https://apps.apple.com/us/app/nurquest/id6502515755',
        imageAsset: PortfolioAssetsPath.nurquestImage,
      ),
      ProjectModel(
        name: 'Skillwave',
        summary:
          'All-in-one service marketplace for booking verified providers, managing tasks, and handling secure payments with ease.',
        details:
            'Skillwave connects users with verified vendors, service providers, skilled professionals, and smart agents in one secure mobile marketplace. It simplifies shopping, service booking, task tracking, support requests, and payments while creating a trusted ecosystem for both customers and providers.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.skillwave.customer',
        imageAsset: PortfolioAssetsPath.skillwaveImage,
      ),
      ProjectModel(
        name: 'Smart Agent',
        summary:
          'Commission-based agent app for assisting users with registrations, bookings, and purchases while tracking earnings on Skillwave.',
        details:
            'Smart Agent empowers users to earn commissions by helping people complete registrations, bookings, purchases, and other transactions on the Skillwave platform. It is designed as a lightweight productivity and earnings tool that makes it easy to support communities while tracking agent-linked activity and rewards.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.smart.agent',
        imageAsset: PortfolioAssetsPath.smartAgentImage,
      ),
    ];
  }
}
