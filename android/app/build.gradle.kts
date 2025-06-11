plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")
    id("dev.flutter.flutter-gradle-plugin")
}

<<<<<<< HEAD
=======
dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.15.0"))
    implementation("com.google.firebase:firebase-analytics")
}

>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
android {
    namespace = "com.gabriellybassetto.leitor_acessivel"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = "27.0.12077973"

<<<<<<< HEAD
    defaultConfig {
        applicationId = "com.gabriellybassetto.leitor_acessivel"
        minSdk = 23
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
        multiDexEnabled = true
    }

=======
>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

<<<<<<< HEAD
    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = false         // minificação desligada
            isShrinkResources = false       // remoção de recursos desligada para evitar erro
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
=======
    defaultConfig {
        // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
        applicationId = "com.gabriellybassetto.leitor_acessivel"
        // You can update the following values to match your application needs.
        // For more information, see: https://flutter.dev/to/review-gradle-config.
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // TODO: Add your own signing config for the release build.
            // Signing with the debug keys for now, so `flutter run --release` works.
            signingConfig = signingConfigs.getByName("debug")
>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
        }
    }
}

<<<<<<< HEAD
dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.15.0"))
    implementation("com.google.firebase:firebase-analytics")
    implementation("androidx.multidex:multidex:2.0.1")
}

=======
>>>>>>> 7d3cdea0458b658c32447f4485123d900f153cf2
flutter {
    source = "../.."
}
