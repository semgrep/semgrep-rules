package oversecured.ovaa.activities;

import android.content.Intent;
import android.os.Bundle;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import oversecured.ovaa.C0646R;
import oversecured.ovaa.network.LoginService;
import oversecured.ovaa.network.RetrofitInstance;
import oversecured.ovaa.objects.LoginData;
import oversecured.ovaa.utils.LoginUtils;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/* loaded from: classes.dex */
public class LoginActivity extends AppCompatActivity {
    public static final String INTENT_REDIRECT_KEY = "redirect_intent";
    private LoginUtils loginUtils;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(C0646R.layout.activity_login);
        LoginUtils loginUtils = LoginUtils.getInstance(this);
        this.loginUtils = loginUtils;
        if (loginUtils.isLoggedIn()) {
            onLoginFinished();
        } else {
            findViewById(C0646R.C0648id.loginButton).setOnClickListener(new View.OnClickListener() { // from class: oversecured.ovaa.activities.LoginActivity.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    String email = ((TextView) LoginActivity.this.findViewById(C0646R.C0648id.emailView)).getText().toString();
                    String password = ((TextView) LoginActivity.this.findViewById(C0646R.C0648id.passwordView)).getText().toString();
                    if (TextUtils.isEmpty(email)) {
                        Toast.makeText(LoginActivity.this, "Email is emply!", 1).show();
                    } else if (!TextUtils.isEmpty(password)) {
                        LoginActivity.this.processLogin(email, password);
                    } else {
                        Toast.makeText(LoginActivity.this, "Password is emply!", 1).show();
                    }
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processLogin(String email, String password) {
        LoginData loginData = new LoginData(email, password);
        Log.d("ovaa", "Processing " + loginData);
        LoginService loginService = (LoginService) RetrofitInstance.getInstance().create(LoginService.class);
        loginService.login(this.loginUtils.getLoginUrl(), loginData).enqueue(new Callback<Void>() { // from class: oversecured.ovaa.activities.LoginActivity.2
            @Override // retrofit2.Callback
            public void onResponse(Call<Void> call, Response<Void> response) {
            }

            @Override // retrofit2.Callback
            public void onFailure(Call<Void> call, Throwable t) {
            }
        });
        this.loginUtils.saveCredentials(loginData);
        onLoginFinished();
    }

    private void onLoginFinished() {
        Intent redirectIntent = (Intent) getIntent().getParcelableExtra(INTENT_REDIRECT_KEY);
        if (redirectIntent != null) {
            startActivity(redirectIntent);
        } else {
            startActivity(new Intent(this, MainActivity.class));
        }
        finish();
    }
}