# Architecture de Focus Mentor

## 📊 Analyse Stratégique

### 1. Contexte du Projet
- **Domaine**: SaaS pour photographes professionnels
- **Utilisateurs**: Photographes indépendants et petits studios
- **Plateformes**: iOS, Android, Web
- **Langues**: Français, Anglais
- **Criticité**: Données sensibles (photos, clients)

### 2. Défis Identifiés

#### Techniques
1. **Gestion d'état complexe**: Multiples flux de données (auth, galerie, réservations)
2. **Performance**: Gestion de nombreuses images haute résolution
3. **Synchronisation**: Offline-first avec Drift + Firebase
4. **Sécurité**: Données clients et photos
5. **Scalabilité**: Architecture pour 100K+ utilisateurs

#### Métier
1. **Domaine métier riche**: Portfolios, réservations, facturation (futur)
2. **Flux utilisateur complexes**: Onboarding → Galerie → Portfolio → Réservations
3. **Intégrations externes**: Paiements, calendriers, emails

### 3. Principes Architecturaux Choisis

#### **Clean Architecture + Feature First**
```
✓ Séparation stricte data/domain/presentation
✓ Independance entre features
✓ Testabilité maximale
✓ Maintenabilité long terme
```

#### **Riverpod > GetX/Provider**
```
Raisons:
- Déclaratif et fonctionnel
- Pas de BuildContext
- Testing sans context
- Composable
- Stable et maintenu
```

#### **Drift > Hive/ObjectBox**
```
Raisons:
- SQL typé et type-safe
- Migrations facilement versionnées
- Relations complexes
- Synchronisation avec Firebase
```

#### **Dio > http**
```
Raisons:
- Intercepteurs
- Retry automatique
- Upload/Download progresse
- Request cancellation
- Mock facilement
```

---

## 🏗️ Structure Architecturale Complète

### Niveaux de l'Architecture

```
┌─────────────────────────────────────────┐
│     PRESENTATION LAYER (UI)             │
│  ┌─────────────────────────────────┐   │
│  │ Pages | Widgets | Providers     │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
           ↓ depends on
┌─────────────────────────────────────────┐
│     DOMAIN LAYER (Business Logic)       │
│  ┌─────────────────────────────────┐   │
│  │ Entities | Usecases | Repos     │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
           ↓ depends on
┌─────────────────────────────────────────┐
│     DATA LAYER (Data Access)            │
│  ┌─────────────────────────────────┐   │
│  │ Models | Datasources | Repos    │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
           ↓ depends on
┌─────────────────────────────────────────┐
│     CORE LAYER (Cross-cutting)          │
│  ┌─────────────────────────────────┐   │
│  │ DS | Services | Utils | Config  │   │
│  └─────────────────────────────────┘   │
└─────────────────────────────────────────┘
```

### Mappage Feature First

