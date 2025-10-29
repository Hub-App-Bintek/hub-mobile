plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "id.go.pkp.hub"
    compileSdk = maxOf(flutter.compileSdkVersion, 34)
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_17.toString()
    }

    defaultConfig {
        applicationId = "id.go.pkp.hub"
        minSdk = maxOf(flutter.minSdkVersion, 21)
        targetSdk = maxOf(flutter.targetSdkVersion, 34)
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    flavorDimensions += "flavor-type"

    productFlavors {
        create("development") {
            dimension = "flavor-type"
            applicationIdSuffix = ".dev"
            resValue("string", "app_name", "PKP Hub Dev")
        }
        create("staging") {
            dimension = "flavor-type"
            applicationIdSuffix = ".stg"
            resValue("string", "app_name", "PKP Hub Stg")
        }
        create("production") {
            dimension = "flavor-type"
            resValue("string", "app_name", "PKP Hub")
        }
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}
