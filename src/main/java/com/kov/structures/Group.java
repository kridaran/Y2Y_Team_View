package com.kov.structures;

public class Group {
    String name;
    String schedule;

    public Group(String name, String schedule){
        this.name = name;
        this.schedule = schedule;
    }

    public Group(){}

    public String getName() {
        return name;
    }

    public String getSchedule() {
        return schedule;
    }
}
