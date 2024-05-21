plugins {
	java
	id("org.springframework.boot") version "3.2.5"
	id("io.spring.dependency-management") version "1.1.4"
}

group = "com.airwallex"
version = "0.0.1-SNAPSHOT"

java {
	sourceCompatibility = JavaVersion.VERSION_17
}

repositories {
	mavenCentral()
}

dependencies {
	implementation("org.springframework.boot:spring-boot-starter-web")
	testImplementation("org.springframework.boot:spring-boot-starter-test")
	implementation("org.crac:crac:1.4.0") // Only for Checkpoint on refresh in Spring Boot: -Dspring.context.checkpoint=onRefresh
}

tasks.withType<Test> {
	useJUnitPlatform()
}
