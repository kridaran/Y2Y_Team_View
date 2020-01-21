package com.kov.dao;

import com.kov.entity.Command;
import com.kov.mappers.CommandMapper;
import com.kov.mappers.GroupMapper;
import com.kov.mappers.StudentMapper;
import com.kov.structures.Group;
import com.kov.structures.Student;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;


public class UserDAO implements I_UserDAO {
    public final JdbcTemplate template;

    @Autowired
    public UserDAO(JdbcTemplate template) {
        this.template = template;
    }

    boolean doesCoomandexist(String name){
        List<Command> commands = template.query("select * from commands where name='" + name + "';", new CommandMapper());
        if(commands.size()==0){
            return false;
        }
        else{
            return true;
        }
    }

    boolean doesGroupExist(String name){
        List<Group> groups = template.query("select * from classes where name='" + name + "';", new GroupMapper());
        if (groups.size()==0){
            return false;
        }
        else{
            return true;
        }
    }

    //____________________________________________________C O M M A N D____________________________________________________

    @Override
    public boolean checkLoginData(String name, String password) {
        List<Command> commands = template.query("select * from commands where name='" + name + "';", new CommandMapper());
        try {
            Command c = commands.get(0);
            return c.getPassword().equals(password);
        }
        catch (IndexOutOfBoundsException e){
            return false;
        }
    }


    @Override
    public boolean tryAddCommand(String name, String password) {
        if(!doesCoomandexist(name)){
            template.update("insert into commands values (?, ?)", name, password);
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public void deleteCommand(String name) {
        deleteStudentsOfCommand(name);
        template.update("delete from commands where name='" + name + "';");
    }
    //____________________________________________________C O M M A N D____________________________________________________



    //____________________________________________________G R O U P____________________________________________________

    @Override
    public Group getGroup(String name) {
        return template.query("select * from classes where name='" + name + "';", new GroupMapper()).get(0);
    }

    @Override
    public List<Group> getAllGroups() {
        return template.query("select * from classes;", new GroupMapper());
    }

    @Override
    public boolean tryAddGroup(Group group) {
        if(!doesGroupExist(group.getName())){
            template.update("insert into classes values (?,?);", group.getName(), group.getSchedule());
            return true;
        }
        else{
            return false;
        }
    }

    @Override
    public boolean deleteGroup(String group) {
        if(getStudentsOfGroup(group).size() == 0){
            template.update("delete from classes where name='" + group + "';");
            return true;
        }
        else {
            return false;
        }
    }

    @Override
    public void updateGroup(Group group) {
        template.update("update classes set schedule='" + group.getSchedule() + "' where name='" + group.getName() + "';");
    }


    //____________________________________________________G R O U P____________________________________________________



    //____________________________________________________S T U D E N T S____________________________________________________

    @Override
    public List<Student> getStudentsOfCommand(String name) {
        return template.query("select * from students where command='" + name + "' order by name;", new StudentMapper());
    }

    @Override
    public List<Student> getStudentsOfGroup(String name) {
        return template.query("select * from students where class='" + name + "';", new StudentMapper());
    }

    @Override
    public void addStudent(Student st) {
        template.update("insert into students (name, command, class) values (?,?,?);", st.getName(), st.getCommand(), st.getGroup());
    }

    @Override
    public void deleteStudent(Student st) {
        template.update("delete from students where name='"+st.getName()+"' and command='"+st.getCommand()+"' and class='"+st.getGroup()+"';");
    }

    void deleteStudentsOfCommand(String name) {
        template.update("delete from students where command=?;", name);
    }
}
