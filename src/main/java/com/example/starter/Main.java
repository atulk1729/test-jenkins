package com.example.starter;

import com.example.starter.verticle.MainVerticle;
import io.vertx.core.Vertx;

public class Main {

    public static void main(String[] args) {
        Vertx.vertx().deployVerticle(MainVerticle.class.getName());
    }
}