# Time Tracking Kanban Board

A feature-rich mobile application for task management with integrated time tracking, built with Flutter following clean architecture principles and industry best practices.

## 📱 Demo

**[Demo Video Link](YOUR_DEMO_VIDEO_LINK)**

### Screenshots

<div style="display: flex; flex-wrap: wrap; gap: 10px;">
  <img src="screenshots/kanban_board.png" width="200" alt="Kanban Board"/>
  <img src="screenshots/task_details.png" width="200" alt="Task Details"/>
  <img src="screenshots/timer_active.png" width="200" alt="Active Timer"/>
  <img src="screenshots/task_history.png" width="200" alt="Task History"/>
  <img src="screenshots/comments.png" width="200" alt="Comments"/>
</div>

## ✨ Features

### Core Features
- ✅ **Kanban Board** - Drag-and-drop task management across three columns (To Do, In Progress, Done)
- ✅ **Time Tracking** - Start/stop/pause timer for each task with persistent state
- ✅ **Task History** - View completed tasks with time spent and completion dates
- ✅ **Comments** - Add and view comments on tasks for better collaboration
- ✅ **Task Management** - Create, edit, delete, and move tasks between columns

### Additional Features
- ✅ **Multi-language Support** - Internationalization (i18n) with English, German, and Turkish
- ✅ **Offline Support** - Works without internet connection, syncs when online
- ✅ **Persistent Storage** - Timer state persists across app restarts
- ✅ **Real-time Updates** - Instant UI updates for all operations
- ✅ **Error Handling** - Graceful error handling with user-friendly messages
- ✅ **Loading States** - Shimmer effects and progress indicators
- ✅ **Responsive UI** - Smooth animations and transitions
- ✅ **Pull to Refresh** - Manual sync with Todoist API

## 🏗️ Architecture

This project follows **Clean Architecture** principles with clear separation of concerns:

```
lib/
├── core/                          # Shared utilities and base classes
│   ├── error/                     # Error handling
│   ├── network/                   # API client configuration
│   ├── usecases/                  # Base use case classes
│   └── utils/                     # Constants and extensions
│
├── features/
│   ├── kanban/                    # Kanban board feature
│   │   ├── data/                  # Data layer
│   │   │   ├── models/            # Data models (JSON serialization)
│   │   │   ├── datasources/       # Remote & local data sources
│   │   │   └── repositories/      # Repository implementations
│   │   ├── domain/                # Domain layer (business logic)
│   │   │   ├── entities/          # Business entities
│   │   │   ├── repositories/      # Repository interfaces
│   │   │   └── usecases/          # Business use cases
│   │   └── presentation/          # Presentation layer (UI)
│   │       ├── bloc/              # BLoC state management
│   │       ├── pages/             # Screen widgets
│   │       └── widgets/           # Reusable UI components
│   │
│   ├── timer/                     # Timer feature
│   ├── history/                   # Task history feature
│   └── comments/                  # Comments feature
│
├── injection_container.dart       # Dependency injection setup
└── main.dart                      # App entry point
```

### Architecture Layers

**Presentation Layer (UI)**
- BLoC for state management
- Widgets and screens
- User interaction handling

**Domain Layer (Business Logic)**
- Pure Dart entities
- Use cases (business operations)
- Repository interfaces
- No dependencies on outer layers

**Data Layer (Data Management)**
- Repository implementations
- Data sources (remote/local)
- Data models with JSON serialization
- API integration

For detailed architecture documentation, see [ARCHITECTURE.md](./ARCHITECTURE.md)

## 🛠️ Tech Stack

### Core
- **Flutter** 3.16.0+ (Dart 3.2.0+)
- **BLoC** (flutter_bloc ^8.1.3) - State management
- **GetIt** (get_it ^7.6.4) - Dependency injection
- **Injectable** (injectable ^2.3.2) - DI code generation

### Data & Storage
- **Dio** (dio ^5.4.0) - HTTP client
- **Hive** (hive ^2.2.3) - Local storage
- **Dartz** (dartz ^0.10.1) - Functional programming (Either type)

### Code Generation
- **Freezed** (freezed ^2.4.6) - Immutable models
- **Json Serializable** (json_serializable ^6.7.1) - JSON serialization
- **Build Runner** (build_runner ^2.4.7) - Code generation

### Testing
- **Mockito** (mockito ^5.4.4) - Mocking
- **Bloc Test** (bloc_test ^9.1.5) - BLoC testing

### UI/UX & Localization
- **Intl** (intl ^0.18.1) - Internationalization & date formatting
- **Flutter Localizations** - Multi-language support (EN, DE, TR)
- **Flutter Slidable** (flutter_slidable ^3.0.1) - Swipe actions

