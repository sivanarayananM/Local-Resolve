package com.localresolve.config;

import com.localresolve.model.User;
import com.localresolve.model.enums.Role;
import com.localresolve.repository.UserRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class DataSeeder {

    @Bean
    CommandLineRunner seedAdminUser(UserRepository userRepository, PasswordEncoder passwordEncoder) {
        return args -> {
            if (!userRepository.existsByEmail("admin@localresolve.com")) {
                User admin = User.builder()
                        .name("Admin")
                        .email("admin@localresolve.com")
                        .password(passwordEncoder.encode("admin123"))
                        .role(Role.ADMIN)
                        .build();
                userRepository.save(admin);
                System.out.println("✅ Admin user seeded successfully.");
            } else {
                System.out.println("ℹ️ Admin user already exists, skipping seed.");
            }
        };
    }
}
