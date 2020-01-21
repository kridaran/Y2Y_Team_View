package com.kov.controller;

import com.kov.entity.Command;
import com.kov.service.UserService;
import com.kov.structures.Group;
import com.kov.structures.Student;
import com.kov.structures.Warning;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/")
public class UserController {
    @Autowired
    public UserService userService;

    @ModelAttribute
    void cleanLogin(Model model){
        emptyWarning(model);
        model.addAttribute("command", new Command("",""));
    }

    @ModelAttribute
    void setCommand(Model model, String name){
        model.addAttribute("command", name);
    }

    @ModelAttribute
    void setIndexData(Model model, String name){
        setCommand(model, name);
        model.addAttribute("groups", userService.getAllGroups());
        model.addAttribute("students", userService.getStudentsOfCommand(name));
    }

    @ModelAttribute
    void emptyWarning(Model model){
        model.addAttribute("warning", Warning.empty());
    }



    @GetMapping("/")
    public String base(Model model) {
        return "redirect:login";
    }

    @GetMapping("/login")
    public String login(Model model){
        cleanLogin(model);
        return "login";
    }

//____________________________________________________C O M M A N D____________________________________________________

    @PostMapping("/index")
    public String validateCommand(Model model,
            @RequestParam(value = "name") String name,
            @RequestParam(value = "password") String password){

        if(userService.checkLoginData(name, password)){
            System.out.println("\n\n\n\n\n________________________________________");
            System.out.println(name);
            setIndexData(model, name);
            return "redirect:index";
        }
        else{
            model.addAttribute("warning", Warning.incorrectUserData());
            model.addAttribute("command", new Command(name, password));
            return "login";
        }
    }

    @GetMapping("/index")
    public String enter(Model model, @RequestParam("command") String name){
        setIndexData(model, name);
        return "index";
    }


    @PostMapping("/createCommand")
    public String createCommand(Model model,
                                @RequestParam("name") String name,
                                @RequestParam("password") String password){
        if(userService.tryAddCommand(name, password)){
            return validateCommand(model, name, password);
        }
        else{
            model.addAttribute("command", new Command(name, password));
            model.addAttribute("warning", Warning.commandAlreayExist());
            return "login";
        }
    }

    @GetMapping("/deleteCommand{name}")
    public String deleteCommand(Model model, @RequestParam("name") String name){
        userService.deleteCommand(name);
        return base(model);
    }
//____________________________________________________C O M M A N D____________________________________________________


//____________________________________________________G R O U P____________________________________________________

    @GetMapping("/newGroupForm")
    public String newGroup(Model model,
                           @RequestParam("command") String command){
        emptyWarning(model);
        model.addAttribute("group", new Group("", ""));
        model.addAttribute("new", "true");
        setCommand(model, command);
        return "group";
    }

    @GetMapping("/editGroupForm")
    public String editGroup(Model model,
                            @RequestParam("group") String name,
                            @RequestParam("command") String command){
        emptyWarning(model);
        model.addAttribute("group", userService.getGroup(name));
        model.addAttribute("new","false");
        setCommand(model, command);
        return "group";
    }




    @PostMapping("/addGroup")
    public String addGroup(Model model,
                           @RequestParam("name") String name,
                           @RequestParam("schedule") String schedule,
                           @RequestParam("command") String command){
        Group g = new Group(name, schedule);
        if(userService.tryAddGroup(g)){
            setIndexData(model, command);
            return "redirect:index";
        }
        else{
            model.addAttribute("warning", Warning.groupAlreadyExist());
            model.addAttribute("group", g);
            model.addAttribute("new", "true");
            setCommand(model,command);
            return "group";
        }
    }

    @PostMapping("/updateGroup")
    public String updateGroup(Model model,
                              @RequestParam("name") String name,
                              @RequestParam("schedule") String schedule,
                              @RequestParam("command") String command){
        setIndexData(model, command);
        userService.updateGroup(new Group(name, schedule));
        return "redirect:index";
    }

    @PostMapping("/deleteGroup")
    public String deleteGroup(Model model,
                              @RequestParam("name") String name,
                              @RequestParam("command") String command){
        if(userService.deleteGroup(name)){
            setIndexData(model, command);
            return "redirect:index";
        }
        else {
            model.addAttribute("command", command);
            model.addAttribute("warning", Warning.groupIsInUse());
            model.addAttribute("new", "false");
            model.addAttribute("group", userService.getGroup(name));
            return "group";
        }
    }

//____________________________________________________G R O U P____________________________________________________




//____________________________________________________S T U D E N T____________________________________________________

    @PostMapping("/addStudent")
    public String addStudent(Model model,
                             @RequestParam("name") String name,
                             @RequestParam("group") String group,
                             @RequestParam("command") String command){
        userService.addStudent(new Student(name, group, command));
        setIndexData(model, command);
        return "redirect:index";
    }

    @PostMapping("deleteStudent")
    public String deleteStudent(Model model,
                                @RequestParam("name") String name,
                                @RequestParam("group") String group,
                                @RequestParam("command") String command){
        userService.deleteStudent(new Student(name, group, command));
        setIndexData(model, command);
        return "redirect:index";
    }

//____________________________________________________S T U D E N T____________________________________________________
}
