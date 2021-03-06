package com.kov.dao;

import com.kov.structures.Group;
import com.kov.structures.Student;

import java.util.List;

public interface I_UserDAO {
    boolean checkLoginData(String name, String password);

    boolean tryAddCommand(String name, String password);

    void deleteCommand(String name);


    Group getGroup(String name);

    List<Group> getAllGroups();

    boolean tryAddGroup(Group group);

    boolean deleteGroup(String group);

    void updateGroup(Group group);


    List<Student> getStudentsOfCommand(String name);

    List<Student> getStudentsOfGroup(String name);

    void addStudent(Student st);

    void deleteStudent(Student st);
}