```
lib/
├── core/                              # ⭐ Couche transverse
│   ├── design_system/                 # Design tokens + composants
│   │   ├── theme/
│   │   │   ├── app_theme.dart
│   │   │   ├── colors.dart
│   │   │   ├── typography.dart
│   │   │   └── theme_provider.dart
│   │   ├── components/                # Réutilisables
│   │   │   ├── buttons.dart
│   │   │   ├── inputs.dart
│   │   │   ├── loading.dart
│   │   │   └── dialogs.dart
│   │   ├── spacing/
│   │   │   └── spacing.dart           # Marges standardisées
│   │   └── shadows/
│   │       └── shadows.dart           # Ombres Material 3
│   │
│   ├── config/                        # Configuration app
│   │   ├── environment.dart
│   │   ├── flavor.dart
│   │   └── build_config.dart
│   │
│   ├── services/                      # Services infrastructure
│   │   ├── di/
│   │   │   ├── service_locator.dart
│   │   │   └── providers.dart         # Providers globaux
│   │   ├── api/
│   │   │   ├── api_client.dart
│   │   │   ├── interceptors/
│   │   │   │   ├── auth_interceptor.dart
│   │   │   │   ├── error_interceptor.dart
│   │   │   │   └── logging_interceptor.dart
│   │   │   └── endpoints.dart
│   │   ├── database/
│   │   │   ├── database.dart          # Drift database
│   │   │   └── migrations/
│   │   ├── firebase/
│   │   │   ├── firebase_service.dart
│   │   │   └── firebase_options.dart
│   │   └── storage/
│   │       └── local_storage.dart
│   │
│   ├── l10n/                          # Localisation
│   │   ├── app_localizations.dart
│   │   ├── app_localizations_en.dart
│   │   ├── app_localizations_fr.dart
│   │   └── l10n_provider.dart
│   │
│   ├── utils/                         # Utilitaires
│   │   ├── validators.dart
│   │   ├── formatters.dart
│   │   ├── logger.dart
│   │   ├── extensions/
│   │   │   ├── string_extensions.dart
│   │   │   ├── date_extensions.dart
│   │   │   └── context_extensions.dart
│   │   ├── constants.dart
│   │   └── exceptions/
│   │       ├── app_exception.dart
│   │       └── network_exception.dart
│   │
│   └── routing/                       # Shared routing logic
│       └── route_names.dart
│
├── features/                          # ⭐ Features métier
│   │
│   ├── auth/                          # 🔐 Feature: Authentification
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── auth_remote_datasource.dart
│   │   │   │   └── auth_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── user_model.dart
│   │   │   │   └── auth_response_model.dart
│   │   │   └── repositories/
│   │   │       └── auth_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   └── user.dart
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── sign_in_usecase.dart
│   │   │       ├── sign_up_usecase.dart
│   │   │       ├── sign_out_usecase.dart
│   │   │       ├── get_current_user_usecase.dart
│   │   │       └── check_auth_status_usecase.dart
│   │   │
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   │   ├── login_page.dart
│   │   │   │   ├── register_page.dart
│   │   │   │   └── onboarding_page.dart
│   │   │   ├── widgets/
│   │   │   │   ├── auth_form.dart
│   │   │   │   └── social_login_buttons.dart
│   │   │   ├── providers/
│   │   │   │   ├── auth_provider.dart
│   │   │   │   ├── sign_in_provider.dart
│   │   │   │   └── sign_up_provider.dart
│   │   │   └── state/
│   │   │       ├── auth_state.dart    # Sealed class / freezed
│   │   │       └── auth_state_notifier.dart
│   │   │
│   │   └── auth.dart                  # Public export
│   │
│   ├── gallery/                       # 🖼️ Feature: Galerie photos
│   │   ├── data/
│   │   │   ├── datasources/
│   │   │   │   ├── photo_remote_datasource.dart
│   │   │   │   └── photo_local_datasource.dart
│   │   │   ├── models/
│   │   │   │   ├── photo_model.dart
│   │   │   │   └── album_model.dart
│   │   │   └── repositories/
│   │   │       └── photo_repository_impl.dart
│   │   │
│   │   ├── domain/
│   │   │   ├── entities/
│   │   │   │   ├── photo.dart
│   │   │   │   └── album.dart
│   │   │   ├── repositories/
│   │   │   │   └── photo_repository.dart
│   │   │   └── usecases/
│   │   │       ├── upload_photo_usecase.dart
│   │   │       ├── get_photos_usecase.dart
│   │   │       ├── create_album_usecase.dart
│   │   │       └── delete_photo_usecase.dart
│   │   │
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   │   ├── gallery_page.dart
│   │   │   │   ├── album_detail_page.dart
│   │   │   │   └── photo_upload_page.dart
│   │   │   ├── widgets/
│   │   │   │   ├── photo_grid.dart
│   │   │   │   ├── photo_card.dart
│   │   │   │   └── upload_progress.dart
│   │   │   ├── providers/
│   │   │   │   ├── gallery_provider.dart
│   │   │   │   └── photo_upload_provider.dart
│   │   │   └── state/
│   │   │       ├── gallery_state.dart
│   │   │       └── upload_state.dart
│   │   │
│   │   └── gallery.dart               # Public export
│   │
│   ├── portfolio/                     # 📸 Feature: Portfolio
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── portfolio.dart
│   │
│   ├── booking/                       # 📅 Feature: Réservations
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── booking.dart
│   │
│   ├── settings/                      # ⚙️ Feature: Paramètres
│   │   ├── data/
│   │   ├── domain/
│   │   ├── presentation/
│   │   └── settings.dart
│   │
│   └── home/                          # 🏠 Feature: Accueil (si besoin)
│       ├── data/
│       ├── domain/
│       ├── presentation/
│       └── home.dart
│
├── app/                               # ⭐ Couche app
│   ├── routes/
│   │   ├── app_router.dart
│   │   ├── route_observer.dart
│   │   └── go_router_provider.dart
│   ├── app.dart
│   └── app_provider.dart
│
└── main.dart                          # Entry point
```

