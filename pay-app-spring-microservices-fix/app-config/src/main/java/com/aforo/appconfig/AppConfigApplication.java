package com.aforo.appconfig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class AppConfigApplication {

    public static void main(String[] args) {
        SpringApplication.run(AppConfigApplication.class, args);
    }

}
