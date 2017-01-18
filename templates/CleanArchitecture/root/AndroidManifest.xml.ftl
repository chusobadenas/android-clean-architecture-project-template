<manifest
    xmlns:android="http://schemas.android.com/apk/res/android">

    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>

    <application
        android:name="${packageName}.AndroidApplication">
        <activity
            android:name="${packageName}.presentation.splash.SplashActivity"
            android:label="@string/app_name"
            android:theme="@style/MySplashTheme">
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        <activity
            android:name="${packageName}.presentation.main.${activityClass}"
            android:label="@string/app_name"
            android:theme="@style/MyAppTheme.NoActionBar">
        </activity>
    </application>
</manifest>