---

## 🔌 Patterns et Conventions Clés

### 1. **Riverpod Providers Stratégie**

```dart
// 📍 Service Layer Provider (réutilisable)
final authServiceProvider = Provider((ref) => AuthService());

// 📍 Repository Provider
final authRepositoryProvider = Provider((ref) {
  return AuthRepositoryImpl(
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
});

// 📍 UseCase Provider
final signInUseCaseProvider = Provider((ref) {
  return SignInUseCase(ref.watch(authRepositoryProvider));
});

// 📍 State Notifier for async operations
final signInProvider = StateNotifierProvider<
  SignInNotifier,
  AsyncValue<User>
>((ref) {
  return SignInNotifier(ref.watch(signInUseCaseProvider));
});

// 📍 Computed Provider (cache + dependencies)
final isUserAuthenticatedProvider = FutureProvider<bool>((ref) async {
  final user = await ref.watch(getCurrentUserProvider.future);
  return user != null;
});
```

### 2. **Freezed pour les States et Models**

```dart
// ✓ Immutabilité garantie
// ✓ Égalité automatique
// ✓ Copy with
// ✓ Pattern matching
// ✓ Sérialisation JSON

part 'auth_state.freezed.dart';
part 'auth_state.g.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(User user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;
}
```

### 3. **Drift pour le Cache Local**

```dart
// ✓ SQL type-safe
// ✓ Migrations versionnées
// ✓ Relations complexes
// ✓ Synchronisation facile

@DataClassName('PhotoData')
class Photos extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get remoteId => text().unique()();
  TextColumn get url => text()();
  DateTimeColumn get createdAt => dateTime()();
  TextColumn get albumId => text()();
}
```

### 4. **GoRouter Navigation Structure**

```dart
// ✓ Deep linking natif
// ✓ Navigation déclarative
// ✓ Gestion d'erreurs
// ✓ Transitions animées

const String routeHome = '/home';
const String routeLogin = '/login';
const String routePhotoDetail = '/photo/:id';
```

### 5. **Firestore Sync Strategy**

```
┌──────────────┐
│   Firestore  │
└──────┬───────┘
       │ (Remote Source of Truth)
       ↓
┌──────────────┐
│    Drift     │ (Local Cache)
└──────┬───────┘
       ↓
┌──────────────┐
│  Riverpod    │ (State Management)
└──────────────┘
```

**Stratégie Sync**:
1. Lire depuis Drift (rapide)
2. Sync Firestore en arrière-plan
3. Merge avec Riverpod
4. Persister en Drift

---

## 🧪 Stratégie de Test

### Hiérarchie des Tests

```
Unit Tests (80%)          Domain + Data layers
├── Usecases
├── Repositories
└── Models

Integration Tests (15%)   Multiple layers
├── Feature flows
├── Database sync
└── Firebase mocking

Widget Tests (5%)         Présentation
├── Critical UI flows
└── Interaction patterns
```

### Mock Strategy

```dart
// ✓ Mockito pour les dépendances
// ✓ Fake implementations pour services
// ✓ Riverpod container override

final fakeAuthRepository = FakeAuthRepository();

test('SignInUseCase returns user when credentials valid', () async {
  final container = ProviderContainer(
    overrides: [
      authRepositoryProvider.overrideWithValue(fakeAuthRepository),
    ],
  );
  
  final result = await container
    .read(signInUseCaseProvider)
    .call(email: 'test@test.com', password: 'password');
});
```

---

## 🤖 GitHub Actions Workflow

### CI/CD Pipeline

```yaml
Triggers:
├── Push to main → Full test + Deploy
├── PR → Lint + Unit tests
├── Release tag → Build + Deploy stores
└── Schedule → Nightly tests

Jobs:
├── analyze          # Dart analyzer
├── test             # Unit + Widget tests
├── build_android    # APK build
├── build_ios        # IPA build
└── deploy           # App stores
```

---

## ⚡ Performance & Optimisations

### Caching Strategy