### CI/CD
- **GitHub Actions** - Automated testing and analysis

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.16.0 or higher
- Dart SDK 3.2.0 or higher
- Android Studio / VS Code with Flutter extensions
- Git

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/YOUR_USERNAME/time-tracking-kanban.git
cd time-tracking-kanban
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Set up Todoist API Token**

   a. Go to [Todoist App Management Console](https://app.todoist.com/app/settings/integrations/developer)
   
   b. Create a new app and get your test token
   
   c. Create a `.env` file in the project root:
   ```
   TODOIST_API_TOKEN=your_test_token_here
   ```

4. **Generate code**
```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

5. **Run the app**
```bash
flutter run
```

### Running on Specific Platform

**iOS:**
```bash
flutter run -d ios
```

**Android:**
```bash
flutter run -d android
```

**Web:**
```bash
flutter run -d chrome
```

## 🧪 Testing

### Run All Tests
```bash
flutter test
```

### Run Tests with Coverage
```bash
flutter test --coverage
```

### View Coverage Report
```bash
# Install lcov (macOS)
brew install lcov

# Generate HTML report
genhtml coverage/lcov.info -o coverage/html

# Open report
open coverage/html/index.html
```

### Test Structure
- **Unit Tests** - Business logic, use cases, repositories
- **Widget Tests** - UI components and interactions
- **Integration Tests** - End-to-end user flows

**Test Coverage:** ~[X]%

## 📊 CI/CD

The project includes automated CI/CD pipeline using GitHub Actions:

- ✅ Automated testing on every push/PR
- ✅ Code analysis (`flutter analyze`)
- ✅ Code formatting check (`dart format`)
- ✅ Test coverage reporting

See [`.github/workflows/ci.yml`](.github/workflows/ci.yml) for details.

## 🎯 Design Decisions

### State Management: BLoC

**Why BLoC?**
- Predictable state management with clear event-state flow
- Excellent testability with bloc_test
- Separation of business logic from UI
- Stream-based reactive programming
- Industry standard for complex applications

### Architecture: Clean Architecture

**Benefits:**
- Clear separation of concerns
- Highly testable (each layer independently testable)
- Maintainable and scalable
- Platform-independent business logic
- Easy to modify or replace implementations

### Dependency Injection: GetIt + Injectable

**Advantages:**
- Loose coupling between components
- Easy mocking for tests
- Centralized dependency management
- Code generation reduces boilerplate

### Local Storage: Hive

**Why Hive?**
- Lightweight and fast
- No native dependencies
- Type-safe
- Perfect for timer state persistence

## 📝 API Integration

### Todoist REST API v2

The app integrates with Todoist API for:
- Task CRUD operations
- Task completion tracking
- Comment management

**Key Endpoints Used:**
- `GET /rest/v2/tasks` - Fetch all tasks
- `POST /rest/v2/tasks` - Create new task
- `POST /rest/v2/tasks/{id}` - Update task
- `DELETE /rest/v2/tasks/{id}` - Delete task
- `POST /rest/v2/tasks/{id}/close` - Complete task
- `GET /rest/v2/comments` - Fetch comments
- `POST /rest/v2/comments` - Add comment

**Features:**
- Proper error handling
- Retry mechanism for failed requests
- Offline support with local caching
- Token-based authentication

## 🎨 UI/UX Highlights

- **Material Design 3** - Modern, clean interface
- **Multi-language Support** - Switch between English, German (Deutsch), and Turkish (Türkçe)
- **Smooth Animations** - Drag-and-drop with visual feedback
- **Color-coded Columns** - Easy visual distinction (To Do: Blue, In Progress: Orange, Done: Green)
- **Empty States** - Helpful messages when no data
- **Loading States** - Shimmer effects for better UX
- **Error States** - User-friendly error messages
- **Responsive Design** - Works on various screen sizes

### Language Support

The app supports three languages:
- 🇬🇧 **English** - Default language
- 🇩🇪 **German (Deutsch)** - For German-speaking users
- 🇹🇷 **Turkish (Türkçe)** - For Turkish-speaking users

Language automatically detects device locale and can be manually changed in settings.

## 📖 Code Quality

### Best Practices Applied

✅ **SOLID Principles**
- Single Responsibility Principle
- Open/Closed Principle
- Liskov Substitution Principle
- Interface Segregation Principle
- Dependency Inversion Principle

✅ **Design Patterns**
- Repository Pattern
- Singleton Pattern (GetIt)
- Factory Pattern (use cases)
- Observer Pattern (BLoC streams)

✅ **Code Standards**
- DRY (Don't Repeat Yourself)
- KISS (Keep It Simple, Stupid)
- Consistent naming conventions
- Comprehensive inline documentation
- Meaningful variable and function names

### Code Analysis

```bash
# Run static analysis
flutter analyze

# Check formatting
dart format --set-exit-if-changed .
```

**Analysis Result:** 0 issues

## 🔒 Security Considerations

- ✅ API tokens stored in `.env` (not committed to Git)
- ✅ Secure token handling in API client
- ✅ Input validation for user data
- ✅ Proper error handling (no sensitive data in error messages)
- ✅ HTTPS-only API communication

## 🚧 Known Limitations

- Todoist API rate limiting (450 requests per 15 minutes)
- Timer accuracy depends on app being in foreground (platform limitation)
- Offline mode queues operations but doesn't guarantee order

## 🔮 Future Enhancements

- [ ] Push notifications for task reminders
- [ ] Dark mode support
- [x] ~~Multi-language support (i18n)~~ ✅ **COMPLETED** (English, German, Turkish)
- [ ] Additional languages (Spanish, French, etc.)
- [ ] Advanced analytics and reporting
- [ ] Task priority levels
- [ ] Subtasks support
- [ ] Task filtering and search
- [ ] Collaboration features (real-time updates)
- [ ] Export data (CSV, PDF)

## 📚 Additional Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [BLoC Documentation](https://bloclibrary.dev/)
- [Todoist API Documentation](https://developer.todoist.com/rest/v2/)
- [Clean Architecture Article](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)

## 🤝 Contributing

This is a case study project for innoscripta. For any questions or clarifications, please contact:

**Idris Adeyemi Idris**
- Email: idrisade.eedris@gmail.com
- Phone: +2348135469842
- GitHub: [YOUR_GITHUB_PROFILE]
- LinkedIn: [YOUR_LINKEDIN_PROFILE]

## 📄 License

This project is created as part of a technical assessment for innoscripta.

---

**Built with ❤️ using Flutter**

*Last Updated: December 2025*