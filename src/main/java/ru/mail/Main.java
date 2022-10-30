package ru.mail;

import org.flywaydb.core.Flyway;
import org.jetbrains.annotations.NotNull;

public class Main {
    private static final String mirgationsLocation = "db";

    public static void main(String[] args) {
        if(args.length < 4) {
            throw new IllegalStateException("Not enough arguments. Try again");
        }

        final var dbConnection = args[0];
        final var dbName = args[1];
        final var username = args[2];
        final var password = args[3];

        doMigrations(dbConnection, dbName, username, password);
    }

    private static void doMigrations(@NotNull String connection,
                                     @NotNull String dbName,
                                     @NotNull String userName,
                                     @NotNull String password) {
        final Flyway flyway = Flyway
                .configure()
                .dataSource(connection + dbName, userName, password)
                .locations(mirgationsLocation)
                .load();

        flyway.migrate();
        System.out.println("Migrations applied successfully");
    }
}