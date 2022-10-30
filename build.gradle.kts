plugins {
    java
    application
}

group = "ru.mail"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
    gradlePluginPortal()
}

dependencies {
    implementation("org.flywaydb:flyway-core:9.5.1")
    implementation("org.postgresql:postgresql:42.5.0")
    implementation("org.jetbrains:annotations:23.0.0")
    testImplementation("org.junit.jupiter:junit-jupiter-api:5.9.0")
    testRuntimeOnly("org.junit.jupiter:junit-jupiter-engine:5.9.0")
}

application {
    mainClass.set("ru.mail.Main")
}

tasks.getByName<Test>("test") {
    useJUnitPlatform()
}