```
┌─────────────────┐
│  Memory Cache   │ (Riverpod StateNotifier)
│  (Fast)         │
└────────┬────────┘
         ↓ Miss
┌─────────────────┐
│  Drift Cache    │ (SQLite)
│  (Medium)       │
└────────┬────────┘
         ↓ Miss
┌─────────────────┐
│  Firestore API  │ (Network)
│  (Slow)         │
└─────────────────┘
```

### Image Optimization

```
Upload:
├── Compress (JPEG 85%)
├── Resize (2048px max)
└── Generate thumbnail

Display:
├── Cached NetworkImage
├── Blur placeholder
└── Progressive loading
```

---

## 🔐 Sécurité

### Authentication Flow

```
┌─────────────┐
│   User      │
└──────┬──────┘
       │ Credentials
       ↓
┌──────────────────────────┐
│ Firebase Authentication  │
│ (Email/Google/Apple)     │
└──────┬───────────────────┘
       │ ID Token
       ↓
┌──────────────────────────┐
│ Drift Cache              │
│ (Encrypted if needed)    │
└──────────────────────────┘
```

### Data Protection

- ✅ SSL/TLS par défaut
- ✅ Firebase security rules
- ✅ Drift local encryption (optionnel)
- ✅ Tokens stockés sécurisés

---

## 📱 Responsivité

### Layout Breakpoints

```
┌────────────┬─────────────┬──────────────┐
│ Mobile     │ Tablet      │ Desktop      │
│ < 600dp    │ 600-840dp   │ > 840dp      │
└────────────┴─────────────┴──────────────┘
```

### Implémentation

```dart
// ✓ MediaQuery
// ✓ flutter_screenutil
// ✓ Layouts adaptatifs
// ✓ Navigation: Bottom nav (mobile) → Rail (tablet/desktop)
```

---

## 🌐 Internationalisation

### Structure i18n

```
lib/core/l10n/
├── app_localizations.dart      # Base class
├── app_localizations_en.dart   # Anglais
├── app_localizations_fr.dart   # Français
└── l10n_provider.dart          # Riverpod provider
```

### Usage

```dart
// ✓ Context-aware: Text(context.l10n.signIn)
// ✓ Riverpod provider: ref.watch(localeProvider)
// ✓ Plurals et formats
```

---

## 📦 Dependencies Management

### Dependency Injection Container

```dart
// Service Locator avec GetIt
final getIt = GetIt.instance;

void setupServiceLocator() {
  // Firebase
  getIt.registerSingleton(FirebaseAuth.instance);
  
  // Drift
  getIt.registerSingleton(() => AppDatabase());
  
  // API
  getIt.registerSingleton(() => ApiClient(/* ... */));
  
  // Repositories
  getIt.registerSingleton<AuthRepository>(
    () => AuthRepositoryImpl(/* ... */),
  );
}
```

---

## 🚀 Évolutivité Future

### Prêt pour:

1. **Analytics** → Firebase Analytics provider
2. **Offline Support** → Drift sync queue
3. **Notifications** → FCM + local notifications
4. **Payments** → Stripe/Paypal module
5. **Social Features** → Followers, likes, comments
6. **Admin Panel** → Web admin dashboard
7. **API Public** → REST/GraphQL layer

### Extension Points

```
lib/features/
├── [new_feature]/      # Drop-in ready
├── [another_feature]/
└── [third_feature]/
```

---

## 📊 Qualité de Code

### Métriques

```
✓ Test coverage        ≥ 80% (domain + data)
✓ Cyclomatic complexity ≤ 10
✓ Lines per file       ≤ 300
✓ Lines per function   ≤ 20
✓ Linter rules         100% compliant
```

### Tools

```
- dart analyze
- flutter test --coverage
- coverage -> lcov
- dartdoc
```

---

## 🎯 Timeline Recommandée

```
Phase 1 (Semaine 1): Setup + Infrastructure
├── Structure folders
├── Pubspec + dependencies
├── CI/CD setup
├── Design System
└── Firebase config

Phase 2 (Semaine 2-3): Auth Feature
├── Domain + Data layers
├── Providers + State
├── UI pages
└── Tests + Integration

Phase 3 (Semaine 4-5): Gallery Feature
├── Complete architecture showcase
├── Drift integration
├── Image optimization
└── Tests

Phase 4 (Semaine 6+): Autres features
├── Portfolio
├── Booking
├── Settings
```

---

## ✅ Checklist Pre-Development

Voir section suivante...
