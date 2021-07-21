package com.example.testapp;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.widget.ArrayAdapter;

import java.util.Arrays;
import java.util.LinkedList;

public class MainActivity2 extends AppCompatActivity {

    ArrayAdapter arrayAdapter;
    LinkedList<String> names = new LinkedList<String>(Arrays.asList("Novan", "Prastyo", "Adityo"));


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main2);

        

    }
}