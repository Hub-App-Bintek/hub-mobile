
plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "id.go.pkp.hub"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "id.go.pkp.hub"
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
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
