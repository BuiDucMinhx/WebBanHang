package com.minh;

import java.util.ArrayList;
import java.util.List;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;


@Configuration
@EnableConfigurationProperties
@ConfigurationProperties
public class YAMLConfig {
 
    private String name;
    private String environment;
    private boolean enabled;
    private List<String> servers = new ArrayList<>();

    // standard getters and setters

}