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
            'Global digital wallet for sending, receiving, and spending money with multi-currency wallets, virtual dollar cards, USD ACH accounts, and USDT.',
        details:
          'Cardify Africa is a powerful fintech app built to help users send, receive, and spend money globally with ease. It combines multi-currency wallets, virtual dollar cards, USD ACH accounts, and USDT in one seamless experience. Whether you are a freelancer, entrepreneur, or everyday user, Cardify gives you practical tools to pay globally, earn internationally, and manage your money effortlessly.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=co.savertech.cardify',
        iosUrl: 'https://apps.apple.com/us/app/cardify-africa/id6449608887',
        imageAsset: PortfolioAssetsPath.cardifyAfricaImage,
      ),
      ProjectModel(
        name: 'MyLibri Books',
        summary:
            'Digital library platform improving reading culture and education accessibility with 24/7 access to diverse book genres.',
        details:
          'MyLibriBooks is a digital library platform built to transform reading culture and educational accessibility. It offers 24/7 access to a wide range of book genres for different interests and learning needs, with seamless access to educational resources across all levels. Key features include bookmarks, highlights, a personalized library, wishlist, offline reading downloads, and referral earnings, backed by responsive customer support for user inquiries.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.libribooks',
        iosUrl: 'https://apps.apple.com/us/app/mylibri-books/id1528198803',
        imageAsset: PortfolioAssetsPath.myLibriBooksImage,
      ),
      ProjectModel(
        name: 'LoadNG',
        summary:
          'Automated Bitcoin-to-Naira exchange app for instant crypto selling and direct bank payouts in Nigeria.',
        details:
            'LoadNG enables users in Nigeria to sell Bitcoin instantly through a fully automated flow, with support for wallets like Paxful, Blockchain, Binance, LocalBitcoins, Luno, Cash App, and others. After account registration, users enter the amount to sell and receive an automatic Naira value calculation. For Paxful transactions, users are redirected to confirm; for Blockchain and other wallets, a dedicated LoadNG wallet is generated for transfer and instant processing. Once Bitcoin is confirmed, the system credits Naira automatically and processes auto-withdrawal directly to the user\'s registered bank account without manual intervention.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=loadng.com.loadng',
        iosUrl: 'https://apps.apple.com/ng/app/loadng/id1537865343',
        imageAsset: PortfolioAssetsPath.loadNgImage,
      ),
      ProjectModel(
        name: 'Gate Africa',
        summary:
            'Community platform for marketplace trading, shared interests, and residential smart-home management.',
        details:
          'Gate Africa is a multifaceted community application built to connect like-minded individuals through marketplace trading, shared-interest discovery, and robust community management tools. It also serves as a residential community hub with advanced alarm systems and integrated smart home devices, enabling convenient and efficient household management from one platform.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=co.savertech.gateAfrica',
        iosUrl: 'https://apps.apple.com/uy/app/gate-africa/id6470201463',
        imageAsset: PortfolioAssetsPath.gateAfricaImage,
      ),
      ProjectModel(
        name: 'Rosabon Loan App',
        summary:
            'Savings and credit app offering instant loans, flexible repayment, and investment-focused financial growth tools.',
        details:
          'Rosabon Mobile App is a comprehensive savings and credit platform for individuals and businesses, combining instant loan access, flexible repayment options, competitive investment returns, and easy onboarding. It provides diverse savings plans that help users maintain better control and flexibility over financial goals. Designed for students, salary earners, and enterprises of different sizes, the app enables users to manage credit needs and build long-term wealth from one mobile experience.',
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
          'Secure service and commerce app for shopping, booking providers, tracking tasks, and managing payments with verified professionals.',
        details:
            'Skillwave connects users with verified vendors, service providers, skilled professionals, and smart agents in one secure mobile experience. It makes it easy to shop for products, book services, request help, track tasks, and manage payments with confidence. Whether users need home services, professional support, or skill-based tasks, or want to earn as providers, vendors, or smart agents, Skillwave delivers a seamless platform built on convenience, trust, and transparency—effortless to use and secure in every interaction.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.skillwave.customer',
        imageAsset: PortfolioAssetsPath.skillwaveImage,
      ),
      ProjectModel(
        name: 'Smart Agent',
        summary:
          'Agent earnings feature for assisting registrations, bookings, and purchases while earning commissions per successful transaction.',
        details:
            'The Smart Agent feature enables users to earn income by helping people complete bookings, purchases, and registrations on the Skillwave platform. Agents can support family, friends, and communities, and receive rewards for every successful transaction linked to their account. Core actions include onboarding new customers or service providers, earning automatic commissions whenever they transact, and tracking agent-linked registrations and activity from one streamlined mobile workflow.',
        platform: 'Mobile',
        androidUrl:
            'https://play.google.com/store/apps/details?id=com.smart.agent',
        imageAsset: PortfolioAssetsPath.smartAgentImage,
      ),
    ];
  }
}
