package eu.sesma.komupla

import android.os.Bundle
import android.support.v7.app.AppCompatActivity
import com.touchsurgery.tsmpp.WeatherApi
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.*
import kotlin.coroutines.CoroutineContext


class MainActivity : AppCompatActivity(), CoroutineScope {
    private val job = Job()
    override val coroutineContext: CoroutineContext
        get() = job

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        main_text.text = createApplicationScreenMessage()

        val weatherApi = WeatherApi()
        launch(Dispatchers.Main) {
            try {
                val result = withContext(Dispatchers.IO) { weatherApi.fetchWeather() }
                weather.text = result
            } catch (e: Exception) {
                weather.text = e.message
            }
        }
    }
}
