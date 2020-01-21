package com.kov.service;

import com.kov.dao.UserDAO;
import com.kov.structures.Group;
import com.kov.structures.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService implements I_UserService {

    @Autowired
    public UserDAO userDAO;



    @Override
    public boolean checkLoginData(String name, String password) {
        return userDAO.checkLoginData(name, password);
    }

    @Override
    public boolean tryAddCommand(String name, String password) {
        return userDAO.tryAddCommand(name, password);
    }

    @Override
    public void deleteCommand(String name) {
        userDAO.deleteCommand(name);
    }




    @Override
    public Group getGroup(String name) {
        return userDAO.getGroup(name);
    }

    @Override
    public List<Group> getAllGroups() {
        return userDAO.getAllGroups();
    }

    @Override
    public boolean tryAddGroup(Group group) {
        return userDAO.tryAddGroup(group);
    }

    @Override
    public boolean deleteGroup(String group) {
        return userDAO.deleteGroup(group);
    }

    @Override
    public void updateGroup(Group group) { userDAO.updateGroup(group); }



    @Override
    public List<Student> getStudentsOfCommand(String name) {
        return userDAO.getStudentsOfCommand(name);
    }

    @Override
    public void addStudent(Student st) {
        userDAO.addStudent(st);
    }

    @Override
    public void deleteStudent(Student st) {
        userDAO.deleteStudent(st);
    }
}
