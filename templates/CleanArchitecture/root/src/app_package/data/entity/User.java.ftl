package ${packageName}.data.entity;

import androidx.annotation.Nullable;

import com.google.auto.value.AutoValue;
import com.google.gson.Gson;
import com.google.gson.TypeAdapter;

/**
 * Represents a user.
 */
@AutoValue
public abstract class User {

  public abstract String name();

  @Nullable
  public abstract String surname();

  public static User create(String name, String surname) {
    return new AutoValue_User(name, surname);
  }

  public static TypeAdapter<User> typeAdapter(Gson gson) {
    return new AutoValue_User.GsonTypeAdapter(gson);
  }
}
