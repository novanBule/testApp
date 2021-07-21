package com.example.testapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {

    Button btnChat;
    Button btnHistory;
    EditText phoneNumber;
    String urlWhatsapp = "https://api.whatsapp.com/send?phone=";
    String pn;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        btnChat = findViewById(R.id.btnChat);
        phoneNumber = findViewById(R.id.phoneNumber);

       btnChat.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {
               pn = phoneNumber.getText().toString();

               if (pn.isEmpty()) {
                   Toast toast = Toast.makeText(v.getContext(), "Nomor telepon tidak boleh kosong", Toast.LENGTH_SHORT);
                   toast.show();
               } else {
                   urlWhatsapp = urlWhatsapp + pn;
                   Intent browserIntent = new Intent(Intent.ACTION_VIEW, Uri.parse(urlWhatsapp));
                   startActivity(browserIntent);
                   phoneNumber.getText().clear();
               }

           }
       });

       btnHistory.setOnClickListener(new View.OnClickListener() {
           @Override
           public void onClick(View v) {

           }
       });
    }
}