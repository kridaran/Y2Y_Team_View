package com.kov.structures;

public class Student {
    String name;
    String group;
    String command;

    public Student(String name, String group, String command){
        this.command = command;
        this.group = group;
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public String getCommand() {
        return command;
    }

    public String getGroup() {
        return group;
    }
}
