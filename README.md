<br clear="both">
<a href="https://git.io/typing-svg"><img src="https://readme-typing-svg.demolab.com?font=Protest+Guerrilla&weight=900&size=45&pause=1000&color=F78918&width=835&height=100&lines=News+App+%F0%9F%98%8A%E2%9C%8C%EF%B8%8F" alt="Typing SVG" /></a>
<br clear="both">

[![Flutter Version](https://img.shields.io/badge/Flutter-v3.0-blue.svg)](https://flutter.dev/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A Flutter-based News App that displays the latest news articles across various categories. The app features a splash screen, search functionality, and categorized news lists. 

## Features

- **Splash Screen**: Displays an animated splash screen before navigating to the homepage.
- **News Categories**: View news across different categories like Business, Entertainment, Health, Science, Sports, and Technology.
- **Search News**: Search functionality to quickly find news articles.
- **Latest News**: Displays the most recent articles on the homepage.
- **News Details**: View detailed news articles with images and content.

## Screens

- **Splash Screen**: An animated splash screen with the app logo and transition to the home page.
- **Home Page**: Displays categorized news using a `TabBarView` and a list of the latest news.
- **News Details**: A detailed view for each news article, including images, author information, and published date.

## Technologies & Packages

- **Flutter**: Dart-based framework for cross-platform mobile development.
- **SplashScreenView**: A library for adding a splash screen with animations.
- **CachedNetworkImage**: For displaying images with caching functionality.
- **Shimmer**: Used for displaying placeholder animations while data is being loaded.

## Folder Structure

```
lib/
├── main.dart                         # Main entry point of the app
├── screen/
│   └── home_page.dart                # Home page with TabBar and latest news list
├── widget/
│   ├── all_news/
│   │   ├── news_list.dart            # Widget to display list of news articles
│   │   └── tab_bar_build.dart        # Custom TabBar widget for news categories
│   ├── lastest_news/
│   │   └── horizontal_list_recent_news.dart  # Widget for displaying latest news in a horizontal list
│   └── search/
│       └── search_news_build.dart    # Widget for search functionality
└── api/
    └── get_news_service_api.dart     # Service class for fetching news from the API
```

## Getting Started

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart: Included with the Flutter installation.
- IDE: Preferably [Android Studio](https://developer.android.com/studio) or [VS Code](https://code.visualstudio.com/).

### Installation

1. **Clone the Repository**

   ```
   git clone https://github.com/your-username/news-app.git
   cd news-app
   ```

2. **Install Dependencies**

   ```
   flutter pub get
   ```

3. **Run the App**

   ```
   flutter run
   ```

### API Integration

To fetch news data, the `GetAllNewsService` in `get_news_service_api.dart` should be configured with a news API endpoint. You can use any public API like [NewsAPI](https://newsapi.org/). Make sure to add your API key to the `request` function.

## Usage

- Upon launching the app, you will see the splash screen with the app logo.
- After the splash screen, the home page will show the latest news and a tab bar with different categories.
- Click on any category to view the relevant news.
- Use the search bar to find specific news articles.
- Click on any article to read more details.

## Screenshots

| Splash Screen | Home Page | News Details |
|---|---|---|
| ![Splash Screen](assets/splashscreen.png) | ![Home Page](assets/home_news_screen.png) | ![News Details](assets/details_screen.png) |

## Contributing

Contributions are highly encouraged! If you would like to contribute to `News App`, please follow these steps:

1. **Fork the Repository**.
2. **Create a New Branch**:
   ```bash
   git checkout -b feature/YourFeature
   ```
3. **Commit Your Changes**:
   ```bash
   git commit -m "Add your message"
   ```
4. **Push to the Branch**:
   ```bash
   git push origin feature/YourFeature
   ```
5. **Open a Pull Request**.

## Congratulations

You’ve successfully integrated `News App` into your Flutter app! For more advanced features and customization options.

If you found this guide helpful, don’t forget to ⭐ star this repository on GitHub to show your support!

Thank you for reading!
## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any questions or inquiries, feel free to reach out:

- **GitHub:** [mohamedmagdy2301](https://github.com/mohamedmagdy2301)
- **Email:** [mohammedmego15@gmail.com](mohammedmego15@gmail.com)

