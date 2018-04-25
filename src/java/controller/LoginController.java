/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.validation.BindException;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.SimpleFormController;

/**
 *
 * @author
 */
public class LoginController extends SimpleFormController {
    
    public LoginController() {
        //Initialize controller properties here or 
        //in the Web Application Context

        setCommandClass(LoginController.class);
        setCommandName("Login");
        setSuccessView("loginsuccess");
        setFormView("login");
    }
    
    /*@Override
    protected void doSubmitAction(Object command) throws Exception {
        throw new UnsupportedOperationException("Not yet implemented");
    }*/

    //Use onSubmit instead of doSubmitAction 
    //when you need access to the Request, Response, or BindException objects
   
    @Override
    protected ModelAndView onSubmit(
            HttpServletRequest request, 
            HttpServletResponse response, 
            Object command, 
            BindException errors) throws Exception {
        //Register register = (Register) command;
        ModelAndView mv = new ModelAndView(getSuccessView());
        mv.addObject("name", request.getParameter("loginID"));
        mv.addObject("pw", request.getParameter("password"));
        return mv;
    }
     
}