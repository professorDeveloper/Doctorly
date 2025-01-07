package com.azamovhudstc.doctorly

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication: Application() {
    override fun onCreate() {
        super.onCreate()
        MapKitFactory.setLocale("en_US")
        MapKitFactory.setApiKey("8ac3408b-a9c5-49c1-a161-9750bc804e93")
    }
}
