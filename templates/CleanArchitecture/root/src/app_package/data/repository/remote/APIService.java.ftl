package ${packageName}.data.repository.remote;

import ${packageName}.BuildConfig;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import java.util.concurrent.TimeUnit;

import okhttp3.OkHttpClient;
import okhttp3.logging.HttpLoggingInterceptor;
import retrofit2.Retrofit;
import retrofit2.adapter.rxjava2.RxJava2CallAdapterFactory;
import retrofit2.converter.gson.GsonConverterFactory;

/**
 * APIService for retrieving data from the network using Retrofit.
 */
public interface APIService {

  int CONNECT_TIMEOUT = 15000;
  int READ_TIMEOUT = 20000;
  int WRITE_TIMEOUT = 20000;

  // PUT YOUT API URL HERE
  String API_BASE_URL = "https://jsonplaceholder.typicode.com/";

  /********
   * Helper class that sets up a new services
   *******/
  class Creator {

    private static OkHttpClient createHttpClient() {
      OkHttpClient.Builder clientBuilder = new OkHttpClient.Builder();

      // Enable logging
      if (BuildConfig.DEBUG) {
        HttpLoggingInterceptor interceptor = new HttpLoggingInterceptor();
        interceptor.setLevel(HttpLoggingInterceptor.Level.BASIC);
        clientBuilder.addInterceptor(interceptor);
      }

      return clientBuilder
          .connectTimeout(CONNECT_TIMEOUT, TimeUnit.MILLISECONDS)
          .readTimeout(READ_TIMEOUT, TimeUnit.MILLISECONDS)
          .writeTimeout(WRITE_TIMEOUT, TimeUnit.MILLISECONDS)
          .build();
      }

      private static Retrofit createRetrofit(String baseUrl) {
        Gson gson = new GsonBuilder()
          .setDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'")
          .registerTypeAdapterFactory(GsonAdapterFactory.create())
          .create();

        return new Retrofit.Builder()
          .baseUrl(baseUrl)
          .client(createHttpClient())
          .addConverterFactory(GsonConverterFactory.create(gson))
          .addCallAdapterFactory(RxJava2CallAdapterFactory.create())
          .build();
      }

      public static APIService newAPIService() {
        return createRetrofit(API_BASE_URL).create(APIService.class);
      }
  }
}
