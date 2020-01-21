package com.kov.structures;

public class Warning {
    public static String incorrectUserData() {
        return "incorrectLoginData";
    }

    public static String commandAlreayExist(){
       return "commandExist";
    }

    public static String groupAlreadyExist(){ return "groupExist"; }

    public static String empty(){
        return "empty";
    }

    public static String groupIsInUse(){ return "groupInUse"; }
}
