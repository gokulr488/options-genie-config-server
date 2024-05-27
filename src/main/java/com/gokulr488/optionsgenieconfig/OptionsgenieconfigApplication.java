package com.gokulr488.optionsgenieconfig;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@SpringBootApplication
@EnableConfigServer
public class OptionsgenieconfigApplication {

	public static void main(String[] args) {
		SpringApplication.run(OptionsgenieconfigApplication.class, args);
	}

}
