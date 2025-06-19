
# jiitak_test

# 🌤️ Weather & News Aggregator App

A Flutter-based application that aggregates real-time weather data and news, with a smart **weather-based news filtering system**.

---

## 🧭 Features

- Detects user location on launch and requests permission if needed.
- Displays current weather and 5-day forecast (filtered by midday time).
- News content dynamically changes based on current weather temperature.
- Users can filter news categories and select unit preferences (°C/°F).
- Drawer menu for settings: Unit type and preferred categories.
- Smart pagination (10 news per page with 10 pages total).
- Elegant UI with bottom sheets for full news previews.

---

## 🚀 Getting Started

### 1. 🔁 Initial Navigation Flow

- The app launches into `init_location_screen.dart`.
- If location permission is granted:
  ```dart
If permanently denied:

Navigates the user to App Settings to manually enable permissions.

🏠 Home Screen
Injects HomeViewModel (extends GetxController).

Shows current weather, forecast, and filtered news content.

Uses the following widgets:

🔧 Drawer Features
UnitExpansionTile
Path: lib/View/drawer/widgets/unit_expantion_tile_widget.dart

Allows the user to choose between:

metric for °C

imperial for °F

Changes trigger a new API call to update the weather data.

CategoryExpansionTile
Path: lib/View/drawer/widgets/category_expantion_tile_widget.dart

User can select up to 5 categories.

On exceeding 5, the earliest selected category is removed.

Toggling a selected category removes it.

Uses two variables in the controller:

categoryList: Tracks selected categories.

joinedCategory: Joins selected categories using " OR " for API requests.

🌦️ Weather Data
🔸 Current Weather
API: OpenWeather API

Service: lib/Services/weather_service.dart

Method: fetchCurrentWeather()

Called from: HomeViewModel → assigns result to WeatherData model

🔸 5-Day Forecast
Data every 3 hours — filtered for 12:00 PM:

dart
Copy
Edit
final dailyForecasts = forecastData.list.where((item) {
  return item.dtTxt.hour == 12;
}).toList();
Displays forecast for the upcoming 5 days.

📰 News Data
API: News API

Initially filtered based on temperature using:

Method: setKeywordsWithTemperature() in CommonViewModel

Temperature-based News Filtering

-----------------------------------
Temperature 	Displayed News Types
------------------------------------
Hot	            Fear, Danger
Warm            Winning, Positivity, Happiness
Cold            Depression, Tragedy![1000083682](https://github.com/user-attachments/assets/82ee313c-accf-4922-a9db-425c191ca69e)
![1000083680](https://github.com/user-attachments/assets/8d5b3800-f12b-4d9d-9135-81539c094ad7)
![1000083684](https://github.com/user-attachments/assets/1e18de63-9c02-4f3f-b90f-8e6352ccd4ef)
