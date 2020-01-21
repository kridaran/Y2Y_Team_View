package com.kov.entity;

public class Command {
    String name;
    String password;

    public Command(String name, String password){
        this.name = name;
        this.password = password;
    }

    public Command(){}

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }
}
